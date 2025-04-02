//
//  Color.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func color(
        _ color: Properties.ColorProperty?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.ColorProperty.property, color?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func color(
        _ color: Properties.ColorProperty.WithDarkMode?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.ColorProperty.property, color?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func color(
        light: Types.Color,
        dark: Types.Color?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.ColorProperty.property, Properties.ColorProperty.WithDarkMode.color(.init(light: light, dark: dark)).description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension Properties.ColorProperty {
    public enum WithDarkMode: Sendable, Equatable {
        case color(Properties.ColorProperty.WithDarkMode.Color)
        case global(Types.Global)
        
        public struct Color: Sendable, Equatable {
            public let light: Types.Color
            public let dark: Types.Color?
                       
            public init(light: Types.Color, dark: Types.Color? = nil) {
                self.light = light
                if let dark = dark {
                    self.dark = dark
                } else {
                    self.dark = light.darker()
                }
            }
        }
    }
}

extension Properties.ColorProperty.WithDarkMode.Color: CustomStringConvertible {
    public var description: String {
        if let dark = dark {
            return "@media (prefers-color-scheme: light) { \(light) } @media (prefers-color-scheme: dark) { \(dark) }"
        } else {
            return light.description
        }
    }
}

extension Properties.ColorProperty.WithDarkMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color): return color.description
        case .global(let global): return global.description
        }
    }
}

extension Properties.ColorProperty.WithDarkMode.Color {
    public func map(_ transform: (Types.Color) -> Types.Color) -> Self {
        .init(
            light: transform(light),
            dark: dark.map(transform)
        )
    }
    
    public func flatMap(_ transform: (Types.Color) -> Properties.ColorProperty.WithDarkMode.Color) -> Self {
        let lightTransformed = transform(light)
        let darkTransformed = dark.map(transform)
        
        return .init(
            light: lightTransformed.light,
            dark: darkTransformed?.dark ?? lightTransformed.dark
        )
    }
}

extension ColorProperty {
    public func adjustBrightness(by percentage: Double) -> ColorProperty {
        switch self {
        case .color(let color):
                .color(color.adjustBrightness(by: percentage))
        case .global(let global):
                .global(global)
        }
    }

}

extension Properties.ColorProperty.WithDarkMode.Color {
    public func adjustBrightness(by percentage: Double) -> Self {
        self.map { $0.adjustBrightness(by: percentage) }
    }

    public func darker(by percentage: Double = 0.2) -> Self {
        self.map { $0.darker(by: percentage) }
    }
    
    public func lighter(by percentage: Double = 0.2) -> Self {
        self.map { $0.lighter(by: percentage) }
    }
}

