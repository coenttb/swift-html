//
//  HTML.View+outlineColor.swift
//  swift-html
//
//  Dark mode support for the CSS outline-color property.
//

import CSS_Rendering

extension HTML.View {
    @discardableResult
    @_disfavoredOverload
    public func outlineColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.lightAndDarkMode(
            CSS_Standard.OutlineColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML.View {
    @discardableResult
    @HTML.Builder
    public func outlineColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        if let color {
            self.outlineColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML.View {
    @discardableResult
    @_disfavoredOverload
    @HTML.Builder
    func outlineColor(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.outlineColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}
