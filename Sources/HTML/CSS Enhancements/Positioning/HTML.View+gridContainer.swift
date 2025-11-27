//
//  HTML.View+gridContainer.swift
//  swift-html
//
//  Convenience method for CSS Grid container properties.
//

import CSS_Rendering
import CSS_Standard

extension HTML.View {
    /// Convenience method for CSS Grid container properties.
    ///
    /// ```swift
    /// div.gridContainer(
    ///     columns: .repeat(3, .fr(1)),
    ///     rows: .auto,
    ///     gap: .px(16)
    /// )
    /// ```
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
    ) -> some HTML.View {
        var result: any HTML.View = self
            .display(.grid, media: media, selector: selector, pseudo: pseudo)

        if let columns = columns {
            result = HTML.AnyView(result)
                .gridTemplateColumns(columns, media: media, selector: selector, pseudo: pseudo)
        }
        if let rows = rows {
            result = HTML.AnyView(result)
                .gridTemplateRows(rows, media: media, selector: selector, pseudo: pseudo)
        }
        if let gap = gap {
            result = HTML.AnyView(result)
                .gap(gap, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowGap = rowGap {
            result = HTML.AnyView(result)
                .rowGap(rowGap, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnGap = columnGap {
            result = HTML.AnyView(result)
                .columnGap(columnGap, media: media, selector: selector, pseudo: pseudo)
        }
        if let justifyItems = justifyItems {
            result = HTML.AnyView(result)
                .justifyItems(justifyItems, media: media, selector: selector, pseudo: pseudo)
        }
        if let alignItems = alignItems {
            result = HTML.AnyView(result)
                .alignItems(alignItems, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}
