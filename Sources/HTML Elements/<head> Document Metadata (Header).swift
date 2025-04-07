//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Head<HTML>: Element {
    
    public static var tag: String { "head" }
    
    /// The content of the aside element, which can include any flow content.
    ///
    /// This should contain content that is tangentially related to the surrounding content
    /// but could be removed without diminishing the meaning of the main content.
    public var content: () -> HTML
    
    /// Creates a new Aside element with the specified content.
    ///
    /// - Parameter content: The content of the aside element, typically including supplementary information
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias head = Head
