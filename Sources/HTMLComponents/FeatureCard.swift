//
//  FeatureCard.swift
//  swift-html
//
//  A reusable feature card component for showcasing features, benefits, or capabilities
//

import Foundation
import HTML

/// A card component for displaying features with an icon, title, and description
public struct FeatureCard: HTML {
    /// The icon to display (can be an emoji, SF Symbol name, or icon class)
    let icon: String
    
    /// The title of the feature
    let title: String
    
    /// A description of the feature
    let description: String
    
    /// Whether the card should have hover effects
    let hoverable: Bool
    
    /// Optional custom hover styles
    let hoverStyles: HoverStyles?
    
    /// Optional border configuration
    let borderConfig: BorderConfig?
    
    /// Optional background color
    let backgroundColor: HTMLColor?
    
    public struct BorderConfig: Sendable {
        var width: BorderWidth?
        var style: CSSTypeTypes.LineStyle?
        var color: HTMLColor?
        
        public init(
            width: BorderWidth? = .px(1),
            style: CSSTypeTypes.LineStyle? = .solid,
            color: HTMLColor? = .border.primary
        ) {
            self.width = width
            self.style = style
            self.color = color
        }
        
        public static let `default` = BorderConfig()
    }
    
    public struct HoverStyles: Sendable {
        public let transform: String?
        public let borderColor: HTMLColor?
        public let backgroundColor: HTMLColor?
        public let boxShadow: String?
        
        public init(
            transform: String? = "translateY(-4px)",
            borderColor: HTMLColor? = nil,
            backgroundColor: HTMLColor? = nil,
            boxShadow: String? = nil
        ) {
            self.transform = transform
            self.borderColor = borderColor
            self.backgroundColor = backgroundColor
            self.boxShadow = boxShadow
        }
        
        public static let `default` = HoverStyles()
    }
    
    public init(
        icon: String,
        title: String,
        description: String,
        hoverable: Bool = true,
        hoverStyles: HoverStyles? = nil,
        borderConfig: BorderConfig?,
        backgroundColor: HTMLColor? = .background.primary
    ) {
        self.icon = icon
        self.title = title
        self.description = description
        self.hoverable = hoverable
        self.hoverStyles = hoverStyles
        self.borderConfig = borderConfig
        self.backgroundColor = backgroundColor
    }
    
    public var body: some HTML {
        div {
            // Icon container
            div { icon }
                .fontSize(.rem(2.5))
                .marginBottom(.rem(1))
            
            // Title
            Header(3) { title }
                .fontSize(.rem(1.3))
                .marginBottom(.rem(0.5))
                .color(.text.primary)
            
            // Description
            Paragraph { description }
                .color(.text.secondary)
                .lineHeight(1.6)
        }
        .padding(.rem(2))
        .borderRadius(.px(8))
        .backgroundColor(backgroundColor ?? .background.primary)
        .if(let: borderConfig) { view, config in
            view.border(width: config.width, style: config.style, color: config.color)
        }
        .inlineStyle("transition", hoverable ? "all 0.2s ease" : nil)
        .inlineStyle(":hover", hoverable ? buildHoverStyle() : nil)
    }
    
    private func buildHoverStyle() -> String? {
        guard hoverable else { return nil }
        
        let styles = hoverStyles ?? .default
        var hoverParts: [String] = []
        
        if let transform = styles.transform {
            hoverParts.append("transform: \(transform)")
        }
        
        if let borderColor = styles.borderColor {
            hoverParts.append("border-color: \(borderColor)")
        }
        
        if let backgroundColor = styles.backgroundColor {
            hoverParts.append("background-color: \(backgroundColor)")
        }
        
        if let boxShadow = styles.boxShadow {
            hoverParts.append("box-shadow: \(boxShadow)")
        } else if styles.boxShadow == nil && hoverable {
            // Default shadow on hover if not specified
            hoverParts.append("box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1)")
        }
        
        return hoverParts.isEmpty ? nil : hoverParts.joined(separator: "; ")
    }
}

// MARK: - Convenience Initializers

extension FeatureCard {
    /// Creates a simple feature card with default styling
    public init(
        icon: String,
        title: String,
        description: String
    ) {
        self.init(
            icon: icon,
            title: title,
            description: description,
            hoverable: true,
            hoverStyles: .default,
            borderConfig: .default,
            backgroundColor: .background.primary
        )
    }
    
    /// Creates a feature card with custom hover color
    public init(
        icon: String,
        title: String,
        description: String,
        hoverBorderColor: HTMLColor
    ) {
        self.init(
            icon: icon,
            title: title,
            description: description,
            hoverable: true,
            hoverStyles: HoverStyles(borderColor: hoverBorderColor),
            borderConfig: .default,
            backgroundColor: .background.primary
        )
    }
}
