///
/// <bdi> Bidirectional Isolate.swift
/// swift-html
///
/// Represents the HTML bidirectional isolate element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML bidirectional isolate element (`<bdi>`), which isolates a span of text that might
/// be formatted in a different direction from other text outside it.
///
/// The `BidirectionalIsolate` struct provides a type-safe way to create HTML bidirectional isolate elements.
/// This element is particularly useful when embedding user-generated content with unknown directionality.
///
/// ## Example
///
/// ```swift
/// bdi {
///     "User-generated content with possibly different directionality"
/// }
/// ```
///
/// ## Use Cases
///
/// - Displaying user names or other user-generated content that might contain text 
///   in languages with right-to-left (RTL) script like Arabic or Hebrew
/// - Preventing the directionality of unknown text from affecting surrounding text
/// - Protecting website layout when displaying dynamic content from external sources
///
/// ## Behavior
///
/// The `<bdi>` element works in two ways:
/// - Text inside a `<bdi>` element does not influence the directionality of surrounding text
/// - The directionality of text inside `<bdi>` is not influenced by surrounding text
///
/// - Note: When rendered, this generates an HTML `<bdi>` element that isolates its content from
///   the bidirectional algorithm's influence.
public struct BidirectionalIsolate<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "bdi" }
    
    /// The content of the bidirectional isolate element
    public let content: () -> HTML
    
    /// Creates a new BidirectionalIsolate element with the specified content.
    ///
    /// - Parameters:
    ///   - content: The content to be rendered inside the bidirectional isolate element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating BidirectionalIsolate elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `bdi` identifier when creating
/// HTML bidirectional isolate elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// bdi {
///     "User-generated content with possibly different directionality"
/// }
/// ```
public typealias bdi = BidirectionalIsolate