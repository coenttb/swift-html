//
//  Color.WithDarkMode.swift
//  swift-html
//
//  Legacy dark mode color support - deprecated in favor of DarkModeColor and ColorProperty.
//
//  This file is kept for backward compatibility during migration.
//  New code should use DarkModeColor and ColorProperty instead.
//

import CSS
import CSS_Standard

// MARK: - Legacy CSS_Standard.Color.WithDarkMode Type

extension CSS_Standard.Color {
    /// Legacy dark mode color type.
    ///
    /// - Important: This type is deprecated. Use `DarkModeColor` and `ColorProperty` instead.
    @available(*, deprecated, message: "Use DarkModeColor and ColorProperty instead")
    public enum WithDarkMode: Sendable, Hashable, GlobalConvertible, ColorConvertible {

        case darkMode(CSS_Standard.Color.WithDarkMode.Color)
        case global(CSS_Standard.Global)

        /// Legacy nested Color struct.
        ///
        /// - Important: This type is deprecated. Use `DarkModeColor` instead.
        @available(*, deprecated, message: "Use DarkModeColor instead")
        public struct Color: Sendable, Hashable {
            public let light: CSS_Standard.Color.Value
            public let dark: CSS_Standard.Color.Value

            public init(light: CSS_Standard.Color.Value, dark: CSS_Standard.Color.Value? = nil) {
                self.light = light
                if let dark = dark {
                    self.dark = dark
                } else {
                    self.dark = light.darker()
                }
            }
        }

        public static func color(_ color: CSS_Standard.Color.Value) -> CSS_Standard.Color.WithDarkMode {
            return .init(color)
        }

        public static func color(_ color: CSS_Standard.Color.WithDarkMode.Color) -> Self {
            return .darkMode(color)
        }
    }
}

@available(*, deprecated, message: "Use DarkModeColor and ColorProperty instead")
extension CSS_Standard.Color.WithDarkMode: W3C_CSS_Shared.Property {
    public static var property: String { CSS_Standard.Color.property }
}

@available(*, deprecated, message: "Use DarkModeColor and ColorProperty instead")
extension CSS_Standard.Color.WithDarkMode {
    public init(_ color: CSS_Standard.Color) {
        switch color {
        case .global(let global): self = .global(global)
        case .color(let color): self = .init(color)
        }
    }
}

@available(*, deprecated, message: "Use DarkModeColor and ColorProperty instead")
extension CSS_Standard.Color.WithDarkMode {
    public init(_ color: CSS_Standard.Color.Value) {
        self = .darkMode(.init(light: color))
    }
}

@available(*, deprecated, message: "Use DarkModeColor instead")
extension CSS_Standard.Color.WithDarkMode.Color: CustomStringConvertible {
    public var description: String {
        let attribute = CSS_Standard.Color.property
        return "@media (prefers-color-scheme: light) { \(attribute):\(light) } @media (prefers-color-scheme: dark) { \(attribute):\(dark) }"
    }
}

@available(*, deprecated, message: "Use DarkModeColor and ColorProperty instead")
extension CSS_Standard.Color.WithDarkMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .darkMode(let color): return color.description
        case .global(let global): return global.description
        }
    }
}

@available(*, deprecated, message: "Use DarkModeColor instead")
extension CSS_Standard.Color.WithDarkMode.Color {
    public func map(_ transform: (CSS_Standard.Color.Value) -> CSS_Standard.Color.Value) -> Self {
        .init(
            light: transform(light),
            dark: transform(dark)
        )
    }

    public func flatMap(
        _ transform: (CSS_Standard.Color.Value) -> CSS_Standard.Color.WithDarkMode.Color
    ) -> Self {
        let lightTransformed = transform(light)
        let darkTransformed = transform(dark)

        return .init(
            light: lightTransformed.light,
            dark: darkTransformed.dark
        )
    }
}

@available(*, deprecated, message: "Use DarkModeColor instead")
extension CSS_Standard.Color.WithDarkMode.Color {
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

// MARK: - Conversion to New Types

@available(*, deprecated, message: "Use DarkModeColor and ColorProperty instead")
extension CSS_Standard.Color.WithDarkMode {
    /// Converts to the new ColorProperty type.
    public var asColorProperty: ColorProperty {
        switch self {
        case .darkMode(let color):
            return .value(DarkModeColor(light: color.light, dark: color.dark))
        case .global(let global):
            return .global(global)
        }
    }
}

@available(*, deprecated, message: "Use DarkModeColor instead")
extension CSS_Standard.Color.WithDarkMode.Color {
    /// Converts to the new DarkModeColor type.
    public var asDarkModeColor: DarkModeColor {
        DarkModeColor(light: light, dark: dark)
    }
}
