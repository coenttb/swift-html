//
//  MozUserInput.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

import CSS
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    public func mozUserInput(
        _ mozUserInput: Properties.MozUserInput?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle(Properties.MozUserInput.property, mozUserInput?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}