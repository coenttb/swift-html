//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import CSS
import Foundation

public enum Border: Sendable {
    case all(width: Width, style: Style, color: HTMLColor?)
    case top(width: Width, style: Style, color: HTMLColor?)
    case right(width: Width, style: Style, color: HTMLColor?)
    case bottom(width: Width, style: Style, color: HTMLColor?)
    case left(width: Width, style: Style, color: HTMLColor?)
    case width(Width)
    case style(Style)
    case color(HTMLColor)
    case radius(Radius)
    case global(Global)
    case none
    
    public enum Width: Sendable {
        case length(Length)
        case keyword(Keyword)
        
        public enum Keyword: String, Sendable {
            case thin, medium, thick
        }
    }
    
    public enum Style: String, Sendable {
        case none, hidden, dotted, dashed, solid, double, groove, ridge, inset, outset
    }
    
    public enum Radius: Sendable {
        case all(Length)
        case topLeft(Length)
        case topRight(Length)
        case bottomRight(Length)
        case bottomLeft(Length)
        case custom(topLeft: Length, topRight: Length, bottomRight: Length, bottomLeft: Length)
    }
    
    public enum Global: String, Sendable {
        case inherit, initial, revert, revertLayer = "revert-layer", unset
    }
}

extension Border {
    public static func radius(_ length: Length) -> Border {
        .radius(.all(length))
    }
}

extension Border.Width {
    public static func radius(_ length: Length) -> Border {
        .radius(.all(length))
    }
}

extension Border: CustomStringConvertible {
    public var description: String {
        switch self {
        case .all(let width, let style, let color):
            return "\(width) \(style.rawValue) \(color?.description ?? "")"
        case .top(let width, let style, let color):
            return "border-top: \(width) \(style.rawValue) \(color?.description ?? "")"
        case .right(let width, let style, let color):
            return "border-right: \(width) \(style.rawValue) \(color?.description ?? "")"
        case .bottom(let width, let style, let color):
            return "border-bottom: \(width) \(style.rawValue) \(color?.description ?? "")"
        case .left(let width, let style, let color):
            return "border-left: \(width) \(style.rawValue) \(color?.description ?? "")"
        case .width(let width):
            return "border-width: \(width)"
        case .style(let style):
            return "border-style: \(style.rawValue)"
        case .color(let color):
            return "border-color: \(color.description)"
        case .radius(let radius):
            return "border-radius: \(radius)"
        case .global(let global):
            return global.rawValue
        case .none:
            return "none"
        }
    }
}

extension Border.Width: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .keyword(let keyword):
            return keyword.rawValue
        }
    }
}

extension Border.Radius: CustomStringConvertible {
    public var description: String {
        switch self {
        case .all(let length):
            return length.description
        case .topLeft(let length):
            return "\(length) 0 0 0"
        case .topRight(let length):
            return "0 \(length) 0 0"
        case .bottomRight(let length):
            return "0 0 \(length) 0"
        case .bottomLeft(let length):
            return "0 0 0 \(length)"
        case .custom(let topLeft, let topRight, let bottomRight, let bottomLeft):
            return "\(topLeft) \(topRight) \(bottomRight) \(bottomLeft)"
        }
    }
}

extension Border {
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}


extension Border {
    public static func all(width: Length, style: Style, color: HTMLColor?)-> Self {
        .all(width: .length(width), style: style, color: color)
    }
    
    public static func top(width: Length, style: Style, color: HTMLColor?)-> Self {
        .top(width: .length(width), style: style, color: color)
    }
    
    public static func right(width: Length, style: Style, color: HTMLColor?)-> Self {
        .right(width: .length(width), style: style, color: color)
    }
    
    public static func bottom(width: Length, style: Style, color: HTMLColor?)-> Self {
        .bottom(width: .length(width), style: style, color: color)
    }
}
