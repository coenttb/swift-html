///
/// <blockquote> Block Quotation.swift
/// swift-html
///
/// Represents the HTML block quotation element.
///
/// Created by Claude on 04/09/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML blockquote element (`<blockquote>`), which indicates that the enclosed text 
/// is an extended quotation.
///
/// The `BlockQuote` struct provides a type-safe way to create HTML block quotations with an optional 
/// citation source URL.
///
/// ## Example
///
/// ```swift
/// blockquote(cite: "https://www.example.com/source") {
///     p {
///         "Words can be like X-rays, if you use them properly—they'll go through anything. You read and you're pierced."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Attribution for the quotation should be placed outside the blockquote element
/// - Use the `cite` attribute to reference the source document or message
/// - For shorter inline quotes, use the `q` element instead
/// - The content is typically rendered visually by indentation
///
public struct BlockQuote: Element {
    /// The HTML tag name
    public static var tag: String { "blockquote" }
    
    /// A URL that designates a source document or message for the quoted information
    public var cite: HTML_Attributes.Cite?
    
    /// Creates a new BlockQuote element with the specified citation source and content.
    ///
    /// - Parameters:
    ///   - cite: A URL that designates the source document for the quotation
    public init(
        cite: HTML_Attributes.Cite? = nil
    ) {
        self.cite = cite
    }
}

/// Lowercase typealias for creating BlockQuote elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `blockquote` identifier when creating
/// HTML block quotation elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// blockquote(cite: "https://www.example.com/source") {
///     p {
///         "This is a block quotation with a citation source."
///     }
/// }
/// ```
public typealias blockquote = BlockQuote
