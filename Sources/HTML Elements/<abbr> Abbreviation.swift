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
/// abbreviation {
///     "HTML"
/// }
/// ```
///
/// With global title attribute (handled separately):
/// ```swift
/// abbreviation(title: "HyperText Markup Language") {
///     "HTML"
/// }
/// ```
///
/// ## Best Practices
///
/// - Provide a full expansion of the term in plain text on first use
/// - Use the title attribute to provide the full expansion
/// - Ensure the title attribute contains only the full description and nothing else
/// - For accessibility, consider spelling out the abbreviation in full the first time it's used
///
/// - Note: When rendered, this generates an HTML `<abbr>` element with the appropriate
///   attributes based on the configuration.
public struct Abbreviation<HTML> {
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
/// This typealias allows you to use the lowercase `abbreviation` identifier when creating
/// HTML abbreviation elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// abbreviation {
///     "HTML"
/// }
/// ```
public typealias abbr = Abbreviation
