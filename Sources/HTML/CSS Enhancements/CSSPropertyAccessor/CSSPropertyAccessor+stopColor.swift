//
//  CSSPropertyAccessor+stopColor.swift
//  swift-html
//
//  CSS stop-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func stopColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        let effectiveDark = dark ?? light.darker()
        return applyColorProperty(
            CSS_Standard.StopColor.self,
            .withDarkMode(light: light, dark: effectiveDark),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func stopColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.StopColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @usableFromInline
    @discardableResult
    @_disfavoredOverload
    func stopColor(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.StopColor.self,
            color,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func stopColor(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.StopColor.self,
            value,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    @inlinable
    @discardableResult
    public func stopColor(
        _ global: CSS_Standard.Global?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        applyColorProperty(
            CSS_Standard.StopColor.self,
            global,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
