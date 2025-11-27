//
//  HStack.swift
//  swift-html
//

import Foundation
import HTML_Rendering

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
        tag("swift-html-hstack") { content }
            // necessary?
            .alignItems(.stretch)
            .verticalAlign(alignment)
            .display(.flex)
            .flexDirection(.row)
            .maxHeight(.percentage(100))
            .columnGap(.length(spacing == 0 ? .zero : spacing ?? 1.rem))
    }
}
