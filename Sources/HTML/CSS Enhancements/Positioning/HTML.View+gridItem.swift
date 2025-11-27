//
//  HTML.View+gridItem.swift
//  swift-html
//
//  Convenience method for CSS Grid item properties.
//

import CSS_Rendering
import CSS_Standard

extension HTML.View {
    /// Convenience method for CSS Grid item properties.
    ///
    /// ```swift
    /// div.gridItem(
    ///     column: .span(2),
    ///     row: .span(1)
    /// )
    /// ```
    @discardableResult
    public func gridItem(
        column: GridColumn? = nil,
        row: GridRow? = nil,
        columnStart: GridColumnStart? = nil,
        columnEnd: GridColumnEnd? = nil,
        rowStart: GridRowStart? = nil,
        rowEnd: GridRowEnd? = nil,
        justifySelf: JustifySelf? = nil,
        alignSelf: AlignSelf? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let column = column {
            result = HTML.AnyView(result)
                .gridColumn(column, media: media, selector: selector, pseudo: pseudo)
        }
        if let row = row {
            result = HTML.AnyView(result)
                .gridRow(row, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnStart = columnStart {
            result = HTML.AnyView(result)
                .gridColumnStart(columnStart, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnEnd = columnEnd {
            result = HTML.AnyView(result)
                .gridColumnEnd(columnEnd, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowStart = rowStart {
            result = HTML.AnyView(result)
                .gridRowStart(rowStart, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowEnd = rowEnd {
            result = HTML.AnyView(result)
                .gridRowEnd(rowEnd, media: media, selector: selector, pseudo: pseudo)
        }
        if let justifySelf = justifySelf {
            result = HTML.AnyView(result)
                .justifySelf(justifySelf, media: media, selector: selector, pseudo: pseudo)
        }
        if let alignSelf = alignSelf {
            result = HTML.AnyView(result)
                .alignSelf(alignSelf, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}
