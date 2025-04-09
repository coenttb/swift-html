///
/// <s> Strikethrough.swift
/// swift-html
///
/// Represents the HTML s element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML strikethrough element (`<s>`), which renders text with a strikethrough line.
///
/// The `Strikethrough` struct provides a type-safe way to create HTML elements that indicate content
/// that is no longer relevant or accurate.
///
/// ## Example
///
/// ```swift
/// s {
///     "This product is no longer available."
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<s>` for content that is no longer relevant or accurate
/// - Do not use for indicating document edits - use `<del>` and `<ins>` elements instead
/// - Consider adding CSS for screen readers to improve accessibility
///
/// ## Accessibility Notes
///
/// The strikethrough element is not announced by most screen readers by default.
/// You can use CSS `::before` and `::after` pseudo-elements with the `content` property
/// to make it announced by screen readers when necessary.
///
public struct Strikethrough: Element {
    /// The HTML tag name
    public static var tag: String { "s" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Strikethrough element.
    ///
    /// - Parameter content: The content of the element
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Strikethrough elements with a more HTML-like syntax.
public typealias s = Strikethrough
