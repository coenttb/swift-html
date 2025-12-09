//
//  CSS+gridContainer.swift
//  swift-html
//
//  Convenience method for CSS Grid container properties.
//

import CSS
import CSS_Standard

extension CSS {
    /// Convenience method for CSS Grid container properties.
    ///
    /// ```swift
    /// div.css.gridContainer(
    ///     columns: .repeat(3, .fr(1)),
    ///     rows: .auto,
    ///     gap: .px(16)
    /// )
    /// ```
    @inlinable
    @discardableResult
    public func gridContainer(
        columns: GridTemplateColumns? = nil,
        rows: GridTemplateRows? = nil,
        gap: Gap? = nil,
        rowGap: RowGap? = nil,
        columnGap: ColumnGap? = nil,
        justifyItems: JustifyItems? = nil,
        alignItems: AlignItems? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base
            .inlineStyle(Display.grid, media: media, selector: selector, pseudo: pseudo)

        if let columns = columns {
            result = HTML.AnyView(result)
                .inlineStyle(columns, media: media, selector: selector, pseudo: pseudo)
        }
        if let rows = rows {
            result = HTML.AnyView(result)
                .inlineStyle(rows, media: media, selector: selector, pseudo: pseudo)
        }
        if let gap = gap {
            result = HTML.AnyView(result)
                .inlineStyle(gap, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowGap = rowGap {
            result = HTML.AnyView(result)
                .inlineStyle(rowGap, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnGap = columnGap {
            result = HTML.AnyView(result)
                .inlineStyle(columnGap, media: media, selector: selector, pseudo: pseudo)
        }
        if let justifyItems = justifyItems {
            result = HTML.AnyView(result)
                .inlineStyle(justifyItems, media: media, selector: selector, pseudo: pseudo)
        }
        if let alignItems = alignItems {
            result = HTML.AnyView(result)
                .inlineStyle(alignItems, media: media, selector: selector, pseudo: pseudo)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
