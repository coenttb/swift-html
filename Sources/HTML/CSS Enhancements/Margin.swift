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
    /// When all four values are provided, uses CSS shorthand optimization.
    ///
    /// ```swift
    /// div.css
    ///     .margin(top: .rem(1), bottom: .rem(2))
    ///     .padding(.px(16))
    /// ```
    @discardableResult
    @inlinable
    @CSS.Builder
    public func margin(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil
    ) -> CSS<some HTML.View> {
        // Optimize to shorthand when all four values are provided
        if let top, let right, let bottom, let left {
            // All four equal: margin: value
            if top == right && right == bottom && bottom == left {
                base.inlineStyle(
                    Margin.all(top)
                )
            }
            // Vertical equal, horizontal equal: margin: vertical horizontal
            else if top == bottom && right == left {
                base.inlineStyle(
                    Margin.verticalHorizontal(top, right)
                )
            }
            // All four different: margin: top right bottom left
            else {
                base.inlineStyle(
                    Margin.sides(.lengthPercentage(top), .lengthPercentage(right), .lengthPercentage(bottom), .lengthPercentage(left))
                )
            }
        }
        // Only horizontal provided and equal: margin: 0 horizontal
        else if top == nil && bottom == nil, let right, let left, right == left {
            base.inlineStyle(
                Margin.verticalHorizontal(.px(0), right)
            )
        }
        // Fall back to individual properties
        else {
            base
                .inlineStyle(top.map { MarginTop.lengthPercentage($0) })
                .inlineStyle(right.map { MarginRight.lengthPercentage($0) })
                .inlineStyle(bottom.map { MarginBottom.lengthPercentage($0) })
                .inlineStyle(left.map { MarginLeft.lengthPercentage($0) })
        }
    }

    /// Applies margin using vertical and horizontal values (uses CSS shorthand).
    ///
    /// When both values are provided, this uses the CSS shorthand `margin: vertical horizontal`.
    /// When only one is provided, applies individual side properties.
    ///
    /// ```swift
    /// div.css
    ///     .margin(vertical: .rem(1), horizontal: .rem(2))  // margin: 1rem 2rem
    ///     .padding(.px(16))
    /// ```
    @discardableResult
    @inlinable
    @CSS.Builder
    public func margin(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil
    ) -> CSS<some HTML.View> {
        // Use shorthand when both values are provided
        if let vertical, let horizontal {
            base.inlineStyle(
                Margin.verticalHorizontal(vertical, horizontal)
            )
        } else if let vertical {
            // Only vertical: apply top and bottom
            base
                .inlineStyle(MarginTop.lengthPercentage(vertical))
                .inlineStyle(MarginBottom.lengthPercentage(vertical))
        } else if let horizontal {
            // Only horizontal: apply right and left (TRBL order)
            base
                .inlineStyle(MarginRight.lengthPercentage(horizontal))
                .inlineStyle(MarginLeft.lengthPercentage(horizontal))
        } else {
            base
        }
    }

    /// Applies margin with top, horizontal (right & left), and bottom values.
    ///
    /// ```swift
    /// div.css
    ///     .margin(top: .px(8), horizontal: .px(16), bottom: .px(8))
    /// ```
    @discardableResult
    @inlinable
    @CSS.Builder
    public func margin(
        top: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil
    ) -> CSS<some HTML.View> {
        // Use shorthand when all three are provided
        if let top, let horizontal, let bottom {
            base.inlineStyle(
                Margin.topHorizontalBottom(.lengthPercentage(top), horizontal, .lengthPercentage(bottom))
            )
        } else {
            // Fall back to individual properties
            base
                .inlineStyle(top.map { MarginTop.lengthPercentage($0) })
                .inlineStyle(horizontal.map { MarginRight.lengthPercentage($0) })
                .inlineStyle(bottom.map { MarginBottom.lengthPercentage($0) })
                .inlineStyle(horizontal.map { MarginLeft.lengthPercentage($0) })
        }
    }
}

