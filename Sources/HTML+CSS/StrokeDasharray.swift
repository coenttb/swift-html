//
//  StrokeDasharray.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func strokeDasharray(
        _ strokeDasharray: Properties.StrokeDasharray?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.StrokeDasharray.property, strokeDasharray?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}