///
/// <ruby> Ruby Annotation.swift
/// swift-html
///
/// Represents the HTML Ruby Annotation element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML Ruby Annotation element (`<ruby>`), which displays small annotations above, below, or next to text, 
/// commonly used for showing pronunciation of East Asian characters.
///
/// The `Ruby` struct provides a type-safe way to create ruby annotations with various attributes.
///
/// ## Example
///
/// ```swift
/// ruby {
///     "漢"
///     rp { "(" }
///     rt { "Kan" }
///     rp { ")" }
///     "字"
///     rp { "(" }
///     rt { "ji" }
///     rp { ")" }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use ruby annotations to provide pronunciation guides for characters
/// - Include fallback parentheses using `<rp>` elements for browsers that don't support ruby
/// - Keep annotations concise and directly related to the base text
/// - For complex ruby annotations, consider using `<rb>` (Ruby Base) and `<rtc>` (Ruby Text Container) elements
///
public struct Ruby<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "ruby" }
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Ruby element with the specified attributes.
    ///
    /// - Parameters:
    ///   - id: The unique identifier for this element
    ///   - class: The CSS classes for this element
    ///   - content: The content of the element, typically containing base text, rt (ruby text) and optional rp (ruby parentheses) elements
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Ruby elements with a more HTML-like syntax.
public typealias ruby = Ruby
