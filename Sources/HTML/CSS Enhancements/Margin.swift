//
//  Margin.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import CSS
import CSS_Standard
import OrderedCollections

extension Margin {
    public typealias Variant = Side
}

// MARK: - CSS Extension for margin with named parameters

extension CSS {
    /// Applies margin to specified sides using named parameters (TRBL order).
    ///
    /// This method allows setting margin on individual sides while maintaining CSS chaining.
    /// Only the sides with non-nil values will have margin applied.
    ///
    /// ```swift
    /// div.css
    ///     .margin(top: .rem(1), bottom: .rem(2))
    ///     .padding(.px(16))
    /// ```
    @discardableResult
    @inlinable
    public func margin(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, MarginTop>, MarginRight>, MarginBottom>, MarginLeft>> {
        self
            .marginTop(top.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
            .marginRight(right.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
            .marginBottom(bottom.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
            .marginLeft(left.map { .lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
    }

    /// Applies margin using vertical and horizontal values.
    ///
    /// ```swift
    /// div.css
    ///     .margin(vertical: .rem(1), horizontal: .rem(2))
    ///     .padding(.px(16))
    /// ```
    @discardableResult
    @inlinable
    public func margin(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, MarginTop>, MarginRight>, MarginBottom>, MarginLeft>> {
        self.margin(
            top: vertical,
            right: horizontal,
            bottom: vertical,
            left: horizontal,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }

    /// Applies margin with top, horizontal (right & left), and bottom values.
    ///
    /// ```swift
    /// div.css
    ///     .margin(top: .px(8), horizontal: .px(16), bottom: .px(8))
    /// ```
    @discardableResult
    @inlinable
    public func margin(
        top: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<HTML.Styled<HTML.Styled<HTML.Styled<HTML.Styled<Base, MarginTop>, MarginRight>, MarginBottom>, MarginLeft>> {
        self.margin(
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

