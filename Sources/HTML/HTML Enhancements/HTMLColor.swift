//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 17/09/2024.
//

import Color_Standard

// MARK: - Text Color Definitions

// extension HTMLColor {
//    public static let buttonText: Self = .primary.reverse()
//    public static let primary: Self = .black.withDarkColor(.white)
//    public static let text: Self = primary
//    public static let secondary: Self = .gray300.withDarkColor(.gray700)
//    public static let tertiary: Self = .gray450.withDarkColor(.gray550)
// }

// MARK: - Background Color Definitions
//
// extension HTMLColor {
//    public static let offBackground: Self = .offWhite.withDarkColor(.offBlack)
//    public static let background: Self = .white.withDarkColor(.black)
// }

// MARK: - HTMLColor Extensions

extension DarkModeColor {
    private typealias sRGB = IEC_61966.`2`.`1`.sRGB

    /// Calculates the midpoint color between two colors for gradients
    public static func gradientMidpoint(from color1: DarkModeColor, to color2: DarkModeColor) -> DarkModeColor? {
        func midpoint(
            _ c1: CSS_Standard.Color.Value,
            _ c2: CSS_Standard.Color.Value
        ) -> CSS_Standard.Color.Value? {
            guard let srgb1 = toSRGB(c1), let srgb2 = toSRGB(c2) else { return nil }

            let midR = (srgb1.r255 + srgb2.r255) / 2
            let midG = (srgb1.g255 + srgb2.g255) / 2
            let midB = (srgb1.b255 + srgb2.b255) / 2

            return .rgb(red: midR, green: midG, blue: midB)
        }

        let lightMid = midpoint(color1.light, color2.light)
        let darkMid = midpoint(color1.dark, color2.dark)

        guard let light = lightMid, let dark = darkMid else { return nil }
        return DarkModeColor(light: light, dark: dark)
    }

    public static func readablePrimaryColor(on backgroundColor: DarkModeColor) -> Self {
        guard let srgb = toSRGB(backgroundColor.light) else {
            return .init(.hex("000000"))
        }
        // Perceived brightness using ITU-R BT.601 coefficients
        let brightness = (Double(srgb.r255) * 299 + Double(srgb.g255) * 587 + Double(srgb.b255) * 114) / 255000
        let color: CSS_Standard.Color.Value = brightness > 0.5 ? .hex("000000") : .hex("FFFFFF")
        return .init(color)
    }
}

// MARK: - HTML Extensions

extension HTML.View {
    /// Applies a gradient background to the HTML element
    public func gradient(
        bottom: HTMLColor,
        top: HTMLColor
    ) -> some HTML.View {
        self
            .css
            .inlineStyle(
                "background",
                "linear-gradient(0deg, \(bottom.light.description) 0%, \(top.light.description) 100%);"
            )
            .dark {
                $0.inlineStyle(
                    "background",
                    "linear-gradient(0deg, \(bottom.dark.description) 0%, \(top.dark.description) 100%);"
                )
            }
    }

    public func gradient(
        bottom: HTMLColor,
        middle: HTMLColor,
        top: HTMLColor
    ) -> some HTML.View {
        self
            .css
            .inlineStyle(
                "background",
                "linear-gradient(0deg, \(bottom.light.description) 0%, \(middle.light.description) 50%, \(top.light.description) 100%);"
            )
            .dark {
                $0.inlineStyle(
                    "background",
                    "linear-gradient(0deg, \(bottom.dark.description) 0%, \(middle.dark.description) 50%, \(top.dark.description) 100%);"
                )
            }
    }
}

// MARK: - Private Helper Functions

extension DarkModeColor {
    fileprivate static func toSRGB(_ color: CSS_Standard.Color.Value) -> IEC_61966.`2`.`1`.sRGB? {
        typealias sRGB = IEC_61966.`2`.`1`.sRGB

        switch color {
        case .named(let namedColor):
            return namedColor.toSRGB()
        case .hex(let hexColor):
            return sRGB(hex: hexColor.value)
        case .rgb(let r, let g, let b):
            return sRGB(r255: r, g255: g, b255: b)
        case .rgba(let r, let g, let b, _):
            return sRGB(r255: r, g255: g, b255: b)
        case .hsl(let h, let s, let l):
            return sRGB(h: h.normalizedDegrees(), s: s / 100, l: l / 100)
        case .hsla(let h, let s, let l, _):
            return sRGB(h: h.normalizedDegrees(), s: s / 100, l: l / 100)
        case .hwb(let h, let w, let b):
            return sRGB(hue: h.normalizedDegrees(), whiteness: w / 100, blackness: b / 100)
        case .lab(let l, let a, let b):
            return Color.LAB(l: l, a: a, b: b).converted(to: sRGB.self)
        case .lch(let l, let c, let h):
            return Color.LCH(l: l, c: c, h: h).converted(to: sRGB.self)
        case .oklab(let l, let a, let b):
            return Color.Oklab(l: l, a: a, b: b).converted(to: sRGB.self)
        case .oklch(let l, let c, let h):
            return Color.Oklch(l: l, c: c, h: h).converted(to: sRGB.self)
        default:
            return nil
        }
    }
}

// MARK: - Named Color sRGB Mapping

extension W3C_CSS_Values.NamedColor {
    /// Maps CSS named colors to sRGB values
    fileprivate func toSRGB() -> IEC_61966.`2`.`1`.sRGB? {
        typealias sRGB = IEC_61966.`2`.`1`.sRGB

        switch self {
        case .black: return .black
        case .white: return .white
        case .red: return .red
        case .green: return sRGB(r255: 0, g255: 128, b255: 0)
        case .lime: return sRGB(r255: 0, g255: 255, b255: 0)
        case .blue: return .blue
        case .yellow: return sRGB(r255: 255, g255: 255, b255: 0)
        case .cyan: return sRGB(r255: 0, g255: 255, b255: 255)
        case .magenta: return sRGB(r255: 255, g255: 0, b255: 255)
        case .silver: return sRGB(r255: 192, g255: 192, b255: 192)
        case .gray: return sRGB(r255: 128, g255: 128, b255: 128)
        case .maroon: return sRGB(r255: 128, g255: 0, b255: 0)
        case .purple: return sRGB(r255: 128, g255: 0, b255: 128)
        case .fuchsia: return sRGB(r255: 255, g255: 0, b255: 255)
        case .olive: return sRGB(r255: 128, g255: 128, b255: 0)
        case .navy: return sRGB(r255: 0, g255: 0, b255: 128)
        case .teal: return sRGB(r255: 0, g255: 128, b255: 128)
        case .aqua: return sRGB(r255: 0, g255: 255, b255: 255)
        default: return nil
        }
    }
}
