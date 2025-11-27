//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/07/2025.
//

import CSS_Rendering
import CSS_Standard
import HTML_Rendering

extension HTML.View {
    @discardableResult
    public func position(
        _ value: W3C_CSS_Positioning.Position?,
        top: Top?,
        right: Right?,
        bottom: Bottom?,
        left: Left?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self
            .position(value, media: media, selector: selector, pseudo: pseudo)
            .top(top, media: media, selector: selector, pseudo: pseudo)
            .left(left, media: media, selector: selector, pseudo: pseudo)
            .right(right, media: media, selector: selector, pseudo: pseudo)
            .bottom(bottom, media: media, selector: selector, pseudo: pseudo)
    }
}
