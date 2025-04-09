//
//  <pre> Preformatted Text.swift
//  swift-html
//
//  Represents the HTML <pre> element for displaying preformatted text.
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML `<pre>` element, which displays preformatted text exactly as written in the HTML file.
///
/// The `PreformattedText` struct provides a type-safe way to create HTML preformatted text elements, 
/// which preserve whitespace, line breaks, and spacing.
///
/// The text is typically rendered using a monospaced font. Whitespace inside this element is displayed 
/// as written, with one exception: if one or more leading newline characters are included immediately 
/// following the opening `<pre>` tag, the first newline character is stripped.
///
/// ## Example
///
/// ```swift
/// pre {
///     """
///     function hello() {
///         console.log("Hello, world!");
///     }
///     """
/// }
/// ```
///
/// ## Accessibility Considerations
///
/// - When using pre elements for ASCII art or diagrams, provide alternative descriptions
/// - Consider wrapping pre elements in `<figure>` with a `<figcaption>` for better accessibility
/// - For ASCII art, add role="img" and aria-label attributes to describe the content
///
/// ## Best Practices
///
/// - Use pre elements for displaying code, computer output, or ASCII art
/// - Often combined with elements like `<code>`, `<samp>`, or `<kbd>`
/// - Remember that < characters may need to be escaped as &lt; in the content
///
public struct PreformattedText: Element {
    /// The HTML tag name
    public static var tag: String { "pre" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new PreformattedText element.
    ///
    /// - Parameter content: The content of the element, displayed with preserved whitespace and formatting
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating PreformattedText elements with a more HTML-like syntax.
public typealias pre = PreformattedText

