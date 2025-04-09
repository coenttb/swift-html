///
/// <div> Content Division.swift
/// swift-html
///
/// Represents the HTML div element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML div element (`<div>`), which is the generic container for flow content.
///
/// The `ContentDivision` struct provides a type-safe way to create HTML div elements.
/// The div element has no effect on the content or layout until styled using CSS.
///
/// ## Example
///
/// ```swift
/// div {
///     p {
///         "Any kind of content here. Such as paragraphs, tables, etc."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use the `<div>` element only when no other semantic element (such as `<article>` or `<nav>`) is appropriate
/// - Use CSS properties or techniques such as CSS Grid or CSS Flexbox to align and position `<div>` elements on the page
/// - Apply styles using the `class` or `id` attributes
///
/// ## Accessibility
///
/// The `<div>` element has an implicit ARIA role of "generic", not "none". This may affect certain 
/// ARIA combination declarations that expect a direct descendant element with a certain role to function properly.
///
public struct ContentDivision<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "div" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new ContentDivision element.
    ///
    /// - Parameter content: The content of the div element
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Typealias for creating ContentDivision elements.
public typealias Div = ContentDivision

/// Lowercase typealias for creating ContentDivision elements with a more HTML-like syntax.
public typealias div = Div