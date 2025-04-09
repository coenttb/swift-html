///
/// <frameset> Frameset.swift
/// swift-html
///
/// Represents the HTML frameset element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML frameset element (`<frameset>`), which is used to contain `<frame>` elements.
///
/// The `Frameset` struct provides a type-safe way to create HTML frameset elements with various attributes.
/// 
/// > Note: This element is deprecated. Modern websites should use `<iframe>` instead.
///
/// ## Example
///
/// ```swift
/// frameset(cols: "50%, 50%") {
///     frame(src: "https://example.com/page1")
///     frame(src: "https://example.com/page2")
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using frameset in modern web development as it's deprecated
/// - Use `<iframe>` instead for embedding content
/// - A frameset document has a `<frameset>` element instead of a `<body>` element
///
public struct Frameset: Element {
    /// The HTML tag name
    public static var tag: String { "frameset" }
    
    /// Specifies the number and size of horizontal spaces in a frameset
    public var cols: String?
    
    /// Specifies the number and size of vertical spaces in a frameset
    public var rows: String?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Frameset element with the specified attributes.
    ///
    /// - Parameters:
    ///   - cols: Specifies the number and size of horizontal spaces in a frameset
    ///   - rows: Specifies the number and size of vertical spaces in a frameset
    ///   - content: The content of the element (typically `<frame>` elements)
    public init(
        cols: String? = nil,
        rows: String? = nil,
        
    ) {
        self.cols = cols
        self.rows = rows
        
    }
}

/// Lowercase typealias for creating Frameset elements with a more HTML-like syntax.
public typealias frameset = Frameset
