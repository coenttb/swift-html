//
//  HTML.View+text.swift
//  swift-html
//
//  Convenience method for common text styling properties.
//

import CSS_Rendering
import CSS_Standard

extension HTML.View {
    /// Convenience method for common text styling properties.
    ///
    /// ```swift
    /// p.text(
    ///     align: .center,
    ///     decoration: .underline,
    ///     transform: .uppercase
    /// )
    /// ```
    @discardableResult
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let align = align {
            result = HTML.AnyView(result)
                .textAlign(align, media: media, selector: selector, pseudo: pseudo)
        }
        if let decoration = decoration {
            result = HTML.AnyView(result)
                .textDecoration(decoration, media: media, selector: selector, pseudo: pseudo)
        }
        if let transform = transform {
            result = HTML.AnyView(result)
                .textTransform(transform, media: media, selector: selector, pseudo: pseudo)
        }
        if let overflow = overflow {
            result = HTML.AnyView(result)
                .textOverflow(overflow, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}
