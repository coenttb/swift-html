//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct TableHead<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "thead" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias thead = TableHead
