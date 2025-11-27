//
//  HTML.View+positioned.swift
//  swift-html
//
//  Convenience methods for positioning properties.
//

import CSS_Rendering
import CSS_Standard

extension HTML.View {
    /// Convenience method for positioning properties.
    ///
    /// ```swift
    /// div.positioned(
    ///     .absolute,
    ///     top: .px(0),
    ///     left: .px(0),
    ///     right: .px(0)
    /// )
    /// ```
    @discardableResult
    public func positioned(
        _ position: W3C_CSS_Positioning.Position,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil,
        zIndex: ZIndex? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self
            .position(position, media: media, selector: selector, pseudo: pseudo)

        if let top = top {
            result = HTML.AnyView(result)
                .top(top, media: media, selector: selector, pseudo: pseudo)
        }
        if let right = right {
            result = HTML.AnyView(result)
                .right(right, media: media, selector: selector, pseudo: pseudo)
        }
        if let bottom = bottom {
            result = HTML.AnyView(result)
                .bottom(bottom, media: media, selector: selector, pseudo: pseudo)
        }
        if let left = left {
            result = HTML.AnyView(result)
                .left(left, media: media, selector: selector, pseudo: pseudo)
        }
        if let zIndex = zIndex {
            result = HTML.AnyView(result)
                .zIndex(zIndex, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }

    /// Convenience for absolutely positioned element that fills its container.
    ///
    /// ```swift
    /// div.absoluteFill()
    /// // Equivalent to: position(.absolute), top(0), right(0), bottom(0), left(0)
    /// ```
    @discardableResult
    public func absoluteFill(
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.positioned(
            .absolute,
            top: .px(0),
            right: .px(0),
            bottom: .px(0),
            left: .px(0),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}
