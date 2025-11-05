import Foundation
import HTMLComponents

public struct PageModule<Title: HTML, Content: HTML>: HTML {
    let title: Title?
    var theme: PageModule.Theme
    let content: Content

    public init(
        theme: PageModule.Theme,
        @HTMLBuilder content: () -> Content,
        @HTMLBuilder title: () -> Title
    ) {
        self.title = title()
        self.theme = theme
        self.content = content()
    }

    //    public init(
    //        title: String,
    //        seeAllURL: String? = nil,
    //        theme: PageModule.Theme,
    //        @HTMLBuilder content: () -> Content
    //    ) where Title == Header<HTMLText> {
    //        self.title = Header(3) { HTMLText(title) }
    //        self.theme = theme
    //        self.content = content()
    //    }

    public init(
        theme: PageModule.Theme,
        @HTMLBuilder content: () -> Content
    ) where Title == Never {
        self.title = nil
        self.theme = theme
        self.content = content()
    }

    public var body: some HTML {
        div {
            if let title {
                title
            }
            content
        }
        .flexContainer(
            direction: .column,
            wrap: .wrap,
            justification: theme.gridJustification,
            itemAlignment: theme.itemAlignment
        )
        .maxWidth(.px(1280))
        .margin(vertical: 0, horizontal: .auto, media: .desktop)
        .padding(
            top: theme.topMargin,
            horizontal: theme.leftRightMargin,
            bottom: theme.bottomMargin,
            media: .mobile
        )
        .padding(
            top: theme.topMarginDesktop,
            horizontal: .zero,
            bottom: theme.bottomMargin,
            media: .desktop
        )
    }
}

public struct PageModuleSeeAllTitle<Title: HTML>: HTML {

    let seeAllURL: String
    let title: Title

    public init(
        seeAllURL: String,
        @HTMLBuilder title: () -> Title
    ) {
        self.seeAllURL = seeAllURL
        self.title = title()
    }

    public init(
        title: String,
        seeAllURL: String
    ) where Title == HTMLComponents.Header<HTMLText> {
        self.title = Header(3) { HTMLText(title) }
        self.seeAllURL = seeAllURL
    }

    public var body: some HTML {
        div {
            title
            Link(
                href: .init(seeAllURL)
            ) {
                "\'(String.see_all.capitalizingFirstLetter().description) →"
            }

        }
        .width(.percent(100))
        .flexContainer(
            direction: .row,
            wrap: .nowrap,
            justification: .spaceBetween,
            itemAlignment: .center
        )
        .flexItem(basis: .percent(100))
    }
}

extension PageModule {
    public struct Theme {
        let topMargin: LengthPercentage
        let topMarginDesktop: LengthPercentage
        let bottomMargin: LengthPercentage
        let leftRightMargin: LengthPercentage
        let leftRightMarginDesktop: LengthPercentage
        let gridJustification: JustifyContent
        let itemAlignment: AlignItems

        public init(
            topMargin: LengthPercentage,
            topMarginDesktop: LengthPercentage? = nil,
            bottomMargin: LengthPercentage,
            leftRightMargin: LengthPercentage,
            leftRightMarginDesktop: LengthPercentage,
            gridJustification: JustifyContent = .flexStart(),
            itemAlignment: AlignItems = .inherit
        ) {
            self.topMargin = topMargin
            self.topMarginDesktop = topMarginDesktop ?? topMargin
            self.bottomMargin = bottomMargin
            self.leftRightMargin = leftRightMargin
            self.leftRightMarginDesktop = leftRightMarginDesktop
            self.gridJustification = gridJustification
            self.itemAlignment = itemAlignment
        }
    }
}

extension PageModule.Theme {
    public static var credits: Self {
        Self(
            topMargin: .rem(2),
            bottomMargin: .rem(0),
            leftRightMargin: .rem(2),
            leftRightMarginDesktop: .rem(3)
        )
    }

    public static var content: Self {
        Self(
            topMargin: .rem(4),
            bottomMargin: .rem(4),
            leftRightMargin: .rem(2),
            leftRightMarginDesktop: .rem(3)
        )
    }

    public static var whatPeopleAreSaying: Self {
        Self(
            topMargin: .rem(4),
            bottomMargin: .rem(4),
            leftRightMargin: .rem(2),
            leftRightMarginDesktop: .rem(3),
            itemAlignment: .center
        )
    }
}
