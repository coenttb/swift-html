//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/07/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML

extension HTML {
    @discardableResult
    public func position(
        _ value: CSSPropertyTypes.Position?,
        top: Top?,
        right: Right?,
        bottom: Bottom?,
        left: Left?,
        media : CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .position(value, media: media, pre: pre, pseudo: pseudo)
            .top(top, media: media, pre: pre, pseudo: pseudo)
            .left(left, media: media, pre: pre, pseudo: pseudo)
            .right(right, media: media, pre: pre, pseudo: pseudo)
            .bottom(bottom, media: media, pre: pre, pseudo: pseudo)
    }
}
