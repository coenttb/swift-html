//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 14/08/2024.
//

import Foundation
import HTML
import HTMLComponents
import Dependencies
import Builders

public struct NavigationBar: HTML {
    let logo: any HTML
    let items: [any NavItem]
    let sticky: Bool
    let backgroundColor: HTMLColor?
    
    public init(
        sticky: Bool = false,
        backgroundColor: HTMLColor? = nil,
        @HTMLBuilder logo: () -> any HTML,
        @ArrayBuilder<NavItem> items: () -> [any NavItem]
    ) {
        self.logo = logo()
        self.items = items()
        self.sticky = sticky
        self.backgroundColor = backgroundColor
    }
    
    // Legacy init for backward compatibility
    public init(
        @HTMLBuilder logo: () -> any HTML,
        @HTMLBuilder centeredNavItems: () -> any HTML,
        @HTMLBuilder trailingNavItems: () -> any HTML,
        @HTMLBuilder mobileNavItems: () -> any HTML
    ) {
        self.logo = logo()
        self.items = []
        self.sticky = false
        self.backgroundColor = nil
        // Note: This init is deprecated and will be removed in future versions
    }
    
    public var body: some HTML {
        nav {
            div {
                // Logo
                AnyHTML(logo)
                    .lineHeight(0)
                
                // Desktop navigation items
                div {
                    HTMLForEach(items) { item in
                        AnyHTML(item)
                    }
                }
                .display(.flex)
                .alignItems(.center)
                .gap(.rem(1))
                .display(Display.none, media: .mobile)
                
                // Mobile menu button
                MenuButton()
                
                // Mobile navigation items
                div {
                    HTMLForEach(items) { item in
                        div {
                            AnyHTML(item)
                        }
                        .padding(.rem(0.75))
                    }
                }
                .class("mobile-menu")
                .flexItem(
                    grow: 1,
                    shrink: 1,
                    basis: .percent(100)
                )
                .backgroundColor(backgroundColor ?? .background.secondary)
                .borderTop(width: .px(1), style: .solid, color: .border.secondary)
                .marginTop(.rem(1))
                .display(Display.none)
                .display(.block, media: .mobile, selector: "input:checked ~ .mobile-menu")
            }
            .flexContainer(
                direction: .row,
                wrap: .wrap,
                justification: .spaceBetween,
                itemAlignment: .center
            )
            .padding(
                top: .rem(1.5),
                bottom: .rem(1.5),
                left: .rem(2),
                right: .rem(2)
            )
            .padding(.rem(1.5), media: .desktop)
            .maxWidth(.px(1280))
            .margin(vertical: .zero, horizontal: .auto)
        }
        .width(.percent(100))
        .if(sticky) { nav in
            nav.position(.sticky)
                .top(.zero)
                .zIndex(9999)
        }
        .if(backgroundColor != nil) { nav in
            nav.backgroundColor(backgroundColor!)
        }
    }
    
    
    struct MenuButton: HTML {
        var body: some HTML {
            
            input.checkbox
                .id("menu-checkbox")
                .display(Display.none)
            
            Bars()
                .id("menu-icon")
                .attribute("for", "menu-checkbox")
                .cursor(.pointer)
                .display(Display.none, media: .desktop)
                .userSelect(UserSelect.none)
        }
        
        struct Bars: HTML {
            var body: some HTML {
                label {
                    HTMLForEach(-1...1) { index in
                        Bar(index: index)
                    }
                    .width(.px(24))
                    .height(.px(3))
                    .backgroundColor(.background.button)
                    .display(.block)
                    .inlineStyle("border-radius", "1.5px")
                    .inlineStyle("transition", "all .2s ease-out, background .2s ease-out")
                    .position(.relative)
                }
            }
        }
        
        struct Bar: HTML {
            let index: Int
            var body: some HTML {
                span {}
                    .inlineStyle("top", index == 0 ? nil : "\(index * 5)px")
                    .inlineStyle(
                        "top",
                        index == 0 ? nil : index == 1 ? "-5px" : "0",
                        selector: "input:checked ~ #menu-icon"
                    )
                    .inlineStyle("transform", "rotate(\(index * 45)deg)", selector: "input:checked ~ #menu-icon")
                    .inlineStyle(
                        "background",
                        index == 0 ? "transparent" : nil,
                        selector: "input:checked ~ #menu-icon"
                    )
            }
        }
    }
}


public struct Login {
    let isLoggedIn: Bool
    let accountHref: String
    let signupHref: String
    let loginHref: String
    
    public init(isLoggedIn: Bool, accountHref: String, signupHref: String, loginHref: String) {
        self.isLoggedIn = isLoggedIn
        self.accountHref = accountHref
        self.signupHref = signupHref
        self.loginHref = loginHref
    }
}

public struct NavigationBarSVGLogo: HTML {
    let href: Href
    let svg: SVG
    
    public init(
        href: Href,
        svg: () -> SVG
    ) {
        self.svg = svg()
        self.href = href
    }
    
    public var body: some HTML {
        HTMLComponents.Link(href: href) {
            svg
        }
    }
}

public struct NavigationBarCenteredNavItems: HTML {
    
    let items: [NavListItem]
    
    public init(items: [NavListItem]) {
        self.items = items
    }
    
    public var body: some HTML {
        ul {
            HTMLGroup {
                HTMLForEach(self.items) { item in
                    item
                }
            }
            .padding(left: .rem(1.5), media: .desktop)
        }
        
    }
    
    
    public struct NavListItem: HTML {
        let title: String
        let href: Href
        
        public init(_ title: String, href: Href) {
            self.title = title
            self.href = href
        }
        public var body: some HTML {
            li {
                HTMLComponents.Link(
                    title,
                    href: href
                )
                .padding(left: .rem(2), pseudo: .not(.firstChild))
            }
            .display(.inline)
        }
    }
}


public struct NavigationBarTrailingNavItems: HTML {
    
    let items: [NavListItem]
    
    public init(
        items: [NavListItem]
    ) {
        self.items = items
    }
    
    public var body: some HTML {
        ul {
            HTMLForEach(self.items) { item in
                item
            }
            .display(.inline)
            .padding(
                left: .rem(1),
                pseudo: .not(.firstChild)
            )
        }
    }
    
    public struct NavListItem: HTML {
        let title: String
        let href: Href
        
        public init(_ title: String, href: Href) {
            self.title = title
            self.href = href
        }
        public var body: some HTML {
            li {
                HTMLComponents.Link(
                    title,
                    href: href
                )
                .display(.block)
            }
        }
    }
}




#if DEBUG && canImport(SwiftUI)
import SwiftUI

var content: some HTML {
    NavigationBar {
        div {}
    } centeredNavItems: {
        NavigationBarCenteredNavItems(
            items: [
                .init("hello", href: "#"),
                .init("THERE", href: "#"),
            ]
        )
    } trailingNavItems: {
        NavigationBarTrailingNavItems(
            items: [
                .init("TEST", href: ""),
                .init("TEST2", href: ""),
            ]
        )
    } mobileNavItems: {
        ul {
            li { "test1" }
            li { "test2" }
        }
    }
}


#Preview {
    HTMLDocument {
        content
        
        HTMLSourceText(html: content)
    }
    .frame(width: 400, height: 900)
    
    
}
#endif




struct HTMLSourceText: HTML {
    let html: any HTML
    var body: some HTML {
        HTMLText(
            try! String(
                HTMLDocument {
                    AnyHTML(html)
                }
            )
        )
    }
}
