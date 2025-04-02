//
//  AlignItems.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func alignItems(
        _ alignItems: Properties.AlignItems?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.AlignItems.property, alignItems?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}