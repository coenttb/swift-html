//
//  TransitionTimingFunction.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func transitionTimingFunction(
        _ transitionTimingFunction: Properties.TransitionTimingFunction?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.TransitionTimingFunction.property, transitionTimingFunction?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}