//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation

extension HTML {
    public func flexContainer(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .display(.flex, media: media, selector: selector, pseudo: pseudo)
            .flexDirection(direction, media: media, selector: selector, pseudo: pseudo)
            .flexWrap(wrap, media: media, selector: selector, pseudo: pseudo)
            .justifyContent(justification, media: media, selector: selector, pseudo: pseudo)
            .alignItems(itemAlignment, media: media, selector: selector, pseudo: pseudo)
            .rowGap(rowGap, media: media, selector: selector, pseudo: pseudo)
            .columnGap(columnGap, media: media, selector: selector, pseudo: pseudo)
    }

    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .flexGrow(grow, media: media, selector: selector, pseudo: pseudo)
            .flexShrink(shrink, media: media, selector: selector, pseudo: pseudo)
            .flexBasis(basis, media: media, selector: selector, pseudo: pseudo)
    }
}
