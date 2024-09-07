//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum BoxSizing: Sendable {
    case keyword(Keyword)
    case global(Global)

    public enum Keyword: String, Sendable {
        case contentBox = "content-box"
        case borderBox = "border-box"
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
extension CSS.BoxSizing {
    public static let contentBox = Self.keyword(.contentBox)
    public static let borderBox = Self.keyword(.borderBox)
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension CSS.BoxSizing: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}
