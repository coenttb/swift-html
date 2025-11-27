//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 27/11/2025.
//

import CSS_Rendering

extension CSS_Standard.Color {
    /// Returns an opacity-modified version of this color
    ///
    /// - Parameter alpha: The opacity value (0.0-1.0)
    /// - Returns: A new color with the specified opacity
    public func opacity(_ alpha: Double) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.opacity(alpha))
        case .global:
            return self
        }
    }

    /// Creates a darker version of this color
    ///
    /// - Parameter percent: The amount to darken (0.0-1.0)
    /// - Returns: A darker color
    public func darker(by percent: Double = 0.2) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.darker(by: percent))
        case .global:
            return self
        }
    }

    /// Creates a lighter version of this color
    ///
    /// - Parameter percent: The amount to lighten (0.0-1.0)
    /// - Returns: A lighter color
    public func lighter(by percent: Double = 0.2) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.lighter(by: percent))
        case .global:
            return self
        }
    }

    /// Adjusts the brightness of a color by a percentage
    ///
    /// - Parameter percent: The brightness adjustment (-1.0 to 1.0)
    /// - Returns: A new color with adjusted brightness
    public func adjustBrightness(by percent: Double) -> CSS_Standard.Color {
        switch self {
        case .color(let color):
            return .color(color.adjustBrightness(by: percent))
        case .global:
            return self
        }
    }
}

