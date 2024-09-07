//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum Visibility: Sendable {
    case keyword(Keyword)
    case global(Global)

    public enum Keyword: String, Sendable {
        case visible
        case hidden
        case collapse
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
extension CSS.Visibility {
    public static let visible = Self.keyword(.visible)
    public static let hidden = Self.keyword(.hidden)
    public static let collapse = Self.keyword(.collapse)
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension CSS.Visibility: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}
