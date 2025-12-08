//
//  Position.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/07/2025.
//

import CSS
import CSS_Standard
import HTML_Rendering

extension CSS {
    @discardableResult
    @inlinable
    public func position(
        _ value: W3C_CSS_Positioning.Position?,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, W3C_CSS_Positioning.Position>, Top>, Left>, Right>, Bottom>> {
        self
            .position(value, media: media, selector: selector, pseudo: pseudo)
            .top(top, media: media, selector: selector, pseudo: pseudo)
            .left(left, media: media, selector: selector, pseudo: pseudo)
            .right(right, media: media, selector: selector, pseudo: pseudo)
            .bottom(bottom, media: media, selector: selector, pseudo: pseudo)
    }
}
