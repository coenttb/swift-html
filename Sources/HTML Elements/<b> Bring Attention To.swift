///
/// <b> Bring Attention To.swift
/// swift-html
///
/// Represents the HTML b element for bringing attention to text.
///
/// Created by Claude on 04/06/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML b element (`<b>`), which is used to draw attention to text without conveying
/// extra importance or emphasis.
///
/// The `B` struct provides a type-safe way to create HTML bold text elements. Note that this
/// element should be used for stylistic purposes only, not to indicate importance or emphasis
/// (use `<strong>` or `<em>` for that).
///
/// ## Example
///
/// ```swift
/// b {
///     "This text will appear bold but does not have semantic importance."
/// }
/// ```
///
/// ## Semantic Usage
///
/// The `<b>` element should be used in cases where other elements like `<strong>`, `<em>`,
/// `<mark>`, or `<span>` are not more appropriate:
///
/// - Use `<strong>` for text with strong importance
/// - Use `<em>` for text with emphatic stress
/// - Use `<mark>` for text with marking/highlighting relevance
/// - Use `<span>` with CSS for pure styling purposes
///
/// Appropriate use cases for `<b>` include:
/// - Keywords in a document
/// - Product names in a review
/// - Actionable words in interactive text-based software
/// - Article leads or summaries
///
/// - Note: When rendered, this generates an HTML `<b>` element with bold styling but no
///   additional semantic weight beyond bringing attention to the text.
public struct B<HTML>: Element {
    public static var tag: String { "b" }
    
    /// The content of the b element, which can include text and other elements.
    public var content: () -> HTML
    
    /// Creates a new B element with the specified content.
    ///
    /// - Parameter content: The content to be rendered inside the b element.
    public init(content: @escaping () -> HTML) {
        self.content = content
    }
}

/// Lowercase typealias for creating B elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `b` identifier when creating
/// HTML b elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// b {
///     "This text is bold but semantically neutral."
/// }
/// ```
public typealias b = B
