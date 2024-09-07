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
        case q, cap, ic, rlh
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

extension Length: Equatable {
    public static func == (lhs: Length, rhs: Length) -> Bool {
        switch (lhs, rhs) {
        case let (.length(value1, unit1), .length(value2, unit2)):
            return value1 == value2 && unit1 == unit2
        case let (.percentage(value1), .percentage(value2)):
            return value1 == value2
        case let (.keyword(keyword1), .keyword(keyword2)):
            return keyword1 == keyword2
        case let (.calc(calc1), .calc(calc2)):
            return calc1 == calc2
        case let (.global(global1), .global(global2)):
            return global1 == global2
        default:
            return false
        }
    }
}

extension Length: Numeric {
    public typealias Magnitude = Double
    
    public var magnitude: Double {
        switch self {
        case .length(let value, _), .percentage(let value):
            return abs(value)
        case .calc, .keyword, .global:
            return 0 // Non-numeric types return 0 magnitude
        }
    }
    
    public init?<T>(exactly source: T) where T : BinaryInteger {
        self = .length(Double(source), .px)
    }
    
    public static func * (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, _)):
            return .length(v1 * v2, u1)
        case (.percentage(let v1), .percentage(let v2)):
            return .percentage(v1 * v2)
        default:
            return .calc("\(lhs) * \(rhs)")
        }
    }
    
    public static func *= (lhs: inout Length, rhs: Length) {
        lhs = lhs * rhs
    }
    
    public static func + (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 + v2, u1)
        case (.percentage(let v1), .percentage(let v2)):
            return .percentage(v1 + v2)
        default:
            return .calc("\(lhs) + \(rhs)")
        }
    }
    
    public static func += (lhs: inout Length, rhs: Length) {
        lhs = lhs + rhs
    }
    
    public static func - (lhs: Length, rhs: Length) -> Length {
        switch (lhs, rhs) {
        case (.length(let v1, let u1), .length(let v2, let u2)) where u1 == u2:
            return .length(v1 - v2, u1)
        case (.percentage(let v1), .percentage(let v2)):
            return .percentage(v1 - v2)
        default:
            return .calc("\(lhs) - \(rhs)")
        }
    }
    
    public static func -= (lhs: inout Length, rhs: Length) {
        lhs = lhs - rhs
    }
    
    // Custom division operation
    public static func / (lhs: Length, rhs: Double) -> Length {
        guard rhs != 0 else { fatalError("Division by zero") }
        switch lhs {
        case .length(let value, let unit):
            return .length(value / rhs, unit)
        case .percentage(let value):
            return .percentage(value / rhs)
        case .calc(let expression):
            return .calc("(\(expression)) / \(rhs)")
        case .keyword, .global:
            return lhs // Keywords and globals cannot be divided
        }
    }
}

// Extension to allow division by Int
extension Length {
    public static func / (lhs: Length, rhs: Int) -> Length {
        return lhs / Double(rhs)
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


extension Int {
    public var px: CSS.Length { .px(Double(self)) }
    public var em: CSS.Length { .em(Double(self)) }
    public var rem: CSS.Length { .rem(Double(self)) }
    public var vw: CSS.Length { .vw(Double(self)) }
    public var vh: CSS.Length { .vh(Double(self)) }
    public var percent: CSS.Length { .percent(Double(self)) }
    
    // Add other units as needed
    public var cm: CSS.Length { .length(Double(self), .cm) }
    public var mm: CSS.Length { .length(Double(self), .mm) }
    public var `in`: CSS.Length { .length(Double(self), .in) }
    public var pt: CSS.Length { .length(Double(self), .pt) }
    public var pc: CSS.Length { .length(Double(self), .pc) }
    public var ex: CSS.Length { .length(Double(self), .ex) }
    public var ch: CSS.Length { .length(Double(self), .ch) }
    public var lh: CSS.Length { .length(Double(self), .lh) }
    public var vmin: CSS.Length { .length(Double(self), .vmin) }
    public var vmax: CSS.Length { .length(Double(self), .vmax) }
    public var fr: CSS.Length { .length(Double(self), .fr) }
}

extension Double {
    public var px: CSS.Length { .px(self) }
    public var em: CSS.Length { .em(self) }
    public var rem: CSS.Length { .rem(self) }
    public var vw: CSS.Length { .vw(self) }
    public var vh: CSS.Length { .vh(self) }
    public var percent: CSS.Length { .percent(self) }
    
    // Add other units as needed
    public var cm: CSS.Length { .length(self, .cm) }
    public var mm: CSS.Length { .length(self, .mm) }
    public var `in`: CSS.Length { .length(self, .in) }
    public var pt: CSS.Length { .length(self, .pt) }
    public var pc: CSS.Length { .length(self, .pc) }
    public var ex: CSS.Length { .length(self, .ex) }
    public var ch: CSS.Length { .length(self, .ch) }
    public var lh: CSS.Length { .length(self, .lh) }
    public var vmin: CSS.Length { .length(self, .vmin) }
    public var vmax: CSS.Length { .length(self, .vmax) }
    public var fr: CSS.Length { .length(self, .fr) }
}

extension Int {
    public var q: CSS.Length { .length(Double(self), .q) }
    public var cap: CSS.Length { .length(Double(self), .cap) }
    public var ic: CSS.Length { .length(Double(self), .ic) }
    public var rlh: CSS.Length { .length(Double(self), .rlh) }
}

extension Double {
    public var q: CSS.Length { .length(self, .q) }
    public var cap: CSS.Length { .length(self, .cap) }
    public var ic: CSS.Length { .length(self, .ic) }
    public var rlh: CSS.Length { .length(self, .rlh) }
}
