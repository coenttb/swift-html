//
//  FontSynthesis.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func fontSynthesis(
        _ fontSynthesis: Properties.FontSynthesis?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.FontSynthesis.property, fontSynthesis?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}