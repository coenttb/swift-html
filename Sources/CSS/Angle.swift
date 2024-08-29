//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import Foundation

public enum Angle: Sendable, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    case deg(Double)
    case rad(Double)
    case grad(Double)
    case turn(Double)

    public init(integerLiteral value: Int) {
        self = .deg(Double(value))
    }

    public init(floatLiteral value: Double) {
        self = .deg(value)
    }
}

extension CSS.Angle: CustomStringConvertible {
    public var description: String {
        switch self {
        case .deg(let value):
            return "\(value)deg"
        case .rad(let value):
            return "\(value)rad"
        case .grad(let value):
            return "\(value)grad"
        case .turn(let value):
            return "\(value)turn"
        }
    }
}
