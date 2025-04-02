//
//  PaddingLeft.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func paddingLeft(
        _ paddingLeft: Properties.PaddingLeft?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.PaddingLeft.property, paddingLeft?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}