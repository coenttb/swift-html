//
//  PaddingTop.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func paddingTop(
        _ paddingTop: Properties.PaddingTop?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.PaddingTop.property, paddingTop?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}