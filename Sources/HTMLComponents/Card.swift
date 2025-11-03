import HTML

public struct Card<Content: HTML, Header: HTML, Footer: HTML>: HTML {
    let content: Content
    let header: Header
    let footer: Footer

    public init(
        @HTMLBuilder content: () -> Content,
        @HTMLBuilder header: () -> Header = { HTMLEmpty() },
        @HTMLBuilder footer: () -> Footer = { HTMLEmpty() }
    ) {
        self.content = content()
        self.header = header()
        self.footer = footer()
    }

    public var body: some HTML {
        VStack(spacing: .rem(0)) {
            div {
                header
            }
            .borderBottom(
                .init(width: .px(1), style: .solid, color: .hex("#e8e8e8")),
                media: .prefersColorScheme(.light)
            )
            .borderBottom(
                .init(width: .px(1), style: .solid, color: .hex("#3d3d3d")),
                media: .prefersColorScheme(.dark)
            )

            VStack {
                VStack(spacing: 0.rem) { content }
                    .flexGrow()

                footer
            }
            .flexGrow()
            .padding(top: .rem(0.5), horizontal: .rem(1.5), bottom: .rem(1.5))
        }
        .display(.flex)
        .flexDirection(.column)
        .borderBottom(
            .init(
                width: .px(1),
                style: .solid,
                color: .hex("#353535")
            ),
            media: .prefersColorScheme(.dark)
        )
        .inlineStyle("border", "1px #353535 solid", media: .dark)
        .inlineStyle("box-shadow", "0 4px 12px rgba(0, 0, 0, 0.1)")
        .borderRadius(.length(7.5.px))
        .overflow(.hidden)
    }
}
