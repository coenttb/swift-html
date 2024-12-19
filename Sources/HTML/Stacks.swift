import OrderedCollections
import Foundation
import PointFreeHTML
import CSS

public struct HStack<Content: HTML>: HTML {
    let alignment: VerticalAlign
    let spacing: Length?
    let content: Content
    
    public init(
        alignment: VerticalAlign = .center,
        spacing: CSS.Length? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }
    
    public var body: some HTML {
        tag("swift-html-hstack") {
            content
        }
        // necessary?
        .alignItems(.stretch)
        .verticalAlign(alignment)
        .display(.flex)
        .flexDirection(.row)
        .maxHeight(100.percent)
        .inlineStyle("column-gap", spacing == 0 ? "0" : "\(spacing ?? 1.rem)")
    }
}

public struct VStack<Content: HTML>: HTML {
    let alignment: CSS.AlignItems
    let spacing: CSS.Length?
    let content: Content
    
    public init(
        alignment: CSS.AlignItems = .stretch,
        spacing: CSS.Length? = nil,
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
        .maxWidth(100.percent)
        .rowGap(spacing == 0 ? 0 : (spacing ?? 1.rem))
    }
}

//public struct HorizontalAlignment: Sendable {
//    public var rawValue: String
//    public init(rawValue: String) {
//        self.rawValue = rawValue
//    }
//    public static let center = Self(rawValue: "center")
//    public static let leading = Self(rawValue: "start")
//    public static let stretch = Self(rawValue: "stretch")
//    public static let trailing = Self(rawValue: "end")
//}

//public struct VerticalAlignment: RawRepresentable, Sendable {
//    public var rawValue: String
//    public init(rawValue: String) {
//        self.rawValue = rawValue
//    }
//    public static let bottom = Self(rawValue: "end")
//    public static let center = Self(rawValue: "center")
//    public static let firstTextBaseline = Self(rawValue: "first baseline")
//    public static let lastTextBaseline = Self(rawValue: "last baseline")
//    public static let stretch = Self(rawValue: "stretch")
//    public static let top = Self(rawValue: "start")
//}

public struct Spacer: HTML {
    public init() {}
    public var body: some HTML {
        tag("swift-html-spacer").grow()
    }
}

public struct LazyVGrid<Content: HTML>: HTML {
    let columns: OrderedDictionary<MediaQuery?, [Int]>
    let content: Content
    let horizontalSpacing: CSS.Length?
    let verticalSpacing: CSS.Length?
    
    public init(
        columns: OrderedDictionary<MediaQuery?, [Int]>,
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: CSS.Length? = nil,
        verticalSpacing: CSS.Length? = nil,
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
        horizontalSpacing: CSS.Length? = nil,
        verticalSpacing: CSS.Length? = nil,
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
        ) { html, columns in
            html
//                .inlineStyle(
//                    "column-gap",
////                    horizontalSpacing == 0.px ? "0" : "\(horizontalSpacing ?? 1.rem)",
//                    "\(horizontalSpacing ?? 1.rem)",
//                    media: columns.key
//                )
//                .inlineStyle("display", "grid", media: columns.key)
//                .inlineStyle(
//                    "grid-template-columns",
//                    columns.value.map { "minmax(0, \($0)fr)" }.joined(separator: " "),
//                    media: columns.key
//                )
//                .inlineStyle(
//                    "row-gap",
////                    verticalSpacing == 0.px ? "0" : "\(verticalSpacing ?? 1.rem)",
//                    "\(verticalSpacing ?? 1.rem)",
//                    media: columns.key
//                )
                .inlineStyle(
                    "column-gap",
                    horizontalSpacing == .zero ? "0" : "\(horizontalSpacing ?? 1.rem)",
                    media: columns.key
                )
                .inlineStyle("display", "grid", media: columns.key)
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
