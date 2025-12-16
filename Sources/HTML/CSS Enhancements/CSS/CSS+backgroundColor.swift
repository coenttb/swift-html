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
        dark: CSS_Standard.Color.Value? = nil
    ) -> CSS<some HTML.View> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            .value(darkModeColor)
        )
    }

    /// Sets the background color using a DarkModeColor value.
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ value: DarkModeColor?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            value
        )
    }

    /// Sets the background color using a raw CSS_Standard.Color.Value (no dark mode).
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        _ value: CSS_Standard.Color.Value?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.BackgroundColor.self,
            value
        )
    }
}
