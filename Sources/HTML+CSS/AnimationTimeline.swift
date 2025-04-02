//
//  AnimationTimeline.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func animationTimeline(
        _ animationTimeline: Properties.AnimationTimeline?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.AnimationTimeline.property, animationTimeline?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}