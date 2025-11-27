//
//  HTML.View+spacing.swift
//  swift-html
//
//  Convenience method for spacing properties (padding and margin together).
//

import CSS_Rendering
import CSS_Standard

extension HTML.View {
    /// Convenience method for spacing properties (padding and margin together).
    ///
    /// ```swift
    /// div.spacing(
    ///     padding: .px(16),
    ///     margin: .auto
    /// )
    /// ```
    @discardableResult
    public func spacing(
        padding: Padding? = nil,
        margin: Margin? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let padding = padding {
            result = HTML.AnyView(result)
                .padding(padding, media: media, selector: selector, pseudo: pseudo)
        }
        if let margin = margin {
            result = HTML.AnyView(result)
                .margin(margin, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}
