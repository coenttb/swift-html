//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML
import OrderedCollections

extension HTML {
    @HTMLBuilder
    public func margin(
        vertical: LengthPercentage?,
        horizontal: LengthPercentage?,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    )-> some HTML {
        switch (vertical, horizontal) {
        case let (.some(vertical), .some(horizontal)):
            self.margin(.verticalHorizontal(vertical, horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
        case let (.none, .some(horizontal)):
            self
                .marginRight(.lengthPercentage(horizontal))
                .marginLeft(.lengthPercentage(horizontal))
        case let (.some(vertical), .none):
            self
                .marginTop(.lengthPercentage(vertical))
                .marginBottom(.lengthPercentage(vertical))
        case (.none, .none):
            self
        }
    }
}

extension Margin {
    public typealias Variant = Side
}

extension HTML {
    @HTMLBuilder
    public func margin(
        _ margin: Margin.Variant...,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    )-> some HTML {
        self.margin(.init(margin), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @HTMLBuilder
    public func margin(
        _ margin: OrderedSet<Margin.Variant>,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    )-> some HTML {
        if margin.count == 4 {
            // Extract values for each side from the ordered set
            let topValue = margin.first(where: { if case .top = $0 { return true } else { return false } })
            let rightValue = margin.first(where: { if case .right = $0 { return true } else { return false } })
            let bottomValue = margin.first(where: { if case .bottom = $0 { return true } else { return false } })
            let leftValue = margin.first(where: { if case .left = $0 { return true } else { return false } })
            
            // Convert to LengthPercentage if found
            let top = topValue.flatMap {
                if case .top(let lp) = $0 {
                    return MarginTop.lengthPercentage(lp)
                } else {
                    return nil
                }
            }
            
            let right = rightValue.flatMap {
                if case .right(let lp) = $0 {
                    return MarginRight.lengthPercentage(lp)
                } else {
                    return nil
                }
            }
            
            let bottom = bottomValue.flatMap {
                if case .bottom(let lp) = $0 {
                    return MarginBottom.lengthPercentage(lp)
                } else {
                    return nil
                }
            }
            
            let left = leftValue.flatMap {
                if case .left(let lp) = $0 {
                    return MarginLeft.lengthPercentage(lp)
                } else {
                    return nil
                }
            }
            
            self.margin(
                CSSPropertyTypes.Margin.sides(
                    top: top,
                    right: right,
                    bottom: bottom,
                    left: left
                ),
                media: mediaQuery,
                pre: pre,
                pseudo: pseudo
            )
        } else {
            marginSides(
                margin: margin,
                media: mediaQuery,
                pre: pre,
                pseudo: pseudo
            )
        }
    }
    
    private func marginSides(
        margin: OrderedSet<Margin.Variant>,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        pre: String?,
        pseudo: Pseudo?
    ) -> some HTML {
        self
            .if(margin.contains(where: { if case .top = $0 { return true } else { return false } })) { element in
                HTMLGroup {
                    let lengthPercentage = margin.first(where: { if case .top = $0 { return true } else { return false } })!
                    if case .top(let value) = lengthPercentage {
                        element.inlineStyle("margin-top", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    } else {
                        element
                    }
                }
            }
            .if(margin.contains(where: { if case .bottom = $0 { return true } else { return false } })) { element in
                HTMLGroup {
                    let lengthPercentage = margin.first(where: { if case .bottom = $0 { return true } else { return false } })!
                    if case .bottom(let value) = lengthPercentage {
                        element.inlineStyle("margin-bottom", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    } else {
                        element
                    }
                }
            }
            .if(margin.contains(where: { if case .left = $0 { return true } else { return false } })) { element in
                HTMLGroup {
                    let lengthPercentage = margin.first(where: { if case .left = $0 { return true } else { return false } })!
                    if case .left(let value) = lengthPercentage {
                        element.inlineStyle("margin-left", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    } else {
                        element
                    }
                }
            }
            .if(margin.contains(where: { if case .right = $0 { return true } else { return false } })) { element in
                HTMLGroup {
                    let lengthPercentage = margin.first(where: { if case .right = $0 { return true } else { return false } })!
                    if case .right(let value) = lengthPercentage {
                        element.inlineStyle("margin-right", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    } else {
                        element
                    }
                }
            }
    }
}


extension HTML {
    @discardableResult
    @HTMLBuilder
    public func margin(
        top: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil,
        media: CSSAtRuleTypes.Media? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch (top, right, bottom, left) {
            // All four values provided
        case let (.some(top), .some(right), .some(bottom), .some(left)):
            // Check for optimization opportunities
            if top == right && right == bottom && bottom == left {
                // All equal: margin: x
                self.margin(
                    .all(top),
                    media: media,
                    pre: pre,
                    pseudo: pseudo
                )
            } else if top == bottom && left == right {
                // Vertical and horizontal: margin: top/bottom left/right
                self.margin(
                    .verticalHorizontal(top, left),
                    media: media,
                    pre: pre,
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
                    pre: pre,
                    pseudo: pseudo
                )
            }
            
            // Three values provided
        case let (.some(top), .some(right), .some(bottom), .none):
            self
                .marginTop(.lengthPercentage(top))
                .marginRight(.lengthPercentage(right))
                .marginBottom(.lengthPercentage(bottom))
        case let (.some(top), .some(right), .none, .some(left)):
            self
                .marginTop(.lengthPercentage(top))
                .marginRight(.lengthPercentage(right))
                .marginLeft(.lengthPercentage(left))
        case let (.some(top), .none, .some(bottom), .some(left)):
            self
                .marginTop(.lengthPercentage(top))
                .marginBottom(.lengthPercentage(bottom))
                .marginLeft(.lengthPercentage(left))
        case let (.none, .some(right), .some(bottom), .some(left)):
            self
                .marginRight(.lengthPercentage(right))
                .marginBottom(.lengthPercentage(bottom))
                .marginLeft(.lengthPercentage(left))
            
            // Two values provided
        case let (.some(top), .some(right), .none, .none):
            self
                .marginTop(.lengthPercentage(top))
                .marginRight(.lengthPercentage(right))
        case let (.some(top), .none, .some(bottom), .none):
            self
                .marginTop(.lengthPercentage(top))
                .marginBottom(.lengthPercentage(bottom))
        case let (.some(top), .none, .none, .some(left)):
            self
                .marginTop(.lengthPercentage(top))
                .marginLeft(.lengthPercentage(left))
        case let (.none, .some(right), .some(bottom), .none):
            self
                .marginRight(.lengthPercentage(right))
                .marginBottom(.lengthPercentage(bottom))
        case let (.none, .some(right), .none, .some(left)):
            // Check if both are equal for optimization
            if right == left {
                self.margin(
                    .verticalHorizontal(.zero, right),
                    media: media,
                    pre: pre,
                    pseudo: pseudo
                )
            } else {
                self
                    .marginRight(.lengthPercentage(right))
                    .marginLeft(.lengthPercentage(left))
            }
        case let (.none, .none, .some(bottom), .some(left)):
            self
                .marginBottom(.lengthPercentage(bottom))
                .marginLeft(.lengthPercentage(left))
            
            // Single value provided
        case let (.some(top), .none, .none, .none):
            self.marginTop(.lengthPercentage(top))
        case let (.none, .some(right), .none, .none):
            self.marginRight(.lengthPercentage(right))
        case let (.none, .none, .some(bottom), .none):
            self.marginBottom(.lengthPercentage(bottom))
        case let (.none, .none, .none, .some(left)):
            self.marginLeft(.lengthPercentage(left))
            
            // No values provided - do nothing, return self unchanged
        case (.none, .none, .none, .none):
            self
        }
    }
}
