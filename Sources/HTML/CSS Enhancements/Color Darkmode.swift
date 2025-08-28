//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

public typealias Color = CSSPropertyTypes.Color.WithDarkMode.Color
public typealias HTMLColor = Color

extension CSSTypeTypes.Color {
    public func withDarkColor(_ color: CSSTypeTypes.Color) -> HTMLColor {
        .init(light: self, dark: color)
    }
}

extension HTMLColor {
    public func withDarkColor(_ color: CSSTypeTypes.Color) -> HTMLColor {
        .init(light: self.light, dark: color)
    }
}

extension HTMLColor {
    public func opacity(_ alpha: Double) -> HTMLColor {
        self.map { $0.opacity(alpha) }
    }
}

extension CSSPropertyTypes.Color {
    public enum WithDarkMode: Sendable, Hashable, GlobalConvertible, ColorConvertible {

        case darkMode(CSSPropertyTypes.Color.WithDarkMode.Color)
        case global(CSSTypeTypes.Global)

        public struct Color: Sendable, Hashable {
            public let light: CSSTypeTypes.Color
            public let dark: CSSTypeTypes.Color

            public init(light: CSSTypeTypes.Color, dark: CSSTypeTypes.Color? = nil) {
                self.light = light
                if let dark = dark {
                    self.dark = dark
                } else {
                    self.dark = light.darker()
                }
            }
        }

        public static func color(_ color: CSSTypeTypes.Color) -> CSSPropertyTypes.Color.WithDarkMode {
            return .init(color)
        }

        public static func color(_ color: CSSPropertyTypes.Color.WithDarkMode.Color) -> Self {
            return .darkMode(color)
        }
    }
}

extension CSSPropertyTypes.Color.WithDarkMode: CSSPropertyTypes.Property {
    public static var property: String { CSSPropertyTypes.Color.property }
}

extension CSSPropertyTypes.Color.WithDarkMode {
    public init(_ color: CSSPropertyTypes.Color) {
        switch color {
        case .global(let global): self = .global(global)
        case .color(let color): self = .init(color)
        }
    }
}

extension CSSPropertyTypes.Color.WithDarkMode {
    public init(_ color: CSSTypeTypes.Color) {
        self = .darkMode(.init(light: color))
    }
}

extension CSSPropertyTypes.Color.WithDarkMode.Color: CustomStringConvertible {
    public var description: String {
        let attribute = CSSPropertyTypes.Color.property
        return "@media (prefers-color-scheme: light) { \(attribute):\(light) } @media (prefers-color-scheme: dark) { \(attribute):\(dark) }"
    }
}

extension CSSPropertyTypes.Color.WithDarkMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .darkMode(let color): return color.description
        case .global(let global): return global.description
        }
    }
}

extension CSSPropertyTypes.Color.WithDarkMode.Color {
    public func map(_ transform: (CSSTypeTypes.Color) -> CSSTypeTypes.Color) -> Self {
        .init(
            light: transform(light),
            dark: transform(dark)
        )
    }

    public func flatMap(_ transform: (CSSTypeTypes.Color) -> CSSPropertyTypes.Color.WithDarkMode.Color) -> Self {
        let lightTransformed = transform(light)
        let darkTransformed = transform(dark)

        return .init(
            light: lightTransformed.light,
            dark: darkTransformed.dark
        )
    }
}

extension CSSPropertyTypes.Color {
    public func adjustBrightness(by percentage: Double) -> Self {
        switch self {
        case .color(let color): .color(color.adjustBrightness(by: percentage))
        case .global(let global): .global(global)
        }
    }
}

extension CSSPropertyTypes.Color.WithDarkMode.Color {
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

// MARK: HTML extensions

extension HTML {
    @discardableResult
    @_disfavoredOverload
    func lightAndDarkMode(
        _ property: String,
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .inlineStyle(property, light.description, media: media, selector: selector, pseudo: pseudo)
            .inlineStyle(property, dark?.description, media: .prefersColorScheme(.dark).and(media), selector: selector, pseudo: pseudo)
    }
}

// MARK: HTML extension - Color

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func color(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.Color.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func color(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.color(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func color(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.color(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - AccentColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func accentColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.AccentColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func accentColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.accentColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func accentColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.accentColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BackgroundColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BackgroundColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func backgroundColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.backgroundColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}


// MARK: HTML extension - BorderBlockColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBlockColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderBlockColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBlockColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBlockColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBlockColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderBlockColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderBlockEndColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBlockEndColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderBlockEndColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBlockEndColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBlockEndColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBlockEndColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderBlockEndColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderBlockStartColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBlockStartColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderBlockStartColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBlockStartColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBlockStartColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBlockStartColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderBlockStartColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderBottomColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBottomColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderBottomColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBottomColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBottomColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBottomColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderBottomColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderInlineColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderInlineColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderInlineColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderInlineColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderInlineColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderInlineColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderInlineColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderInlineEndColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderInlineEndColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderInlineEndColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderInlineEndColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderInlineEndColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderInlineEndColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderInlineEndColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderInlineStartColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderInlineStartColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderInlineStartColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderInlineStartColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderInlineStartColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderInlineStartColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderInlineStartColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderLeftColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderLeftColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderLeftColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderLeftColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderLeftColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderLeftColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderLeftColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderRightColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderRightColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderRightColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderRightColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderRightColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderRightColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderRightColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderTopColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderTopColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.BorderTopColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderTopColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderTopColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderTopColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.borderTopColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - CaretColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func caretColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.CaretColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func caretColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.caretColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func caretColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.caretColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - ColumnRuleColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func columnRuleColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.ColumnRuleColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func columnRuleColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.columnRuleColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func columnRuleColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.columnRuleColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - FloodColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func floodColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.FloodColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func floodColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.floodColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func floodColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.floodColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}
// MARK: HTML extension - Fill

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func fill(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.Fill.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func fill(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.fill(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func fill(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.fill(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - LightingColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func lightingColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.LightingColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func lightingColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.lightingColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func lightingColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.lightingColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - OutlineColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func outlineColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.OutlineColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func outlineColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.outlineColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func outlineColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.outlineColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - StopColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func stopColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.StopColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func stopColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.stopColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func stopColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.stopColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - Stroke

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func stroke(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.Stroke.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func stroke(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.stroke(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func stroke(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.stroke(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - TextDecorationColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func textDecorationColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.TextDecorationColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func textDecorationColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.textDecorationColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func textDecorationColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.textDecorationColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}

// MARK: HTML extension - TextEmphasisColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func textEmphasisColor(
        light: CSSTypeTypes.Color,
        dark: CSSTypeTypes.Color?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(CSSPropertyTypes.TextEmphasisColor.property, light: light, dark: dark, media: media, selector: selector, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func textEmphasisColor(
        _ color: HTMLColor?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.textEmphasisColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func textEmphasisColor(
        _ color: CSSPropertyTypes.Color.WithDarkMode?,
        media: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case let .darkMode(color):
            self.textEmphasisColor(light: color.light, dark: color.dark, media: media, selector: selector, pseudo: pseudo)
        case .none:
            self
        }
    }
}
