//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Default: BooleanAttribute {
    /// The name of the HTML attribute
    public static let attribute: String = "default"
    
    public var value: Bool
  
    public init(value: Bool) {
        self.value = value
    }
}
