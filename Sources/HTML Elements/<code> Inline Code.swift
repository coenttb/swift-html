///
/// <code> Inline Code.swift
/// swift-html
///
/// Represents the HTML code element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<code>` element, which displays its contents styled as a fragment of computer code.
///
/// The `Code` element is used to display short fragments of computer code or programming language syntax. 
/// By default, browsers display the content of a `<code>` element using a monospace font.
///
/// ## Example
///
/// ```swift
/// p {
///     "The "
///     code {
///         "push()"
///     }
///     " method adds one or more elements to the end of an array."
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<code>` for short code fragments like variable names, function names, or single statements.
/// - For multi-line code blocks, wrap the `<code>` element within a `<pre>` element.
/// - Consider combining with other semantic text elements like `<var>` for variables or `<kbd>` for keyboard input.
/// - The element can be styled with CSS to enhance readability (background color, padding, etc.).
///
public struct Code: Element {
    /// The HTML tag name
    public static var tag: String { "code" }

    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Code element.
    ///
    /// - Parameter content: The content of the element
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Code elements with a more HTML-like syntax.
public typealias code = Code
