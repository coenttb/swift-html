//
//  OutlineWidth.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func outlineWidth(
        _ outlineWidth: Properties.OutlineWidth?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.OutlineWidth.property, outlineWidth?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}