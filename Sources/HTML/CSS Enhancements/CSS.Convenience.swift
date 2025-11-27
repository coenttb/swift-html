//
//  CSS.Convenience.swift
//  swift-html
//
//  Provides convenience methods that group related CSS properties.
//  These methods make common styling patterns more ergonomic.
//

import CSS_Rendering
import CSS_Standard

// MARK: - Frame Convenience

extension HTML.View {
    /// Convenience method for sizing properties (width, height, min/max).
    ///
    /// ```swift
    /// div.frame(
    ///     width: .percent(100),
    ///     maxWidth: .px(800),
    ///     height: .auto
    /// )
    /// ```
    @discardableResult
    public func frame(
        width: CSS_Standard.Width? = nil,
        height: CSS_Standard.Height? = nil,
        minWidth: MinWidth? = nil,
        minHeight: MinHeight? = nil,
        maxWidth: MaxWidth? = nil,
        maxHeight: MaxHeight? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let width = width {
            result = HTML.AnyView(result)
                .width(width, media: media, selector: selector, pseudo: pseudo)
        }
        if let height = height {
            result = HTML.AnyView(result)
                .height(height, media: media, selector: selector, pseudo: pseudo)
        }
        if let minWidth = minWidth {
            result = HTML.AnyView(result)
                .minWidth(minWidth, media: media, selector: selector, pseudo: pseudo)
        }
        if let minHeight = minHeight {
            result = HTML.AnyView(result)
                .minHeight(minHeight, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxWidth = maxWidth {
            result = HTML.AnyView(result)
                .maxWidth(maxWidth, media: media, selector: selector, pseudo: pseudo)
        }
        if let maxHeight = maxHeight {
            result = HTML.AnyView(result)
                .maxHeight(maxHeight, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}

// MARK: - Spacing Convenience

extension HTML.View {
    /// Convenience method for spacing properties (padding and margin together).
    ///
    /// ```swift
    /// div.spacing(
    ///     padding: .px(16),
    ///     margin: .auto
    /// )
    /// ```
    @discardableResult
    public func spacing(
        padding: Padding? = nil,
        margin: Margin? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let padding = padding {
            result = HTML.AnyView(result)
                .padding(padding, media: media, selector: selector, pseudo: pseudo)
        }
        if let margin = margin {
            result = HTML.AnyView(result)
                .margin(margin, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}

// MARK: - Text Convenience

extension HTML.View {
    /// Convenience method for common text styling properties.
    ///
    /// ```swift
    /// p.text(
    ///     align: .center,
    ///     decoration: .underline,
    ///     transform: .uppercase
    /// )
    /// ```
    @discardableResult
    public func text(
        align: TextAlign? = nil,
        decoration: TextDecoration? = nil,
        transform: TextTransform? = nil,
        overflow: TextOverflow? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self

        if let align = align {
            result = HTML.AnyView(result)
                .textAlign(align, media: media, selector: selector, pseudo: pseudo)
        }
        if let decoration = decoration {
            result = HTML.AnyView(result)
                .textDecoration(decoration, media: media, selector: selector, pseudo: pseudo)
        }
        if let transform = transform {
            result = HTML.AnyView(result)
                .textTransform(transform, media: media, selector: selector, pseudo: pseudo)
        }
        if let overflow = overflow {
            result = HTML.AnyView(result)
                .textOverflow(overflow, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }
}

// MARK: - Position Convenience

extension HTML.View {
    /// Convenience method for positioning properties.
    ///
    /// ```swift
    /// div.positioned(
    ///     .absolute,
    ///     top: .px(0),
    ///     left: .px(0),
    ///     right: .px(0)
    /// )
    /// ```
    @discardableResult
    public func positioned(
        _ position: W3C_CSS_Positioning.Position,
        top: Top? = nil,
        right: Right? = nil,
        bottom: Bottom? = nil,
        left: Left? = nil,
        zIndex: ZIndex? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        var result: any HTML.View = self
            .position(position, media: media, selector: selector, pseudo: pseudo)

        if let top = top {
            result = HTML.AnyView(result)
                .top(top, media: media, selector: selector, pseudo: pseudo)
        }
        if let right = right {
            result = HTML.AnyView(result)
                .right(right, media: media, selector: selector, pseudo: pseudo)
        }
        if let bottom = bottom {
            result = HTML.AnyView(result)
                .bottom(bottom, media: media, selector: selector, pseudo: pseudo)
        }
        if let left = left {
            result = HTML.AnyView(result)
                .left(left, media: media, selector: selector, pseudo: pseudo)
        }
        if let zIndex = zIndex {
            result = HTML.AnyView(result)
                .zIndex(zIndex, media: media, selector: selector, pseudo: pseudo)
        }

        return HTML.AnyView(result)
    }

    /// Convenience for absolutely positioned element that fills its container.
    ///
    /// ```swift
    /// div.absoluteFill()
    /// // Equivalent to: position(.absolute), top(0), right(0), bottom(0), left(0)
    /// ```
    @discardableResult
    public func absoluteFill(
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.positioned(
            .absolute,
            top: .px(0),
            right: .px(0),
            bottom: .px(0),
            left: .px(0),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

// MARK: - Grid Convenience

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
