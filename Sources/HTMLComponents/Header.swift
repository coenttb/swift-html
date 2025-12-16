//import Foundation
//import HTML
//
//public struct Header<Content: HTML.View>: HTML.View {
//    let size: Int
//    let disableMargins: Bool
//
//    @HTML.Builder let content: Content
//
//    public init(
//        _ size: Int = 3,
//        disableMargins: Bool = false,
//        @HTML.Builder content: () -> Content
//    ) {
//        self.size = size
//        self.disableMargins = disableMargins
//        self.content = content()
//    }
//
//    public var body: some HTML.View {
//        tag("h\(size)") { content }
//            .inlineStyle("margin", disableMargins != true ? "0" : nil)
//            .inlineStyle("margin-top", disableMargins != true ? marginTopValue : nil, selector: ":not(:first-child)")
//            .inlineStyle("margin-bottom", disableMargins != true ? marginBottomValue : nil, selector: ":not(:last-child)")
//            .inlineStyle("font-size", fontSizeValue)
//            .inlineStyle("font-weight", "700")
//            .inlineStyle("line-height", lineHeightValue)
//    }
//
//    var fontSizeValue: String {
//        switch size {
//        case 1: "2em"
//        case 2: "1.5em"
//        case 3: "1.17em"
//        case 4: "1em"
//        case 5: "0.83em"
//        default: "0.67em"
//        }
//    }
//    var lineHeightValue: String {
//        switch size {
//        case 1, 2, 3, 4: "1.2"
//        default: "1.15"
//        }
//    }
//    var marginBottomValue: String {
//        switch size {
//        case 1: "1em"
//        case 2: "0.75em"
//        case 3, 4, 5: "0.5em"
//        default: "0.3em"
//        }
//    }
//    var marginTopValue: String {
//        switch size {
//        case 1: "2em"
//        case 2: "1.75em"
//        case 3, 4: "1.5em"
//        default: "0.5em"
//        }
//    }
//}
