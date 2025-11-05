//
//  NavItem.swift
//  swift-html
//
//  Navigation item types for NavigationBar
//

import Foundation
import HTML
import HTMLComponents
import HTMLTheme

// MARK: - NavItem Protocol
public typealias NavItem = HTML

// MARK: - NavLink
public struct NavLink: NavItem {
    let title: any HTML
    let href: Href
    let isActive: Bool

    public init(
        _ title: any HTML,
        href: Href,
        isActive: Bool
    ) {
        self.title = title
        self.href = href
        self.isActive = isActive
    }

    public var body: some HTML {
        a(href: href) {
            AnyHTML(title)
        }
        .fontWeight(isActive ? .semiBold : nil)
        .color(isActive ? .text.link : .text.tertiary)
        .color(HTMLColor.text.link, pseudo: .visited)
        .color(HTMLColor.text.link, pseudo: .link)
        .textDecoration(TextDecoration.none, pseudo: .visited)
        .textDecoration(TextDecoration.none, pseudo: .link)
        .textDecoration(TextDecoration.underline, pseudo: .hover)
    }
}

// MARK: - NavButton
public struct NavButton: NavItem {
    public enum Style {
        case primary
        case secondary
        case danger
        case success

        var backgroundColor: HTMLColor {
            switch self {
            case .primary: return .blue
            case .secondary: return .gray
            case .danger: return .red
            case .success: return .green
            }
        }

        var textColor: HTMLColor {
            switch self {
            case .primary, .danger, .success: return .white
            case .secondary: return .text.primary
            }
        }

        var borderColor: HTMLColor? {
            switch self {
            case .secondary: return .border.secondary
            default: return nil
            }
        }
    }

    let title: String
    let href: Href
    let style: Style

    public init(
        _ title: String,
        href: Href,
        style: Style = .primary
    ) {
        self.title = title
        self.href = href
        self.style = style
    }

    public var body: some HTML {
        a(href: href) {
            title
        }
        .padding(vertical: .rem(0.5), horizontal: .rem(1))
        .backgroundColor(style.backgroundColor)
        .color(style.textColor)
        .borderRadius(.px(4))
        .textDecoration(TextDecoration.none)
        .fontWeight(.medium)
        .if(style.borderColor != nil) { button in
            button.border(
                width: .px(1),
                style: .solid,
                color: style.borderColor!
            )
        }
        .inlineStyle("transition", "all 0.2s")
        .opacity(0.9, pseudo: .hover)
        .transform("translateY(-1px)", pseudo: .hover)
    }
}

// MARK: - NavDivider
public struct NavDivider: NavItem {
    public init() {}

    public var body: some HTML {
        span {}
            .width(.px(1))
            .height(.rem(1.5))
            .backgroundColor(.border.secondary)
            .margin(horizontal: .rem(0.5))
            .display(.inlineBlock)
    }
}

// MARK: - NavDropdown
public struct NavDropdown<Items: HTML>: NavItem {
    let title: String
    let items: Items

    public init(
        _ title: String,
        @HTMLBuilder items: () -> Items
    ) {
        self.title = title
        self.items = items()
    }

    public var body: some HTML {
        div {
            button {
                title
                span { "▼" }
                    .marginLeft(.rem(0.25))
                    .fontSize(.rem(0.75))
            }
            .backgroundColor(.transparent)
            .border(.hidden)
            .color(.text.primary)
            .cursor(.pointer)
            .padding(.rem(0.5))
            .fontWeight(.medium)

            div {
                items
            }
            .class("dropdown-menu")
            .display(.block, selector: ":hover .dropdown-menu")
            .display(Display.none)
            .position(.absolute)
            .top(.percent(100))
            .right(.px(0))
            .backgroundColor(.background.primary)
            .border(.init(width: .px(1), style: .solid, color: .border.secondary))
            .borderRadius(.px(4))
            .padding(.rem(0.5))
            .minWidth(.px(150))
            .zIndex(1000)
            .inlineStyle("box-shadow", "0 4px 6px rgba(0, 0, 0, 0.1)")
        }
        .class("dropdown")
        .position(.relative)
    }
}

// MARK: - NavSpacer
public struct NavSpacer: NavItem {
    public init() {}

    public var body: some HTML {
        div {}
            .flexGrow(1)  // Takes up all available space between items
            .display(.block, media: .desktop)
            .display(Display.none, media: .mobile)  // Hide on mobile
    }
}

// MARK: - NavGroup
public struct NavGroup<Items: HTML>: NavItem {
    let items: Items
    let spacing: Length

    public init(
        spacing: Length = .rem(1),
        @HTMLBuilder items: () -> Items
    ) {
        self.items = items()
        self.spacing = spacing
    }

    public var body: some HTML {
        div {
            items
        }
        .display(.flex)
        .alignItems(.center)
        .gap(.length(spacing))
    }
}
