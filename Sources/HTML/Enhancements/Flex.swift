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
        media: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .display(.flex, media: media, pre: pre, pseudo: pseudo)
            .flexDirection(direction, media: media, pre: pre, pseudo: pseudo)
            .flexWrap(wrap, media: media, pre: pre, pseudo: pseudo)
            .justifyContent(justification, media: media, pre: pre, pseudo: pseudo)
            .alignItems(itemAlignment, media: media, pre: pre, pseudo: pseudo)
            .rowGap(rowGap, media: media, pre: pre, pseudo: pseudo)
            .columnGap(columnGap, media: media, pre: pre, pseudo: pseudo)
    }
    
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil,
        media: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .flexGrow(grow, media: media, pre: pre, pseudo: pseudo)
            .flexShrink(shrink, media: media, pre: pre, pseudo: pseudo)
            .flexBasis(basis, media: media, pre: pre, pseudo: pseudo)
    }
}
