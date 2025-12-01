import HTML

public struct Card<Content: HTML.View, Header: HTML.View, Footer: HTML.View>: HTML.View {
    let content: Content
    let header: Header
    let footer: Footer

    public init(
        @HTML.Builder content: () -> Content,
        @HTML.Builder header: () -> Header = { HTML.Empty() },
        @HTML.Builder footer: () -> Footer = { HTML.Empty() }
    ) {
        self.content = content()
        self.header = header()
        self.footer = footer()
    }

    public var body: some HTML.View {
        let headerDiv = div { header }
            .inlineStyle("border-bottom", "1px solid #e8e8e8", media: .prefersColorScheme(.light))
            .inlineStyle("border-bottom", "1px solid #3d3d3d", media: .prefersColorScheme(.dark))

        let innerVStack = VStack(spacing: 0.rem) { content }
            .inlineStyle("flex-grow", "1")

        let contentVStack = VStack {
            innerVStack
            footer
        }
        .inlineStyle("flex-grow", "1")
        .inlineStyle("padding", "0.5rem 1.5rem 1.5rem 1.5rem")

        let outerVStack = VStack(spacing: .rem(0)) {
            headerDiv
            contentVStack
        }
        .inlineStyle("display", "flex")
        .inlineStyle("flex-direction", "column")
        .inlineStyle("border", "1px #353535 solid", media: .prefersColorScheme(.dark))
        .inlineStyle("box-shadow", "0 4px 12px rgba(0, 0, 0, 0.1)")
        .inlineStyle("border-radius", "7.5px")
        .inlineStyle("overflow", "hidden")

        return outerVStack
    }
}
