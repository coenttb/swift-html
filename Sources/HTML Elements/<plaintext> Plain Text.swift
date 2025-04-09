///
/// <plaintext> Plain Text.swift
/// swift-html
///
/// Represents the HTML plaintext element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<plaintext>` element, which renders everything following the start tag as raw text.
///
/// > **Warning**: This element is deprecated since HTML 2 and should not be used.
/// > Browsers may treat it as a `<pre>` element that still interprets HTML within.
///
/// The `<plaintext>` element has no closing tag, as everything after it is considered raw text.
///
/// ## Alternatives
///
/// Instead of `<plaintext>`, use:
/// - The `<pre>` element for preformatted text
/// - The `<code>` element for inline code
/// - A text file with the `text/plain` MIME-type if plaintext is needed as the first element
///
/// ## Example
///
/// ```swift
/// plaintext {
///     "This text will be displayed as-is, without HTML parsing."
/// }
/// ```
///
/// ## Best Practices
///
/// - **Do not use this element** in new code as it is deprecated.
/// - Use `<pre>` or `<code>` elements instead and escape special characters.
/// - Apply monospaced fonts via CSS using `font-family: monospace` where needed.
///
@available(*, deprecated, message: "The <plaintext> element is deprecated. Use <pre> or <code> instead.")
public struct PlainText<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "plaintext" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new plaintext element.
    ///
    /// - Parameter content: The content to be displayed as plain text
    @available(*, deprecated, message: "The <plaintext> element is deprecated. Use <pre> or <code> instead.")
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating PlainText elements with a more HTML-like syntax.
@available(*, deprecated, message: "The <plaintext> element is deprecated. Use <pre> or <code> instead.")
public typealias plaintext = PlainText