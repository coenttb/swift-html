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
            let top: LengthPercentage? = topValue.flatMap {
                if case .top(let lp) = $0 { 
                    return lp
                } else {
                    return nil 
                }
            }
            
            let right: LengthPercentage? = rightValue.flatMap {
                if case .right(let lp) = $0 { 
                    return lp
                } else {
                    return nil 
                }
            }
            
            let bottom: LengthPercentage? = bottomValue.flatMap {
                if case .bottom(let lp) = $0 { 
                    return lp
                } else {
                    return nil 
                }
            }
            
            let left: LengthPercentage? = leftValue.flatMap {
                if case .left(let lp) = $0 { 
                    return lp
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
