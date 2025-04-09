//
// <u> Unarticulated Annotation (Underline).swift
// swift-html
//
// Represents the HTML <u> element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML unarticulated annotation element (`<u>`), which indicates text that should 
/// be rendered in a way that indicates it has a non-textual annotation.
///
/// The `UnarticulatedAnnotation` struct provides a type-safe way to create HTML `<u>` elements.
/// By default, this element renders as a solid underline, but can be styled using CSS.
///
/// ## Example
///
/// ```swift
/// u {
///     "This text appears with an underline"
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using the `<u>` element with its default styling (underlined text) in a way that could be confused with hyperlinks
/// - Valid use cases include annotating spelling errors, applying proper name marks in Chinese text, and other forms of annotation
/// - Do NOT use `<u>` to underline text for presentation purposes or to denote book titles
/// - Consider using more appropriate semantic elements:
///   - `<em>` for stress emphasis
///   - `<b>` to draw attention to text
///   - `<mark>` to mark key words or phrases  
///   - `<strong>` to indicate that text has strong importance
///   - `<cite>` to mark titles of books or other publications
///   - `<i>` for technical terms, transliterations, thoughts, or vessel names
/// - For non-semantic underlining, use CSS `text-decoration: underline` with a `<span>` element instead
///
public struct UnarticulatedAnnotation: Element {
    /// The HTML tag name
    public static var tag: String { "u" }
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new UnarticulatedAnnotation element.
    ///
    /// - Parameter content: The content of the element
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating UnarticulatedAnnotation elements with a more HTML-like syntax.
public typealias u = UnarticulatedAnnotation

/// Alternative lowercase typealias for creating UnarticulatedAnnotation elements.
public typealias underline = UnarticulatedAnnotation
