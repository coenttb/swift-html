//
// <tt> Teletype Text.swift
// swift-html
//
// Represents the HTML <tt> element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML teletype text element (`<tt>`), which displays text in a monospace font.
///
/// The `TeletypeText` struct provides a type-safe way to create HTML `<tt>` elements.
/// This element is obsolete in HTML5 and should generally be avoided in favor of more
/// semantic elements or CSS styling.
///
/// ## Example
///
/// ```swift
/// tt {
///     "This text appears in a monospace font"
/// }
/// ```
///
/// ## Best Practices
///
/// - This element is deprecated/obsolete. Consider using one of these semantic alternatives:
///   - `<code>` for computer code
///   - `<kbd>` for keyboard input
///   - `<samp>` for sample output
///   - `<var>` for variables
///   - `<pre>` for preformatted text blocks
/// - For non-semantic monospace text, use CSS `font-family: monospace` with a `<span>` element
///
public struct TeletypeText<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "tt" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new TeletypeText element.
    ///
    /// - Parameter content: The content of the element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating TeletypeText elements with a more HTML-like syntax.
public typealias tt = TeletypeText