//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

package protocol BooleanAttribute: Attribute, ExpressibleByBooleanLiteral {
    var value: Bool { get }
    
    init(value: Bool)
}

extension BooleanAttribute {
    public init(booleanLiteral value: Bool) {
        self = .init(value: value)
    }
}
