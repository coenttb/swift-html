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
/// ## Accessibility Considerations
///
/// Creating separate paragraphs of text using multiple `<br>` elements is problematic for people who 
/// navigate with screen reading technology. Screen readers may announce the presence of the element, 
/// but not any content contained within `<br>` elements. Use `<p>` elements and CSS properties like 
/// `margin` to control paragraph spacing instead.
///
/// ## Semantic Usage
///
/// The `<br>` element should only be used when the line break is part of the content's meaning,
/// such as in poetry or an address. Do not use `<br>` to create spacing between paragraphs;
/// instead, use CSS margin properties with appropriate elements like `<p>`.
///
/// ## Best Practices
///
/// - Use only for line breaks within content where the breaks are semantically meaningful
/// - Use for poetry, addresses, or similar content where line divisions matter
/// - Don't use to create margins between paragraphs
/// - Don't use multiple `<br>` elements for spacing; use CSS instead
/// - Don't set margins on `<br>` elements; use the `line-height` property instead
///
/// - Note: The `<br>` element is a void element and does not have a closing tag.
public struct BR: Element {
    /// The HTML tag name
    public static var tag: String { "br" }
    
    /// Creates a new BR element.
    ///
    /// Since the `<br>` element is a void element with no attributes beyond global ones,
    /// this initializer takes no parameters.
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