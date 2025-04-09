///
/// <hgroup> Heading Group.swift
/// swift-html
///
/// Represents the HTML heading group element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML heading group element (`<hgroup>`), which groups a heading with 
/// related content such as subheadings, alternative titles, or taglines.
///
/// The `HeadingGroup` struct provides a type-safe way to create HTML heading group elements.
///
/// ## Example
///
/// ```swift
/// hgroup {
///     h1 {
///         "Frankenstein"
///     }
///     p {
///         "Or: The Modern Prometheus"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<hgroup>` to associate a heading with secondary content like subheadings or taglines
/// - Include exactly one heading element (`<h1>` through `<h6>`) within the `<hgroup>`
/// - Use `<p>` elements for the secondary content
/// - Note that only the heading element contributes to the document outline
/// - The `<hgroup>` has an implicit ARIA role of "group"
///
public struct HeadingGroup: Element {
    /// The HTML tag name
    public static var tag: String { "hgroup" }
    
    /// Creates a new HeadingGroup element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating HeadingGroup elements with a more HTML-like syntax.
public typealias hgroup = HeadingGroup
