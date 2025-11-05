//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 07/10/2024.
//

import Foundation
import HTML
import HTMLMarkdown
import HTMLTheme
import Markdown

public struct EmailMarkdown: HTML {
    public let markdown: String
    public let content: AnyHTML

    public init(
        @StringBuilder _ markdown: () -> String
    ) {
        self.markdown = markdown()
        var visitor = Visitor()
        self.content = visitor.visit(
            Document(parsing: self.markdown, options: .parseBlockDirectives)
        )
    }

    public var body: some HTML {
        content
    }
}

private struct Visitor: MarkupVisitor {
    typealias Result = AnyHTML

    @HTMLBuilder
    mutating func defaultVisit(_ markup: any Markup) -> AnyHTML {
        for child in markup.children {
            visit(child)
        }
    }

    @HTMLBuilder
    mutating func visitBlockDirective(_ blockDirective: Markdown.BlockDirective) -> AnyHTML {
        switch blockDirective.name {
        case "Comment":
            HTMLEmpty()

        default:
            for child in blockDirective.children {
                visit(child)
            }
        }
    }

    @HTMLBuilder
    mutating func visitEmphasis(_ emphasis: Markdown.Emphasis) -> AnyHTML {
        em {
            for child in emphasis.children {
                visit(child)
            }
        }
    }

    @HTMLBuilder
    mutating func visitHeading(_ heading: Markdown.Heading) -> AnyHTML {
        tag("h\(heading.level)") {
            for child in heading.children {
                visit(child)
            }
        }
        .color(.text.primary)
        .inlineStyle("padding", "1rem 0 0.5rem 0")
        .inlineStyle("position", "relative")
    }

    @HTMLBuilder
    mutating func visitHTMLBlock(_ html: Markdown.HTMLBlock) -> AnyHTML {
        HTMLRaw(html.rawHTML)
    }

    @HTMLBuilder
    mutating func visitImage(_ image: Markdown.Image) -> AnyHTML {
        if let source = image.source {
            a(href: .init(value: source)) {
                img(src: .init(value: source), alt: .init(image.title ?? ""))
                    .borderRadius(.px(6))
                    .margin(vertical: .zero, horizontal: .rem(1))
            }
        }
    }

    @HTMLBuilder
    mutating func visitInlineCode(_ inlineCode: Markdown.InlineCode) -> AnyHTML {
        code {
            HTMLText(inlineCode.code)
        }
    }

    @HTMLBuilder
    mutating func visitInlineHTML(_ inlineHTML: Markdown.InlineHTML) -> AnyHTML {
        HTMLRaw(inlineHTML.rawHTML)
    }

    @HTMLBuilder
    mutating func visitLineBreak(_ lineBreak: Markdown.LineBreak) -> AnyHTML {
        br()
    }

    @HTMLBuilder
    mutating func visitLink(_ link: Markdown.Link) -> AnyHTML {
        a(href: .init(link.destination ?? "#")) {
            for child in link.children {
                visit(child)
            }
        }
        .attribute("title", link.title)
    }

    @HTMLBuilder
    mutating func visitListItem(_ listItem: Markdown.ListItem) -> AnyHTML {
        li {
            for child in listItem.children {
                visit(child)
            }
        }
    }

    @HTMLBuilder
    mutating func visitOrderedList(_ orderedList: Markdown.OrderedList) -> AnyHTML {
        ol {
            for child in orderedList.children {
                visit(child)
            }
        }
        .marginBottom(.zero)
        .marginTop(.zero)
        .padding(vertical: .zero, horizontal: .rem(1))
    }

    @HTMLBuilder
    mutating func visitUnorderedList(_ unorderedList: Markdown.UnorderedList) -> AnyHTML {
        ul {
            for child in unorderedList.children {
                visit(child)
            }
        }
        .marginBottom(.zero)
        .marginTop(.zero)
        .padding(
            top: .rem(0.5),
            bottom: .zero,
            left: .rem(0.5),
            right: .rem(1)
        )
        .inlineStyle("padding", "0.5rem 0 0.5rem 1rem")
    }

    @HTMLBuilder
    mutating func visitParagraph(_ paragraph: Markdown.Paragraph) -> AnyHTML {
        p {
            for child in paragraph.children {
                visit(child)
            }
        }
        .color(.text.primary)
        .fontStyle(.normal)
        .lineHeight(1.5)
        .padding(
            top: .zero,
            bottom: .zero,
            left: .rem(0.5),
            right: .zero
        )
        .margin(.zero)
    }

    @HTMLBuilder
    mutating func visitSoftBreak(_ softBreak: Markdown.SoftBreak) -> AnyHTML {
        " "
    }

    @HTMLBuilder
    mutating func visitStrikethrough(_ strikethrough: Markdown.Strikethrough) -> AnyHTML {
        s {
            for child in strikethrough.children {
                visit(child)
            }
        }
    }

    @HTMLBuilder
    mutating func visitStrong(_ strong: Markdown.Strong) -> AnyHTML {
        tag("strong") {
            for child in strong.children {
                visit(child)
            }
        }
    }

    @HTMLBuilder
    mutating func visitTable(_ table: Markdown.Table) -> AnyHTML {
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
                }
            }
        }
    }

    @HTMLBuilder
    private mutating func render(
        tag: HTMLTag,
        cells: some Sequence<Markdown.Table.Cell>,
        columnAlignments: [Markdown.Table.ColumnAlignment?]
    ) -> AnyHTML {
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

                let _: Void = column += Int(cell.colspan)
            }
        }
    }

    @HTMLBuilder
    mutating func visitText(_ text: Markdown.Text) -> AnyHTML {
        HTMLText(text.string)
    }

    @HTMLBuilder
    mutating func visitThematicBreak(_ thematicBreak: Markdown.ThematicBreak) -> AnyHTML {
        div {
            hr()()
                .borderRight(BorderRight.none)
                .borderBottom(BorderBottom.none)
                .borderLeft(BorderLeft.none)
                .borderTop(.init(width: .px(1), style: .solid, color: .gray))
                .margin(vertical: 0, horizontal: .percent(30))
        }
        .inlineStyle("margin", "1rem 0 2rem")
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

extension HTMLBuilder {
    @_disfavoredOverload
    fileprivate static func buildExpression(_ expression: any HTML) -> AnyHTML {
        AnyHTML(expression)
    }

    @_disfavoredOverload
    fileprivate static func buildFinalResult(_ component: some HTML) -> AnyHTML {
        AnyHTML(component)
    }
}
