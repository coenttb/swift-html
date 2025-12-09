//
//  CSS+frame.swift
//  swift-html
//
//  Convenience method for sizing properties (width, height, min/max).
//

import CSS
import CSS_Standard

extension CSS {
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
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base

        if let width = width {
            result = HTML.AnyView(result)
                .inlineStyle(width, media: media, selector: selector, pseudo: pseudo)
        }
        if let height = height {
            result = HTML.AnyView(result)
                .inlineStyle(height, media: media, selector: selector, pseudo: pseudo)
        }
        if let minWidth = minWidth {
            result = HTML.AnyView(result)
                .inlineStyle(minWidth, media: media, selector: selector, pseudo: pseudo)
        }
        if let minHeight = minHeight {
            result = HTML.AnyView(result)
                .inlineStyle(minHeight, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxWidth = maxWidth {
            result = HTML.AnyView(result)
                .inlineStyle(maxWidth, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxHeight = maxHeight {
            result = HTML.AnyView(result)
                .inlineStyle(maxHeight, media: media, selector: selector, pseudo: pseudo)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
