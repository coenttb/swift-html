//
//  CSS+positioned.swift
//  swift-html
//
//  Convenience methods for positioning properties.
//

import CSS
import CSS_Standard

extension CSS {
    /// Convenience method for positioning properties.
    ///
    /// ```swift
    /// div.css.positioned(
    ///     .absolute,
    ///     top: .px(0),
    ///     left: .px(0),
    ///     right: .px(0)
    /// )
    /// ```
    @inlinable
    @discardableResult
    public func positioned(
        _ position: W3C_CSS_Positioning.Position,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil,
        zIndex: ZIndex? = nil
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base
            .inlineStyle(position)

        if let top = top {
            result = HTML.AnyView(result)
                .inlineStyle(top)
        }
        if let right = right {
            result = HTML.AnyView(result)
                .inlineStyle(right)
        }
        if let bottom = bottom {
            result = HTML.AnyView(result)
                .inlineStyle(bottom)
        }
        if let left = left {
            result = HTML.AnyView(result)
                .inlineStyle(left)
        }
        if let zIndex = zIndex {
            result = HTML.AnyView(result)
                .inlineStyle(zIndex)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }

    /// Convenience for absolutely positioned element that fills its container.
    ///
    /// ```swift
    /// div.css.absoluteFill()
    /// // Equivalent to: position(.absolute), top(0), right(0), bottom(0), left(0)
    /// ```
    @inlinable
    @discardableResult
    public func absoluteFill(
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        self.positioned(
            .absolute,
            top: .px(0),
            right: .px(0),
            bottom: .px(0),
            left: .px(0)
        )
    }
}
