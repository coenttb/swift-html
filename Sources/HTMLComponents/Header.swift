import Foundation
import HTML

public struct Header<Content: HTML.View>: HTML.View {
    let size: Int
    let disableMargins: Bool

    @HTML.Builder let content: Content

    public init(
        _ size: Int = 3,
        disableMargins: Bool = false,
        @HTML.Builder content: () -> Content
    ) {
        self.size = size
        self.disableMargins = disableMargins
        self.content = content()
    }

    public var body: some HTML.View {
        tag("h\(size)") { content }
            .margin(disableMargins != true ? .zero : nil)
            .marginTop(
                disableMargins != true ? .lengthPercentage(marginTop) : nil,
                pseudo: .not(.firstChild)
            )
            .marginBottom(
                disableMargins != true ? .lengthPercentage(marginBottom) : nil,
                pseudo: .not(.lastChild)
            )
            .fontSize(fontSize)
            .fontWeight(700)
            .lineHeight(lineHeight)
    }

    var fontSize: CSS_Standard.FontSize {
        switch size {
        case 1: .em(2)
        case 2: .em(1.5)
        case 3: .em(1.17)
        case 4: .em(1)
        case 5: .em(0.83)
        default: .em(0.67)
        }
    }
    var lineHeight: LineHeight {
        switch size {
        case 1: 1.2
        case 2: 1.2
        case 3: 1.2
        case 4: 1.2
        case 5: 1.15
        default: 1.15
        }
    }
    var marginBottom: LengthPercentage {
        switch size {
        case 1: .em(1)
        case 2: .em(0.75)
        case 3: .em(0.5)
        case 4: .em(0.5)
        case 5: .em(0.5)
        default: .em(0.3)
        }
    }
    var marginTop: LengthPercentage {
        switch size {
        case 1: .em(2)
        case 2: .em(1.75)
        case 3: .em(1.5)
        case 4: .em(1.5)
        case 5: .em(0.5)
        default: .em(0.5)
        }
    }
}
