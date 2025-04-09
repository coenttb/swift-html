///
/// <figure> Figure with Optional Caption.swift
/// swift-html
///
/// Represents the HTML figure element with an optional caption.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents an HTML figure element (`<figure>`), which represents self-contained content, 
/// potentially with an optional caption.
///
/// The `Figure` struct provides a type-safe way to create HTML figure elements with content
/// such as images, illustrations, diagrams, code snippets, etc., that are referenced in the 
/// main flow of a document, but can be moved to another part of the document without affecting the main flow.
///
/// ## Examples
///
/// ```swift
/// // Figure with an image
/// figure {
///     img(src: "image.jpg", alt: "Description")
/// }
/// 
/// // Figure with an image and caption
/// figure {
///     img(src: "image.jpg", alt: "Description")
///     figcaption {
///         "This is a caption"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Add a `<figcaption>` element as either first or last child to provide a caption
/// - The caption provides the accessible name for the figure
/// - Typically used for images, illustrations, diagrams, code snippets, etc.
/// - Can be moved to another part of the document without affecting the main flow
///
public struct Figure: Element {
    /// The HTML tag name
    public static var tag: String { "figure" }
    
    /// Creates a new Figure element with the specified content.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Figure elements with a more HTML-like syntax.
public typealias figure = Figure
