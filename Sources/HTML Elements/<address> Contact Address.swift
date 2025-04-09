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
/// The contact information can include any appropriate form such as physical address, 
/// URL, email address, phone number, social media handle, or geographic coordinates.
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
/// ## Usage Notes
///
/// The `<address>` element can only be used to represent the contact information for its nearest
/// `<article>` or `<body>` element ancestor. Typically, it is placed inside the `<footer>` 
/// element of the current section.
///
/// ## Best Practices
///
/// - Use only for contact information, not for other content
/// - Include the name of the person or organization along with contact details
/// - Place inside the `footer` element of the current section when appropriate
/// - Don't nest address elements
/// - Don't include headings, sections, or header/footer elements inside
/// - Use instead of generic elements like `<i>` or `<em>` for contact information to convey proper semantics
///
/// - Note: When rendered, this generates an HTML `<address>` element with the appropriate
///   attributes based on the configuration.
public struct Address: Element {
    public static var tag: String { "address" }

    /// Creates a new Address element with the specified content.
    public init(){}
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
