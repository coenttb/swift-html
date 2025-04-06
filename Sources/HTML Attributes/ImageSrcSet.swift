//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 06/04/2025.
//

import Foundation

public struct ImageSrcSet: Attribute, ExpressibleByStringLiteral {
    public static let attribute: String = "imagesrcset"
    
    private var value: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
    
}
