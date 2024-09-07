//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2024.
//

import Foundation

public enum JustifyContent: Sendable {
    case positional(Positional)
    case normal
    case distributed(Distributed)
    case overflow(Overflow)
    case global(Global)
    
    public enum Positional: String, Sendable {
        case center
        case start
        case end
        case flexStart = "flex-start"
        case flexEnd = "flex-end"
        case left
        case right
    }
    
    public enum Distributed: String, Sendable {
        case spaceBetween = "space-between"
        case spaceAround = "space-around"
        case spaceEvenly = "space-evenly"
        case stretch
    }
    
    public enum Overflow: Sendable {
        case safe(Alignment)
        case unsafe(Alignment)
        
        public enum Alignment: String, Sendable {
            case center
        }
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
extension JustifyContent {
    // Positional
    public static let center: Self = .positional(.center)
    public static let start: Self = .positional(.start)
    public static let end: Self = .positional(.end)
    public static let flexStart: Self = .positional(.flexStart)
    public static let flexEnd: Self = .positional(.flexEnd)
    public static let left: Self = .positional(.left)
    public static let right: Self = .positional(.right)
    
    // Normal

    // Distributed
    public static let spaceBetween: Self = .distributed(.spaceBetween)
    public static let spaceAround: Self = .distributed(.spaceAround)
    public static let spaceEvenly: Self = .distributed(.spaceEvenly)
    public static let stretch: Self = .distributed(.stretch)
    
    // Overflow
    public static func center(safe: Bool) -> JustifyContent {
        switch safe {
        case true: return .overflow(.safe(.center))
        case false: return .overflow(.unsafe(.center))
        }
    }
    
    // Global
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}

// CustomStringConvertible conformance
extension JustifyContent: CustomStringConvertible {
    public var description: String {
        switch self {
        case .positional(let positional):
            return positional.rawValue
        case .normal:
            return "normal"
        case .distributed(let distributed):
            return distributed.rawValue
        case .overflow(let overflow):
            return overflow.description
        case .global(let global):
            return global.rawValue
        }
    }
}

extension JustifyContent.Overflow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .safe(let alignment):
            return "safe \(alignment.rawValue)"
        case .unsafe(let alignment):
            return "unsafe \(alignment.rawValue)"
        }
    }
}
