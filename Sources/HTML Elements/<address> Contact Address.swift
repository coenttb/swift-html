///
/// <address> Contact Address.swift
/// swift-html
///
/// Represents the HTML address element for contact information.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML address element (`<address>`), which indicates that the enclosed HTML 
/// provides contact information for a person, people, or organization.
///
/// The `Address` struct provides a type-safe way to create HTML address elements that contain
/// contact information related to the document or a specific article within the document.
///
/// ## Example
///
/// ```swift
/// address {
///   "Contact the author: "
///   anchor(href: "mailto:author@example.com") {
///     "author@example.com"
///   }
///   lineBreak()
///   "123 Main Street, Anytown USA"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use only for contact information, not for other content
/// - Include the name of the person or organization along with contact details
/// - Place inside the `footer` element of the current section when appropriate
/// - Don't nest address elements
/// - Don't include headings, sections, or header/footer elements inside
///
/// - Note: When rendered, this generates an HTML `<address>` element with the appropriate
///   attributes based on the configuration.
public struct Address<HTML>: Element {
    public static var tag: String { "address" }
    
    /// The content of the address element, which can include text and other elements
    /// like anchors, line breaks, etc.
    ///
    /// The content should contain contact information for a person, people, or organization.
    public var content: () -> HTML
    
    /// Creates a new Address element with the specified content.
    ///
    /// - Parameter content: The contact information to be contained within the address element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Address elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `address` identifier when creating
/// HTML address elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// address {
///   "Contact us: contact@example.com"
/// }
/// ```
public typealias address = Address
