//
//  WhiteSpace.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func whiteSpace(
        _ whiteSpace: Properties.WhiteSpace?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.WhiteSpace.property, whiteSpace?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}