//
//  CSS+text.swift
//  swift-html
//
//  Convenience method for common text styling properties.
//

import CSS
import CSS_Standard

extension CSS {
    /// Convenience method for common text styling properties.
    ///
    /// ```swift
    /// p.css.text(
    ///     align: .center,
    ///     decoration: .underline,
    ///     transform: .uppercase
    /// )
    /// ```
    @inlinable
    @discardableResult
    @CSS.Builder
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        base
            .inlineStyle(align, media: media, selector: selector, pseudo: pseudo)
            .inlineStyle(decoration, media: media, selector: selector, pseudo: pseudo)
            .inlineStyle(transform, media: media, selector: selector, pseudo: pseudo)
            .inlineStyle(overflow, media: media, selector: selector, pseudo: pseudo)
    }
}
