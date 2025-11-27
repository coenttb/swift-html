//
//  ColorProperty.swift
//  swift-html
//
//  The canonical color property type with dark mode support.
//

import CSS_Rendering
import CSS_Standard

/// The canonical color property type with dark mode support.
///
/// `ColorProperty` is defined as the composition:
/// ```
/// ColorProperty = WithGlobal<DarkModeColor>
///               = DarkModeColor + Global
///               ≅ (Color.Value × Color.Value) + Global
/// ```
///
/// This replaces the previous `ColorInput` enum with a principled categorical
/// composition, making the structure explicit and reusable.
///
/// ## Usage
///
/// ```swift
/// // Single color
/// let single: ColorProperty = .single(.red)
///
/// // Adaptive light/dark pair
/// let adaptive: ColorProperty = .adaptive(light: .white, dark: .black)
///
/// // Auto-darkening
/// let auto: ColorProperty = .autoAdaptive(light: .white)
///
/// // Global CSS value
/// let inherit: ColorProperty = .inherit
/// ```
public typealias ColorProperty = WithGlobal<DarkModeColor>

// MARK: - Convenience Static Methods

extension ColorProperty {
    /// Creates a color property with a single color value.
    ///
    /// The color is normalized to `(c, c)` via `DarkModeColor.init(_:)`.
    ///
    /// - Parameter color: The color value to use for both light and dark modes
    /// - Returns: A ColorProperty containing the normalized single color
    @inlinable
    public static func single(_ color: CSS_Standard.Color.Value) -> ColorProperty {
        .value(DarkModeColor(color))
    }

    /// Creates a color property with explicit light and dark values.
    ///
    /// - Parameters:
    ///   - light: The color to use in light mode
    ///   - dark: The color to use in dark mode
    /// - Returns: A ColorProperty containing the light/dark pair
    @inlinable
    public static func adaptive(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value
    ) -> ColorProperty {
        .value(DarkModeColor(light: light, dark: dark))
    }

    /// Creates a color property with auto-derived dark mode.
    ///
    /// When `dark` is nil, a darker variant of the light color is generated automatically.
    ///
    /// - Parameters:
    ///   - light: The color to use in light mode
    ///   - dark: The color to use in dark mode, or nil to auto-derive
    /// - Returns: A ColorProperty with the specified or derived dark value
    @inlinable
    public static func autoAdaptive(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) -> ColorProperty {
        .value(DarkModeColor.autoAdaptive(light: light, dark: dark))
    }
}

// MARK: - ColorProperty Injection Protocol

/// Protocol for types that can be injected into ColorProperty.
///
/// This defines the injection morphism from each input type
/// into the ColorProperty coproduct. In category theory, these are
/// the canonical morphisms from each summand into the coproduct.
@usableFromInline
protocol ColorPropertyConvertible {
    /// Injection morphism into the ColorProperty coproduct.
    static var injection: @Sendable (Self) -> ColorProperty { get }
}

// MARK: - ColorPropertyConvertible Conformances

extension DarkModeColor: ColorPropertyConvertible {
    @usableFromInline
    static let injection: @Sendable (DarkModeColor) -> ColorProperty = { .value($0) }
}

extension CSS_Standard.Color.Value: ColorPropertyConvertible {
    @usableFromInline
    static let injection: @Sendable (CSS_Standard.Color.Value) -> ColorProperty = { .single($0) }
}

extension CSS_Standard.Global: ColorPropertyConvertible {
    @usableFromInline
    static let injection: @Sendable (CSS_Standard.Global) -> ColorProperty = { .global($0) }
}

// MARK: - HTMLColor Typealias (Backward Compatibility)

/// Backward-compatible typealias for DarkModeColor.
///
/// `HTMLColor` was previously defined as `CSS_Standard.Color.WithDarkMode.Color`.
/// This typealias provides source compatibility during the migration.
public typealias HTMLColor = DarkModeColor
