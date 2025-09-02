//
//  AuthNavigationBar.swift
//  swift-html
//
//  Authentication-aware navigation bar
//

import Foundation
import HTML
import HTMLComponents
import Builders

// MARK: - AuthNavigationBar
public struct AuthNavigationBar: HTML {
    let logo: any HTML
    let isAuthenticated: Bool
    let authenticatedItems: [any NavItem]
    let unauthenticatedItems: [any NavItem]
    let sticky: Bool
    let backgroundColor: HTMLColor?
    
    public init(
        isAuthenticated: Bool,
        sticky: Bool = true,
        backgroundColor: HTMLColor? = nil,
        @HTMLBuilder logo: () -> any HTML,
        @ArrayBuilder<NavItem> authenticatedItems: () -> [any NavItem],
        @ArrayBuilder<NavItem> unauthenticatedItems: () -> [any NavItem]
    ) {
        self.logo = logo()
        self.isAuthenticated = isAuthenticated
        self.authenticatedItems = authenticatedItems()
        self.unauthenticatedItems = unauthenticatedItems()
        self.sticky = sticky
        self.backgroundColor = backgroundColor
    }
    
    public var body: some HTML {
        NavigationBar(
            sticky: sticky,
            backgroundColor: backgroundColor,
            logo: { AnyHTML(logo) }
        ) {
            if isAuthenticated {
                authenticatedItems
            } else {
                unauthenticatedItems
            }
        }
    }
}

// MARK: - SmartNavigationBar (Alternative with single builder)
public struct SmartNavigationBar: HTML {
    public typealias ItemsBuilder = (Bool) -> [any NavItem]
    
    let logo: any HTML
    let isAuthenticated: Bool
    let items: [any NavItem]
    let sticky: Bool
    let backgroundColor: HTMLColor?
    
    public init(
        isAuthenticated: Bool,
        sticky: Bool = true,
        backgroundColor: HTMLColor? = nil,
        @HTMLBuilder logo: () -> any HTML,
        items: ItemsBuilder
    ) {
        self.logo = logo()
        self.isAuthenticated = isAuthenticated
        self.items = items(isAuthenticated)
        self.sticky = sticky
        self.backgroundColor = backgroundColor
    }
    
    public var body: some HTML {
        NavigationBar(
            sticky: sticky,
            backgroundColor: backgroundColor,
            logo: { AnyHTML(logo) },
            items: { items }
        )
    }
}

// MARK: - Convenience Extensions for Common Patterns
extension AuthNavigationBar {
    /// Creates a navigation bar with standard login/logout buttons
    public static func standard(
        isAuthenticated: Bool,
        logoText: String,
        logoHref: Href,
        authenticatedLinks: [(String, Href)],
        unauthenticatedLinks: [(String, Href)],
        loginHref: Href,
        signupHref: Href,
        logoutHref: Href,
        sticky: Bool = true
    ) -> AuthNavigationBar {
        AuthNavigationBar(
            isAuthenticated: isAuthenticated,
            sticky: sticky
        ) {
            HTMLComponents.Link(logoText, href: logoHref)
                .fontSize(.rem(1.4))
                .fontWeight(.bold)
                .textDecoration(TextDecoration.none)
        } authenticatedItems: {
            for (title, href) in authenticatedLinks {
                NavLink(title, href: href)
            }
            NavSpacer()
            NavButton("Sign Out", href: logoutHref, style: .danger)
        } unauthenticatedItems: {
            for (title, href) in unauthenticatedLinks {
                NavLink(title, href: href)
            }
            NavSpacer()
            NavLink("Sign In", href: loginHref)
            NavButton("Get Started", href: signupHref, style: .primary)
        }
    }
}
