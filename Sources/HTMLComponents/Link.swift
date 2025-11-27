import Dependencies
import Foundation
import HTML

public struct Link<Label: HTML.View>: HTML.View {
    @Dependency(\.linkStyle) var linkStyle
    let label: Label
    let href: Href?

    public init(href: Href?, @HTML.Builder label: () -> Label) {
        self.href = href
        self.label = label()
    }

    public init(_ title: String, href: Href?) where Label == HTML.Text {
        self.init(href: href) {
            HTML.Text(title)
        }
    }

    public var body: some HTML.View {
        a(href: href) { label }
            .color(.text.link)
            .color(HTMLColor.text.link, pseudo: .visited)
            .color(HTMLColor.text.link, pseudo: .link)
            .textDecoration(
                linkStyle.underline == true ? .underline : TextDecoration.none,
                pseudo: .visited
            )
            .textDecoration(
                linkStyle.underline == true ? .underline : TextDecoration.none,
                pseudo: .link
            )
            .textDecoration(
                linkStyle.underline == true ? .none : TextDecoration.underline,
                pseudo: .hover
            )
    }
}

extension HTML.View {
    public func linkColor(_ linkColor: HTMLColor?) -> some HTML.View {
        @Dependency(\.theme.text.link) var color
        return self.dependency(\.theme.text.link, linkColor ?? color)
    }
    public func linkUnderline(_ linkUnderline: Bool?) -> some HTML.View {
        self.dependency(\.linkStyle.underline, linkUnderline)
    }
    public func linkStyle(_ linkStyle: LinkStyle) -> some HTML.View {
        self.dependency(\.linkStyle, linkStyle)
    }
}

public struct LinkStyle: Sendable {
    //    public var color: HTMLColor?
    public var underline: Bool?

    public init(
        //        color: HTMLColor? = nil,
        underline: Bool? = nil
    ) {
        //        self.color = color
        self.underline = underline
    }
}

private enum LinkStyleKey: DependencyKey {
    static let liveValue = LinkStyle()
    static let testValue = LinkStyle()
}

extension DependencyValues {
    public var linkStyle: LinkStyle {
        get { self[LinkStyleKey.self] }
        set { self[LinkStyleKey.self] = newValue }
    }
}
