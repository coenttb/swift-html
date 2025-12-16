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
    /// The at-rule, selector, and pseudo values are read from the current
    /// `HTML.Style.Context` TaskLocal, allowing context-based styling.
    ///
    /// For colors with different light/dark values, two styles are emitted:
    /// - The light color uses the current context
    /// - The dark color adds `@media (prefers-color-scheme: dark)` to the context
    ///
    /// - Parameters:
    ///   - propertyType: The CSS property type (e.g., `CSS_Standard.Color.self`)
    ///   - input: The canonical color property to apply
    /// - Returns: A new CSS with the style applied
    @usableFromInline
    @discardableResult
    @CSS.Builder
    func applyColorProperty<P: CSSColorProperty>(
        _ propertyType: P.Type,
        _ input: ColorProperty?
    ) -> CSS<some HTML.View> {
        if let input {
            switch input {
            case .value(let darkModeColor):
                if darkModeColor.isSingleColor {
                    // Single color: emit one style (no dark mode variant needed)
                    base.inlineStyle(P.color(darkModeColor.light))
                } else {
                    // Different light/dark: emit both with media query
                    // Light color uses current context
                    // Dark color adds prefers-color-scheme: dark to context
                    let ctx = HTML.Style.Context.current
                    let darkMedia = W3C_CSS_MediaQueries.Media.prefersColorScheme(.dark)
                    let darkAtRule: HTML.AtRule = {
                        if let existingAtRule = ctx.atRule {
                            // Combine with existing media query using Media's and() method
                            // which properly strips @media prefixes
                            let combined = darkMedia.and(W3C_CSS_MediaQueries.Media(rawValue: existingAtRule.rawValue))
                            return HTML.AtRule(rawValue: combined.rawValue)
                        } else {
                            return HTML.AtRule.Media(darkMedia)
                        }
                    }()

                    // Apply light color with current context
                    // Apply dark color explicitly with combined media query
                    HTML.Styled(
                        HTML.Styled(base, P.color(darkModeColor.light), atRule: ctx.atRule, selector: ctx.selector, pseudo: ctx.pseudo),
                        P.color(darkModeColor.dark),
                        atRule: darkAtRule,
                        selector: ctx.selector,
                        pseudo: ctx.pseudo
                    )
                }

            case .global(let global):
                base.inlineStyle(P.global(global))
            }
        } else {
            base
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
        _ value: T?
    ) -> CSS<some HTML.View> {
        applyColorProperty(propertyType, value.map(T.injection))
    }
}
