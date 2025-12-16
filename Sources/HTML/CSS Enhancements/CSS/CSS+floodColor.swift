//
//  CSS+floodColor.swift
//  swift-html
//
//  CSS flood-color property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func floodColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) -> CSS<some HTML.View> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.FloodColor.self,
            .value(darkModeColor)
        )
    }

    @inlinable
    @discardableResult
    public func floodColor(
        _ color: DarkModeColor?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.FloodColor.self,
            color
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func floodColor(
        _ value: CSS_Standard.Color.Value?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.FloodColor.self,
            value
        )
    }
}
