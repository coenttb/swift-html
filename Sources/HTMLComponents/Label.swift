//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import Foundation
import HTML

public struct Label<Title: HTML, Icon: HTML>: HTML {
    let alignment: VerticalAlign
    let spacing: Length
    let title: Title
    let icon: Icon

    public init(
        alignment: VerticalAlign = .middle,
        spacing: Length = 0.25.rem,
        @HTMLBuilder icon: () -> Icon,
        @HTMLBuilder title: () -> Title
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.icon = icon()
        self.title = title()
    }

    public var body: some HTML {
        HStack(alignment: alignment, spacing: spacing) {
            icon
            title
        }
    }
}

extension Label {
    public init(
        alignment: VerticalAlign = .middle,
        spacing: Length = 0.25.rem,
        _ title: String,
        icon: SVG
    ) where Title == HTMLText, Icon == SVG {
        self = .init(
            alignment: alignment,
            spacing: spacing,
            icon: { icon },
            title: { HTMLText(title) }
        )
    }
}
public typealias LabelTypealias = Label
