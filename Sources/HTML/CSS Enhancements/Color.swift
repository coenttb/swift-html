//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import CSSTypeTypes
import Foundation

extension CSSTypeTypes.Color {
    /// Creates a darker version of this color
    ///
    /// - Parameter percent: The amount to darken (0.0-1.0)
    /// - Returns: A darker color
    public func darker(by percent: Double = 0.2) -> CSSTypeTypes.Color {
        return adjustBrightness(by: -percent)
    }

    /// Creates a lighter version of this color
    ///
    /// - Parameter percent: The amount to lighten (0.0-1.0)
    /// - Returns: A lighter color
    public func lighter(by percent: Double = 0.2) -> CSSTypeTypes.Color {
        return adjustBrightness(by: percent)
    }

    /// Returns an opacity-modified version of this color
    ///
    /// - Parameter alpha: The opacity value (0.0-1.0)
    /// - Returns: A new color with the specified opacity
    public func opacity(_ alpha: Double) -> CSSTypeTypes.Color {
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
        var cleaned = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))

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
    public func adjustBrightness(by percent: Double) -> CSSTypeTypes.Color {
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
