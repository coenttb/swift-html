import Dependencies
import HTML

struct Link<Label: HTML>: HTML {
    @Dependency(\.linkStyle) var linkStyle
    let label: Label
    let href: String
    
    init(href: String, @HTMLBuilder label: () -> Label) {
        self.href = href
        self.label = label()
    }
    
    init(_ title: String, href: String) where Label == HTMLText {
        self.init(href: href) {
            HTMLText(title)
        }
    }
    
    var body: some HTML {
        a { label }
            .attribute("href", href)
            .color(linkStyle.color, .visited)
            .color(linkStyle.color, .link)
            .inlineStyle(
                "text-decoration", linkStyle.underline == true ? "underline" : "none", pseudo: .visited
            )
            .inlineStyle(
                "text-decoration", linkStyle.underline == true ? "underline" : "none", pseudo: .link
            )
            .inlineStyle(
                "text-decoration", linkStyle.underline == false ? "none" : "underline", pseudo: .hover
            )
    }
}

extension HTML {
    func linkColor(_ linkColor: HTMLColor?) -> some HTML {
        dependency(\.linkStyle.color, linkColor)
    }
    func linkUnderline(_ linkUnderline: Bool?) -> some HTML {
        dependency(\.linkStyle.underline, linkUnderline)
    }
    func linkStyle(_ linkStyle: LinkStyle) -> some HTML {
        dependency(\.linkStyle, linkStyle)
    }
}

struct LinkStyle: Sendable {
    var color: HTMLColor?
    var underline: Bool?
    init(
        color: HTMLColor? = nil,
        underline: Bool? = nil
    ) {
        self.color = color
        self.underline = underline
    }
}

private enum LinkStyleKey: DependencyKey {
    static let liveValue = LinkStyle()
    static let testValue = LinkStyle()
}

extension DependencyValues {
    var linkStyle: LinkStyle {
        get { self[LinkStyleKey.self] }
        set { self[LinkStyleKey.self] = newValue }
    }
}
