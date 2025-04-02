////
////  HTMLColor.swift
////
////
////  Created by Coen ten Thije Boonkkamp
////
//

import Foundation
import PointFreeHTML
import Types
import Properties


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

