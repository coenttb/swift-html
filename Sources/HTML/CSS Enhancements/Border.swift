//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import Foundation
import HTML_CSS_PointFreeHTML

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
        pre: String? = nil,
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
                    .inlineStyle("border", "\(borderStyle) \(lightColor)", media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("border", "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, pre: pre, pseudo: pseudo)
            } else {
                borderSides(
                    border: border,
                    borderStyle: borderStyle,
                    lightColor: lightColor,
                    darkColor: darkColor,
                    pre: pre,
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
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            pre: pre,
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
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.border(
            Border(sides: .init(sides), width: width, style: style, color: color),
            media: mediaQuery,
            pre: pre,
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
        pre: String?,
        pseudo: Pseudo?
    ) -> some HTML {

        self
            .if(border.sides?.contains(.top) == true) { element in
                element
                    .inlineStyle("border-top", "\(borderStyle) \(lightColor)", media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("border-top", "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, pre: pre, pseudo: pseudo)
            }
            .if(border.sides?.contains(.left) == true) { element in
                element
                    .inlineStyle("border-left", "\(borderStyle) \(lightColor)", media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("border-left", "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, pre: pre, pseudo: pseudo)
            }
            .if(border.sides?.contains(.bottom) == true) { element in
                element
                    .inlineStyle("border-bottom", "\(borderStyle) \(lightColor)", media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("border-bottom", "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, pre: pre, pseudo: pseudo)
            }
            .if(border.sides?.contains(.right) == true) { element in
                element
                    .inlineStyle("border-right", "\(borderStyle) \(lightColor)", media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("border-right", "\(borderStyle) \(darkColor)", media: .prefersColorScheme(.dark) && mediaQuery, pre: pre, pseudo: pseudo)
            }

    }
}
