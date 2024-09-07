//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/09/2024.
//

import Foundation

public enum RowGap: Sendable {
    case length(Length)
    case percentage(Double)
    case normal
    case global(Global)
    
    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }
}

extension RowGap: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let value):
            return "\(value)%"
        case .normal:
            return "normal"
        case .global(let global):
            return global.rawValue
        }
    }
}

// Convenience static properties and methods
extension CSS.RowGap {
    
    
    
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}

