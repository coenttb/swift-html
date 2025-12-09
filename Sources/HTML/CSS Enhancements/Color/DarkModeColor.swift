//
//  DarkModeColor.swift
//  swift-html
//
//  A normalized color type with explicit light and dark mode values.
//

import CSS
import CSS_Standard

/// A color with explicit light and dark mode values.
///
/// This type represents a color pair for light and dark mode, using a normalized
/// representation where single colors become `(c, c)` at construction time.
/// This eliminates the quotient issue where `single(c)` and `withDarkMode(c, c)`
/// would be semantically equivalent but structurally different.
///
/// ## Categorical Structure
///
/// `DarkModeColor` is isomorphic to `Color.Value × Color.Value` (a product type).
/// The `init(_:)` constructor provides a diagonal embedding:
/// ```
/// Δ: Color.Value -> DarkModeColor
/// Δ(c) = (c, c)
/// ```
///
/// This normalization ensures that there is exactly one representation for
/// "the same color in both light and dark modes."
///
/// ## Usage
///
/// ```swift
/// // Single color (normalized to light == dark)
/// let single = DarkModeColor(.red)
///
/// // Explicit light/dark pair
/// let adaptive = DarkModeColor(light: .white, dark: .black)
///
/// // Auto-adaptive (derives dark variant automatically)
/// let auto = DarkModeColor(light: .white)
/// ```
public struct DarkModeColor: Sendable, Hashable, ColorConvertible {
    /// Creates a DarkModeColor from a CSS Color value, using the same color for both modes.
    public static func color(_ color: W3C_CSS_Values.Color) -> DarkModeColor {
        .init(light: color, dark: color)
    }

    /// The color value for light mode
    public let light: CSS_Standard.Color.Value

    /// The color value for dark mode
    public let dark: CSS_Standard.Color.Value

    /// Creates a dark mode color with light and optional dark values.
    ///
    /// When `dark` is nil, derives a darker variant of the light color automatically.
    ///
    /// - Parameters:
    ///   - light: The color to use in light mode
    ///   - dark: The color to use in dark mode, or nil to auto-derive
    @inlinable
    public init(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) {
        self.light = light
        self.dark = dark ?? light.darker()
    }

    /// Creates a dark mode color from a single color value.
    ///
    /// This is the diagonal embedding `Δ: Color.Value -> DarkModeColor`
    /// that normalizes single colors to `(c, c)`.
    ///
    /// - Parameter color: The color to use for both light and dark modes
    @inlinable
    public init(_ color: CSS_Standard.Color.Value) {
        self.light = color
        self.dark = color
    }

    /// Whether this represents a single color (light equals dark).
    ///
    /// When true, only one CSS rule needs to be emitted (no media query needed).
    @inlinable
    public var isSingleColor: Bool { light == dark }
}

// MARK: - Functor Operations

extension DarkModeColor {
    /// Transforms both color values using the given function.
    ///
    /// This is a functor map operation: `(Color.Value -> Color.Value) -> (DarkModeColor -> DarkModeColor)`
    ///
    /// - Parameter transform: A function to apply to both light and dark colors
    /// - Returns: A new DarkModeColor with transformed values
    @inlinable
    public func map(_ transform: (CSS_Standard.Color.Value) -> CSS_Standard.Color.Value) -> DarkModeColor {
        DarkModeColor(
            light: transform(light),
            dark: transform(dark)
        )
    }

    /// Transforms both color values using functions that return DarkModeColor.
    ///
    /// Extracts the light color from transforming light, and dark from transforming dark.
    ///
    /// - Parameter transform: A function that maps a color to a DarkModeColor
    /// - Returns: A new DarkModeColor combining the results
    @inlinable
    public func flatMap(_ transform: (CSS_Standard.Color.Value) -> DarkModeColor) -> DarkModeColor {
        let lightTransformed = transform(light)
        let darkTransformed = transform(dark)
        return DarkModeColor(
            light: lightTransformed.light,
            dark: darkTransformed.dark
        )
    }
}

// MARK: - Color Manipulation

extension DarkModeColor {
    /// Adjusts the brightness of both color values.
    ///
    /// - Parameter percentage: The brightness adjustment (-1.0 to 1.0)
    /// - Returns: A new DarkModeColor with adjusted brightness
    @inlinable
    public func adjustBrightness(by percentage: Double) -> DarkModeColor {
        map { $0.adjustBrightness(by: percentage) }
    }

    /// Creates a darker version of both colors.
    ///
    /// - Parameter percentage: The amount to darken (0.0-1.0), default 0.2
    /// - Returns: A new DarkModeColor with darker values
    @inlinable
    public func darker(by percentage: Double = 0.2) -> DarkModeColor {
        map { $0.darker(by: percentage) }
    }

    /// Creates a lighter version of both colors.
    ///
    /// - Parameter percentage: The amount to lighten (0.0-1.0), default 0.2
    /// - Returns: A new DarkModeColor with lighter values
    @inlinable
    public func lighter(by percentage: Double = 0.2) -> DarkModeColor {
        map { $0.lighter(by: percentage) }
    }

    /// Applies opacity to both color values.
    ///
    /// - Parameter alpha: The opacity value (0.0-1.0)
    /// - Returns: A new DarkModeColor with the specified opacity
    @inlinable
    public func opacity(_ alpha: Double) -> DarkModeColor {
        map { $0.opacity(alpha) }
    }
}

// MARK: - Convenience Initializers

extension DarkModeColor {
    /// Creates a dark mode color by specifying a dark variant for an existing color value.
    ///
    /// - Parameters:
    ///   - light: The base light mode color
    ///   - dark: The dark mode variant
    /// - Returns: A new DarkModeColor
    @inlinable
    public func withDarkColor(_ dark: CSS_Standard.Color.Value) -> DarkModeColor {
        DarkModeColor(light: self.light, dark: dark)
    }
}

extension CSS_Standard.Color.Value {
    /// Creates a DarkModeColor with this value as light and the specified value as dark.
    ///
    /// - Parameter dark: The color to use in dark mode
    /// - Returns: A new DarkModeColor
    @inlinable
    public func withDarkColor(_ dark: CSS_Standard.Color.Value) -> DarkModeColor {
        DarkModeColor(light: self, dark: dark)
    }
}

// MARK: - CustomStringConvertible

extension DarkModeColor: CustomStringConvertible {
    public var description: String {
        if isSingleColor {
            return light.description
        } else {
            let attribute = CSS_Standard.Color.property
            return "@media (prefers-color-scheme: light) { \(attribute):\(light) } @media (prefers-color-scheme: dark) { \(attribute):\(dark) }"
        }
    }
}
