//
//  HStack.swift
//  swift-html
//

import Foundation
import HTML_Rendering
import CSS

public struct HStack<Content: HTML.View>: HTML.View {
    let alignment: VerticalAlign
    let spacing: Length?
    let content: Content

    public init(
        alignment: VerticalAlign = .middle,
        spacing: CSS_Standard.Length? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some HTML.View {
        div { content }
            .css
            .alignItems(AlignItems.stretch)
            .verticalAlign(alignment)
            .display(Display.flex)
            .flexDirection(FlexDirection.row)
            .maxHeight(MaxHeight.percentage(100))
            .columnGap(ColumnGap.length(spacing == 0 ? .zero : spacing ?? 1.rem))
    }
}
