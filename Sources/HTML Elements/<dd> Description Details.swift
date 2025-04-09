///
/// <dd> Description Details.swift
/// swift-html
///
/// Represents the HTML description details element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML description details element (`<dd>`), which provides the description, definition, 
/// or value for the preceding term (`<dt>`) in a description list (`<dl>`).
///
/// The `DescriptionDetails` struct provides a type-safe way to create HTML description detail elements.
///
/// ## Example
///
/// ```swift
/// dl {
///     dt { "Beast of Bodmin" }
///     dd { "A large feline inhabiting Bodmin Moor." }
///     dt { "Morgawr" }
///     dd { "A sea serpent." }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always use `<dd>` elements within a `<dl>` (description list) element
/// - Each `<dd>` element should correspond to a preceding `<dt>` (description term) element
/// - A `<dt>` element may be followed by multiple `<dd>` elements if needed
/// - The end tag may be omitted if this element is immediately followed by another
///   `<dd>` element, a `<dt>` element, or if there is no more content in the parent element
///
public struct DescriptionDetails: Element {
    /// The HTML tag name
    public static var tag: String { "dd" }
    
    /// Creates a new DescriptionDetails element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating DescriptionDetails elements with a more HTML-like syntax.
public typealias dd = DescriptionDetails
