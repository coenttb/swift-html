//
//  CSSPropertyAccessor+frame.swift
//  swift-html
//
//  Convenience method for sizing properties (width, height, min/max).
//

import CSS
import CSS_Standard

extension CSSPropertyAccessor {
    /// Convenience method for sizing properties (width, height, min/max).
    ///
    /// ```swift
    /// div.css.frame(
    ///     width: .percent(100),
    ///     maxWidth: .px(800),
    ///     height: .auto
    /// )
    /// ```
    @inlinable
    @discardableResult
    public func frame(
        width: CSS_Standard.Width? = nil,
        height: CSS_Standard.Height? = nil,
        minWidth: MinWidth? = nil,
        minHeight: MinHeight? = nil,
        maxWidth: MaxWidth? = nil,
        maxHeight: MaxHeight? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        var result: any HTML.View = base

        if let width = width {
            result = HTML.AnyView(result)
                .inlineStyle(CSS_Standard.Width.property, width.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let height = height {
            result = HTML.AnyView(result)
                .inlineStyle(CSS_Standard.Height.property, height.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let minWidth = minWidth {
            result = HTML.AnyView(result)
                .inlineStyle(MinWidth.property, minWidth.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let minHeight = minHeight {
            result = HTML.AnyView(result)
                .inlineStyle(MinHeight.property, minHeight.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxWidth = maxWidth {
            result = HTML.AnyView(result)
                .inlineStyle(MaxWidth.property, maxWidth.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxHeight = maxHeight {
            result = HTML.AnyView(result)
                .inlineStyle(MaxHeight.property, maxHeight.description, media: media, selector: selector, pseudo: pseudo)
        }

        return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
