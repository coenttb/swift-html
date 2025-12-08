//
//  Flex.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import CSS
import CSS_Standard

extension CSS {
    @discardableResult
    @inlinable
    public func flexContainer(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, Display>, FlexDirection>, FlexWrap>, JustifyContent>, AlignItems>, RowGap>, ColumnGap>> {
        self
            .display(.flex, media: media, selector: selector, pseudo: pseudo)
            .flexDirection(direction, media: media, selector: selector, pseudo: pseudo)
            .flexWrap(wrap, media: media, selector: selector, pseudo: pseudo)
            .justifyContent(justification, media: media, selector: selector, pseudo: pseudo)
            .alignItems(itemAlignment, media: media, selector: selector, pseudo: pseudo)
            .rowGap(rowGap, media: media, selector: selector, pseudo: pseudo)
            .columnGap(columnGap, media: media, selector: selector, pseudo: pseudo)
    }

    @discardableResult
    @inlinable
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<Base, FlexGrow>, FlexShrink>, FlexBasis>> {
        self
            .flexGrow(grow, media: media, selector: selector, pseudo: pseudo)
            .flexShrink(shrink, media: media, selector: selector, pseudo: pseudo)
            .flexBasis(basis, media: media, selector: selector, pseudo: pseudo)
    }
}
