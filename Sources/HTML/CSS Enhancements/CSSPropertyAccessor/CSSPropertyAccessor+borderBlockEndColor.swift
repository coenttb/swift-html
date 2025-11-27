//
//  CSSPropertyAccessor+borderBlockEndColor.swift
//  swift-html
//
//  CSS border-block-end-color property with dark mode support.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
    /// Sets the border block end color with explicit light and dark mode values.
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderBlockEndColor(
        light: CSS_Standard.Color.Value,
        dark: CSS_Standard.Color.Value?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        lightAndDarkMode(
            CSS_Standard.BorderBlockEndColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the border block end color using an HTMLColor value.
    @inlinable
    @discardableResult
    public func borderBlockEndColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        guard let color else {
            return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(base))
        }
        return self.borderBlockEndColor(
            light: color.light,
            dark: color.dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Sets the border block end color using a Color.WithDarkMode value.
    @usableFromInline
    @discardableResult
    @_disfavoredOverload
    func borderBlockEndColor(
        _ color: CSS_Standard.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        switch color {
        case .global(let global):
            return CSSPropertyAccessor<HTML.AnyView>(
                base: HTML.AnyView(base.inlineStyle(CSS_Standard.BorderBlockEndColor.self, global, media: media, selector: selector, pseudo: pseudo))
            )
        case .darkMode(let color):
            return self.borderBlockEndColor(
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

    /// Sets the border block end color using a raw CSS_Standard.Color.Value (no dark mode).
    @inlinable
    @discardableResult
    @_disfavoredOverload
    public func borderBlockEndColor(
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
                    CSS_Standard.BorderBlockEndColor.property,
                    value.description,
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            )
        )
    }

    /// Sets the border block end color using a global CSS value (inherit, initial, unset, revert).
    @inlinable
    @discardableResult
    public func borderBlockEndColor(
        _ global: CSS_Standard.Global,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        CSSPropertyAccessor<HTML.AnyView>(
            base: HTML.AnyView(
                base.inlineStyle(
                    CSS_Standard.BorderBlockEndColor.self,
                    global,
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            )
        )
    }
}
