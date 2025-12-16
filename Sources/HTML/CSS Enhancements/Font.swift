//
//  Font.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 26/06/2025.
//

import CSS
import CSS_Standard
import Dependencies

public struct Font: Hashable, Sendable {
    public let family: CSS_Standard.FontFamily
    public let size: CSS_Standard.FontSize
    public let stretch: CSS_Standard.FontStretch
    public let style: CSS_Standard.FontStyle
    public let variant: CSS_Standard.FontVariant
    public let weight: CSS_Standard.FontWeight
    public let lineHeight: CSS_Standard.LineHeight

    public init(
        family: CSS_Standard.FontFamily,
        size: CSS_Standard.FontSize,
        stretch: CSS_Standard.FontStretch,
        style: CSS_Standard.FontStyle,
        variant: CSS_Standard.FontVariant,
        weight: CSS_Standard.FontWeight,
        lineHeight: CSS_Standard.LineHeight
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

extension CSS {
    @discardableResult
    @inlinable
    public func font(
        _ font: Font
    ) -> CSS<
        HTML.Styled<
            HTML.Styled<
                HTML.Styled<
                    HTML.Styled<
                        HTML.Styled<
                            HTML.Styled<
                                HTML.Styled<Base, FontFamily>,
                                CSS_Standard.FontSize
                            >,
                            FontStretch
                        >,
                        FontStyle
                    >,
                    FontVariant
                >,
                FontWeight
            >,
            LineHeight
        >
    > {
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
