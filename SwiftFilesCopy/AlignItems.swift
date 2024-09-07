//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2024.
//

import Foundation

public enum AlignItems: Sendable {
    case basic(Basic)
    case positional(Positional)
    case baseline(Baseline)
    case overflow(Overflow)
    case global(Global)
    
    public enum Basic: String, Sendable {
        case normal
        case stretch
    }
    
    public enum Positional: String, Sendable {
        case center
        case start
        case end
        case flexStart = "flex-start"
        case flexEnd = "flex-end"
        case selfStart = "self-start"
        case selfEnd = "self-end"
        case anchorCenter = "anchor-center"
    }
    
    public enum Baseline: String, Sendable {
        case baseline
        case firstBaseline = "first baseline"
        case lastBaseline = "last baseline"
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
extension AlignItems {
    // Basic keywords
    public static let normal: Self = .basic(.normal)
    public static let stretch: Self = .basic(.stretch)
    
    // Positional alignment
    public static let center: Self = .positional(.center)
    public static let start: Self = .positional(.start)
    public static let end: Self = .positional(.end)
    public static let flexStart: Self = .positional(.flexStart)
    public static let flexEnd: Self = .positional(.flexEnd)
    public static let selfStart: Self = .positional(.selfStart)
    public static let selfEnd: Self = .positional(.selfEnd)
    public static let anchorCenter: Self = .positional(.anchorCenter)
    
    // Baseline alignment
    public static let baseline: Self = .baseline(.baseline)
    public static let firstBaseline: Self = .baseline(.firstBaseline)
    public static let lastBaseline: Self = .baseline(.lastBaseline)
    
    // Overflow alignment
    public static func safeCenter() -> Self {
        return .overflow(.safe(.center))
    }
    
    public static func unsafeCenter() -> Self {
        return .overflow(.unsafe(.center))
    }
    
    // Global values
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
    public static let leading: Self = .start
    public static let trailing: Self = .end
}

// CustomStringConvertible conformance
extension AlignItems: CustomStringConvertible {
    public var description: String {
        switch self {
        case .basic(let basic):
            return basic.rawValue
        case .positional(let positional):
            return positional.rawValue
        case .baseline(let baseline):
            return baseline.rawValue
        case .overflow(let overflow):
            return overflow.description
        case .global(let global):
            return global.rawValue
        }
    }
}

extension AlignItems.Overflow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .safe(let alignment):
            return "safe \(alignment.rawValue)"
        case .unsafe(let alignment):
            return "unsafe \(alignment.rawValue)"
        }
    }
}
