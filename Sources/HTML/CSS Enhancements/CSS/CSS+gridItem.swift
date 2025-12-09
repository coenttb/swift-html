//
//  CSS+gridItem.swift
//  swift-html
//
//  Convenience method for CSS Grid item properties.
//

import CSS
import CSS_Standard

extension CSS {
    /// Convenience method for CSS Grid item properties.
    ///
    /// ```swift
    /// div.css.gridItem(
    ///     column: .span(2),
    ///     row: .span(1)
    /// )
    /// ```
    @inlinable
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
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base

        if let column = column {
            result = HTML.AnyView(result)
                .inlineStyle(column, media: media, selector: selector, pseudo: pseudo)
        }
        if let row = row {
            result = HTML.AnyView(result)
                .inlineStyle(row, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnStart = columnStart {
            result = HTML.AnyView(result)
                .inlineStyle(columnStart, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnEnd = columnEnd {
            result = HTML.AnyView(result)
                .inlineStyle(columnEnd, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowStart = rowStart {
            result = HTML.AnyView(result)
                .inlineStyle(rowStart, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowEnd = rowEnd {
            result = HTML.AnyView(result)
                .inlineStyle(rowEnd, media: media, selector: selector, pseudo: pseudo)
        }
        if let justifySelf = justifySelf {
            result = HTML.AnyView(result)
                .inlineStyle(justifySelf, media: media, selector: selector, pseudo: pseudo)
        }
        if let alignSelf = alignSelf {
            result = HTML.AnyView(result)
                .inlineStyle(alignSelf, media: media, selector: selector, pseudo: pseudo)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
