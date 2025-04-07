//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct DateTime<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "time" }
    
    public var datetime: HTML_Attributes.DateTime?
    public let content: () -> HTML
    
    public init(
        datetime: HTML_Attributes.DateTime? = nil,
        content: @escaping () -> HTML
    ) {
        self.datetime = datetime
        self.content = content
    }
}

public typealias time = DateTime
