//
//  HTML.View+LightAndDarkMode.swift
//  swift-html
//
//  Internal helper for applying light/dark mode color styles.
//

import CSS_Rendering

extension HTML.View {
    @discardableResult
    @_disfavoredOverload
    func lightAndDarkMode(
        _ property: String,
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self
            .inlineStyle(
                property,
                light.description,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
            .inlineStyle(
                property,
                dark?.description,
                media: .prefersColorScheme(.dark).and(media),
                selector: selector,
                pseudo: pseudo
            )
    }
}
