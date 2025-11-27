import HTML
import HTMLTheme
import Markdown

public struct HTMLMarkdown: HTML.View {
    public struct Section {
        public let title: String
        public let id: String
        public let level: Int
        public let timestamp: Timestamp?

        public var anchor: String {
            "#\(id)"
        }

        public init(title: String, id: String, level: Int, timestamp: Timestamp?) {
            self.title = title
            self.id = id
            self.level = level
            self.timestamp = timestamp
        }
    }

    public let markdown: String
    public let previewOnly: Bool
    public let tableOfContents: [Section]
    public let content: HTML.AnyView

    public init(_ markdown: String, previewOnly: Bool = false) {
        self.markdown = markdown
        self.previewOnly = previewOnly
        var converter = HTMLConverter(previewOnly: previewOnly)
        self.content = converter.visit(Document(parsing: markdown, options: .parseBlockDirectives))
        self.tableOfContents = converter.tableOfContents
    }

    public var body: some HTML.View {
        tag("swift-html-markdown") {
            VStack(spacing: .rem(0.5)) {
                content
            }
            .inlineStyle(
                "mask-image",
                previewOnly ? "linear-gradient(to bottom,black 50%,transparent 100%)" : nil
            )
        }
        .display(.block)
    }
}

private struct HTMLConverter: MarkupVisitor {
    typealias Result = HTML.AnyView

    let previewOnly: Bool

    init(previewOnly: Bool) {
        self.previewOnly = previewOnly
    }

    private var currentTimestamp: Timestamp?
    private var currentSection: (title: String, id: String, level: Int)?
    private var ids: Set<Slug> = []
    var tableOfContents: [HTMLMarkdown.Section] = []

    @HTML.Builder
    mutating func defaultVisit(_ markup: any Markup) -> HTML.AnyView {
        for child in markup.children {
            let html = visit(child)
            if previewOnly ? tableOfContents.count <= 1 : true {
                html
            }
        }
    }

    @HTML.Builder
    mutating func visitBlockDirective(_ blockDirective: Markdown.BlockDirective) -> HTML.AnyView {
        switch blockDirective.name {
        case "Button":
            VStack(alignment: .center) {
                a(
                    href: .init(
                        blockDirective.argumentText.segments.map(\.trimmedText).joined(
                            separator: " "
                        )
                    )
                ) {
                    for child in blockDirective.children {
                        visit(child)
                    }
                }
                .margin(vertical: .rem(0.5), horizontal: 0)
            }

        case "Comment":
            HTML.Empty()

        case "T":
            let segments = blockDirective.argumentText.segments
                .map(\.trimmedText)
                .joined()
                .split(separator: ", ")

            if let segment = segments.first {
                let timestamp = Timestamp(
                    format: String(segment),
                    speaker: segments.dropFirst().first.map { String($0) }
                )
                let _ = currentTimestamp = timestamp
                timestamp
                if let currentSection {
                    let _ = tableOfContents.append(
                        HTMLMarkdown.Section(
                            title: currentSection.title,
                            id: currentSection.id,
                            level: currentSection.level,
                            timestamp: timestamp
                        )
                    )
                    let _ = self.currentSection = nil
                }
            }

        case "Video":
            video {
                tag("source")
                    .attribute("src", value(forArgument: "source", block: blockDirective))
            }
            .attribute("poster", value(forArgument: "poster", block: blockDirective))
            .attribute("controls")
            .attribute("playsinline")
            .objectFit(.cover)
            .margin(bottom: .rem(1))

        default:
            for child in blockDirective.children {
                visit(child)
            }
        }
    }

    @HTML.Builder
    mutating func visitBlockQuote(_ blockQuote: Markdown.BlockQuote) -> HTML.AnyView {
        let aside = Markdown.Aside(blockQuote)
        if let level = DiagnosticLevel(aside: aside) {
            Diagnostic(level: level) {
                for child in aside.content {
                    visit(child)
                }
            }
            .padding(vertical: nil, horizontal: .rem(1))
        } else {
            let style = BlockQuoteStyle(blockName: aside.kind.displayName)
            blockquote {
                VStack(spacing: .rem(0.5)) {
                    strong {
                        HTML.Text(aside.kind.displayName)
                    }
                    .color(style.borderColor)

                    for child in aside.content {
                        visit(child)
                    }
                }
            }
            .color(CSS_Standard.Color.offBlack.withDarkColor(.offWhite))
            .backgroundColor(style.backgroundColor)
            .border(width: .px(2), style: .solid, color: style.borderColor)
            .borderRadius(.uniform(.px(6)))
            .margin(vertical: .rem(0.5), horizontal: 0)
            .padding(vertical: .rem(1), horizontal: .rem(1.5))
        }
    }

    @HTML.Builder
    mutating func visitCodeBlock(_ codeBlock: Markdown.CodeBlock) -> HTML.AnyView {
        let language: (class: String, dataLine: String?)? = codeBlock.language.map {
            let languageInfo = $0.split(separator: ":", maxSplits: 2)
            let language = languageInfo[0]
            let dataLine = languageInfo.dropFirst().first
            let highlightColor = languageInfo.dropFirst(2).first
            return (
                class: "language-\(language)\(highlightColor.map { " highlight-\($0)" } ?? "")",
                dataLine: dataLine.map { String($0) }
            )
        }
        pre {
            code {
                HTML.Text(codeBlock.code)
            }
            .attribute("class", language?.class)
            //            .linkUnderline(true)
        }
        .attribute("data-line", language?.dataLine)
        //        .backgroundColor(.offWhite.withDarkColor(.offBlack))
        .color(light: .black, dark: .gray900)
        .margin(0)
        .margin(bottom: .rem(0.5))
        .overflowX(.auto)
        .padding(vertical: .rem(1), horizontal: .rem(1.5))
        .borderRadius(.px(6))
    }

    @HTML.Builder
    mutating func visitEmphasis(_ emphasis: Markdown.Emphasis) -> HTML.AnyView {
        em {
            for child in emphasis.children {
                visit(child)
            }
        }
    }

    @HTML.Builder
    mutating func visitHeading(_ heading: Markdown.Heading) -> HTML.AnyView {
        let id = ids.slug(for: heading.plainText)

        a {}
            .id(id)
            .display(.block)
            .position(.relative)
            .top(.em(-5))
            .top(.em(-0.5), media: .desktop)
            .visibility(.hidden)

        div {
            tag("h\(heading.level)") {
                for child in heading.children {
                    visit(child)
                }

                a(href: .init(value: "#\(id)")) {
                    LegacySVG("Link") {
                        """
                        <svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 -960 960 960" width="20px" fill="currentColor"><path d="M432-288H288q-79.68 0-135.84-56.23Q96-400.45 96-480.23 96-560 152.16-616q56.16-56 135.84-56h144v72H288q-50 0-85 35t-35 85q0 50 35 85t85 35h144v72Zm-96-156v-72h288v72H336Zm192 156v-72h144q50 0 85-35t35-85q0-50-35-85t-85-35H528v-72h144q79.68 0 135.84 56.23 56.16 56.22 56.16 136Q864-400 807.84-344 751.68-288 672-288H528Z"/></svg>
                        """
                    }
                }
                .color(.branding.accent)
                .display(Display.none)
                .display(.initial, selector: "article div:hover > * >")
                .left(0)
                .position(.absolute)
                .top(.px(2), media: .mobile)
                .width(.rem(2.5))

            }
            .color(.offBlack.withDarkColor(.offWhite))
        }
        .margin(left: .rem(-2.25))
        .margin(left: .rem(-2.5), media: .desktop)
        .padding(left: .rem(2.25))
        .padding(left: .rem(2.5), media: .desktop)
        .position(.relative)

        let _ = currentSection = (title: heading.plainText, id: id, level: heading.level)
    }

    @HTML.Builder
    mutating func visitHTMLBlock(_ html: Markdown.HTMLBlock) -> HTML.AnyView {
        HTML.Raw(html.rawHTML)
    }

    @HTML.Builder
    mutating func visitImage(_ image: Markdown.Image) -> HTML.AnyView {
        if let source = image.source {
            VStack(alignment: .center) {
                a(href: .init(value: source)) {
                    Image(
                        src: .init(value: source),
                        alt: .init(value: image.title ?? ""),
                        loading: nil
                    )
                    .margin(
                        vertical: .rem(0),
                        horizontal: .rem(1)
                    )
                    .borderRadius(.uniform(.px(6)))
                }
            }
        }
    }

    @HTML.Builder
    mutating func visitInlineCode(_ inlineCode: Markdown.InlineCode) -> HTML.AnyView {
        code {
            HTML.Text(inlineCode.code)
        }
    }

    @HTML.Builder
    mutating func visitInlineHTML(_ inlineHTML: Markdown.InlineHTML) -> HTML.AnyView {
        HTML.Raw(inlineHTML.rawHTML)
    }

    @HTML.Builder
    mutating func visitLineBreak(_ lineBreak: Markdown.LineBreak) -> HTML.AnyView {
        br()
    }

    @HTML.Builder
    mutating func visitLink(_ link: Markdown.Link) -> HTML.AnyView {
        a(href: .init(link.destination ?? "#")) {
            for child in link.children {
                visit(child)
            }
        }
        .attribute(Title.tag, link.title)
    }

    @HTML.Builder
    mutating func visitListItem(_ listItem: Markdown.ListItem) -> HTML.AnyView {
        li {
            VStack(spacing: .rem(0.5)) {
                for child in listItem.children {
                    visit(child)
                }
            }
        }
    }

    @HTML.Builder
    mutating func visitOrderedList(_ orderedList: Markdown.OrderedList) -> HTML.AnyView {
        ol {
            for child in orderedList.children {
                visit(child)
            }
        }
        .flexContainer(
            direction: .column,
            rowGap: .rem(0.5)
        )
    }

    @HTML.Builder
    mutating func visitParagraph(_ paragraph: Markdown.Paragraph) -> HTML.AnyView {
        p {
            for child in paragraph.children {
                visit(child)
            }
        }
        .lineHeight(1.5)
        .padding(0)
        .margin(0)
    }

    @HTML.Builder
    mutating func visitSoftBreak(_ softBreak: Markdown.SoftBreak) -> HTML.AnyView {
        " "
    }

    @HTML.Builder
    mutating func visitStrikethrough(_ strikethrough: Markdown.Strikethrough) -> HTML.AnyView {
        s {
            for child in strikethrough.children {
                visit(child)
            }
        }
    }

    @HTML.Builder
    mutating func visitStrong(_ strong: Markdown.Strong) -> HTML.AnyView {
        tag("strong") {
            for child in strong.children {
                visit(child)
            }
        }
    }

    @HTML.Builder
    mutating func visitTable(_ table: Markdown.Table) -> HTML.AnyView {
        tag("table") {
            if !table.head.isEmpty {
                thead {
                    tr {
                        render(
                            tag: "th",
                            cells: table.head.cells,
                            columnAlignments: table.columnAlignments
                        )
                    }
                }
            }
            if !table.body.isEmpty {
                tbody {
                    HTMLForEach(table.body.rows) { row in
                        tr {
                            render(
                                tag: "td",
                                cells: row.cells,
                                columnAlignments: table.columnAlignments
                            )
                        }
                    }
                    //                    for row in table.body.rows {
                    //                        tr {
                    //                            render(tag: "td", cells: row.cells, columnAlignments: table.columnAlignments)
                    //                        }
                    //                    }
                }
            }
        }
    }

    @HTML.Builder
    private mutating func render(
        tag: HTML_Renderable.HTMLTag,
        cells: some Sequence<Markdown.Table.Cell>,
        columnAlignments: [Markdown.Table.ColumnAlignment?]
    ) -> HTML.AnyView {
        var column = 0
        for cell in cells {
            if cell.colspan > 0 && cell.rowspan > 0 {
                tag {
                    for child in cell.children {
                        visit(child)
                    }
                }
                .attribute("align", columnAlignments[column]?.attributeValue)
                .attribute("colspan", cell.colspan == 1 ? nil : "\(cell.colspan)")
                .attribute("rowspan", cell.rowspan == 1 ? nil : "\(cell.rowspan)")

                let _ = column += Int(cell.colspan)
            }
        }
    }

    @HTML.Builder
    mutating func visitText(_ text: Markdown.Text) -> HTML.AnyView {
        HTML.Text(text.string)
    }

    @HTML.Builder
    mutating func visitThematicBreak(_ thematicBreak: Markdown.ThematicBreak) -> HTML.AnyView {
        div {
            hr()()
                .borderRight(BorderRight.none)
                .borderBottom(BorderBottom.none)
                .borderLeft(BorderLeft.none)
                .borderTop(.init(width: .px(1), style: .solid, color: .gray))
                .margin(vertical: 0, horizontal: .percent(30))
        }
        .margin(
            top: .rem(1),
            bottom: .rem(2)
        )
    }

    @HTML.Builder
    mutating func visitUnorderedList(_ unorderedList: Markdown.UnorderedList) -> HTML.AnyView {
        ul {
            for child in unorderedList.children {
                visit(child)
            }
        }
        .flexContainer(
            direction: .column,
            rowGap: .length(.rem(0.5))
        )
        .margin(
            vertical: 0,
            horizontal: nil
        )
    }
}

extension Markdown.Table.ColumnAlignment {
    fileprivate var attributeValue: String {
        switch self {
        case .center: "center"
        case .left: "left"
        case .right: "right"
        }
    }
}

extension HTML.Builder {
    @_disfavoredOverload
    fileprivate static func buildExpression(_ expression: any HTML) -> HTML.AnyView {
        HTML.AnyView(expression)
    }

    @_disfavoredOverload
    fileprivate static func buildFinalResult(_ component: some HTML) -> HTML.AnyView {
        HTML.AnyView(component)
    }
}

private struct BlockQuoteStyle {
    var backgroundColor: HTMLColor
    var borderColor: HTMLColor

    init(blockName: String) {
        switch blockName {
        case "Warning", "Correction":
            self.backgroundColor = HTMLColor(light: .hex("FDF2F4"), dark: .hex("2E0402"))
            self.borderColor = HTMLColor(light: .hex("D02C1E"), dark: .hex("EB4642"))
        case "Important":
            self.backgroundColor = HTMLColor(light: .hex("FEFBF3"), dark: .hex("291F04"))
            self.borderColor = HTMLColor(light: .hex("966922"), dark: .hex("F4B842"))
        case "Announcement", "Tip":
            self.backgroundColor = HTMLColor(light: .hex("FBFFFF"), dark: .hex("0F2C2B"))
            self.borderColor = HTMLColor(light: .hex("4B767C"), dark: .hex("9FFCE5"))
        case "Preamble":
            self.backgroundColor = HTMLColor(light: .hex("FBF8FF"), dark: .hex("1e1925"))
            self.borderColor = HTMLColor(light: .hex("8D51F6"), dark: .hex("8D51F6"))
        default:
            self.backgroundColor = HTMLColor(light: .hex("f5f5f5"), dark: .hex("323232"))
            self.borderColor = HTMLColor(light: .hex("696969"), dark: .hex("9a9a9a"))
        }
    }
}

private func value(forArgument argument: String, block: BlockDirective) -> String? {
    block.argumentText.segments
        .compactMap {
            let text = $0.trimmedText.drop(while: { $0 == " " })
            return text.hasPrefix("\(argument): \"")
                ? text.dropFirst("\(argument): \"".count).prefix(while: { $0 != "\"" })
                : nil
        }
        .first
        .map(String.init)
}

extension DiagnosticLevel {
    fileprivate init?(aside: Markdown.Aside) {
        switch aside.kind.rawValue {
        case "Error": self = .error
        case "Expected Failure": self = .knownIssue
        case "Failed": self = .issue
        case "Runtime Warning": self = .runtimeWarning
        case "Warning": self = .warning
        default: return nil
        }
    }
}

public struct Timestamp: HTML.View {
    public var hour: Int
    public var minute: Int
    public var second: Int
    public var speaker: String?

    public init?(format: String, speaker: String?) {
        let components = format.split(separator: ":")
        guard let second = components.last.flatMap({ Int($0) }) else { return nil }
        self.hour = components.dropLast(2).last.flatMap { Int($0) } ?? 0
        self.minute = components.dropLast().last.flatMap { Int($0) } ?? 0
        self.second = second
        self.speaker = speaker
    }

    public var duration: Int {
        hour * 60 * 60 + minute * 60 + second
    }

    public var id: String {
        "t\(duration)"
    }

    public var anchor: String {
        "#\(id)"
    }

    public func formatted() -> String {
        var formatted = hour > 0 ? "\(hour):" : ""
        formatted.append("\(hour > 0 && minute < 10 ? "0" : "")\(minute):")
        formatted.append("\(second < 10 ? "0" : "")\(second)")
        return formatted
    }

    public var body: some HTML.View {
        div {
            if let speaker {
                strong {
                    HTML.Text(speaker)
                }
                .color(.gray500)
                .fontSize(.rem(0.875))
                .lineHeight(1, media: .desktop)
                .position(.relative, media: .desktop)
                .inlineStyle("text-transform", "uppercase")
                .top(.rem(0.5), media: .desktop)
            }

            let duration = self.duration
            div {
                div {
                    a(href: .init(value: anchor)) {
                        HTML.Text(formatted())
                    }
                    .attribute("data-timestamp", "\(duration)")
                }
                .fontSize(.small)
                .textDecoration(TextDecoration.none)
                .dependency(\.theme.text.link, .gray800.withDarkColor(.gray300))
                .id(id)
                .inlineStyle("font-variant-numeric", "tabular-nums")
                .lineHeight(3, media: .desktop)
                .margin(left: .rem(-4), media: .desktop)
                .position(.absolute, media: .desktop)
                .textAlign(.right, media: .desktop)
                .width(.rem(3.25), media: .desktop)
            }
        }
        .flexContainer(
            direction: .columnReverse,
            rowGap: .length(.rem(0.5)),
            media: .mobile
        )
    }
}

private struct Slug: Hashable {
    var name: String
    var generation: Int
}

extension Set<Slug> {
    fileprivate func slug(for string: String) -> String {
        var slug = Slug(name: string.slug(), generation: 0)
        while contains(slug) {
            slug.generation += 1
        }
        return "\(slug.name)\(slug.generation > 0 ? "-\(slug.generation)" : "")"
    }
}

extension String {
    fileprivate func slug() -> String {
        split(whereSeparator: { !$0.isLetter && !$0.isNumber }).joined(separator: "-").lowercased()
    }
}
