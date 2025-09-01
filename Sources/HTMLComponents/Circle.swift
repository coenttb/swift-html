//
//  File.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 03/07/2025.
//

import Foundation
import HTML

public struct Circle: HTML {

    @HTMLBuilder let content: any HTML

    public var width: LengthPercentage
    public var height: LengthPercentage

    public init(
        width: LengthPercentage = .rem(10),
        height: LengthPercentage = .rem(10),
        @HTMLBuilder content: @escaping () -> any HTML
    ) {
        self.content = content()
        self.width = width
        self.height = height
    }

    public init(
        size: LengthPercentage,
        @HTMLBuilder content: @escaping () -> any HTML
    ) {
        self.content = content()
        self.width = size
        self.height = size
    }

    public var body: some HTML {
        div {
            div {
                div {
                    AnyHTML(content)
                        .objectFit(.cover)
                        .height(.percent(100))
                        .width(.percent(100))
                        .maxWidth(.percent(100))
                        .borderStyle(BorderStyle.none)
                }
                .position(.absolute)
                .width(.percent(100))
                .height(.percent(100))
                .display(.block)
            }
            .clipPath(.circle(.percent(50)))
            .position(.relative)
            .width(.lengthPercentage(width))
            .height(.lengthPercentage(height))
        }
    }
}
