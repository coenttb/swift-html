//
//  CSSPropertyAccessor+borderTopColor.swift
//  swift-html
//
//  CSS border-top-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderTopColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        let effectiveDark = dark ?? light.darker()
        return applyColorProperty(
            CSS_Standard.BorderTopColor.self,
            .withDarkMode(light: light, dark: effectiveDark),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func borderTopColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BorderTopColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @usableFromInline
    @discardableResult
    @_disfavoredOverload
    func borderTopColor(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BorderTopColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderTopColor(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BorderTopColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func borderTopColor(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.BorderTopColor.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
