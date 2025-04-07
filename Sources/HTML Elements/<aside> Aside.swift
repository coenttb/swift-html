///
/// <aside> Aside.swift
/// swift-html
///
/// Represents the HTML aside element for content tangentially related to the main content.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML aside element (`<aside>`), which defines content that is indirectly
/// related to the main content of the document.
///
/// The `Aside` struct provides a type-safe way to create HTML aside elements that represent
/// sidebars, call-out boxes, or other supporting content that enhances but isn't essential
/// to the main content.
///
/// ## Example
///
/// ```swift
/// article {
///   paragraph { "The Disney movie The Little Mermaid was first released to theatres in 1989." }
///   
///   aside {
///     paragraph { "The movie earned $87 million during its initial release." }
///   }
///   
///   paragraph { "More info about the movie..." }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use for content that could be removed without reducing the meaning of the main content
/// - Do not use for parenthesized text that's part of the main flow
/// - Common uses include sidebars, pull quotes, advertising, and supplementary information
/// - Don't place aside elements inside `<address>` elements
/// - The aside element has an implicit ARIA role of "complementary"
///
/// - Note: When rendered, this generates an HTML `<aside>` element with the appropriate
///   attributes based on the configuration.
public struct Aside<HTML>: Element {
    public static var tag: String { "aside" }
    
    /// The content of the aside element, which can include any flow content.
    ///
    /// This should contain content that is tangentially related to the surrounding content
    /// but could be removed without diminishing the meaning of the main content.
    public var content: () -> HTML
    
    /// Creates a new Aside element with the specified content.
    ///
    /// - Parameter content: The content of the aside element, typically including supplementary information
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Aside elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `aside` identifier when creating
/// HTML aside elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// aside {
///   paragraph { "This is supplementary information that enhances the main content." }
/// }
/// ```
public typealias aside = Aside
