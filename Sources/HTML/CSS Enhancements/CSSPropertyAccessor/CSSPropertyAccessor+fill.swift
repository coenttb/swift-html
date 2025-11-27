//
//  CSSPropertyAccessor+fill.swift
//  swift-html
//
//  CSS fill property with dark mode support.
//

import CSS
import CSS_Standard

extension CSSPropertyAccessor {
    /// Sets the fill color with explicit light and dark mode values.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func fill(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.Fill.self,
            .value(darkModeColor),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the fill color using a DarkModeColor value.
    @inlinable
    @discardableResult
    public func fill(
        _ color: DarkModeColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Fill.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the fill color using a raw CSS_Standard.Color.Value (no dark mode).
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func fill(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Fill.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the fill color using a global CSS value.
    @inlinable
    @discardableResult
    public func fill(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Fill.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
