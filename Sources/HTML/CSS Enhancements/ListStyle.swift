//
//  ListStyle.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import CSS
import CSS_Standard

public enum ListStyle: Sendable {
    case reset
    case cssPropertyTypesListStyle(CSS_Standard.ListStyle)
}

extension CSS {
    @discardableResult
    @inlinable
    public func listStyle(
        _ listStyle: ListStyle
    ) -> CSS<HTML.Styled<HTML.Styled<Base, CSS_Standard.ListStyle>, PaddingLeft>> {
        switch listStyle {
        case .reset:
            self
                .listStyle(CSS_Standard.ListStyle.none)
                .paddingLeft(.zero)
        case .cssPropertyTypesListStyle(let cssListStyle):
            self
                .listStyle(cssListStyle)
                .paddingLeft(nil)
        }
    }
}
