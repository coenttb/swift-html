///
/// <bdo> Bidirectional Text Override.swift
/// swift-html
///
/// Represents the HTML bidirectional text override element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

public struct BlockQuote<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "blockquote" }
    
    public var cite: HTML_Attributes.Cite?
    
    /// The content of the bidirectional text override element
    public let content: () -> HTML
    
    /// Creates a new BlockQuote element with the specified direction and content.
    ///
    /// - Parameters:
    ///   - content: The content to be rendered with the specified direction
    public init(
        cite: HTML_Attributes.Cite? = nil,
        content: @escaping () -> HTML
    ) {
        self.cite = cite
        self.content = content
    }
}

/// Lowercase typealias for creating BlockQuote elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `bdo` identifier when creating
/// HTML bidirectional text override elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// bdo(dir: .rtl) {
///     "This text will display right-to-left."
/// }
/// ```
public typealias blockquote = BlockQuote
