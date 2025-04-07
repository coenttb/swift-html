//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Dialog<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dialog" }
    
    public var open: Open?
    public let content: () -> HTML
    
    public init(
        open: Open? = nil,
        content: @escaping () -> HTML
    ) {
        self.open = open
        self.content = content
    }
}

public typealias dialog = Dialog
