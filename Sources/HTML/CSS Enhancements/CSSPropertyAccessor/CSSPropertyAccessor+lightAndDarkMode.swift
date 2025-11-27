//
//  CSSPropertyAccessor+lightAndDarkMode.swift
//  swift-html
//
//  Internal helper for applying light/dark mode color styles within the CSS namespace.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    /// Internal helper for applying CSS properties with light and dark mode variants.
    ///
    /// Applies the light value normally and the dark value within a
    /// `prefers-color-scheme: dark` media query.
    ///
    /// When `light == dark`, only emits the light style (no redundant dark mode block).
    @usableFromInline
    @discardableResult
    func lightAndDarkMode(
        _ property: String,
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        // Skip dark mode block if dark is nil or if light == dark (no redundant CSS)
        let effectiveDark: CSS_Standard.Color.Value? = {
            guard let dark else { return nil }
            return light == dark ? nil : dark
        }()

        return CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(
                base
                    .inlineStyle(
                        property,
                        light.description,
                        media: media,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .inlineStyle(
                        property,
                        effectiveDark?.description,
                        media: .prefersColorScheme(.dark).and(media),
                        selector: selector,
                        pseudo: pseudo
                    )
            )
        )
    }
}
