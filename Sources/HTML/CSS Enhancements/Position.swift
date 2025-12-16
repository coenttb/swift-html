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
        left: Left? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, W3C_CSS_Positioning.Position>, Top>, Left>, Right>, Bottom>> {
        self
            .position(value)
            .top(top)
            .left(left)
            .right(right)
            .bottom(bottom)
    }
}
