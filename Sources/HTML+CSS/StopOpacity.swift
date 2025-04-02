//
//  StopOpacity.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func stopOpacity(
        _ stopOpacity: Properties.StopOpacity?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.StopOpacity.property, stopOpacity?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}