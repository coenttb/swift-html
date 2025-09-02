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
    let centeredNavItems: any HTML
    let trailingNavItems: any HTML
    let mobileNavItems: any HTML
    
    public init(
        @HTMLBuilder logo: () -> any HTML,
        @HTMLBuilder centeredNavItems: () -> any HTML,
        @HTMLBuilder trailingNavItems: () -> any HTML,
        @HTMLBuilder mobileNavItems: () -> any HTML
    ) {
        self.logo = logo()
        self.centeredNavItems = centeredNavItems()
        self.trailingNavItems = trailingNavItems()
        self.mobileNavItems = mobileNavItems()
    }
    
    public var body: some HTML {
        nav {
            div {
                AnyHTML(logo)
                    .lineHeight(0)
                AnyHTML(centeredNavItems)
                    .listStyle(.reset)
                    .display(Display.none, media: .mobile)
                AnyHTML(trailingNavItems)
                    .listStyle(.reset)
                    .display(Display.none, media: .mobile)
                MenuButton()
                AnyHTML(mobileNavItems)
                    .listStyle(.reset)
                    .flexItem(
                        grow: 1,
                        shrink: 1,
                        basis: .percent(100)
                    )
                    .margin(.zero)
                    .display(Display.none)
                    .display(.block, media: .mobile, selector: "input:checked ~")
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
        .position(.sticky, media: .mobile)
        .top(.zero, media: .mobile)
        .zIndex(9999)
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

public struct NavigationBarMobileNavItems: HTML {
    let login: Login?
    let items: [NavListItem]
    
    public init(
        login: Login?,
        items: [NavListItem]
    ) {
        self.login = login
        self.items = items
    }
    
    public var body: some HTML {
        HTMLText("TO BE DELETED")
        //        ul {
        //            HTMLForEach(self.items) { item in
        //                li {
        //                    item
        //                }
        //            }
        //            .padding(top: 1.5.rem)
        //
        //            if let login {
        //                switch login.isLoggedIn {
        //                case true:
        //                    li {
        //                        Button(
        //                            tag: a,
        //                            backgroundColor: .purple,
        //                            foregroundColor: .white.withDarkColor(.black)
        //                        ) {
        //                            HTMLText("Account")
        //                        }
        //                        .textAlign(.center)
        //                        .attribute("href", login.accountHref)
        //                        .display(.block)
        //                    }
        //                case false:
        //                    li {
        //                        Button(
        //                            tag: a,
        //                            backgroundColor: .purple,
        //                            foregroundColor: .white.withDarkColor(.black)
        //                        ) {
        //                            HTMLText("Login")
        //                        }
        //                        .textAlign(.center)
        //                        .attribute(
        //                            "href",
        //                            login.loginHref
        //                        )
        //                        .display(.block)
        //                    }
        //
        //                    li {
        //
        //                        Button(
        //                            tag: a,
        //                            backgroundColor: .purple,
        //                            foregroundColor: .white.withDarkColor(.black)
        //                        ) {
        //                            HTMLText("Sign up")
        //                        }
        //                        .textAlign(.center)
        //                        .attribute(
        //                            "href",
        //                            login.signupHref
        //                        )
        //                        .display(.block)
        //                    }
        //                }
        //            } else {
        //                HTMLEmpty()
        //            }
        //        }
    }
    
    public struct NavListItem: HTML {
        let title: String
        let href: Href
        
        public init(
            _ title: String,
            href: Href
        ) {
            self.title = title
            self.href = href
        }
        public var body: some HTML {
            
            HTMLComponents.Link(
                title,
                href: href
            )
            .display(.block)
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
