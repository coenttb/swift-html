//
//  InterpolateSize.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func interpolateSize(
        _ interpolateSize: Properties.InterpolateSize?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.InterpolateSize.property, interpolateSize?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}