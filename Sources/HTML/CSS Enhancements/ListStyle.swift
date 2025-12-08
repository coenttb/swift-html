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
        _ listStyle: ListStyle,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<Base, CSS_Standard.ListStyle>, PaddingLeft>> {
        switch listStyle {
        case .reset:
            self
                .listStyle(CSS_Standard.ListStyle.none, media: media, selector: selector, pseudo: pseudo)
                .paddingLeft(.zero, media: media, selector: selector, pseudo: pseudo)
        case .cssPropertyTypesListStyle(let cssListStyle):
            self
                .listStyle(cssListStyle, media: media, selector: selector, pseudo: pseudo)
                .paddingLeft(nil, media: media, selector: selector, pseudo: pseudo)
        }
    }
}
