import Foundation
import HTML

public struct Divider: HTML.View {
    public init() {}
    public var body: some HTML.View {
        hr()()
            .borderRight(BorderRight.none)
            .borderBottom(BorderBottom.none)
            .borderLeft(BorderLeft.none)
            .borderTop(.init(width: .px(1), style: .solid, color: .gray500))
            .margin(vertical: 0, horizontal: .percent(30))
    }
}
