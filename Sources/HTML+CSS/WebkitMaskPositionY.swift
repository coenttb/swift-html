//
//  WebkitMaskPositionY.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func webkitMaskPositionY(
        _ webkitMaskPositionY: Properties.WebkitMaskPositionY?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.WebkitMaskPositionY.property, webkitMaskPositionY?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}