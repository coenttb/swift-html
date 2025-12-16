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
        alignItems: AlignItems? = nil
    ) -> CSS<some HTML.View> {
        var result: any HTML.View = base
            .inlineStyle(Display.grid)

        if let columns = columns {
            result = HTML.AnyView(result)
                .inlineStyle(columns)
        }
        if let rows = rows {
            result = HTML.AnyView(result)
                .inlineStyle(rows)
        }
        if let gap = gap {
            result = HTML.AnyView(result)
                .inlineStyle(gap)
        }
        if let rowGap = rowGap {
            result = HTML.AnyView(result)
                .inlineStyle(rowGap)
        }
        if let columnGap = columnGap {
            result = HTML.AnyView(result)
                .inlineStyle(columnGap)
        }
        if let justifyItems = justifyItems {
            result = HTML.AnyView(result)
                .inlineStyle(justifyItems)
        }
        if let alignItems = alignItems {
            result = HTML.AnyView(result)
                .inlineStyle(alignItems)
        }

        return CSS<HTML.AnyView>(base: HTML.AnyView(result))
    }
}
