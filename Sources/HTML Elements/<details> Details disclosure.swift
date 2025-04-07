//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Details<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "details" }
    
    public var open: Open?
    public var name: Name?
    public let content: () -> HTML
    
    public init(
        open: Open? = nil,
        name: Name? = nil,
        content: @escaping () -> HTML
    ) {
        self.open = open
        self.name = name
        self.content = content
    }
}

public typealias details = Details

