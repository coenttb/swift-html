//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation

//hreflang
//Hints at the human language of the linked URL. No built-in functionality. Allowed values are the same as the global lang attribute.

public struct Hreflang: Attribute, ExpressibleByStringLiteral {
    public static let attribute: String = "hreflang"
    
    private var value: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
