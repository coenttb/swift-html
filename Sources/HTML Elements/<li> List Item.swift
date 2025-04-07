//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct ListItem<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "li" }
    
    public var value: Int?
    public let content: () -> HTML
    
    public init(
        value: Int? = nil,
        content: @escaping () -> HTML
    ) {
        self.value = value
        self.content = content
    }
}

public typealias li = ListItem
