//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/09/2024.
//

import CSS
import CSS_Standard

// Note: CSS_Standard.Color.Value already has an opacity method, so we don't need to redefine it

extension CSS_Standard.Color.Value {
    public static let gray100 = Self.hex("1a1a1a")
    public static let gray150 = Self.hex("2a2a2a")
    public static let gray200 = Self.hex("3a3a3a")
    public static let gray250 = Self.hex("4a4a4a")
    public static let gray300 = Self.hex("5a5a5a")
    public static let gray350 = Self.hex("666666")
    public static let gray400 = Self.hex("707070")
    public static let gray450 = Self.hex("808080")
    public static let gray500 = Self.hex("888888")
    public static let gray550 = Self.hex("8f8f8f")
    public static let gray600 = Self.hex("999999")
    public static let gray650 = Self.hex("aaaaaa")
    public static let gray700 = Self.hex("bbbbbb")
    public static let gray750 = Self.hex("c5c5c5")
    public static let gray800 = Self.hex("d0d0d0")
    public static let gray850 = Self.hex("e0e0e0")
    public static let gray900 = Self.hex("f5f5f5")
}

extension CSS_Standard.Color.Value {
    public static let blue100 = Self.hex("001a33")
    public static let blue150 = Self.hex("001f3f")
    public static let blue200 = Self.hex("003366")
    public static let blue250 = Self.hex("004488")
    public static let blue300 = Self.hex("0055aa")
    public static let blue350 = Self.hex("0066cc")
    public static let blue400 = Self.hex("0077ee")
    public static let blue450 = Self.hex("0088ff")
    public static let blue500 = Self.hex("3399ff")
    public static let blue550 = Self.hex("4d9cff")
    public static let blue600 = Self.hex("66aaff")
    public static let blue650 = Self.hex("99bbff")
    public static let blue700 = Self.hex("b3ccff")
    public static let blue750 = Self.hex("b3d9ff")
    public static let blue800 = Self.hex("cce5ff")
    public static let blue850 = Self.hex("e6f2ff")
    public static let blue900 = Self.hex("f0f8ff")
}

extension CSS_Standard.Color.Value {
    public static let green100 = Self.hex("002600")
    public static let green150 = Self.hex("003300")
    public static let green200 = Self.hex("004400")
    public static let green250 = Self.hex("005500")
    public static let green300 = Self.hex("006600")
    public static let green350 = Self.hex("007700")
    public static let green400 = Self.hex("009900")
    public static let green450 = Self.hex("00b300")
    public static let green500 = Self.hex("33cc33")
    public static let green550 = Self.hex("4ddb4d")
    public static let green600 = Self.hex("66d966")
    public static let green650 = Self.hex("99e699")
    public static let green700 = Self.hex("b3f0b3")
    public static let green750 = Self.hex("bdeabf")
    public static let green800 = Self.hex("ccf5cc")
    public static let green850 = Self.hex("e6ffe6")
    public static let green900 = Self.hex("f0fff0")
}

extension CSS_Standard.Color.Value {
    public static let purple100 = Self.hex("1a0026")
    public static let purple150 = Self.hex("2a0033")
    public static let purple200 = Self.hex("3b0044")
    public static let purple250 = Self.hex("4c0055")
    public static let purple300 = Self.hex("5d0066")
    public static let purple350 = Self.hex("6e0088")
    public static let purple400 = Self.hex("7f0099")
    public static let purple450 = Self.hex("8f00b3")
    public static let purple500 = Self.hex("a300cc")
    public static let purple550 = Self.hex("a866d6")
    public static let purple600 = Self.hex("b366e0")
    public static let purple650 = Self.hex("cc80e6")
    public static let purple700 = Self.hex("d9b3f0")
    public static let purple750 = Self.hex("e0b3f0")
    public static let purple800 = Self.hex("e6ccf5")
    public static let purple850 = Self.hex("f2e6ff")
    public static let purple900 = Self.hex("f9f0ff")
}

extension CSS_Standard.Color.Value {
    public static let red100 = Self.hex("260000")
    public static let red150 = Self.hex("330000")
    public static let red200 = Self.hex("440000")
    public static let red250 = Self.hex("550000")
    public static let red300 = Self.hex("660000")
    public static let red350 = Self.hex("880000")
    public static let red400 = Self.hex("990000")
    public static let red450 = Self.hex("b30000")
    public static let red500 = Self.hex("cc3333")
    public static let red550 = Self.hex("dd6666")
    public static let red600 = Self.hex("e06666")
    public static let red650 = Self.hex("e69999")
    public static let red700 = Self.hex("f0b3b3")
    public static let red750 = Self.hex("f5b3b3")
    public static let red800 = Self.hex("f5cccc")
    public static let red850 = Self.hex("ffe6e6")
    public static let red900 = Self.hex("fff0f0")
}

extension CSS_Standard.Color.Value {
    public static let yellow100 = Self.hex("262600")
    public static let yellow150 = Self.hex("333300")
    public static let yellow200 = Self.hex("444400")
    public static let yellow250 = Self.hex("555500")
    public static let yellow300 = Self.hex("666600")
    public static let yellow350 = Self.hex("808000")
    public static let yellow400 = Self.hex("999900")
    public static let yellow450 = Self.hex("b3b300")
    public static let yellow500 = Self.hex("cccc33")
    public static let yellow550 = Self.hex("dedd66")
    public static let yellow600 = Self.hex("d6d666")
    public static let yellow650 = Self.hex("e0e099")
    public static let yellow700 = Self.hex("ebebcc")
    public static let yellow750 = Self.hex("f0eebf")
    public static let yellow800 = Self.hex("f5f5e0")
    public static let yellow850 = Self.hex("ffffe6")
    public static let yellow900 = Self.hex("fffff0")
}

extension CSS_Standard.Color.Value {
    public static let orange100 = Self.hex("261300")
    public static let orange150 = Self.hex("331a00")
    public static let orange200 = Self.hex("442200")
    public static let orange250 = Self.hex("553300")
    public static let orange300 = Self.hex("663300")
    public static let orange350 = Self.hex("884400")
    public static let orange400 = Self.hex("994d00")
    public static let orange450 = Self.hex("b35900")
    public static let orange500 = Self.hex("cc6600")
    public static let orange550 = Self.hex("e68a4d")
    public static let orange600 = Self.hex("e67333")
    public static let orange650 = Self.hex("f29466")
    public static let orange700 = Self.hex("f5a366")
    public static let orange750 = Self.hex("f7c299")
    public static let orange800 = Self.hex("f9d1cc")
    public static let orange850 = Self.hex("fde8d9")
    public static let orange900 = Self.hex("fff4e6")
}

extension CSS_Standard.Color.Value {
    public static let teal100 = Self.hex("001a1a")
    public static let teal150 = Self.hex("003333")
    public static let teal200 = Self.hex("004444")
    public static let teal250 = Self.hex("005555")
    public static let teal300 = Self.hex("006666")
    public static let teal350 = Self.hex("007777")
    public static let teal400 = Self.hex("008888")
    public static let teal450 = Self.hex("009999")
    public static let teal500 = Self.hex("33aaaa")
    public static let teal550 = Self.hex("4dbfbf")
    public static let teal600 = Self.hex("66bfbf")
    public static let teal650 = Self.hex("99cccc")
    public static let teal700 = Self.hex("b3d6d6")
    public static let teal750 = Self.hex("b3e0e0")
    public static let teal800 = Self.hex("cce5e5")
    public static let teal850 = Self.hex("e6f2f2")
    public static let teal900 = Self.hex("f0f8f8")
}

extension CSS_Standard.Color.Value {
    public static let cyan100 = Self.teal100
    public static let cyan150 = Self.teal150
    public static let cyan200 = Self.teal200
    public static let cyan250 = Self.teal250
    public static let cyan300 = Self.teal300
    public static let cyan350 = Self.teal350
    public static let cyan400 = Self.teal400
    public static let cyan450 = Self.teal450
    public static let cyan500 = Self.teal500
    public static let cyan550 = Self.teal550
    public static let cyan600 = Self.teal600
    public static let cyan650 = Self.teal650
    public static let cyan700 = Self.teal700
    public static let cyan750 = Self.teal750
    public static let cyan800 = Self.teal800
    public static let cyan850 = Self.teal850
    public static let cyan900 = Self.teal900
}

extension CSS_Standard.Color.Value {
    public static let pink100 = Self.hex("260013")
    public static let pink150 = Self.hex("33001a")
    public static let pink200 = Self.hex("440022")
    public static let pink250 = Self.hex("55002b")
    public static let pink300 = Self.hex("660033")
    public static let pink350 = Self.hex("88003d")
    public static let pink400 = Self.hex("990047")
    public static let pink450 = Self.hex("b30052")
    public static let pink500 = Self.hex("cc3366")
    public static let pink550 = Self.hex("e66699")
    public static let pink600 = Self.hex("e06699")
    public static let pink650 = Self.hex("e699b3")
    public static let pink700 = Self.hex("f0b3cc")
    public static let pink750 = Self.hex("f0aacc")
    public static let pink800 = Self.hex("f5cce0")
    public static let pink850 = Self.hex("f9e6f2")
    public static let pink900 = Self.hex("fceff5")
}

extension CSS_Standard.Color.Value {
    public static let brown100 = Self.hex("261300")
    public static let brown150 = Self.hex("331a00")
    public static let brown200 = Self.hex("442200")
    public static let brown250 = Self.hex("553300")
    public static let brown300 = Self.hex("663300")
    public static let brown350 = Self.hex("884400")
    public static let brown400 = Self.hex("994d00")
    public static let brown450 = Self.hex("b35900")
    public static let brown500 = Self.hex("cc6600")
    public static let brown550 = Self.hex("e6884d")
    public static let brown600 = Self.hex("e67333")
    public static let brown650 = Self.hex("f0b366")
    public static let brown700 = Self.hex("f5cc99")
    public static let brown750 = Self.hex("f5d1b3")
    public static let brown800 = Self.hex("f7e0cc")
    public static let brown850 = Self.hex("fdeee6")
    public static let brown900 = Self.hex("fef5f0")
}

extension CSS_Standard.Color.Value {
    public static let black = Self.hex("121212")
    public static let offBlack = Self.hex("171717")
    public static let white = Self.hex("FFFFFF")
    public static let offWhite = Self.hex("fafafa")

    public static let cyan = Self.teal500
    public static let teal = Self.teal500
    public static let pink = Self.pink500
    public static let brown = Self.brown500

    public static let orange = Self.orange500
    public static let green = Self.green500
    public static let purple = Self.purple500
    public static let blue = Self.blue500
    public static let red = Self.red500
    public static let yellow = Self.yellow500
}

// MARK: - Extensions for CSS_Standard.Color.Value (Value Type)

extension CSS_Standard.Color.Value {
    /// Creates a darker version of this color
    ///
    /// - Parameter percent: The amount to darken (0.0-1.0)
    /// - Returns: A darker color
    public func darker(by percent: Double = 0.2) -> CSS_Standard.Color.Value {
        return adjustBrightness(by: -percent)
    }

    /// Creates a lighter version of this color
    ///
    /// - Parameter percent: The amount to lighten (0.0-1.0)
    /// - Returns: A lighter color
    public func lighter(by percent: Double = 0.2) -> CSS_Standard.Color.Value {
        return adjustBrightness(by: percent)
    }

    /// Returns an opacity-modified version of this color
    ///
    /// - Parameter alpha: The opacity value (0.0-1.0)
    /// - Returns: A new color with the specified opacity
    public func opacity(_ alpha: Double) -> CSS_Standard.Color.Value {
        let clampedAlpha = min(1.0, max(0.0, alpha))

        switch self {
        case .rgb(let r, let g, let b):
            return .rgba(r, g, b, clampedAlpha)

        case .rgba(let r, let g, let b, _):
            return .rgba(r, g, b, clampedAlpha)

        case .hsl(let h, let s, let l):
            return .hsla(h, s, l, clampedAlpha)

        case .hsla(let h, let s, let l, _):
            return .hsla(h, s, l, clampedAlpha)

        case .named(let name):
            // For named colors, we need to convert to RGB values first
            if let rgb = namedColorToRgb(name) {
                return .rgba(rgb.r, rgb.g, rgb.b, clampedAlpha)
            }
            return self

        case .hex(let hex):
            // For hex colors, we can parse the RGB values
            if let rgb = hexToRgb(hex.value) {
                return .rgba(rgb.r, rgb.g, rgb.b, clampedAlpha)
            }
            return self

        default:
            // For other color types, simply return this color as we don't have
            // a straightforward way to apply opacity
            return self
        }
    }

    /// Helper function to convert HEX to RGB
    private func hexToRgb(_ hex: String) -> (r: Int, g: Int, b: Int)? {
        var cleaned = String(hex.trimmingPrefix("#"))

        // Handle shorthand hex (#RGB)
        if cleaned.count == 3 {
            cleaned = cleaned.map { "\($0)\($0)" }.joined()
        }

        guard cleaned.count == 6 else { return nil }

        var rgb: [Int] = []

        for i in stride(from: 0, to: 6, by: 2) {
            let start = cleaned.index(cleaned.startIndex, offsetBy: i)
            let end = cleaned.index(start, offsetBy: 2)
            let hexPair = String(cleaned[start..<end])

            guard let value = Int(hexPair, radix: 16) else { return nil }
            rgb.append(value)
        }

        return (r: rgb[0], g: rgb[1], b: rgb[2])
    }

    /// Helper function to convert named colors to RGB
    private func namedColorToRgb(_ name: NamedColor) -> (r: Int, g: Int, b: Int)? {
        // A simple lookup table for basic named colors
        switch name {
        case .black: return (0, 0, 0)
        case .silver: return (192, 192, 192)
        case .gray: return (128, 128, 128)
        case .white: return (255, 255, 255)
        case .maroon: return (128, 0, 0)
        case .red: return (255, 0, 0)
        case .purple: return (128, 0, 128)
        case .fuchsia: return (255, 0, 255)
        case .green: return (0, 128, 0)
        case .lime: return (0, 255, 0)
        case .olive: return (128, 128, 0)
        case .yellow: return (255, 255, 0)
        case .navy: return (0, 0, 128)
        case .blue: return (0, 0, 255)
        case .teal: return (0, 128, 128)
        case .aqua: return (0, 255, 255)
        default: return nil
        }
    }

    /// Adjusts the brightness of a color by a percentage
    ///
    /// - Parameter percent: The brightness adjustment (-1.0 to 1.0, where -1.0 is completely darkened and 1.0 is completely lightened)
    /// - Returns: A new color with adjusted brightness
    public func adjustBrightness(by percent: Double) -> CSS_Standard.Color.Value {
        guard percent >= -1, percent <= 1 else { return self }

        func adjustComponent(_ value: Int) -> Int {
            if percent > 0 {
                return min(255, max(0, Int(Double(value) + (255 - Double(value)) * percent)))
            } else {
                return max(0, min(255, Int(Double(value) * (1 + percent))))
            }
        }

        func adjustLightness(_ l: Double) -> Double {
            if percent > 0 {
                return min(100, max(0, l + (100 - l) * percent))
            } else {
                return max(0, min(100, l * (1 + percent)))
            }
        }

        switch self {
        case .rgb(let r, let g, let b):
            return .rgb(adjustComponent(r), adjustComponent(g), adjustComponent(b))

        case .rgba(let r, let g, let b, let a):
            return .rgba(adjustComponent(r), adjustComponent(g), adjustComponent(b), a)

        case .hsl(let h, let s, let l):
            return .hsl(h, s, adjustLightness(l))

        case .hsla(let h, let s, let l, let a):
            return .hsla(h, s, adjustLightness(l), a)

        case .hex(let hex):
            if let rgb = hexToRgb(hex.value) {
                let adjustedR = adjustComponent(rgb.r)
                let adjustedG = adjustComponent(rgb.g)
                let adjustedB = adjustComponent(rgb.b)
                return .rgb(adjustedR, adjustedG, adjustedB)
            }
            return self

        case .named(let name):
            if let rgb = namedColorToRgb(name) {
                let adjustedR = adjustComponent(rgb.r)
                let adjustedG = adjustComponent(rgb.g)
                let adjustedB = adjustComponent(rgb.b)
                return .rgb(adjustedR, adjustedG, adjustedB)
            }
            return self

        default:
            return self
        }
    }
}
