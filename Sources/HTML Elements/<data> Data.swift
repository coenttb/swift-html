//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Data<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "data" }
    
    public var value: Value
    
    public let content: () -> HTML
    
    public init(
        value: Value,
        content: @escaping () -> HTML
    ) {
        self.value = value
        self.content = content
    }
}

public typealias data = Data
