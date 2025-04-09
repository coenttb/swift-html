///
/// <q> Inline Quotation.swift
/// swift-html
///
/// Represents the HTML inline quotation element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML inline quotation element (`<q>`), which indicates that the enclosed text is a short inline quotation.
///
/// The `InlineQuotation` struct provides a type-safe way to create HTML inline quotations with various attributes.
/// Most modern browsers implement this by surrounding the text in quotation marks.
/// This element is intended for short quotations that don't require paragraph breaks; for long quotations use the `<blockquote>` element.
///
/// ## Example
///
/// ```swift
/// q(cite: "https://www.mozilla.org/en-US/about/history/details/") {
///     "Firefox 1.0 was released in 2004 and became a big success."
/// }
/// ```
///
/// ## Best Practices
///
/// - Use for short inline quotations that don't require paragraph breaks
/// - For longer quotations that require paragraph breaks, use the `<blockquote>` element
/// - Use the `cite` attribute to specify the source URL of the quotation
/// - Consider using the `<cite>` element in conjunction with `<q>` to attribute the source
///
public struct InlineQuotation<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "q" }
    
    /// The URL that designates a source document or message for the information quoted
    /// This attribute is intended to point to information explaining the context or the reference for the quote
    public var cite: HTML_Attributes.Cite?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new InlineQuotation element with the specified attributes.
    ///
    /// - Parameters:
    ///   - cite: The URL that designates a source document or message for the information quoted
    ///   - content: The content of the element
    public init(
        cite: HTML_Attributes.Cite? = nil,
        content: @escaping () -> HTML
    ) {
        self.cite = cite
        self.content = content
    }
}

/// Lowercase typealias for creating InlineQuotation elements with a more HTML-like syntax.
public typealias q = InlineQuotation
