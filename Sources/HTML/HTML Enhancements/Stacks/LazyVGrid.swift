//
//  LazyVGrid.swift
//  swift-html
//

import Foundation
import HTML_Rendering
import CSS
import OrderedCollections

public struct LazyVGrid<Content: HTML.View>: HTML.View {
    let columns: OrderedDictionary<CSS_Standard.Media?, [Int]>
    let content: Content
    let horizontalSpacing: W3C_CSS_Multicolumn.ColumnGap?
    let verticalSpacing: W3C_CSS_Flexbox.RowGap?

    public init(
        columns: OrderedDictionary<CSS_Standard.Media?, [Int]>,
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: W3C_CSS_Multicolumn.ColumnGap? = nil,
        verticalSpacing: W3C_CSS_Flexbox.RowGap? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.columns = columns
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    public init(
        columns: [Int],
        // TODO: alignment: HorizontalAlignment = .center,
        horizontalSpacing: W3C_CSS_Multicolumn.ColumnGap? = nil,
        verticalSpacing: W3C_CSS_Flexbox.RowGap? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.columns = [nil: columns]
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        self.content = content()
    }

    public var body: some HTML.View {
        // Build grid - simplified to avoid type complexity with reduce
        let first = columns.elements.first
        let colValues = first?.value ?? [1]
        let columnGap = horizontalSpacing == .zero ? .zero : horizontalSpacing
        let rowGap = verticalSpacing == .zero ? .zero : verticalSpacing
        let gridCols = colValues.map { "minmax(0, \($0)fr)" }.joined(separator: " ")

        div { content }
            .css
            .width(.percent(100))
            .display(.grid)
            .inlineStyle("grid-template-columns", gridCols)
            .columnGap(columnGap)
            .rowGap(rowGap)
    }
}
