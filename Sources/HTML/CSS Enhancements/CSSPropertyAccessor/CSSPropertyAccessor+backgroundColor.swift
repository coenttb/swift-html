//
//  CSSPropertyAccessor+backgroundColor.swift
//  swift-html
//
//  CSS background-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    /// Sets the background color with explicit light and dark mode values.
    ///
    /// This is the ONLY overload that auto-darkens: when `dark` is nil,
    /// the light color is automatically darkened for dark mode.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        return applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            .withDarkMode(
                light: light,
                dark: dark ?? light.darker()
            ),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using an HTMLColor value.
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ value: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
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
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using a global CSS value (inherit, initial, unset, revert).
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
