//
//  CSS+spacing.swift
//  swift-html
//
//  Convenience method for spacing properties (padding and margin together).
//

import CSS
import CSS_Standard

extension CSS {
    /// Convenience method for spacing properties (padding and margin together).
    ///
    /// ```swift
    /// div.css.spacing(
    ///     padding: .px(16),
    ///     margin: .auto
    /// )
    /// ```
    @inlinable
    @discardableResult
    public func spacing(
        padding: Padding? = nil,
        margin: Margin? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.AnyView> {
        var result: any HTML.View = base

        if let padding = padding {
            result = HTML.AnyView(result)
                .inlineStyle(padding, media: media, selector: selector, pseudo: pseudo)
        }
        if let margin = margin {
            result = HTML.AnyView(result)
                .inlineStyle(margin, media: media, selector: selector, pseudo: pseudo)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
