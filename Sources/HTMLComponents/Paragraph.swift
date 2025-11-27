import Foundation
import HTML

public struct Paragraph<Content: HTML.View>: HTML.View {
    let size: Size
    @HTML.Builder let content: Content
    public init(
        _ size: Size = .regular,
        @HTML.Builder content: () -> Content
    ) {
        self.size = size
        self.content = content()
    }

    public var body: some HTML.View {
        tag("p") {
            content
        }
        .padding(.bottom(.rem(0.5)), pseudo: .not(.lastChild))
        .padding(.top(0), .right(0), .left(0))
        .margin(0)
        .lineHeight(1.5)
    }

    public enum Size {
        case big
        case regular
        case small
        var fontSize: CSS_Standard.Length {
            switch self {
            case .big: .length((19 / 16).rem)
            case .regular: .length((16 / 16).rem)
            case .small: .length((14 / 16).rem)
            }
        }
        var lineheight: CSS_Standard.Height {
            switch self {
            case .big: .length((28 / 16).rem)
            case .regular: .length((24 / 16).rem)
            case .small: .length((21 / 16).rem)
            }
        }
    }
}
