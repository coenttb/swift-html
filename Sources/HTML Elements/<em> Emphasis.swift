///
/// <em> Emphasis.swift
/// swift-html
///
/// Represents the HTML emphasis element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML emphasis element (`<em>`), which marks text that has stress emphasis.
///
/// The `Emphasis` element indicates a greater degree of emphasis than surrounding text, affecting
/// the meaning of the sentence. When nested, each level indicates a greater degree of emphasis.
///
/// ## Example
///
/// ```swift
/// em {
///     "This is ", em { "really" }, " important!"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<em>` for words that have a stressed emphasis compared to surrounding text
/// - Don't use it merely for visual styling (use CSS `font-style` for that)
/// - Use `<cite>` for titles of works (books, plays, songs)
/// - Use `<i>` for alternate tone/mood, scientific names, or words in other languages
/// - Use `<strong>` for text with greater importance than surrounding text
///
/// ## Accessibility Notes
///
/// - Screen readers may use verbal stress or a different tone when reading `<em>` content
/// - The element has an implicit ARIA role of "emphasis"
///
public struct Emphasis: Element {
    /// The HTML tag name
    public static var tag: String { "em" }
    
    /// Creates a new Emphasis element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Emphasis elements with a more HTML-like syntax.
public typealias em = Emphasis
