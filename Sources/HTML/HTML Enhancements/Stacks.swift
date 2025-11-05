import Foundation
import OrderedCollections

public struct HStack<Content: HTML>: HTML {
    let alignment: VerticalAlign
    let spacing: Length?
    let content: Content

    public init(
        alignment: VerticalAlign = .middle,
        spacing: CSSPropertyTypes.Length? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some HTML {
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

public struct VStack<Content: HTML>: HTML {
    let alignment: AlignItems
    let spacing: CSSPropertyTypes.Length?
    let content: Content

    public init(
        alignment: AlignItems = .stretch,
        spacing: CSSPropertyTypes.Length? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some HTML {
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

public struct Spacer: HTML {
    public init() {}
    public var body: some HTML {
        tag("swift-html-spacer").flexGrow(1)
    }
}

public struct LazyVGrid<Content: HTML>: HTML {
    let columns: OrderedDictionary<CSSAtRuleTypes.Media?, [Int]>
    let content: Content
    let horizontalSpacing: CSSPropertyTypes.Length?
    let verticalSpacing: CSSPropertyTypes.Length?

    public init(
        columns: OrderedDictionary<CSSAtRuleTypes.Media?, [Int]>,
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: CSSPropertyTypes.Length? = nil,
        verticalSpacing: CSSPropertyTypes.Length? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.columns = columns
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    public init(
        columns: [Int],
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: CSSPropertyTypes.Length? = nil,
        verticalSpacing: CSSPropertyTypes.Length? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.columns = [nil: columns]
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    public var body: some HTML {
        columns.reduce(
            tag("swift-html-vgrid") {
                content
            }
            .inlineStyle("width", "100%")
        ) {
            html,
            columns in

            html
                .inlineStyle(
                    "column-gap",
                    horizontalSpacing == .zero ? "0" : "\(horizontalSpacing ?? 1.rem)",
                    media: columns.key
                )
                .inlineStyle(
                    "display",
                    "grid",
                    media: columns.key
                )
                .inlineStyle(
                    "grid-template-columns",
                    columns.value.map { "minmax(0, \($0)fr)" }.joined(separator: " "),
                    media: columns.key
                )
                .inlineStyle(
                    "row-gap",
                    verticalSpacing == .zero ? "0" : "\(verticalSpacing ?? 1.rem)",
                    media: columns.key
                )
        }
    }
}
