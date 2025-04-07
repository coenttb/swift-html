///
/// <br> Line Break.swift
/// swift-html
///
/// Represents the HTML br element for line breaks.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML br element (`<br>`), which produces a line break in text (carriage-return).
///
/// The `BR` struct provides a type-safe way to create HTML line break elements. It is useful for
/// writing content where line breaks are semantically meaningful, such as in poetry or addresses.
///
/// ## Example
///
/// ```swift
/// p {
///     "First line"
///     br()
///     "Second line"
/// }
/// ```
///
/// ## Semantic Usage
///
/// The `<br>` element should only be used when the line break is part of the content's meaning,
/// such as in poetry or an address. Do not use `<br>` to create spacing between paragraphs;
/// instead, use CSS margin properties with appropriate elements like `<p>`.
///
/// - Note: When rendered, this generates an HTML `<br>` element, which creates a line break.
public struct BR: Element  {
    public static var tag: String { "br" }
    
    /// Creates a new BR element with the specified attributes.
    ///
    /// - Parameter attributes: Optional attributes for the br element.
    public init() { }
}

/// Lowercase typealias for creating BR elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `br` identifier when creating
/// HTML br elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// p {
///     "First line"
///     br()
///     "Second line"
/// }
/// ```
public typealias br = BR
