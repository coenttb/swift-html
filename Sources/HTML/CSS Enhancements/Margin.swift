//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import CSS_Rendering
import CSS_Standard
import OrderedCollections

extension HTML.View {
    @HTML.Builder
    public func margin(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        switch (vertical, horizontal) {
        case (.some(let vertical), .some(let horizontal)):
            self.margin(
                .verticalHorizontal(vertical, horizontal),
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
        case (.none, .some(let horizontal)):
            self
                .marginRight(
                    .lengthPercentage(horizontal),
                    media: mediaQuery,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginLeft(
                    .lengthPercentage(horizontal),
                    media: mediaQuery,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.some(let vertical), .none):
            self
                .marginTop(
                    .lengthPercentage(vertical),
                    media: mediaQuery,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginBottom(
                    .lengthPercentage(vertical),
                    media: mediaQuery,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.none, .none):
            self
        }
    }
}

extension Margin {
    public typealias Variant = Side
}

extension HTML.View {
    //    @HTML.Builder
    //    public func margin(
    //        _ margin: Margin.Variant...,
    //        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
    //        selector: HTML.Selector? = nil,
    //        pseudo: HTML.Pseudo? = nil
    //    )-> some HTML.View {
    //        self.margin(.init(margin), media: mediaQuery, selector: selector, pseudo: pseudo)
    //    }

    //    @HTML.Builder
    //    public func margin(
    //        _ margin: OrderedSet<Margin.Variant>,
    //        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
    //        selector: HTML.Selector? = nil,
    //        pseudo: HTML.Pseudo? = nil
    //    )-> some HTML.View {
    //        if margin.count == 4 {
    //            // Extract values for each side from the ordered set
    //            let topValue = margin.first(where: { if case .top = $0 { return true } else { return false } })
    //            let rightValue = margin.first(where: { if case .right = $0 { return true } else { return false } })
    //            let bottomValue = margin.first(where: { if case .bottom = $0 { return true } else { return false } })
    //            let leftValue = margin.first(where: { if case .left = $0 { return true } else { return false } })
    //
    //            // Convert to LengthPercentage if found
    //            let top = topValue.flatMap {
    //                if case .top(let lp) = $0 {
    //                    return MarginTop.lengthPercentage(lp)
    //                } else {
    //                    return nil
    //                }
    //            }
    //
    //            let right = rightValue.flatMap {
    //                if case .right(let lp) = $0 {
    //                    return MarginRight.lengthPercentage(lp)
    //                } else {
    //                    return nil
    //                }
    //            }
    //
    //            let bottom = bottomValue.flatMap {
    //                if case .bottom(let lp) = $0 {
    //                    return MarginBottom.lengthPercentage(lp)
    //                } else {
    //                    return nil
    //                }
    //            }
    //
    //            let left = leftValue.flatMap {
    //                if case .left(let lp) = $0 {
    //                    return MarginLeft.lengthPercentage(lp)
    //                } else {
    //                    return nil
    //                }
    //            }
    //
    //            self.margin(
    //                CSS_Standard.Margin.sides(
    //                    top: top,
    //                    right: right,
    //                    bottom: bottom,
    //                    left: left
    //                ),
    //                media: mediaQuery,
    //                selector: selector,
    //                pseudo: pseudo
    //            )
    //        } else {
    //            marginSides(
    //                margin: margin,
    //                media: mediaQuery,
    //                selector: selector,
    //                pseudo: pseudo
    //            )
    //        }
    //    }

    //    private func marginSides(
    //        margin: OrderedSet<Margin.Variant>,
    //        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
    //        pre: String?,
    //        pseudo: HTML.Pseudo?
    //    ) -> some HTML.View {
    //        return self
    //            .if(margin.contains(where: { if case .top = $0 { return true } else { return false } })) { element in
    //                let lengthPercentage = margin.first(where: { if case .top = $0 { return true } else { return false } })!
    //                if case .top(let value) = lengthPercentage {
    //                    return element.inlineStyle("margin-top", value.description, media: mediaQuery, selector: selector, pseudo: pseudo)
    //                } else {
    //                    return element
    //                }
    //            }
    //            .if(margin.contains(where: { if case .bottom = $0 { return true } else { return false } })) { element in
    //                let lengthPercentage = margin.first(where: { if case .bottom = $0 { return true } else { return false } })!
    //                if case .bottom(let value) = lengthPercentage {
    //                    return element.inlineStyle("margin-bottom", value.description, media: mediaQuery, selector: selector, pseudo: pseudo)
    //                } else {
    //                    return element
    //                }
    //            }
    //            .if(margin.contains(where: { if case .left = $0 { return true } else { return false } })) { element in
    //                let lengthPercentage = margin.first(where: { if case .left = $0 { return true } else { return false } })!
    //                if case .left(let value) = lengthPercentage {
    //                    return element.inlineStyle("margin-left", value.description, media: mediaQuery, selector: selector, pseudo: pseudo)
    //                } else {
    //                    return element
    //                }
    //            }
    //            .if(margin.contains(where: { if case .right = $0 { return true } else { return false } })) { element in
    //                let lengthPercentage = margin.first(where: { if case .right = $0 { return true } else { return false } })!
    //                if case .right(let value) = lengthPercentage {
    //                    return element.inlineStyle("margin-right", value.description, media: mediaQuery, selector: selector, pseudo: pseudo)
    //                } else {
    //                    return element
    //                }
    //            }
    //    }
}

extension HTML.View {
    @discardableResult
    @HTML.Builder
    public func margin(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        switch (top, right, bottom, left) {
        // All four values provided
        case (.some(let top), .some(let right), .some(let bottom), .some(let left)):
            // Check for optimization opportunities
            if top == right && right == bottom && bottom == left {
                // All equal: margin: x
                self.margin(
                    .all(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            } else if top == bottom && left == right {
                // Vertical and horizontal: margin: top/bottom left/right
                self.margin(
                    .verticalHorizontal(top, left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            } else {
                self.margin(
                    .sides(
                        top: .lengthPercentage(top),
                        right: .lengthPercentage(right),
                        bottom: .lengthPercentage(bottom),
                        left: .lengthPercentage(left)
                    ),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            }

        // Three values provided
        case (.some(let top), .some(let right), .some(let bottom), .none):
            self
                .marginTop(
                    .lengthPercentage(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginRight(
                    .lengthPercentage(right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginBottom(
                    .lengthPercentage(bottom),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.some(let top), .some(let right), .none, .some(let left)):
            self
                .marginTop(
                    .lengthPercentage(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginRight(
                    .lengthPercentage(right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginLeft(
                    .lengthPercentage(left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.some(let top), .none, .some(let bottom), .some(let left)):
            self
                .marginTop(
                    .lengthPercentage(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginBottom(
                    .lengthPercentage(bottom),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginLeft(
                    .lengthPercentage(left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.none, .some(let right), .some(let bottom), .some(let left)):
            self
                .marginRight(
                    .lengthPercentage(right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginBottom(
                    .lengthPercentage(bottom),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginLeft(
                    .lengthPercentage(left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )

        // Two values provided
        case (.some(let top), .some(let right), .none, .none):
            self
                .marginTop(
                    .lengthPercentage(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginRight(
                    .lengthPercentage(right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.some(let top), .none, .some(let bottom), .none):
            self
                .marginTop(
                    .lengthPercentage(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginBottom(
                    .lengthPercentage(bottom),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.some(let top), .none, .none, .some(let left)):
            self
                .marginTop(
                    .lengthPercentage(top),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginLeft(
                    .lengthPercentage(left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.none, .some(let right), .some(let bottom), .none):
            self
                .marginRight(
                    .lengthPercentage(right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginBottom(
                    .lengthPercentage(bottom),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
        case (.none, .some(let right), .none, .some(let left)):
            // Check if both are equal for optimization
            if right == left {
                self.margin(
                    .verticalHorizontal(.zero, right),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
            } else {
                self
                    .marginRight(
                        .lengthPercentage(right),
                        media: media,
                        selector: selector,
                        pseudo: pseudo
                    )
                    .marginLeft(
                        .lengthPercentage(left),
                        media: media,
                        selector: selector,
                        pseudo: pseudo
                    )
            }
        case (.none, .none, .some(let bottom), .some(let left)):
            self
                .marginBottom(
                    .lengthPercentage(bottom),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )
                .marginLeft(
                    .lengthPercentage(left),
                    media: media,
                    selector: selector,
                    pseudo: pseudo
                )

        // Single value provided
        case (.some(let top), .none, .none, .none):
            self.marginTop(
                .lengthPercentage(top),
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case (.none, .some(let right), .none, .none):
            self.marginRight(
                .lengthPercentage(right),
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case (.none, .none, .some(let bottom), .none):
            self.marginBottom(
                .lengthPercentage(bottom),
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case (.none, .none, .none, .some(let left)):
            self.marginLeft(
                .lengthPercentage(left),
                media: media,
                selector: selector,
                pseudo: pseudo
            )

        // No values provided - do nothing, return self unchanged
        case (.none, .none, .none, .none):
            self
        }
    }
}
