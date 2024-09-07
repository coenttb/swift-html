//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum Position: Sendable {
    case keyword(Keyword)
    case global(Global)

    public enum Keyword: String, Sendable {
        case `static`
        case relative
        case absolute
        case fixed
        case sticky
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
extension CSS.Position {
    public static let `static` = Self.keyword(.static)
    public static let relative = Self.keyword(.relative)
    public static let absolute = Self.keyword(.absolute)
    public static let fixed = Self.keyword(.fixed)
    public static let sticky = Self.keyword(.sticky)
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension CSS.Position: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}

