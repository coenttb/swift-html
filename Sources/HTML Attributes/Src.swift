//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 04/04/2025.
//

import Foundation

public struct Src: Attribute, ExpressibleByStringLiteral, ExpressibleByStringInterpolation, CustomStringConvertible {
    public static let attribute: String = "src"
    
    public var value: String
    
    public init(_ value: String) {
        self.value = value
    }
    
    public init(_ url: URL) {
        self.value = url.absoluteString
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self = .init(value)
    }
    
    public var description: String { value }
}
