//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum Overflow: Sendable {
    case single(Value)
    case separate(x: Value, y: Value)
    case global(Global)

    public enum Value: String, Sendable {
        case visible
        case hidden
        case clip
        case scroll
        case auto
    }

    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }
}
// Convenience static properties
extension CSS.Overflow {
    public static let visible = Self.single(.visible)
    public static let hidden = Self.single(.hidden)
    public static let clip = Self.single(.clip)
    public static let scroll = Self.single(.scroll)
    public static let auto = Self.single(.auto)
    
    public static func xy(x: Value, y: Value) -> Self {
        .separate(x: x, y: y)
    }
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension CSS.Overflow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .single(let value):
            return value.rawValue
        case .separate(x: let x, y: let y):
            return "\(x.rawValue) \(y.rawValue)"
        case .global(let global):
            return global.rawValue
        }
    }
}

