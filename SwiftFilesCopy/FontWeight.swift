//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum FontWeight: Sendable, ExpressibleByIntegerLiteral {
    case keyword(Keyword)
    case numeric(Int)
    case global(Global)

    public enum Keyword: String, Sendable {
        case normal
        case bold
        case lighter
        case bolder
    }

    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }

    public init(integerLiteral value: Int) {
        self = .numeric(min(max(1, value), 1000))
    }
}

// Convenience static properties
extension CSS.FontWeight {
    public static let normal = Self.keyword(.normal)
    public static let bold = Self.keyword(.bold)
    public static let lighter = Self.keyword(.lighter)
    public static let bolder = Self.keyword(.bolder)
    
    public static let thin = Self.numeric(100)
    public static let extraLight = Self.numeric(200)
    public static let light = Self.numeric(300)
    public static let regular = Self.numeric(400)
    public static let medium = Self.numeric(500)
    public static let semiBold = Self.numeric(600)
    public static let extraBold = Self.numeric(800)
    public static let black = Self.numeric(900)
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension CSS.FontWeight: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .numeric(let value):
            return String(value)
        case .global(let global):
            return global.rawValue
        }
    }
}

