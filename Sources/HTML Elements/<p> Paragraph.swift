///
/// <p> Paragraph.swift
/// swift-html
///
/// Represents the HTML paragraph element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML paragraph element (`<p>`), which displays a block of text separated from adjacent blocks.
///
/// Paragraphs are block-level elements that automatically close if another block-level element is parsed before the closing
/// `</p>` tag.
///
/// ## Example
///
/// ```swift
/// p {
///     "This is a paragraph of text."
/// }
///
/// p {
///     "This is another paragraph with " + a(href: "https://example.com") { "a link" } + " inside it."
/// }
/// ```
///
/// ## Best Practices
///
/// - Use paragraphs to structure content into logical blocks of related text
/// - Avoid using empty paragraphs to create spacing (use CSS margins instead)
/// - Screen readers provide shortcuts to navigate between paragraphs, so proper use helps accessibility
///
/// ## Accessibility Considerations
///
/// - Breaking content into paragraphs improves accessibility by allowing screen reader users to navigate between logical sections
/// - Never use empty paragraphs for spacing, as screen readers may announce them without any content, causing confusion
/// - Use CSS properties like `margin` to create spacing between paragraphs
///
public struct Paragraph: Element {
    /// The HTML tag name
    public static var tag: String { "p" }
    
    /// Creates a new paragraph element with the specified content.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Paragraph elements with a more HTML-like syntax.
public typealias p = Paragraph
