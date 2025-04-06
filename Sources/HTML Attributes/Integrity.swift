//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 06/04/2025.
//

import Foundation

public struct Integrity: Attribute, ExpressibleByStringLiteral {
    public static let attribute: String = "integrity"
    
    private var value: String
    
    public init(stringLiteral value: String) {
        self.value = value
    }
}

