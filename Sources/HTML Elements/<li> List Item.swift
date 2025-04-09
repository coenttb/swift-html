//
// <li> List Item.swift
// swift-html
//
// Represents the HTML <li> (list item) element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML list item element (`<li>`), which is used to represent an item in a list.
///
/// The `ListItem` struct provides a type-safe way to create HTML list items for use within
/// ordered lists (`<ol>`), unordered lists (`<ul>`), or menus (`<menu>`).
///
/// ## Example
///
/// ```swift
/// ul {
///     li {
///         "First item"
///     }
///     li {
///         "Second item"
///     }
/// }
/// ```
///
/// ## Ordered List with Custom Value
///
/// ```swift
/// ol {
///     li(value: 3) {
///         "Third item"
///     }
///     li {
///         "Fourth item"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use list items only within appropriate parent elements (`<ul>`, `<ol>`, or `<menu>`)
/// - The `value` attribute only has meaning within ordered lists
/// - Use CSS for styling rather than deprecated attributes like `type`
///
public struct ListItem<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "li" }
    
    /// The ordinal value of the list item (only meaningful within `<ol>` elements).
    /// This integer attribute indicates the current ordinal value as defined by the
    /// parent `<ol>` element. List items that follow this one continue numbering from this value.
    public var value: Int?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new list item element with the specified value.
    ///
    /// - Parameters:
    ///   - value: The ordinal value of the list item (only meaningful within `<ol>` elements)
    ///   - content: The content of the list item
    public init(
        value: Int? = nil,
        content: @escaping () -> HTML
    ) {
        self.value = value
        self.content = content
    }
}

/// Lowercase typealias for creating ListItem elements with a more HTML-like syntax.
public typealias li = ListItem