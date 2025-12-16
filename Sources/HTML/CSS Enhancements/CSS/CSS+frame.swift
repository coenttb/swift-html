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
        maxHeight: MaxHeight? = nil
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base

        if let width = width {
            result = HTML.AnyView(result)
                .inlineStyle(width)
        }
        if let height = height {
            result = HTML.AnyView(result)
                .inlineStyle(height)
        }
        if let minWidth = minWidth {
            result = HTML.AnyView(result)
                .inlineStyle(minWidth)
        }
        if let minHeight = minHeight {
            result = HTML.AnyView(result)
                .inlineStyle(minHeight)
        }
        if let maxWidth = maxWidth {
            result = HTML.AnyView(result)
                .inlineStyle(maxWidth)
        }
        if let maxHeight = maxHeight {
            result = HTML.AnyView(result)
                .inlineStyle(maxHeight)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
