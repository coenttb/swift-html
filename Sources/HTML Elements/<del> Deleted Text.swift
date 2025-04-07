//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Del<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "del" }
    
    public var cite: HTML_Attributes.Cite?
    public var datetime: HTML_Attributes.DateTime?
    
    public let content: () -> HTML
    
    public init(
        cite: HTML_Attributes.Cite? = nil,
        datetime: HTML_Attributes.DateTime? = nil,
        content: @escaping () -> HTML
    ) {
        self.cite = cite
        self.datetime = datetime
        self.content = content
    }
}

public typealias del = Del
