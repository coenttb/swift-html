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
    public enum WithDarkMode: Sendable, Equatable, GlobalConvertible {
        case color(Properties.ColorProperty.WithDarkMode.Color)
        case global(Types.Global)
        
        public struct Color: Sendable, Equatable {
            public let light: Types.Color
            public let dark: Types.Color
                       
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
        "@media (prefers-color-scheme: light) { \(light) } @media (prefers-color-scheme: dark) { \(dark) }"
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
            dark: transform(dark)
        )
    }
    
    public func flatMap(_ transform: (Types.Color) -> Properties.ColorProperty.WithDarkMode.Color) -> Self {
        let lightTransformed = transform(light)
        let darkTransformed = transform(dark)
        
        return .init(
            light: lightTransformed.light,
            dark: darkTransformed.dark
        )
    }
}

extension ColorProperty {
    public func adjustBrightness(by percentage: Double) -> ColorProperty {
        switch self {
        case .color(let color): .color(color.adjustBrightness(by: percentage))
        case .global(let global): .global(global)
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



//
//extension Properties.ColorProperty.WithDarkMode.Color {
//    @available(*, deprecated, renamed: "withDarkColor(_:)")
//    public func dark(_ color: ColorProperty) -> Self {
//        withDarkColor(color)
//    }
//
//    @available(*, deprecated, renamed: "withLightColor(_:)")
//    public func light(_ color: Types.Color) -> Self {
//        withLightColor(.color(color))
//    }
//
//    public func withDarkColor(_ color: Types.Color) -> Self {
//        .init(light: self.light, dark: color)
//    }
//
//    public func withLightColor(_ color: Types.Color) -> Self {
//        .init(light: color, dark: self.dark)
//    }
//}
//
//extension HTMLColor {
//    public static func gray(_ value: UInt8) -> Self {
//        let lightHex = String(format: "%02X", value)
//        let darkHex = String(format: "%02X", 255 - value)
//        return Self(light: .hex(lightHex + lightHex + lightHex))
//            .withDarkColor(.hex(darkHex + darkHex + darkHex))
//    }
//
//    @_disfavoredOverload
//    public static func gray(_ value: Double) -> Self {
//        gray(UInt8(255 * value))
//    }
//}
//
//extension HTMLColor {
//    public func opacity(_ opacity: Double) -> HTMLColor {
//        self.map { $0.opacity(opacity) }
//    }
//}



//extension HTMLColor {
//    public static func keyword(_ keyword: Types.Color.Keyword) -> HTMLColor {
//        return HTMLColor(.keyword(keyword))
//    }
//
//    public static func hex(_ hex: String) -> HTMLColor {
//        return HTMLColor(.hex(hex))
//    }
//
//    public static func rgb(red: Int, green: Int, blue: Int) -> HTMLColor {
//        return HTMLColor(.rgb(red: red, green: green, blue: blue))
//    }
//
//    public static func rgba(red: Int, green: Int, blue: Int, alpha: Double) -> HTMLColor {
//        return HTMLColor(.rgba(red: red, green: green, blue: blue, alpha: alpha))
//    }
//
//    public static func hsl(hue: Int, saturation: Double, lightness: Double) -> HTMLColor {
//        return HTMLColor(.hsl(hue: hue, saturation: saturation, lightness: lightness))
//    }
//
//    public static func hsla(hue: Int, saturation: Double, lightness: Double, alpha: Double) -> HTMLColor {
//        return HTMLColor(.hsla(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha))
//    }
//
//    public static func hwb(hue: Int, whiteness: Double, blackness: Double) -> HTMLColor {
//        return HTMLColor(.hwb(hue: hue, whiteness: whiteness, blackness: blackness))
//    }
//
//    public static func lab(lightness: Double, a: Double, b: Double) -> HTMLColor {
//        return HTMLColor(.lab(lightness: lightness, a: a, b: b))
//    }
//
//    public static func lch(lightness: Double, chroma: Double, hue: Double) -> HTMLColor {
//        return HTMLColor(.lch(lightness: lightness, chroma: chroma, hue: hue))
//    }
//
//    public static func system(_ system: Types.Color.SystemColor) -> HTMLColor {
//        return HTMLColor(.system(system))
//    }
//
//    public static func global(_ global: Types.Color.Global) -> HTMLColor {
//        return HTMLColor(.global(global))
//    }
//
//    public static let currentColor: HTMLColor = HTMLColor(.currentColor)
//    public static let transparent: HTMLColor = HTMLColor(.transparent)
//}

