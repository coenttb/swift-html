//
//  CSSPropertyAccessor+ColorProperty.swift
//  swift-html
//
//  Unified color property implementation using categorical coproduct pattern.
//  Reduces 21 × 5 = 105 overloads to a single generic implementation.
//

import CSS_Rendering
import CSS_Standard

// MARK: - ColorInput (Internal Canonical Representation)

/// Internal canonical representation for color inputs.
///
/// This sum type represents the coproduct of all possible color inputs,
/// providing a single target for the universal morphism from each input type.
/// All public API methods convert to this before applying styles.
@usableFromInline
enum ColorInput: Sendable, Hashable {
    /// Light/dark pair - emits both styles with @media query
    case withDarkMode(light: CSS_Standard.Color.Value, dark: CSS_Standard.Color.Value)

    /// Single value - emits one style, no dark mode
    case single(CSS_Standard.Color.Value)

    /// Global value - inherit, initial, unset, revert
    case global(CSS_Standard.Global)
}

// MARK: - ColorInputConvertible Protocol

/// Protocol for types that can be converted to a ColorInput.
///
/// This protocol defines the universal morphism from each color input type
/// to the canonical `ColorInput` representation, enabling a single generic
/// implementation for all color properties.
@usableFromInline
protocol ColorInputConvertible {
    /// Static transform function from Self to ColorInput.
    static var transform: @Sendable (Self) -> ColorInput { get }
}

// MARK: - ColorInputConvertible Conformances

extension HTMLColor: ColorInputConvertible {
    @usableFromInline
    static let transform: @Sendable (HTMLColor) -> ColorInput = ColorInput.init
}

extension CSS_Standard.Color.Value: ColorInputConvertible {
    @usableFromInline
    static let transform: @Sendable (CSS_Standard.Color.Value) -> ColorInput = ColorInput.init
}

extension ColorInput {
    @usableFromInline
    init(
        _ color: CSS_Standard.Color.Value
    ){
        self = .single(color)
    }
}

extension ColorInput {
    @usableFromInline
    init(
        _ color: CSS_Standard.Color
    ){
        switch color {
        case .global(let global):
            self = .global(global)
        case .color(let color):
            self = .init(color)
        }
    }
}

extension ColorInput {
    @usableFromInline
    init(
        _ color: CSS_Standard.Color.WithDarkMode
    ){
        switch color {
        case .darkMode(let color):
            self = .withDarkMode(light: color.light, dark: color.dark)
        case .global(let global):
            self = .global(global)
        }
    }
}

extension ColorInput {
    @usableFromInline
    init(
        _ color: HTMLColor
    ){
        self = .withDarkMode(light: color.light, dark: color.dark)
    }
}

extension ColorInput {
    @usableFromInline
    init(
        _ global: CSS_Standard.Global
    ){
        self = .global(global)
    }
}

extension CSS_Standard.Global: ColorInputConvertible {
    @usableFromInline
    static let transform: @Sendable (CSS_Standard.Global) -> ColorInput = ColorInput.init
}

extension CSS_Standard.Color.WithDarkMode: ColorInputConvertible {
    @usableFromInline
    static let transform: @Sendable (CSS_Standard.Color.WithDarkMode) -> ColorInput = ColorInput.init
}

// MARK: - CSSColorProperty Protocol

/// Marker protocol for CSS color property types.
///
/// CSS_Standard.Color, CSS_Standard.BackgroundColor, etc. conform to this.
/// The protocol provides the property name via `W3C_CSS_Shared.Property`.
public protocol CSSColorProperty: W3C_CSS_Shared.Property {}

// MARK: - CSSColorProperty Conformances

extension CSS_Standard.Color: CSSColorProperty {}
extension CSS_Standard.BackgroundColor: CSSColorProperty {}
extension CSS_Standard.BorderColor: CSSColorProperty {}
extension CSS_Standard.BorderBlockColor: CSSColorProperty {}
extension CSS_Standard.BorderBlockEndColor: CSSColorProperty {}
extension CSS_Standard.BorderBlockStartColor: CSSColorProperty {}
extension CSS_Standard.BorderBottomColor: CSSColorProperty {}
extension CSS_Standard.BorderInlineColor: CSSColorProperty {}
extension CSS_Standard.BorderInlineEndColor: CSSColorProperty {}
extension CSS_Standard.BorderInlineStartColor: CSSColorProperty {}
extension CSS_Standard.BorderLeftColor: CSSColorProperty {}
extension CSS_Standard.BorderRightColor: CSSColorProperty {}
extension CSS_Standard.BorderTopColor: CSSColorProperty {}
extension CSS_Standard.AccentColor: CSSColorProperty {}
extension CSS_Standard.CaretColor: CSSColorProperty {}
extension CSS_Standard.ColumnRuleColor: CSSColorProperty {}
extension CSS_Standard.Fill: CSSColorProperty {}
extension CSS_Standard.Stroke: CSSColorProperty {}
extension CSS_Standard.OutlineColor: CSSColorProperty {}
extension CSS_Standard.FloodColor: CSSColorProperty {}
extension CSS_Standard.LightingColor: CSSColorProperty {}
extension CSS_Standard.StopColor: CSSColorProperty {}
extension CSS_Standard.TextDecorationColor: CSSColorProperty {}
extension CSS_Standard.TextEmphasisColor: CSSColorProperty {}

// MARK: - Generic Color Property Implementation

extension CSSPropertyAccessor {
    /// Core implementation: applies any ColorInput to any CSS color property.
    ///
    /// This single generic method replaces 21 separate implementations,
    /// providing a unified approach to color property styling.
    ///
    /// - Parameters:
    ///   - propertyType: The CSS property type (e.g., `CSS_Standard.Color.self`)
    ///   - input: The canonical color input to apply
    ///   - media: Optional media query
    ///   - selector: Optional CSS selector
    ///   - pseudo: Optional pseudo-class/element
    /// - Returns: A new CSSPropertyAccessor with the style applied
    @usableFromInline
    @discardableResult
    func applyColorProperty<P: CSSColorProperty>(
        _ propertyType: P.Type,
        _ input: ColorInput?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        guard let input else {
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }

        switch input {
        case .withDarkMode(let light, let dark):
            // Optimization: skip dark block if light == dark (no redundant CSS)
            let effectiveDark: CSS_Standard.Color.Value? = light == dark ? nil : dark
            return CSSPropertyAccessor<HTML.AnyView>(
                base: HTML.AnyView(
                    base
                        .inlineStyle(
                            P.property,
                            light.description,
                            media: media,
                            selector: selector,
                            pseudo: pseudo
                        )
                        .inlineStyle(
                            P.property,
                            effectiveDark?.description,
                            media: .prefersColorScheme(.dark).and(media),
                            selector: selector,
                            pseudo: pseudo
                        )
                )
            )

        case .single(let value):
            return CSSPropertyAccessor<HTML.AnyView>(
                base: HTML.AnyView(
                    base.inlineStyle(
                        P.property,
                        value.description,
                        media: media,
                        selector: selector,
                        pseudo: pseudo
                    )
                )
            )

        case .global(let global):
            return CSSPropertyAccessor<HTML.AnyView>(
                base: HTML.AnyView(
                    base.inlineStyle(
                        P.property,
                        global.description,
                        media: media,
                        selector: selector,
                        pseudo: pseudo
                    )
                )
            )
        }
    }
}

// MARK: - Generic ColorInputConvertible Overload

extension CSSPropertyAccessor {
    /// Convenience overload that accepts any optional ColorInputConvertible type.
    @usableFromInline
    @discardableResult
    func applyColorProperty<P: CSSColorProperty, T: ColorInputConvertible>(
        _ propertyType: P.Type,
        _ value: T?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            propertyType,
            value.map(T.transform),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
