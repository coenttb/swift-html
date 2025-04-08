///
/// <bdo> Bidirectional Text Override.swift
/// swift-html
///
/// Represents the HTML bidirectional text override element.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML bidirectional text override element (`<bdo>`), which explicitly overrides
/// the bidirectional algorithm to set the direction of text rendering.
///
/// The `BidirectionalTextOverride` struct provides a type-safe way to create HTML bidirectional 
/// text override elements. This element requires a `dir` attribute to specify the text direction.
///
/// ## Example
///
/// ```swift
/// bdo(dir: .rtl) {
///     "This text will display right-to-left."
/// }
/// ```
///
/// ## Directionality Options
///
/// - `.ltr`: Left-to-right text direction (default for most languages)
/// - `.rtl`: Right-to-left text direction (for languages like Arabic, Hebrew, etc.)
///
/// ## Use Cases
///
/// - Displaying text in a direction opposite to the natural language direction
/// - Demonstrating or displaying bidirectional text features
/// - Fixing incorrectly displayed text in multilingual content
///
/// ## Behavior
///
/// The `<bdo>` element overrides the browser's bidirectional algorithm, forcing text to render
/// in the specified direction. The characters themselves are not reversed; only the order in which
/// they appear is changed.
///
/// - Note: When rendered, this generates an HTML `<bdo>` element that overrides the default
///   text direction for its content.
public struct BidirectionalTextOverride<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "bdo" }
    
    /// The content of the bidirectional text override element
    public let content: () -> HTML
    
    /// Creates a new BidirectionalTextOverride element with the specified direction and content.
    ///
    /// - Parameters:
    ///   - content: The content to be rendered with the specified direction
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating BidirectionalTextOverride elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `bdo` identifier when creating
/// HTML bidirectional text override elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// bdo(dir: .rtl) {
///     "This text will display right-to-left."
/// }
/// ```
public typealias bdo = BidirectionalTextOverride


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdo
 */
// <bdo>: The Bidirectional Text Override element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <bdo>
// HTML
// element overrides the current directionality of text, so that the text within is rendered in a different direction.
// Try it
// <h1>Famous seaside songs</h1>
// <p>The English song "Oh I do like to be beside the seaside"</p>
// <p>
//  Looks like this in Hebrew:
//  <span dir="rtl">××, ×× × ×××× ×××××ª ××× ×××£ ×××</span>
// </p>
// <p>
//  In the computer's memory, this is stored as
//  <bdo dir="ltr">××, ×× × ×××× ×××××ª ××× ×××£ ×××</bdo>
// </p>
// html {
//  font-family: sans-serif;
// }
// bdo {
//  /* Add your styles here */
// }
// The text's characters are drawn from the starting point in the given direction; the individual characters' orientation is not affected (so characters don't get drawn backward, for example).
// Attributes
// This element's attributes include the
// global attributes
// .
// dir
// The direction in which text should be rendered in this element's contents. Possible values are:
// ltr
// : Indicates that the text should go in a left-to-right direction.
// rtl
// : Indicates that the text should go in a right-to-left direction.
// Examples
// html
// <!-- Switch text direction -->
// <p>This text will go left to right.</p>
// <p><bdo dir="rtl">This text will go right to left.</bdo></p>
// Result
// Notes
// The HTML 4 specification did not specify events for this element; they were added in XHTML. This is most likely an oversight.
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
// Up to Gecko 1.9.2 (Firefox 4)
//  inclusive, Firefox implements the
// HTMLSpanElement
// interface for this element.
// Specifications
// Specification
// HTML
// #
// the-bdo-element
// Browser compatibility
// See also
// Related HTML element:
// <bdi>