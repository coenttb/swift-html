///
/// <b> Bring Attention To.swift
/// swift-html
///
/// Represents the HTML b element for bringing attention to text.
///
/// Created by Claude on 04/06/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML b element (`<b>`), which is used to draw attention to text without conveying
/// extra importance or emphasis.
///
/// The `B` struct provides a type-safe way to create HTML bold text elements. Note that this
/// element should be used for stylistic purposes only, not to indicate importance or emphasis
/// (use `<strong>` or `<em>` for that).
///
/// ## Example
///
/// ```swift
/// b {
///     "This text will appear bold but does not have semantic importance."
/// }
/// ```
///
/// ## Semantic Usage
///
/// The `<b>` element should be used in cases where other elements like `<strong>`, `<em>`,
/// `<mark>`, or `<span>` are not more appropriate:
///
/// - Use `<strong>` for text with strong importance
/// - Use `<em>` for text with emphatic stress
/// - Use `<mark>` for text with marking/highlighting relevance
/// - Use `<span>` with CSS for pure styling purposes
///
/// Appropriate use cases for `<b>` include:
/// - Keywords in a document
/// - Product names in a review
/// - Actionable words in interactive text-based software
/// - Article leads or summaries
///
/// - Note: When rendered, this generates an HTML `<b>` element with bold styling but no
///   additional semantic weight beyond bringing attention to the text.
public struct B<HTML>: Element {
    public static var tag: String { "b" }
    
    /// The content of the b element, which can include text and other elements.
    public var content: () -> HTML
    
    /// Creates a new B element with the specified content.
    ///
    /// - Parameter content: The content to be rendered inside the b element.
    public init(content: @escaping () -> HTML) {
        self.content = content
    }
}

/// Lowercase typealias for creating B elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `b` identifier when creating
/// HTML b elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// b {
///     "This text is bold but semantically neutral."
/// }
/// ```
public typealias b = B


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/b
 */
// <b>: The Bring Attention To element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <b>
// HTML
// element is used to draw the reader's attention to the element's contents, which are not otherwise granted special importance. This was formerly known as the Boldface element, and most browsers still draw the text in boldface. However, you should not use
// <b>
// for styling text or granting importance. If you wish to create boldface text, you should use the CSS
// font-weight
// property. If you wish to indicate an element is of special importance, you should use the
// <strong>
// element.
// Try it
// <p>
//  The two most popular science courses offered by the school are
//  <b class="term">chemistry</b> (the study of chemicals and the composition of
//  substances) and <b class="term">physics</b> (the study of the nature and
//  properties of matter and energy).
// </p>
// b {
//  /* Add your styles here */
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Use the
// <b>
// for cases like keywords in a summary, product names in a review, or other spans of text whose typical presentation would be boldfaced (but not including any special importance).
// Do not confuse the
// <b>
// element with the
// <strong>
// ,
// <em>
// , or
// <mark>
// elements. The
// <strong>
// element represents text of certain
// importance
// ,
// <em>
// puts some emphasis on the text and the
// <mark>
// element represents text of certain
// relevance
// . The
// <b>
// element doesn't convey such special semantic information; use it only when no others fit.
// Similarly, do not mark titles and headings using the
// <b>
// element. For this purpose, use the
// h1
// to
// h6
// tags. Further, stylesheets can change the default style of these elements, with the result that they are not
// necessarily
// displayed in bold.
// It is a good practice to use the
// class
// attribute on the
// <b>
// element in order to convey additional semantic information as needed (for example
// <b class="lead">
// for the first sentence in a paragraph). This makes it easier to manage multiple use cases of
// <b>
// if your stylistic needs change, without the need to change all of its uses in the HTML.
// Historically, the
// <b>
// element was meant to make text boldface. Styling information has been deprecated since HTML4, so the meaning of the
// <b>
// element has been changed.
// If there is no semantic purpose to using the
// <b>
// element, you should use the CSS
// font-weight
// property with the value
// "bold"
// instead in order to make text bold.
// Examples
// html
// <p>
//  This article describes several <b class="keywords">text-level</b> elements. It
//  explains their usage in an <b class="keywords">HTML</b> document.
// </p>
// Keywords are displayed with the default style of the
// <b>element, likely in bold.</b>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// generic
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-b-element
// Browser compatibility
// See also
// Other elements conveying text-level semantics:
// <a>
// ,
// <em>
// ,
// <strong>
// ,
// <small>
// ,
// <cite>
// ,
// <q>
// ,
// <dfn>
// ,
// <abbr>
// ,
// <time>
// ,
// <code>
// ,
// <var>
// ,
// <samp>
// ,
// <kbd>
// ,
// <sub>
// ,
// <sup>
// ,
// <i>
// ,
// <mark>
// ,
// <ruby>
// ,
// <rp>
// ,
// <rt>
// ,
// <bdo>
// ,
// <span>
// ,
// <br>
// ,
// <wbr>
// .
// Using <b> and <i> elements (W3C)