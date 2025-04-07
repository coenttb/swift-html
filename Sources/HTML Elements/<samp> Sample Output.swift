//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Samp<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "samp" }
    
    public let content: () -> HTML
    
    @available(*, deprecated)
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias samp = Samp
