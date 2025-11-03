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
    color: HTMLColor? = nil
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
          .inlineStyle(
            CSSPropertyTypes.Border.property,
            "\(borderStyle) \(lightColor)",
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
          .inlineStyle(
            CSSPropertyTypes.Border.property,
            "\(borderStyle) \(darkColor)",
            media: .prefersColorScheme(.dark) && mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
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
    // Apply styles sequentially without nested conditionals to avoid deep generic nesting
    var result: any HTML = self

    if let sides = border.sides {
      if sides.contains(.top) {
        result = AnyHTML(result)
          .inlineStyle(
            BorderTop.property,
            "\(borderStyle) \(lightColor)",
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
          .inlineStyle(
            BorderTop.property,
            "\(borderStyle) \(darkColor)",
            media: .prefersColorScheme(.dark) && mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
      }

      if sides.contains(.left) {
        result = AnyHTML(result)
          .inlineStyle(
            BorderLeft.property,
            "\(borderStyle) \(lightColor)",
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
          .inlineStyle(
            BorderLeft.property,
            "\(borderStyle) \(darkColor)",
            media: .prefersColorScheme(.dark) && mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
      }

      if sides.contains(.bottom) {
        result = AnyHTML(result)
          .inlineStyle(
            BorderBottom.property,
            "\(borderStyle) \(lightColor)",
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
          .inlineStyle(
            BorderBottom.property,
            "\(borderStyle) \(darkColor)",
            media: .prefersColorScheme(.dark) && mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
      }

      if sides.contains(.right) {
        result = AnyHTML(result)
          .inlineStyle(
            BorderRight.property,
            "\(borderStyle) \(lightColor)",
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
          .inlineStyle(
            BorderRight.property,
            "\(borderStyle) \(darkColor)",
            media: .prefersColorScheme(.dark) && mediaQuery,
            selector: selector,
            pseudo: pseudo
          )
      }
    }

    return AnyHTML(result)
  }
}

// MARK: - Individual Border Side Functions

extension HTML {
  @discardableResult
  @HTMLBuilder
  public func borderTop(
    width: BorderWidth? = nil,
    style: CSSTypeTypes.LineStyle? = .solid,
    color: HTMLColor? = nil,
    media mediaQuery: CSSAtRuleTypes.Media? = nil,
    selector: PointFreeHTML.Selector? = nil,
    pseudo: Pseudo? = nil
  ) -> some HTML {
    self.border(
      [.top],
      width: width,
      style: style,
      color: color,
      media: mediaQuery,
      selector: selector,
      pseudo: pseudo
    )
  }

  @discardableResult
  @HTMLBuilder
  public func borderBottom(
    width: BorderWidth? = nil,
    style: CSSTypeTypes.LineStyle? = .solid,
    color: HTMLColor? = nil,
    media mediaQuery: CSSAtRuleTypes.Media? = nil,
    selector: PointFreeHTML.Selector? = nil,
    pseudo: Pseudo? = nil
  ) -> some HTML {
    self.border(
      [.bottom],
      width: width,
      style: style,
      color: color,
      media: mediaQuery,
      selector: selector,
      pseudo: pseudo
    )
  }

  @discardableResult
  @HTMLBuilder
  public func borderLeft(
    width: BorderWidth? = nil,
    style: CSSTypeTypes.LineStyle? = .solid,
    color: HTMLColor? = nil,
    media mediaQuery: CSSAtRuleTypes.Media? = nil,
    selector: PointFreeHTML.Selector? = nil,
    pseudo: Pseudo? = nil
  ) -> some HTML {
    self.border(
      [.left],
      width: width,
      style: style,
      color: color,
      media: mediaQuery,
      selector: selector,
      pseudo: pseudo
    )
  }

  @discardableResult
  @HTMLBuilder
  public func borderRight(
    width: BorderWidth? = nil,
    style: CSSTypeTypes.LineStyle? = .solid,
    color: HTMLColor? = nil,
    media mediaQuery: CSSAtRuleTypes.Media? = nil,
    selector: PointFreeHTML.Selector? = nil,
    pseudo: Pseudo? = nil
  ) -> some HTML {
    self.border(
      [.right],
      width: width,
      style: style,
      color: color,
      media: mediaQuery,
      selector: selector,
      pseudo: pseudo
    )
  }
}
