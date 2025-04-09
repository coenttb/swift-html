///
/// <span> Content Span.swift
/// swift-html
///
/// Represents the HTML span element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML span element (`<span>`), which is a generic inline container
/// for phrasing content that doesn't inherently represent anything specific.
///
/// The `ContentSpan` struct provides a type-safe way to create HTML span elements.
/// Spans are typically used to group elements for styling purposes (using class or id attributes),
/// or because they share attribute values.
///
/// ## Example
///
/// ```swift
/// span {
///     "Some text"
/// }
/// ```
///
/// ```swift
/// span {
///     a(href: "portfolio.html", target: "_blank") {
///         "See my portfolio"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use span only when no other semantic element is appropriate
/// - Unlike `div` (which is block-level), span is an inline-level element
/// - Commonly used with CSS classes to apply styling to portions of text
///
public struct ContentSpan: Element {
    /// The HTML tag name
    public static var tag: String { "span" }
    
    /// Creates a new span element with the specified attributes.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating span elements with a more HTML-like syntax.
public typealias span = ContentSpan


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/span
 */
// <span>: The Content Span element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <span>
// HTML
// element is a generic inline container for phrasing content, which does not inherently represent anything. It can be used to group elements for styling purposes (using the
// class
// or
// id
// attributes), or because they share attribute values, such as
// lang
// . It should be used only when no other semantic element is appropriate.
// <span>
// is very much like a
// <div>
// element, but
// <div>
// is a
// block-level element
// whereas a
// <span>
// is an
// inline-level element
// .
// Try it
// <p>
//  Add the <span class="ingredient">basil</span>,
//  <span class="ingredient">pine nuts</span> and
//  <span class="ingredient">garlic</span> to a blender and blend into a paste.
// </p>
// <p>
//  Gradually add the <span class="ingredient">olive oil</span> while running the
//  blender slowly.
// </p>
// span.ingredient {
//  color: #f00;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Example
// Example 1
// HTML
// html
// <p><span>Some text</span></p>
// Result
// Example 2
// HTML
// html
// <li>
//  <span>
//  <a href="portfolio.html" target="_blank">See my portfolio</a>
//  </span>
// </li>
// CSS
// css
// li span {
//  background: gold;
// }
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// .
// Permitted content
// Phrasing content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// , or any element that accepts
// flow content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// Any
// DOM interface
// HTMLSpanElement
// Specifications
// Specification
// HTML
// #
// the-span-element
// Browser compatibility
// See also
// HTML
// <div>
// element
