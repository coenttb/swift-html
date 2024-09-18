////
////  HTMLColor.swift
////
////
////  Created by Coen ten Thije Boonkkamp
////
//

import Foundation

public struct HTMLColor: Sendable {
    public let light: CSS.Color
    public let dark: CSS.Color?
    
    public init(light: CSS.Color, dark: CSS.Color? = nil) {
        self.light = light
        if let dark = dark {
            self.dark = dark
        } else {
            self.dark = light.darker()
        }
    }
}

extension HTMLColor {
    public init(_ color: CSS.Color){
        self = .init(
            light: color,
            dark: color.darker()
        )
    }
}

extension HTMLColor {
    
    public static func keyword(_ keyword: CSS.Color.Keyword) -> HTMLColor {
        return HTMLColor(.keyword(keyword))
    }
    
    public static func hex(_ hex: String) -> HTMLColor {
        return HTMLColor(.hex(hex))
    }
    
    public static func rgb(red: Int, green: Int, blue: Int) -> HTMLColor {
        return HTMLColor(.rgb(red: red, green: green, blue: blue))
    }
    
    public static func rgba(red: Int, green: Int, blue: Int, alpha: Double) -> HTMLColor {
        return HTMLColor(.rgba(red: red, green: green, blue: blue, alpha: alpha))
    }
    
    public static func hsl(hue: Int, saturation: Double, lightness: Double) -> HTMLColor {
        return HTMLColor(.hsl(hue: hue, saturation: saturation, lightness: lightness))
    }
    
    public static func hsla(hue: Int, saturation: Double, lightness: Double, alpha: Double) -> HTMLColor {
        return HTMLColor(.hsla(hue: hue, saturation: saturation, lightness: lightness, alpha: alpha))
    }
    
    public static func hwb(hue: Int, whiteness: Double, blackness: Double) -> HTMLColor {
        return HTMLColor(.hwb(hue: hue, whiteness: whiteness, blackness: blackness))
    }
    
    public static func lab(lightness: Double, a: Double, b: Double) -> HTMLColor {
        return HTMLColor(.lab(lightness: lightness, a: a, b: b))
    }
    
    public static func lch(lightness: Double, chroma: Double, hue: Double) -> HTMLColor {
        return HTMLColor(.lch(lightness: lightness, chroma: chroma, hue: hue))
    }
    
    public static func system(_ system: CSS.Color.SystemColor) -> HTMLColor {
        return HTMLColor(.system(system))
    }
    
    public static func global(_ global: CSS.Color.Global) -> HTMLColor {
        return HTMLColor(.global(global))
    }
    
    public static let currentColor: HTMLColor = HTMLColor(.currentColor)
    public static let transparent: HTMLColor = HTMLColor(.transparent)
}



extension HTMLColor: CustomStringConvertible {
    public var description: String {
        if let dark = dark {
            return "@media (prefers-color-scheme: light) { \(light) } @media (prefers-color-scheme: dark) { \(dark) }"
        } else {
            return light.description
        }
    }
}

extension HTMLColor {
    public func map(_ transform: (CSS.Color) -> CSS.Color) -> HTMLColor {
        HTMLColor(
            light: transform(light),
            dark: dark.map(transform)
        )
    }
    
    public func flatMap(_ transform: (CSS.Color) -> HTMLColor) -> HTMLColor {
        let lightTransformed = transform(light)
        let darkTransformed = dark.map(transform)
        
        return HTMLColor(
            light: lightTransformed.light,
            dark: darkTransformed?.dark ?? lightTransformed.dark
        )
    }
}

extension HTMLColor {
    public func adjustBrightness(by percentage: Double) -> HTMLColor {
        self.map { $0.adjustBrightness(by: percentage) }
    }
    
    public func darker(by percentage: Double = 0.2) -> HTMLColor {
        self.map { $0.darker(by: percentage) }
    }
    
    public func lighter(by percentage: Double = 0.2) -> HTMLColor {
        self.map { $0.lighter(by: percentage) }
    }
}

extension HTMLColor {
    @available(*, deprecated, renamed: "withDarkColor(_:)")
    public func dark(_ color: CSS.Color) -> Self {
        withDarkColor(color)
    }
    
    @available(*, deprecated, renamed: "withLightColor(_:)")
    public func light(_ color: CSS.Color) -> Self {
        withLightColor(color)
    }
    
    public func withDarkColor(_ color: CSS.Color) -> Self {
        HTMLColor(light: self.light, dark: color)
    }
    
    public func withLightColor(_ color: CSS.Color) -> Self {
        HTMLColor(light: color, dark: self.dark)
    }
}

extension HTMLColor {
    public static func gray(_ value: UInt8) -> Self {
        let lightHex = String(format: "%02X", value)
        let darkHex = String(format: "%02X", 255 - value)
        return Self(light: .hex(lightHex + lightHex + lightHex))
            .withDarkColor(.hex(darkHex + darkHex + darkHex))
    }
    
    @_disfavoredOverload
    public static func gray(_ value: Double) -> Self {
        gray(UInt8(255 * value))
    }
}


