//
//  FillOpacity.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func fillOpacity(
        _ fillOpacity: Properties.FillOpacity?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.FillOpacity.property, fillOpacity?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}