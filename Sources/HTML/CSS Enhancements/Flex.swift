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
        columnGap: ColumnGap? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, Display>, FlexDirection>, FlexWrap>, JustifyContent>, AlignItems>, RowGap>, ColumnGap>> {
        self
            .display(.flex)
            .flexDirection(direction)
            .flexWrap(wrap)
            .justifyContent(justification)
            .alignItems(itemAlignment)
            .rowGap(rowGap)
            .columnGap(columnGap)
    }

    @discardableResult
    @inlinable
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<Base, FlexGrow>, FlexShrink>, FlexBasis>> {
        self
            .flexGrow(grow)
            .flexShrink(shrink)
            .flexBasis(basis)
    }
}
