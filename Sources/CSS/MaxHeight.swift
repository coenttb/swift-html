//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/09/2024.
//

import Foundation

import Foundation

public enum MaxHeight: Sendable {
    case length(Length)
    case percentage(Double)
    case keyword(Keyword)
    case global(Global)
    
    public enum Keyword: String, Sendable {
        case none
        case maxContent = "max-content"
        case minContent = "min-content"
        case fitContent = "fit-content"
    }
    
    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }
}

extension MaxHeight: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let value):
            return "\(value)%"
        case .keyword(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}

// Convenience static properties and methods
extension CSS.MaxHeight {
    public static let none: Self = .keyword(.none)
    public static let maxContent: Self = .keyword(.maxContent)
    public static let minContent: Self = .keyword(.minContent)
    public static let fitContent: Self = .keyword(.fitContent)
    
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}

