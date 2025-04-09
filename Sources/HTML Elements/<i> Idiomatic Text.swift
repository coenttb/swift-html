//
//  <i> Idiomatic Text.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML `<i>` element, which represents a range of text that is set off from the normal text for some reason,
/// such as idiomatic text, technical terms, taxonomical designations, among others.
///
/// The `IdiomaticText` struct provides a type-safe way to create HTML elements with proper semantic meaning.
///
/// ## Example
///
/// ```swift
/// i {
///     "Musa is one of two or three genera in the family Musaceae"
/// }
/// ```
///
/// ```swift
/// i(class: "term", lang: "la") {
///     "Veni, vidi, vici"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use for text with different semantic meaning than surrounding text, such as:
///   - Alternative voice or mood
///   - Taxonomic designations
///   - Idiomatic terms from another language (include the `lang` attribute)
///   - Technical terms
///   - Transliterations
///   - Thoughts
///   - Ship or vessel names in Western writing systems
/// - Do not use `<i>` when another element is more appropriate:
///   - Use `<em>` for stress emphasis
///   - Use `<strong>` for importance
///   - Use `<mark>` for relevance
///   - Use `<cite>` for names of works
///   - Use `<dfn>` for defining terms
public struct IdiomaticText: Element {
    /// The HTML tag name
    public static var tag: String { "i" }
    
    /// Creates a new IdiomaticText element with the specified content.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating IdiomaticText elements with a more HTML-like syntax.
public typealias i = IdiomaticText
