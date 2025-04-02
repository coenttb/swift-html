//
//  MaskImage.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func maskImage(
        _ maskImage: Properties.MaskImage?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.MaskImage.property, maskImage?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}