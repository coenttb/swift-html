///
/// <mark> Mark Text.swift
/// swift-html
///
/// Represents the HTML mark element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML mark element (`<mark>`), which represents text that is marked or highlighted 
/// for reference or notation purposes due to its relevance in the enclosing context.
///
/// The `Mark` struct provides a type-safe way to create HTML mark elements for highlighting text.
///
/// ## Example
///
/// ```swift
/// mark {
///     "This text is highlighted for relevance"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use mark to highlight text of special interest, such as search results or key phrases
/// - Don't use mark for syntax highlighting; use span with appropriate CSS instead
/// - Don't confuse mark with strong; mark indicates relevance while strong indicates importance
///
/// ## Accessibility
///
/// The presence of the mark element is not announced by most screen reading technology by default.
/// Consider using CSS ::before and ::after pseudo-elements to make it more accessible if necessary.
///
public struct Mark<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "mark" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Mark element with the specified content.
    ///
    /// - Parameter content: The content to be highlighted
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Mark elements with a more HTML-like syntax.
public typealias mark = Mark