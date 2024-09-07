//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Foundation

public struct Opacity: Equatable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    
    
    let value: Double
    
    public init(_ value: Double) {
        self.value = max(0, min(1, value))  // Clamp between 0 and 1
    }
    
    public init(floatLiteral value: Double) {
        self.init(value)
    }
    
    public init(integerLiteral value: Int) {
        self.init(.init(value))
    }
    
    public var description: String {
        return String(format: "%.2f", value)
    }
    
    public static let transparent: Opacity = 0.0
    public static let opaque: Opacity = 1.0
}
