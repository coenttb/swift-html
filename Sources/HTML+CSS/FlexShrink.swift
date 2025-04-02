//
//  FlexShrink.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func flexShrink(
        _ flexShrink: Properties.FlexShrink?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.FlexShrink.property, flexShrink?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}