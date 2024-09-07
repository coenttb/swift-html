//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/09/2024.
//

import Foundation
import HTMLCore

public enum TableLayout: String, CaseIterable {
    case auto, fixed
}

public enum BorderCollapse: String, CaseIterable {
    case separate, collapse
}

public enum CaptionSide: String, CaseIterable {
    case top, bottom
    case blockStart = "block-start"
    case blockEnd = "block-end"
    case inlineStart = "inline-start"
    case inlineEnd = "inline-end"
}

public enum EmptyCells: String, CaseIterable {
    case show, hide
}

public struct BorderSpacing {
    let horizontal: Length
    let vertical: Length?
    
    public init(_ horizontal: Length, _ vertical: Length? = nil) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
}

public enum TableProperties {
    case tableLayout(TableLayout)
    case borderCollapse(BorderCollapse)
    case borderSpacing(BorderSpacing)
    case captionSide(CaptionSide)
    case emptyCells(EmptyCells)
}

extension TableProperties: CustomStringConvertible {
    public var description: String {
        switch self {
        case .tableLayout(let value):
            return "table-layout: \(value.rawValue)"
        case .borderCollapse(let value):
            return "border-collapse: \(value.rawValue)"
        case .borderSpacing(let value):
            if let vertical = value.vertical {
                return "border-spacing: \(value.horizontal) \(vertical)"
            } else {
                return "border-spacing: \(value.horizontal)"
            }
        case .captionSide(let value):
            return "caption-side: \(value.rawValue)"
        case .emptyCells(let value):
            return "empty-cells: \(value.rawValue)"
        }
    }
}

// HTML methods
extension HTML {
    @discardableResult
    public func tableLayout(_ value: TableLayout, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("table-layout", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderCollapse(_ value: BorderCollapse, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-collapse", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderSpacing(_ value: BorderSpacing, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let spacingValue = value.vertical != nil ? "\(value.horizontal) \(value.vertical!)" : value.horizontal.description
        return inlineStyle("border-spacing", spacingValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func captionSide(_ value: CaptionSide, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("caption-side", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func emptyCells(_ value: EmptyCells, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("empty-cells", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// Convenience static properties
extension TableLayout {
    public static let `default` = auto
}

extension BorderCollapse {
    public static let `default` = separate
}

extension CaptionSide {
    public static let `default` = top
}

extension EmptyCells {
    public static let `default` = show
}

// Convenience static functions
extension TableLayout {
    public static func custom(_ value: String) -> TableLayout? {
        return TableLayout(rawValue: value)
    }
}

extension BorderCollapse {
    public static func custom(_ value: String) -> BorderCollapse? {
        return BorderCollapse(rawValue: value)
    }
}

extension CaptionSide {
    public static func custom(_ value: String) -> CaptionSide? {
        return CaptionSide(rawValue: value)
    }
}

extension EmptyCells {
    public static func custom(_ value: String) -> EmptyCells? {
        return EmptyCells(rawValue: value)
    }
}
