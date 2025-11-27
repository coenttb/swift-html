//
//  CSSPropertyAccessor+borderRightColor.swift
//  swift-html
//
//  CSS border-right-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    /// Sets the border right color with explicit light and dark mode values.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderRightColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        lightAndDarkMode(
            CSS_Standard.BorderRightColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the border right color using an HTMLColor value.
    @inlinable
    @discardableResult
    public func borderRightColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        guard let color else {
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }
        return self.borderRightColor(
            light: color.light,
            dark: color.dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the border right color using a Color.WithDarkMode value.
    @usableFromInline
    @discardableResult
    @_disfavoredOverload
    func borderRightColor(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        switch color {
        case .global(let global):
            return CSSPropertyAccessor<HTML.AnyView>(
                base: HTML.AnyView(base.inlineStyle(CSS_Standard.BorderRightColor.self, global, media: media, selector: selector, pseudo: pseudo))
            )
        case .darkMode(let color):
            return self.borderRightColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }
    }

    /// Sets the border right color using a raw CSS_Standard.Color.Value (no dark mode).
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderRightColor(
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
                    CSS_Standard.BorderRightColor.property,
                    value.description,
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            )
        )
    }

    /// Sets the border right color using a global CSS value (inherit, initial, unset, revert).
    @inlinable
    @discardableResult
    public func borderRightColor(
        _ global: CSS_Standard.Global,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(
                base.inlineStyle(
                    CSS_Standard.BorderRightColor.self,
                    global,
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            )
        )
    }
}
