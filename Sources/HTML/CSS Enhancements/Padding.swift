//
//  Padding.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import CSS
import CSS_Standard
import OrderedCollections

extension Padding {
    public typealias Variant = Side
}

// MARK: - CSS Extension for padding with named parameters

extension CSS {
    /// Applies padding to specified sides using named parameters (TRBL order).
    ///
    /// This method allows setting padding on individual sides while maintaining CSS chaining.
    /// Only the sides with non-nil values will have padding applied.
    ///
    /// ```swift
    /// div.css
    ///     .padding(top: .rem(1), bottom: .rem(2))
    ///     .margin(.px(16))
    /// ```
    @discardableResult
    @inlinable
    public func padding(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, PaddingTop>, PaddingRight>, PaddingBottom>, PaddingLeft>> {
        self
            .paddingTop(top.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
            .paddingRight(right.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
            .paddingBottom(bottom.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
            .paddingLeft(left.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
    }

    /// Applies padding using vertical and horizontal values.
    ///
    /// ```swift
    /// div.css
    ///     .padding(vertical: .rem(1), horizontal: .rem(2))
    ///     .margin(.px(16))
    /// ```
    @discardableResult
    @inlinable
    public func padding(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, PaddingTop>, PaddingRight>, PaddingBottom>, PaddingLeft>> {
        self.padding(
            top: vertical,
            right: horizontal,
            bottom: vertical,
            left: horizontal,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Applies padding with top, horizontal (right & left), and bottom values.
    ///
    /// ```swift
    /// div.css
    ///     .padding(top: .px(8), horizontal: .px(16), bottom: .px(8))
    /// ```
    @discardableResult
    @inlinable
    public func padding(
        top: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, PaddingTop>, PaddingRight>, PaddingBottom>, PaddingLeft>> {
        self.padding(
            top: top,
            right: horizontal,
            bottom: bottom,
            left: horizontal,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

