//
//  CSS+backgroundColor.swift
//  swift-html
//
//  CSS background-color property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    /// Sets the background color with explicit light and dark mode values.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            .value(darkModeColor),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using a DarkModeColor value.
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ value: DarkModeColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using a raw CSS_Standard.Color.Value (no dark mode).
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using a global CSS value.
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
