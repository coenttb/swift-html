//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2024.
//

import Foundation

import Foundation

public enum Length: Sendable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    case length(Double, Unit)
    case percentage(Double)
    case keyword(Keyword)
    case calc(String) // For calc() expressions
    case global(Global)

    public enum Unit: String, Sendable {
        case px, em, rem, vw, vh, vmin, vmax
        case cm, mm, `in`, pt, pc
        case ex, ch, lh // Typography-related units
        case fr // For CSS Grid
    }

    public enum Keyword: String, Sendable {
        case auto
        case maxContent = "max-content"
        case minContent = "min-content"
        case fitContent = "fit-content"
    }

    public enum Global: String, Sendable {
        case inherit, initial, revert
        case revertLayer = "revert-layer"
        case unset
    }

    public init(integerLiteral value: Int) {
        self = .length(Double(value), .px)
    }

    public init(floatLiteral value: Double) {
        self = .length(value, .px)
    }
}

extension CSS.Length {
    public static func px(_ value: Double) -> Self { .length(value, .px) }
    public static func em(_ value: Double) -> Self { .length(value, .em) }
    public static func rem(_ value: Double) -> Self { .length(value, .rem) }
    public static func vw(_ value: Double) -> Self { .length(value, .vw) }
    public static func vh(_ value: Double) -> Self { .length(value, .vh) }
    public static func percent(_ value: Double) -> Self { .percentage(value) }
    
    public static let auto: Self = .keyword(.auto)
    public static let maxContent: Self = .keyword(.maxContent)
    public static let minContent: Self = .keyword(.minContent)
    public static let fitContent: Self = .keyword(.fitContent)
    
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}

extension CSS.Length: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let value, let unit):
            return "\(value)\(unit.rawValue)"
        case .percentage(let value):
            return "\(value)%"
        case .keyword(let keyword):
            return keyword.rawValue
        case .calc(let expression):
            return "calc(\(expression))"
        case .global(let global):
            return global.rawValue
        }
    }
}

