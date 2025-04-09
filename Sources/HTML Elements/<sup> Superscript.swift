///
/// <sup> Superscript.swift
/// swift-html
///
/// Represents the HTML <sup> element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML superscript element (`<sup>`), which specifies inline text 
/// to be displayed as superscript for typographical reasons.
///
/// Superscripts are usually rendered with a raised baseline using smaller text.
///
/// ## Example
///
/// ```swift
/// sup {
///     "2"
/// }
/// ```
///
/// ## Usage Notes
///
/// The superscript element should only be used for typographical reasons—that is, 
/// to change the position of the text to comply with typographical conventions 
/// or standards, rather than solely for presentation or appearance purposes.
///
/// Appropriate use cases include:
/// - Displaying exponents, such as "x³"
/// - Displaying superior lettering for abbreviations (e.g., in French "Mlle")
/// - Representing ordinal numbers, such as "4th" instead of "fourth"
///
/// For purely presentational superscript, consider using CSS `vertical-align: super` instead.
///
public struct Superscript: Element {
    /// The HTML tag name
    public static var tag: String { "sup" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new superscript element.
    ///
    /// - Parameter content: The content of the element
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Superscript elements with a more HTML-like syntax.
public typealias sup = Superscript
