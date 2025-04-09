///
/// <strong> Strong Importance.swift
/// swift-html
///
/// Represents the HTML strong element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<strong>` element, which indicates that its contents have strong importance, seriousness, or urgency.
///
/// The `StrongImportance` struct provides a type-safe way to create HTML strong elements. Browsers typically render the contents in bold type,
/// although this element should be used for semantic importance rather than styling.
///
/// ## Example
///
/// ```swift
/// strong {
///     "Warning! This is very dangerous."
/// }
/// ```
///
/// ## Usage Notes
///
/// - Use `<strong>` for content that is of "strong importance," including things of great seriousness or urgency (such as warnings).
/// - Can be used to denote labels of paragraphs which represent notes or warnings within text.
/// - Do not use for styling; use CSS `font-weight` property for that purpose.
/// - Use `<b>` to draw attention to text without indicating higher importance.
/// - Use `<em>` to mark text that has stress emphasis.
/// - Can be nested to increase the relative degree of importance.
///
/// ## Accessibility
///
/// The `<strong>` element has an implicit ARIA role of "strong" which communicates the importance to assistive technologies.
///
public struct StrongImportance<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "strong" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new StrongImportance element.
    ///
    /// - Parameter content: The content to be marked as having strong importance
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating StrongImportance elements with a more HTML-like syntax.
public typealias strong = StrongImportance