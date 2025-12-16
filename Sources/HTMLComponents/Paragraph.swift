//import Foundation
//import HTML
//
//public struct Paragraph<Content: HTML.View>: HTML.View {
//    let size: Size
//    @HTML.Builder let content: Content
//    public init(
//        _ size: Size = .regular,
//        @HTML.Builder content: () -> Content
//    ) {
//        self.size = size
//        self.content = content()
//    }
//
//    public var body: some HTML.View {
//        tag("p") {
//            content
//        }
//        .inlineStyle("padding-bottom", "0.5rem", selector: ":not(:last-child)")
//        .inlineStyle("padding-top", "0")
//        .inlineStyle("padding-right", "0")
//        .inlineStyle("padding-left", "0")
//        .inlineStyle("margin", "0")
//        .inlineStyle("line-height", "1.5")
//    }
//
//    public enum Size {
//        case big
//        case regular
//        case small
//        var fontSizeValue: String {
//            switch self {
//            case .big: "\(19.0 / 16.0)rem"
//            case .regular: "1rem"
//            case .small: "\(14.0 / 16.0)rem"
//            }
//        }
//        var lineHeightValue: String {
//            switch self {
//            case .big: "\(28.0 / 16.0)rem"
//            case .regular: "1.5rem"
//            case .small: "\(21.0 / 16.0)rem"
//            }
//        }
//    }
//}
