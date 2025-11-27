//
//  CSS+color.swift
//  swift-html
//
//  CSS color property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    /// Sets the text color with explicit light and dark mode values.
    ///
    /// This overload auto-darkens when `dark` is nil: the light color is
    /// automatically darkened for dark mode using `DarkModeColor(light:)`.
    ///
    /// - Parameters:
    ///   - light: The color to use in light mode
    ///   - dark: The color to use in dark mode, or nil to auto-derive
    ///   - media: Optional media query
    ///   - selector: Optional CSS selector
    ///   - pseudo: Optional pseudo-class/element
    /// - Returns: A new CSS with the style applied
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func color(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.Color.self,
            .value(darkModeColor),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the text color using a DarkModeColor (HTMLColor) value.
    ///
    /// DarkModeColor already contains both light and dark values.
    /// No auto-darkening occurs - the values are used as-is.
    ///
    /// - Parameters:
    ///   - color: The dark mode color pair to apply
    ///   - media: Optional media query
    ///   - selector: Optional CSS selector
    ///   - pseudo: Optional pseudo-class/element
    /// - Returns: A new CSS with the style applied
    @inlinable
    @discardableResult
    public func color(
        _ color: DarkModeColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
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
    /// The color is normalized to `(c, c)` via `DarkModeColor.init(_:)`.
    /// Use `DarkModeColor` directly if you need separate light/dark values.
    ///
    /// - Parameters:
    ///   - value: The color value to apply
    ///   - media: Optional media query
    ///   - selector: Optional CSS selector
    ///   - pseudo: Optional pseudo-class/element
    /// - Returns: A new CSS with the style applied
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func color(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Color.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the text color using a global CSS value (inherit, initial, unset, revert).
    ///
    /// - Parameters:
    ///   - global: The global CSS value to apply
    ///   - media: Optional media query
    ///   - selector: Optional CSS selector
    ///   - pseudo: Optional pseudo-class/element
    /// - Returns: A new CSS with the style applied
    @inlinable
    @discardableResult
    public func color(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.Color.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
