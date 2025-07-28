//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

public struct Border: Equatable, Sendable {
    public var sides: Set<Side>?
    public var width: BorderWidth?
    public var style: CSSTypeTypes.LineStyle?
    public var color: HTMLColor?

    public enum Side: String, Sendable, CaseIterable {
        case top, left, right, bottom

        public static let all: [Self] = allCases
    }

    public init(
        sides: Set<Side>? = nil,
        width: BorderWidth? = nil,
        style: CSSTypeTypes.LineStyle? = .solid,
        color: HTMLColor? = nil,
    ) {
        self.width = width
        self.style = style
        self.color = color
        self.sides = sides
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func border(
        _ border: Border?,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch border {
        case .none:
            self

        case .some(let border):
            // Extract common border properties
            let borderStyle = "\(border.width?.description ?? "") \(border.style?.description ?? "")"
            let lightColor = border.color?.light.description ?? ""
            let darkColor = border.color?.dark.description ?? ""

            if border.sides == nil || border.sides?.count == Border.Side.allCases.count {
                self
                    .inlineStyle(CSSPropertyTypes.Border.property, "\(borderStyle) \(lightColor)", media: mediaQuery, selector: selector, pseudo: pseudo)
                    .inlineStyle(CSSPropertyTypes.Border.property, "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, selector: selector, pseudo: pseudo)
            } else {
                borderSides(
                    border: border,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    selector: selector,
                    pseudo: pseudo
                )
            }
        }
    }

    @discardableResult
    @HTMLBuilder
    public func border(
        _ sides: [Border.Side] = Border.Side.allCases,
        width: BorderWidth? = nil,
        style: CSSTypeTypes.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }

    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    public func border(
        _ sides: Border.Side...,
        width: BorderWidth? = nil,
        style: CSSTypeTypes.LineStyle? = .solid,
        color: HTMLColor? = nil,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    private func borderSides(
        border: Border,
        borderStyle: String,
        lightColor: String,
        darkColor: String,
        media mediaQuery: CSSAtRuleTypes.Media? = nil,
        selector: PointFreeHTML.Selector?,
        pseudo: Pseudo?
    ) -> some HTML {
        self
            .if(border.sides?.contains(.top) == true) { element in
                element
                    .inlineStyle(BorderTop.property, "\(borderStyle) \(lightColor)", media: mediaQuery, selector: selector, pseudo: pseudo)
                    .inlineStyle(BorderTop.property, "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, selector: selector, pseudo: pseudo)
            }
            .if(border.sides?.contains(.left) == true) { element in
                element
                    .inlineStyle(BorderLeft.property, "\(borderStyle) \(lightColor)", media: mediaQuery, selector: selector, pseudo: pseudo)
                    .inlineStyle(BorderLeft.property, "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, selector: selector, pseudo: pseudo)
            }
            .if(border.sides?.contains(.bottom) == true) { element in
                element
                    .inlineStyle(BorderBottom.property, "\(borderStyle) \(lightColor)", media: mediaQuery, selector: selector, pseudo: pseudo)
                    .inlineStyle(BorderBottom.property, "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, selector: selector, pseudo: pseudo)
            }
            .if(border.sides?.contains(.right) == true) { element in
                element
                    .inlineStyle(BorderRight.property, "\(borderStyle) \(lightColor)", media: mediaQuery, selector: selector, pseudo: pseudo)
                    .inlineStyle(BorderRight.property, "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, selector: selector, pseudo: pseudo)
            }
    }
}
