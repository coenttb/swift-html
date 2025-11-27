//
//  CSSPropertyAccessor+lightingColor.swift
//  swift-html
//
//  CSS lighting-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func lightingColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        let effectiveDark = dark ?? light.darker()
        return applyColorProperty(
            CSS_Standard.LightingColor.self,
            .withDarkMode(light: light, dark: effectiveDark),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func lightingColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.LightingColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @usableFromInline
    @discardableResult
    @_disfavoredOverload
    func lightingColor(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.LightingColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func lightingColor(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.LightingColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func lightingColor(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.LightingColor.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
