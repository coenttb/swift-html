//
//  CSS+fill.swift
//  swift-html
//
//  CSS fill property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    /// Sets the fill color with explicit light and dark mode values.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func fill(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) -> CSS<some HTML.View> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.Fill.self,
            .value(darkModeColor)
        )
    }

    /// Sets the fill color using a DarkModeColor value.
    @inlinable
    @discardableResult
    public func fill(
        _ color: DarkModeColor?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.Fill.self,
            color
        )
    }

    /// Sets the fill color using a raw CSS_Standard.Color.Value (no dark mode).
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func fill(
        _ value: CSS_Standard.Color.Value?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.Fill.self,
            value
        )
    }
}
