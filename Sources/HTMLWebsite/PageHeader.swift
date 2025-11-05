import Foundation
import HTMLComponents

public struct PageHeader<Title: HTML, Blurb: HTML, CallToAction: HTML>: HTML {
    var title: Title
    var blurb: Blurb
    var callToAction: CallToAction?

    public init(
        title: String,
        @HTMLBuilder blurb: () -> Blurb,
        @HTMLBuilder callToAction: () -> CallToAction? = { Never?.none }
    ) where Title == HTMLText {
        self.title = HTMLText(title)
        self.blurb = blurb()
        self.callToAction = callToAction()
    }

    public init(
        @HTMLBuilder title: () -> Title,
        @HTMLBuilder blurb: () -> Blurb,
        @HTMLBuilder callToAction: () -> CallToAction? = { Never?.none }
    ) {
        self.title = title()
        self.blurb = blurb()
        self.callToAction = callToAction()
    }

    public var body: some HTML {
        VStack {
            HStack(
                alignment: .middle
            ) {
                div {
                    Header(2) { title }
                        .color(.text.primary)

                    Paragraph(.big) { blurb }
                        .font(.body(.regular))
                        .color(.text.secondary)
                }
                .flexGrow(1)

                div {
                    callToAction
                }
            }
            .boxSizing(.borderBox)
            .flexBasis(.percent(100))
            .maxWidth(.px(1280))
            .width(.percent(100))
            .margin(vertical: .zero, horizontal: .auto)
            .padding(vertical: .rem(6), horizontal: .rem(2))
            .padding(vertical: .rem(8), horizontal: .rem(3), media: .desktop)
        }
        .boxSizing(.borderBox)
        .boxSizing(.borderBox)
    }
}

public struct PageHeaderGradient {
    let bottom: HTMLColor
    let top: HTMLColor

    public init(bottom: HTMLColor, top: HTMLColor) {
        self.bottom = bottom
        self.top = top
    }
}

extension PageHeaderGradient {
    public static var pf: Self {
        .init(
            bottom: .init(light: .hex("E0E0E0"), dark: .hex("121212")),
            top: .init(light: .hex("B0B0B0"), dark: .hex("242424"))
        )
    }

    public static var coenttb: Self {
        .init(
            bottom: .init(light: .hex("D3D3D3"), dark: .hex("242424")),
            top: .init(light: .hex("D6C4F2"), dark: .hex("6a5acd"))
        )
    }
}
