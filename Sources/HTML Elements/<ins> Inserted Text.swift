///
/// <ins> Inserted Text.swift
/// swift-html
///
/// Represents the HTML inserted text element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<ins>` element, which marks text that has been added to a document.
///
/// The `InsertedText` struct provides a type-safe way to create HTML inserted text elements with various attributes.
///
/// ## Example
///
/// ```swift
/// ins {
///     "This text has been inserted"
/// }
/// ```
///
/// ```swift
/// ins(cite: "changes.html", datetime: "2025-04-05T12:00:00Z") {
///     "This text was added on April 5th, 2025"
/// }
/// ```
///
/// ## Accessibility Considerations
///
/// - The presence of the `<ins>` element is not announced by most screen reading technology in its default configuration.
/// - It can be made to be announced by using the CSS `content` property, along with the `::before` and `::after` pseudo-elements.
/// - Only use this when it's important for users to know that content was inserted.
///
public struct InsertedText: Element {
    /// The HTML tag name
    public static var tag: String { "ins" }
    
    /// The URI of a resource that explains the change, such as a link to meeting minutes or a ticket.
    public var cite: HTML_Attributes.Cite?
    
    /// Indicates the time and date of the change.
    public var datetime: HTML_Attributes.DateTime?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new InsertedText element with the specified attributes.
    ///
    /// - Parameters:
    ///   - cite: The URI of a resource that explains the change.
    ///   - datetime: The time and date of the change.
    ///   - content: The content of the element.
    public init(
        cite: HTML_Attributes.Cite? = nil,
        datetime: HTML_Attributes.DateTime? = nil,
        
    ) {
        self.cite = cite
        self.datetime = datetime
        
    }
}

/// Lowercase typealias for creating InsertedText elements with a more HTML-like syntax.
public typealias ins = InsertedText
