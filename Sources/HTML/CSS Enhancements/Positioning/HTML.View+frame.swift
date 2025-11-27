//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 27/11/2025.
//

import CSS_Rendering

extension HTML.View {
    /// Convenience method for sizing properties (width, height, min/max).
    ///
    /// ```swift
    /// div.frame(
    ///     width: .percent(100),
    ///     maxWidth: .px(800),
    ///     height: .auto
    /// )
    /// ```
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
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let width = width {
            result = HTML.AnyView(result)
                .width(width, media: media, selector: selector, pseudo: pseudo)
        }
        if let height = height {
            result = HTML.AnyView(result)
                .height(height, media: media, selector: selector, pseudo: pseudo)
        }
        if let minWidth = minWidth {
            result = HTML.AnyView(result)
                .minWidth(minWidth, media: media, selector: selector, pseudo: pseudo)
        }
        if let minHeight = minHeight {
            result = HTML.AnyView(result)
                .minHeight(minHeight, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxWidth = maxWidth {
            result = HTML.AnyView(result)
                .maxWidth(maxWidth, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxHeight = maxHeight {
            result = HTML.AnyView(result)
                .maxHeight(maxHeight, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}
