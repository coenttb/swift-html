//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct FrameFallback<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "noframes" }
    
    public let content: () -> HTML
    
    @available(*, deprecated)
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias noframes = FrameFallback
