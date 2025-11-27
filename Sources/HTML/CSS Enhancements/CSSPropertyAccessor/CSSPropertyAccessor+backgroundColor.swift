//
//  CSSPropertyAccessor+backgroundColor.swift
//  swift-html
//
//  CSS background-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    /// Sets the background color with explicit light and dark mode values.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        lightAndDarkMode(
            CSS_Standard.BackgroundColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using an HTMLColor value.
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        guard let color else {
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }
        return self.backgroundColor(
            light: color.light,
            dark: color.dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the background color using a raw CSS_Standard.Color.Value (no dark mode).
    ///
    /// This overload applies a single color value without any dark mode variant.
    /// Use `HTMLColor` if you need dark mode support.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        _ value: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        guard let value else {
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }
        return CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(
                base.inlineStyle(
                    CSS_Standard.BackgroundColor.property,
                    value.description,
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            )
        )
    }

    /// Sets the background color using a global CSS value (inherit, initial, unset, revert).
    @inlinable
    @discardableResult
    public func backgroundColor(
        _ global: CSS_Standard.Global,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(
                base.inlineStyle(
                    CSS_Standard.BackgroundColor.self,
                    global,
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            )
        )
    }
}
