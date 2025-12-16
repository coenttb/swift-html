//
//  CSS+textEmphasisColor.swift
//  swift-html
//
//  CSS text-emphasis-color property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func textEmphasisColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil
    ) -> CSS<some HTML.View> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.TextEmphasisColor.self,
            .value(darkModeColor)
        )
    }

    @inlinable
    @discardableResult
    public func textEmphasisColor(
        _ color: DarkModeColor?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.TextEmphasisColor.self,
            color
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func textEmphasisColor(
        _ value: CSS_Standard.Color.Value?
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.TextEmphasisColor.self,
            value
        )
    }
}
