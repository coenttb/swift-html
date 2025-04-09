///
/// <ul> Unordered List.swift
/// swift-html
///
/// Represents the HTML unordered list element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents an HTML unordered list element (`<ul>`), which is used to group a collection of items 
/// that do not have a numerical ordering, typically rendered as a bulleted list.
///
/// The `UnorderedList` struct provides a type-safe way to create HTML unordered lists with various attributes.
///
/// ## Example
///
/// Simple unordered list:
///
/// ```swift
/// ul {
///     li { "First item" }
///     li { "Second item" }
///     li { "Third item" }
/// }
/// ```
///
/// Nested lists:
///
/// ```swift
/// ul {
///     li { "First item" }
///     li {
///         "Second item"
///         ul {
///             li { "Second item first subitem" }
///             li { "Second item second subitem" }
///         }
///     }
///     li { "Third item" }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use unordered lists when the items' order doesn't affect their meaning
/// - Use ordered lists (`<ol>`) when the sequence of items is meaningful
/// - Lists can be nested to create hierarchical structures
/// - Avoid using deprecated attributes like `type` or `compact` - use CSS instead
/// - Use `list-style-type` in CSS to control bullet appearance
///
/// ## Accessibility Considerations
///
/// - Unordered lists have an implicit ARIA role of "list"
/// - Screen readers announce lists and their items, helping users navigate content structure
/// - When styling removes visual list markers, maintain the list structure for accessibility
///
/// ## Styling
///
/// Common CSS properties for styling unordered lists:
/// - `list-style-type`: Controls the bullet style (disc, circle, square, none)
/// - `list-style-position`: Sets whether bullets appear inside or outside the list item box
/// - `list-style-image`: Uses a custom image for bullets
/// - `margin` and `padding`: Control list indentation and spacing
///
public struct UnorderedList: Element {
    /// The HTML tag name
    public static var tag: String { "ul" }
    
    /// Creates a new UnorderedList element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating UnorderedList elements with a more HTML-like syntax.
public typealias ul = UnorderedList
