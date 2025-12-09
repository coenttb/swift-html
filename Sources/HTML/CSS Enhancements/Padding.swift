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
    /// When all four values are provided, uses CSS shorthand optimization.
    ///
    /// ```swift
    /// div.css
    ///     .padding(top: .rem(1), bottom: .rem(2))
    ///     .margin(.px(16))
    /// ```
    @discardableResult
    @inlinable
    @CSS.Builder
    public func padding(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        // Optimize to shorthand when all four values are provided
        if let top, let right, let bottom, let left {
            // All four equal: padding: value
            if top == right && right == bottom && bottom == left {
                base.inlineStyle(
                    Padding.all(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            }
            // Vertical equal, horizontal equal: padding: vertical horizontal
            else if top == bottom && right == left {
                base.inlineStyle(
                    Padding.verticalHorizontal(top, right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            }
            // All four different: padding: top right bottom left
            else {
                base.inlineStyle(
                    Padding.sides(top, right, bottom, left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            }
        }
        // Fall back to individual properties
        else {
            base
                .inlineStyle(top.map { PaddingTop.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(right.map { PaddingRight.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(bottom.map { PaddingBottom.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(left.map { PaddingLeft.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
        }
    }

    /// Applies padding using vertical and horizontal values (uses CSS shorthand).
    ///
    /// When both values are provided, this uses the CSS shorthand `padding: vertical horizontal`.
    /// When only one is provided, applies individual side properties.
    ///
    /// ```swift
    /// div.css
    ///     .padding(vertical: .rem(1), horizontal: .rem(2))  // padding: 1rem 2rem
    ///     .margin(.px(16))
    /// ```
    @discardableResult
    @inlinable
    @CSS.Builder
    public func padding(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        // Use shorthand when both values are provided
        if let vertical, let horizontal {
            base.inlineStyle(
                Padding.verticalHorizontal(vertical, horizontal),
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else if let vertical {
            // Only vertical: apply top and bottom
            base
                .inlineStyle(PaddingTop.lengthPercentage(vertical), media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(PaddingBottom.lengthPercentage(vertical), media: media, selector: selector, pseudo: pseudo)
        } else if let horizontal {
            // Only horizontal: apply right and left (TRBL order)
            base
                .inlineStyle(PaddingRight.lengthPercentage(horizontal), media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(PaddingLeft.lengthPercentage(horizontal), media: media, selector: selector, pseudo: pseudo)
        } else {
            base
        }
    }

    /// Applies padding with top, horizontal (right & left), and bottom values.
    ///
    /// ```swift
    /// div.css
    ///     .padding(top: .px(8), horizontal: .px(16), bottom: .px(8))
    /// ```
    @discardableResult
    @inlinable
    @CSS.Builder
    public func padding(
        top: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> CSS<some HTML.View> {
        // Use shorthand when all three are provided
        if let top, let horizontal, let bottom {
            base.inlineStyle(
                Padding.topHorizontalBottom(top, horizontal, bottom),
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            // Fall back to individual properties
            base
                .inlineStyle(top.map { PaddingTop.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(horizontal.map { PaddingRight.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(bottom.map { PaddingBottom.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
                .inlineStyle(horizontal.map { PaddingLeft.lengthPercentage($0) }, media: media, selector: selector, pseudo: pseudo)
        }
    }
}

