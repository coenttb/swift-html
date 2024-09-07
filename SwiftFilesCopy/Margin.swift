//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import Foundation

public enum Margin: Sendable {
    case all(Length)
    case horizontal(Length)
    case vertical(Length)
    case trbl(top: Length?, right: Length?, bottom: Length?, left: Length?)
    case keyword(Keyword)
    case global(Global)
    
    public enum Keyword: String, Sendable {
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
// CustomStringConvertible conformance
extension CSS.Margin: CustomStringConvertible {
    public var description: String {
        switch self {
        case .all(let length):
            return length.description
        case .horizontal(let length):
            return "\(length) 0"
        case .vertical(let length):
            return "0 \(length)"
        case .trbl(let top, let right, let bottom, let left):
            let values = [top, right, bottom, left].map { $0?.description ?? "0" }
            return values.joined(separator: " ")
        case .keyword(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}

// Convenience initializers and static properties
extension CSS.Margin {
    public static func top(_ length: CSS.Length) -> Self {
        .trbl(top: length, right: nil, bottom: nil, left: nil)
    }
    
    public static func right(_ length: CSS.Length) -> Self {
        .trbl(top: nil, right: length, bottom: nil, left: nil)
    }
    
    public static func bottom(_ length: CSS.Length) -> Self {
        .trbl(top: nil, right: nil, bottom: length, left: nil)
    }
    
    public static func left(_ length: CSS.Length) -> Self {
        .trbl(top: nil, right: nil, bottom: nil, left: length)
    }
    
    public static let auto: Self = .keyword(.auto)
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}
