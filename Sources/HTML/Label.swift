//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import Foundation

public struct Label<Title: HTML, Icon: HTML>: HTML {
    let alignment: VerticalAlign
    let spacing: Length
    let title: Title
    let icon: Icon
    
    public init(
        alignment: VerticalAlign = .center,
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
