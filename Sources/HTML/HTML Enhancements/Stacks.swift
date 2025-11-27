import Foundation
import HTML_Rendering
import OrderedCollections

public struct HStack<Content: HTML.View>: HTML.View {
    let alignment: VerticalAlign
    let spacing: Length?
    let content: Content

    public init(
        alignment: VerticalAlign = .middle,
        spacing: CSS_Standard.Length? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some HTML.View {
        tag("swift-html-hstack") { content }
            // necessary?
            .alignItems(.stretch)
            .verticalAlign(alignment)
            .display(.flex)
            .flexDirection(.row)
            .maxHeight(.percentage(100))
            .columnGap(.length(spacing == 0 ? .zero : spacing ?? 1.rem))
    }
}

public struct VStack<Content: HTML.View>: HTML.View {
    let alignment: AlignItems
    let spacing: CSS_Standard.Length?
    let content: Content

    public init(
        alignment: AlignItems = .stretch,
        spacing: CSS_Standard.Length? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some HTML.View {
        tag("swift-html-vstack") {
            content
        }
        .alignItems(alignment)
        .display(.flex)
        .flexDirection(.column)
        .maxWidth(.percentage(100))
        .rowGap(.length(spacing == .zero ? .zero : (spacing ?? 1.rem)))
    }
}

public struct Spacer: HTML.View {
    public init() {}
    public var body: some HTML.View {
        tag("swift-html-spacer").flexGrow(1)
    }
}

public struct LazyVGrid<Content: HTML.View>: HTML.View {
    let columns: OrderedDictionary<HTML.AtRule.Media?, [Int]>
    let content: Content
    let horizontalSpacing: CSS_Standard.Length?
    let verticalSpacing: CSS_Standard.Length?

    public init(
        columns: OrderedDictionary<HTML.AtRule.Media?, [Int]>,
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: CSS_Standard.Length? = nil,
        verticalSpacing: CSS_Standard.Length? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.columns = columns
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    public init(
        columns: [Int],
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: CSS_Standard.Length? = nil,
        verticalSpacing: CSS_Standard.Length? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.columns = [nil: columns]
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    public var body: some HTML.View {
        // Build grid - simplified to avoid type complexity with reduce
        let first = columns.elements.first
        let colValues = first?.value ?? [1]
        let columnGap = horizontalSpacing == .zero ? "0" : "\(horizontalSpacing ?? 1.rem)"
        let rowGap = verticalSpacing == .zero ? "0" : "\(verticalSpacing ?? 1.rem)"
        let gridCols = colValues.map { "minmax(0, \($0)fr)" }.joined(separator: " ")

        tag("swift-html-vgrid") { content }
            .inlineStyle("width", "100%", atRule: nil, selector: nil, pseudo: nil)
            .inlineStyle("display", "grid", atRule: nil, selector: nil, pseudo: nil)
            .inlineStyle("grid-template-columns", gridCols, atRule: nil, selector: nil, pseudo: nil)
            .inlineStyle("column-gap", columnGap, atRule: nil, selector: nil, pseudo: nil)
            .inlineStyle("row-gap", rowGap, atRule: nil, selector: nil, pseudo: nil)
    }
}
