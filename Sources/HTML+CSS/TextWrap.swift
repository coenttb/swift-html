//
//  TextWrap.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func textWrap(
        _ textWrap: Properties.TextWrap?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.TextWrap.property, textWrap?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}