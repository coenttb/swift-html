///
/// <abbr> Abbreviation.swift
/// swift-html
///
/// Represents the HTML abbreviation element for marking up abbreviations or acronyms.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML abbreviation element (`<abbr>`), which marks up an abbreviation or acronym.
///
/// The `Abbreviation` struct provides a type-safe way to create HTML abbreviation elements.
/// The `title` global attribute has special semantic meaning with this element and should
/// contain the full expansion of the abbreviation when used.
///
/// ## Example
///
/// ```swift
/// abbr {
///     "HTML"
/// }
/// ```
///
/// With global title attribute (handled separately):
/// ```swift
/// abbr(title: "HyperText Markup Language") {
///     "HTML"
/// }
/// ```
///
/// ## Use Cases
///
/// - When an abbreviation is used and you want to provide an expansion outside the document's content flow
/// - To define an abbreviation which may be unfamiliar to the reader
/// - When an abbreviation's presence needs to be semantically noted for styling or scripting
/// - In combination with `<dfn>` to establish definitions for abbreviated terms
///
/// ## Best Practices
///
/// - Provide a full expansion of the term in plain text on first use
/// - Use the title attribute to provide the full expansion
/// - Ensure the title attribute contains only the full description and nothing else
/// - For accessibility, consider spelling out the abbreviation in full the first time it's used
/// - In languages with grammatical number, use the same grammatical number in your title attribute as inside the abbr element
///
/// ## Accessibility Considerations
///
/// - Spelling out the acronym or abbreviation in full the first time it is used on a page is beneficial for helping people understand it
/// - Only include a title if expanding the abbreviation in the text is not possible
/// - This is especially helpful for people unfamiliar with terminology, new to the language, or with cognitive concerns
///
/// - Note: When rendered, this generates an HTML `<abbr>` element with the appropriate
///   attributes based on the configuration.
public struct Abbreviation<HTML>: Element {
    public static var tag: String { "abbr" }
    
    /// The content of the abbreviation element, typically the abbreviated form.
    ///
    /// This should be the short form of the term that is being marked up as an abbreviation.
    public var content: () -> HTML
    
    /// Creates a new Abbreviation element with the specified content.
    ///
    /// - Parameter content: The content of the abbreviation element, typically the abbreviated form
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Abbreviation elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `abbr` identifier when creating
/// HTML abbreviation elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// abbr {
///     "HTML"
/// }
/// ```
public typealias abbr = Abbreviation