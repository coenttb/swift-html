//
//  CSSPropertyAccessor+gridContainer.swift
//  swift-html
//
//  Convenience method for CSS Grid container properties.
//

import CSS
import CSS_Standard

extension CSSPropertyAccessor {
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
    ) -> CSSPropertyAccessor<HTML.AnyView> {
        var result: any HTML.View = base
            .inlineStyle(Display.property, Display.grid.description, media: media, selector: selector, pseudo: pseudo)

        if let columns = columns {
            result = HTML.AnyView(result)
                .inlineStyle(GridTemplateColumns.property, columns.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let rows = rows {
            result = HTML.AnyView(result)
                .inlineStyle(GridTemplateRows.property, rows.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let gap = gap {
            result = HTML.AnyView(result)
                .inlineStyle(Gap.property, gap.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let rowGap = rowGap {
            result = HTML.AnyView(result)
                .inlineStyle(RowGap.property, rowGap.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let columnGap = columnGap {
            result = HTML.AnyView(result)
                .inlineStyle(ColumnGap.property, columnGap.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let justifyItems = justifyItems {
            result = HTML.AnyView(result)
                .inlineStyle(JustifyItems.property, justifyItems.description, media: media, selector: selector, pseudo: pseudo)
        }
        if let alignItems = alignItems {
            result = HTML.AnyView(result)
                .inlineStyle(AlignItems.property, alignItems.description, media: media, selector: selector, pseudo: pseudo)
        }

        return CSSPropertyAccessor<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
