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
        VStack {
            header
                .border(.bottom(width: 1.px, style: .solid, color: .init(rawValue: "#e8e8e8")))
                .border(.bottom(width: 1.px, style: .solid, color: .init(rawValue: "#3d3d3d")), media: .dark)
            
            VStack {
                VStack(spacing: 0) { content }
                    .grow()
                
                footer
            }
            .grow()
            .padding(top: 0.5.rem, right: 1.5.rem, bottom: 1.5.rem)
        }
        .backgroundColor(.white.dark(.gray150))
        .border(.bottom(width: 1.px, style: .solid, color: .init(rawValue: "#353535")), media: .dark)
        .inlineStyle("box-shadow", "0 2px 10px -2px rgba(0,0,0,0.3)")
        .border(.radius(5.px))
        .margin(top: 1.rem, right: 0, bottom: 2.rem, left: 0)
        .overflow(.hidden)
    }
}

public struct Label: HTML {
    let icon: SVG
    let title: String
    
    public init(_ title: String, icon: SVG) {
        self.icon = icon
        self.title = title
    }
    
    public var body: some HTML {
        HStack(alignment: .center, spacing: 0.25) {
            icon
            HTMLText(title)
        }
        .fontStyle(.body(.small))
    }
}
