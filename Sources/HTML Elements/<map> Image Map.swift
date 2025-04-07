//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Map<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "map" }
    
    public var name: Name?
    public let content: () -> HTML
    
    public init(
        name: Name? = nil,
        content: @escaping () -> HTML
    ) {
        self.name = name
        self.content = content
    }
}

public typealias map = Map
