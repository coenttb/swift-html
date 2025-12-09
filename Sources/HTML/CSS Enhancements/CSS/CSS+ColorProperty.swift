//
//  CSS+ColorProperty.swift
//  swift-html
//
//  Unified color property implementation using categorical coproduct pattern.
//
//  ColorProperty represents the coproduct (sum type):
//      ColorProperty = WithGlobal<DarkModeColor>
//                    = DarkModeColor + Global
//                    ≅ (Color.Value × Color.Value) + Global
//
//  Each external type has an injection morphism defined via ColorPropertyConvertible.
//  The universal property is realized by pattern-matching (case analysis) in
//  applyColorProperty, which provides the unique factoring morphism.
//
//  This reduces 21 × 5 = 105 potential overloads to a single generic implementation.
//

import CSS
import CSS_Standard

// MARK: - CSSColorProperty Typealias

/// A CSS color property type that can be constructed from color values.
///
/// CSS_Standard.Color, CSS_Standard.BackgroundColor, etc. conform to this
/// via their existing conformances to Property and ColorConvertible.
/// Property provides the property name and GlobalConvertible conformance,
/// while ColorConvertible provides the `color(_:)` factory method.
public typealias CSSColorProperty = W3C_CSS_Shared.Property & W3C_CSS_Color.ColorConvertible

// MARK: - Generic Color Property Implementation

extension CSS {
    /// Core implementation: applies any ColorProperty to any CSS color property.
    ///
    /// This single generic method replaces 21 separate implementations,
    /// providing a unified approach to color property styling.
    ///
    /// The pattern-match on `ColorProperty` realizes the universal property
    /// of the coproduct: it is the unique morphism that factors through
    /// the injection morphisms from each summand.
    ///
    /// - Parameters:
    ///   - propertyType: The CSS property type (e.g., `CSS_Standard.Color.self`)
    ///   - input: The canonical color property to apply
    ///   - media: Optional media query
    ///   - selector: Optional CSS selector
    ///   - pseudo: Optional pseudo-class/element
    /// - Returns: A new CSS with the style applied
    @usableFromInline
    @discardableResult
    func applyColorProperty<P: CSSColorProperty>(
        _ propertyType: P.Type,
        _ input: ColorProperty?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        guard let input else {
            return CSS<HTML.AnyView>(base: HTML.AnyView(base))
        }

        switch input {
        case .value(let darkModeColor):
            if darkModeColor.isSingleColor {
                // Single color: emit one style (no dark mode variant needed)
                return CSS<HTML.AnyView>(
                    base: HTML.AnyView(
                        base.inlineStyle(
                            P.color(darkModeColor.light),
                            media: media,
                            selector: selector,
                            pseudo: pseudo
                        )
                    )
                )
            } else {
                // Different light/dark: emit both with media query
                return CSS<HTML.AnyView>(
                    base: HTML.AnyView(
                        base
                            .inlineStyle(
                                P.color(darkModeColor.light),
                                media: media,
                                selector: selector,
                                pseudo: pseudo
                            )
                            .inlineStyle(
                                P.color(darkModeColor.dark),
                                media: .prefersColorScheme(.dark).and(media),
                                selector: selector,
                                pseudo: pseudo
                            )
                    )
                )
            }

        case .global(let global):
            return CSS<HTML.AnyView>(
                base: HTML.AnyView(
                    base.inlineStyle(
                        P.global(global),
                        media: media,
                        selector: selector,
                        pseudo: pseudo
                    )
                )
            )
        }
    }
}

// MARK: - Generic ColorPropertyConvertible Overload

extension CSS {
    /// Convenience overload that accepts any optional ColorPropertyConvertible type.
    ///
    /// This method uses the injection morphism from the conforming type
    /// to convert to ColorProperty before applying.
    @usableFromInline
    @discardableResult
    func applyColorProperty<P: CSSColorProperty, T: ColorPropertyConvertible>(
        _ propertyType: P.Type,
        _ value: T?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            propertyType,
            value.map(T.injection),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
