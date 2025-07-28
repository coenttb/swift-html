//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 26/06/2025.
//

import Dependencies
import Foundation
import HTMLCSSPointFreeHTML

public struct Font: Hashable, Sendable {
    public let family: CSSPropertyTypes.FontFamily
    public let size: CSSPropertyTypes.FontSize
    public let stretch: CSSPropertyTypes.FontStretch
    public let style: CSSPropertyTypes.FontStyle
    public let variant: CSSPropertyTypes.FontVariant
    public let weight: CSSPropertyTypes.FontWeight
    public let lineHeight: CSSPropertyTypes.LineHeight

    public init(
        family: CSSPropertyTypes.FontFamily,
        size: CSSPropertyTypes.FontSize,
        stretch: CSSPropertyTypes.FontStretch,
        style: CSSPropertyTypes.FontStyle,
        variant: CSSPropertyTypes.FontVariant,
        weight: CSSPropertyTypes.FontWeight,
        lineHeight: CSSPropertyTypes.LineHeight
    ) {
        self.family = family
        self.size = size
        self.stretch = stretch
        self.style = style
        self.variant = variant
        self.weight = weight
        self.lineHeight = lineHeight
    }
}

extension HTML {
    @HTMLBuilder
    public func font(_ font: Font) -> some HTML {
        self
            .fontFamily(font.family)
            .fontSize(font.size)
            .fontStretch(font.stretch)
            .fontStyle(font.style)
            .fontVariant(font.variant)
            .fontWeight(font.weight)
            .lineHeight(font.lineHeight)
    }
}
