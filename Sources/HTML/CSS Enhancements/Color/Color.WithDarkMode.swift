//
//  Color.WithDarkMode.swift
//  swift-html
//
//  Core type definitions for dark mode color support.
//

import CSS_Rendering
import CSS_Standard

public typealias Color = CSS_Standard.Color.WithDarkMode.Color
public typealias HTMLColor = Color

extension CSS_Standard.Color.Value {
    public func withDarkColor(_ color: CSS_Standard.Color.Value) -> HTMLColor {
        .init(light: self, dark: color)
    }
}

extension HTMLColor {
    public func withDarkColor(_ color: CSS_Standard.Color.Value) -> HTMLColor {
        .init(light: self.light, dark: color)
    }
}

extension HTMLColor {
    public func opacity(_ alpha: Double) -> HTMLColor {
        self.map { $0.opacity(alpha) }
    }
}

extension CSS_Standard.Color {
    public enum WithDarkMode: Sendable, Hashable, GlobalConvertible, ColorConvertible {

        case darkMode(CSS_Standard.Color.WithDarkMode.Color)
        case global(CSS_Standard.Global)

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

        public static func color(_ color: CSS_Standard.Color.Value) -> CSS_Standard.Color.WithDarkMode
        {
            return .init(color)
        }

        public static func color(_ color: CSS_Standard.Color.WithDarkMode.Color) -> Self {
            return .darkMode(color)
        }
    }
}

extension CSS_Standard.Color.WithDarkMode: W3C_CSS_Shared.Property {
    public static var property: String { CSS_Standard.Color.property }
}

extension CSS_Standard.Color.WithDarkMode {
    public init(_ color: CSS_Standard.Color) {
        switch color {
        case .global(let global): self = .global(global)
        case .color(let color): self = .init(color)
        }
    }
}

extension CSS_Standard.Color.WithDarkMode {
    public init(_ color: CSS_Standard.Color.Value) {
        self = .darkMode(.init(light: color))
    }
}

extension CSS_Standard.Color.WithDarkMode.Color: CustomStringConvertible {
    public var description: String {
        let attribute = CSS_Standard.Color.property
        return
            "@media (prefers-color-scheme: light) { \(attribute):\(light) } @media (prefers-color-scheme: dark) { \(attribute):\(dark) }"
    }
}

extension CSS_Standard.Color.WithDarkMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .darkMode(let color): return color.description
        case .global(let global): return global.description
        }
    }
}

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
