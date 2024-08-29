//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import Foundation

public enum Padding: Sendable {
    case all(Length)
    case horizontal(Length)
    case vertical(Length)
    case top(Length)
    case right(Length)
    case bottom(Length)
    case left(Length)
    case trbl(top: Length?, right: Length?, bottom: Length?, left: Length?)
    case global(Global)
    
    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }
}
// CustomStringConvertible conformance
extension CSS.Padding: CustomStringConvertible {
    public var description: String {
        switch self {
        case .all(let length):
            return length.description
        case .horizontal(let length):
            return "\(length.description) 0"
        case .vertical(let length):
            return "0 \(length.description)"
        case .top(let length):
            return "\(length.description) 0 0 0"
        case .right(let length):
            return "0 \(length.description) 0 0"
        case .bottom(let length):
            return "0 0 \(length.description) 0"
        case .left(let length):
            return "0 0 0 \(length.description)"
        case .trbl(let top, let right, let bottom, let left):
            let values = [top, right, bottom, left].map { $0?.description ?? "0" }
            return values.joined(separator: " ")
        case .global(let global):
            return global.rawValue
        }
    }
}

// Convenience initializers and static properties
extension CSS.Padding {
    public static func all(_ value: Double) -> Self { .all(.px(value)) }
    public static func horizontal(_ value: Double) -> Self { .horizontal(.px(value)) }
    public static func vertical(_ value: Double) -> Self { .vertical(.px(value)) }
    public static func top(_ value: Double) -> Self { .top(.px(value)) }
    public static func right(_ value: Double) -> Self { .right(.px(value)) }
    public static func bottom(_ value: Double) -> Self { .bottom(.px(value)) }
    public static func left(_ value: Double) -> Self { .left(.px(value)) }
    
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}


