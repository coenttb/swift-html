//
//  CSS+stroke.swift
//  swift-html
//
//  CSS stroke property with dark mode support.
//

import CSS
import CSS_Standard

extension CSS {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func stroke(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        let darkModeColor = dark.map { DarkModeColor(light: light, dark: $0) }
            ?? DarkModeColor(light: light)
        return applyColorProperty(
            CSS_Standard.Stroke.self,
            .value(darkModeColor),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func stroke(
        _ color: DarkModeColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.Stroke.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func stroke(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        applyColorProperty(
            CSS_Standard.Stroke.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
