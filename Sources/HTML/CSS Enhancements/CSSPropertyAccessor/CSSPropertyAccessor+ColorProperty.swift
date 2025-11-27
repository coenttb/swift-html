//
//  CSSPropertyAccessor+ColorProperty.swift
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

import CSS_Rendering
import CSS_Standard

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
    /// - Returns: A new CSSPropertyAccessor with the style applied
    @usableFromInline
    @discardableResult
    func applyColorProperty<P: CSSColorProperty>(
        _ propertyType: P.Type,
        _ input: ColorProperty?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        guard let input else {
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }

        switch input {
        case .value(let darkModeColor):
            if darkModeColor.isSingleColor {
                // Single color: emit one style (no dark mode variant needed)
                return CSSPropertyAccessor<HTML.AnyView>(
                    base: HTML.AnyView(
                        base.inlineStyle(
                            P.property,
                            darkModeColor.light.description,
                            media: media,
                            selector: selector,
                            pseudo: pseudo
                        )
                    )
                )
            } else {
                // Different light/dark: emit both with media query
                return CSSPropertyAccessor<HTML.AnyView>(
                    base: HTML.AnyView(
                        base
                            .inlineStyle(
                                P.property,
                                darkModeColor.light.description,
                                media: media,
                                selector: selector,
                                pseudo: pseudo
                            )
                            .inlineStyle(
                                P.property,
                                darkModeColor.dark.description,
                                media: .prefersColorScheme(.dark).and(media),
                                selector: selector,
                                pseudo: pseudo
                            )
                    )
                )
            }

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

// MARK: - Generic ColorPropertyConvertible Overload

extension CSSPropertyAccessor {
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
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            propertyType,
            value.map(T.injection),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
