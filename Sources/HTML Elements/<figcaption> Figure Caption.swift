///
/// <figcaption> Figure Caption.swift
/// swift-html
///
/// Represents the HTML figure caption element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML figure caption element (`<figcaption>`), which provides a caption or legend describing the contents of its 
/// parent `<figure>` element, giving the figure an accessible description.
///
/// The `FigureCaption` struct provides a type-safe way to create HTML figure caption elements.
///
/// ## Example
///
/// ```swift
/// figure {
///     img(src: "/images/elephant.jpg", alt: "Elephant at sunset")
///     figcaption {
///         "An elephant at sunset"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - A `<figcaption>` must be either the first or last child of its parent `<figure>` element
/// - Use `<figcaption>` to provide an accessible description for the figure content
/// - Only include one `<figcaption>` per `<figure>` element
///
public struct FigureCaption: Element {
    /// The HTML tag name
    public static var tag: String { "figcaption" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new FigureCaption element.
    ///
    /// - Parameter content: The content of the figure caption
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating FigureCaption elements with a more HTML-like syntax.
public typealias figcaption = FigureCaption
