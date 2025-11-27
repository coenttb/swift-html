//
//  CSSPropertyAccessor+color.swift
//  swift-html
//
//  CSS color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    /// Sets the text color with explicit light and dark mode values.
    ///
    /// This is the ONLY overload that auto-darkens: when `dark` is nil,
    /// the light color is automatically darkened for dark mode.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func color(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        let effectiveDark = dark ?? light.darker()
        return applyColorProperty(
            CSS_Standard.Color.self,
            .withDarkMode(light: light, dark: effectiveDark),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the text color using an HTMLColor value.
    ///
    /// HTMLColor already contains both light and dark values.
    /// No auto-darkening occurs (HTMLColor.init handles it).
    @inlinable
    @discardableResult
    public func color(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Color.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the text color using a Color.WithDarkMode value.
    @usableFromInline
    @discardableResult
    @_disfavoredOverload
    func color(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Color.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the text color using a raw CSS_Standard.Color.Value (no dark mode).
    ///
    /// This overload applies a single color value without any dark mode variant.
    /// Use `HTMLColor` if you need dark mode support.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func color(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Color.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the text color using a global CSS value (inherit, initial, unset, revert).
    @inlinable
    @discardableResult
    public func color(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Color.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
