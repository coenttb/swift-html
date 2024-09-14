//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import CSS
import Foundation

public struct HTMLBorder {
    private var cssBorder: CSS.Border
    private var htmlColor: HTMLColor?

    private init(cssBorder: CSS.Border, htmlColor: HTMLColor? = nil) {
        self.cssBorder = cssBorder
        self.htmlColor = htmlColor
    }

    public static func all(width: CSS.Border.Width, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        HTMLBorder(cssBorder: .all(width: width, style: style, color: nil), htmlColor: color)
    }

    public static func top(width: CSS.Border.Width, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        HTMLBorder(cssBorder: .top(width: width, style: style, color: nil), htmlColor: color)
    }

    public static func right(width: CSS.Border.Width, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        HTMLBorder(cssBorder: .right(width: width, style: style, color: nil), htmlColor: color)
    }

    public static func bottom(width: CSS.Border.Width, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        HTMLBorder(cssBorder: .bottom(width: width, style: style, color: nil), htmlColor: color)
    }

    public static func left(width: CSS.Border.Width, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        HTMLBorder(cssBorder: .left(width: width, style: style, color: nil), htmlColor: color)
    }

    public static func width(_ width: CSS.Border.Width) -> HTMLBorder {
        HTMLBorder(cssBorder: .width(width))
    }

    public static func style(_ style: CSS.Border.Style) -> HTMLBorder {
        HTMLBorder(cssBorder: .style(style))
    }

//    public static func color(_ color: HTMLColor) -> HTMLBorder {
//        HTMLBorder(cssBorder: .color(.keyword(.currentColor)), htmlColor: color)
//    }

    public static func radius(_ radius: CSS.Border.Radius) -> HTMLBorder {
        HTMLBorder(cssBorder: .radius(radius))
    }

    public static func global(_ global: CSS.Border.Global) -> HTMLBorder {
        HTMLBorder(cssBorder: .global(global))
    }

    public static let none: HTMLBorder = HTMLBorder(cssBorder: .none)
}

extension HTMLBorder {
    public static func all(width: Length, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        .all(width: .length(width), style: style, color: color)
    }

    public static func top(width: Length, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        .top(width: .length(width), style: style, color: color)
    }

    public static func right(width: Length, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        .right(width: .length(width), style: style, color: color)
    }

    public static func bottom(width: Length, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        .bottom(width: .length(width), style: style, color: color)
    }

    public static func left(width: Length, style: CSS.Border.Style, color: HTMLColor?) -> HTMLBorder {
        .left(width: .length(width), style: style, color: color)
    }
}

extension HTMLBorder: CustomStringConvertible {
    public var description: String {
        switch cssBorder {
        case .all(let width, let style, _),
             .top(let width, let style, _),
             .right(let width, let style, _),
             .bottom(let width, let style, _),
             .left(let width, let style, _):
            let colorDesc = htmlColor?.description ?? ""
            return "\(width) \(style.rawValue) \(colorDesc)"
        default:
            return cssBorder.description
        }
    }
}


import Foundation

extension HTML {
    @discardableResult
    public func border(_ border: HTMLBorder, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border", border.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderTop(_ border: HTMLBorder, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-top", border.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderRight(_ border: HTMLBorder, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-right", border.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderBottom(_ border: HTMLBorder, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-bottom", border.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderLeft(_ border: HTMLBorder, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-left", border.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderColor(_ color: HTMLColor, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-color", color.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderWidth(_ width: CSS.Border.Width, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-width", width.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderStyle(_ style: CSS.Border.Style, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-style", style.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderRadius(_ radius: CSS.Border.Radius, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-radius", radius.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// Convenience methods for common use cases
extension HTML {
    @discardableResult
    public func border(width: Length, style: CSS.Border.Style, color: HTMLColor, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let border = HTMLBorder.all(width: width, style: style, color: color)
        return self.border(border, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderTop(width: Length, style: CSS.Border.Style, color: HTMLColor, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let border = HTMLBorder.top(width: width, style: style, color: color)
        return self.borderTop(border, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderRight(width: Length, style: CSS.Border.Style, color: HTMLColor, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let border = HTMLBorder.right(width: width, style: style, color: color)
        return self.borderRight(border, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderBottom(width: Length, style: CSS.Border.Style, color: HTMLColor, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let border = HTMLBorder.bottom(width: width, style: style, color: color)
        return self.borderBottom(border, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderLeft(width: Length, style: CSS.Border.Style, color: HTMLColor, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let border = HTMLBorder.left(width: width, style: style, color: color)
        return self.borderLeft(border, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}
