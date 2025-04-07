//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct InlineQuotation<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "q" }
    
    public var cite: HTML_Attributes.Cite?
    
    public let content: () -> HTML
    
    public init(
        cite: HTML_Attributes.Cite? = nil,
        content: @escaping () -> HTML
    ) {
        self.cite = cite
        self.content = content
    }
}

public typealias q = InlineQuotation
