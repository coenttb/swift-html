import Foundation
import PointFreeHtml
import CSS

public struct Divider: HTML {
    public init() {}
    public var body: some HTML {
        hr()
            .inlineStyle("border-right", "none")
            .inlineStyle("border-bottom", "none")
            .inlineStyle("border-left", "none")
//            .border(.top(width: 1.px, style: .solid, color: .gray800.dark(.gray300)))
            .border(.top(width: 1.px, style: .solid, color: .gray550.dark(.gray450)))
            .margin(vertical: 0, horizontal: 30.percent)
    }
}
