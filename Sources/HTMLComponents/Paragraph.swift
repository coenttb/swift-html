import Foundation
import HTML

public struct Paragraph<Content: HTML>: HTML {
    let size: Size
    @HTMLBuilder let content: Content
    public init(
        _ size: Size = .regular,
        @HTMLBuilder content: () -> Content
    ) {
        self.size = size
        self.content = content()
    }

    public var body: some HTML {
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
        var fontSize: Length {
            switch self {
            case .big: (19 / 16).rem
            case .regular: (16 / 16).rem
            case .small: (14 / 16).rem
            }
        }
        var lineHeight: Length {
            switch self {
            case .big: (28 / 16).rem
            case .regular: (24 / 16).rem
            case .small: (21 / 16).rem
            }
        }
    }
}
