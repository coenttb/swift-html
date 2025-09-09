//
//  SettingsSection.swift
//  swift-html
//
//  A reusable settings section component for admin panels and configuration pages
//

import Foundation
import HTML
import HTMLComponents
import HTMLFontAwesome
import Builders

/// A section component for settings pages with icon, title, and content area
public struct SettingsSection<Content: HTML>: HTML {
    /// The title of the settings section
    let title: String
    
    /// Optional icon to display
    let icon: FontAwesomeIcon?
    
    /// The variant/style of the section
    let variant: Variant
    
    /// The content of the section
    let content: Content
    
    /// Optional custom padding
    let padding: LengthPercentage?
    
    /// Optional custom border radius
    let borderRadius: LengthPercentage?
    
    /// Defines the visual style of the settings section
    public enum Variant {
        case `default`
        case danger
        case warning
        case success
        case info
        
        var borderColor: HTMLColor {
            switch self {
            case .default: return .border.secondary
            case .danger: return .border.error
            case .warning: return .border.warning
            case .success: return .border.success
            case .info: return .border.info
            }
        }
        
        var titleColor: HTMLColor {
            switch self {
            case .default: return .text.primary
            case .danger: return .red
            case .warning: return .orange
            case .success: return .green
            case .info: return .blue
            }
        }
        
        var backgroundColor: HTMLColor? {
            switch self {
            case .default: return .background.primary
            case .danger: return .background.error.opacity(0.05)
            case .warning: return .background.warning.opacity(0.05)
            case .success: return .background.success.opacity(0.05)
            case .info: return .background.info.opacity(0.05)
            }
        }
    }
    
    public init(
        title: String,
        icon: FontAwesomeIcon? = nil,
        variant: Variant = .default,
        padding: LengthPercentage? = nil,
        borderRadius: LengthPercentage? = nil,
        @HTMLBuilder content: () -> Content
    ) {
        self.title = title
        self.icon = icon
        self.variant = variant
        self.padding = padding
        self.borderRadius = borderRadius
        self.content = content()
    }
    
    public var body: some HTML {
        div {
            // Header with icon and title
            Header(3) {
                if let icon = icon {
                    span {
                        icon
                            .style(.solid)
                            .size(.normal)
                    }
                    .marginRight(.rem(0.75))
                }
                HTMLText(title)
            }
            .fontSize(.rem(1.3))
            .color(variant.titleColor)
            .display(.flex)
            .alignItems(.center)
            .marginBottom(.rem(1.5))
            
            // Content area
            content
        }
        .padding(.init(padding ?? .rem(2)))
        .backgroundColor(variant.backgroundColor ?? .background.primary)
        .border(.init(
            width: .px(1),
            style: .solid,
            color: variant.borderColor
        ))
        .borderRadius(.init(borderRadius ?? .px(8)))
    }
}

extension SettingsSection {
    /// Creates a danger zone settings section (convenience initializer)
    public static func dangerZone<C: HTML>(
        title: String = "Danger Zone",
        icon: FontAwesomeIcon = .triangleExclamation,
        @HTMLBuilder content: () -> C
    ) -> SettingsSection<C> {
        SettingsSection<C>(
            title: title,
            icon: icon,
            variant: .danger,
            content: content
        )
    }
    
    /// Creates an info settings section (convenience initializer)
    public static func info<C: HTML>(
        title: String,
        icon: FontAwesomeIcon = .circleInfo,
        @HTMLBuilder content: () -> C
    ) -> SettingsSection<C> {
        SettingsSection<C>(
            title: title,
            icon: icon,
            variant: .info,
            content: content
        )
    }
}
