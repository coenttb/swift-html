//
//  MarginTrim.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func marginTrim(
        _ marginTrim: Properties.MarginTrim?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.MarginTrim.property, marginTrim?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}