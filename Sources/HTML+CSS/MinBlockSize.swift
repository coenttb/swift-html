//
//  MinBlockSize.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func minBlockSize(
        _ minBlockSize: Properties.MinBlockSize?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.MinBlockSize.property, minBlockSize?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}