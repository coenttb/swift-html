//
//  CSSPropertyAccessor+text.swift
//  swift-html
//
//  Convenience method for common text styling properties.
//

import CSS_Rendering
import CSS_Standard

extension CSSPropertyAccessor {
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
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        var result: any HTML.View = base

        if let align = align {
            result = HTML.AnyView(result)
                .inlineStyle(TextAlign.property, align.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let decoration = decoration {
            result = HTML.AnyView(result)
                .inlineStyle(TextDecoration.property, decoration.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let transform = transform {
            result = HTML.AnyView(result)
                .inlineStyle(TextTransform.property, transform.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let overflow = overflow {
            result = HTML.AnyView(result)
                .inlineStyle(TextOverflow.property, overflow.description, media: media, selector: selector, pseudo: pseudo)
        }

        return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
