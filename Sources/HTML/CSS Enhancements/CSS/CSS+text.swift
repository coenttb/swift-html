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
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base

        if let align = align {
            result = HTML.AnyView(result)
                .inlineStyle(align, media: media, selector: selector, pseudo: pseudo)
        }
        if let decoration = decoration {
            result = HTML.AnyView(result)
                .inlineStyle(decoration, media: media, selector: selector, pseudo: pseudo)
        }
        if let transform = transform {
            result = HTML.AnyView(result)
                .inlineStyle(transform, media: media, selector: selector, pseudo: pseudo)
        }
        if let overflow = overflow {
            result = HTML.AnyView(result)
                .inlineStyle(overflow, media: media, selector: selector, pseudo: pseudo)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
