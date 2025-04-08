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

public struct BlockQuote<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "blockquote" }
    
    public var cite: HTML_Attributes.Cite?
    
    /// The content of the bidirectional text override element
    public let content: () -> HTML
    
    /// Creates a new BlockQuote element with the specified direction and content.
    ///
    /// - Parameters:
    ///   - content: The content to be rendered with the specified direction
    public init(
        cite: HTML_Attributes.Cite? = nil,
        content: @escaping () -> HTML
    ) {
        self.cite = cite
        self.content = content
    }
}

/// Lowercase typealias for creating BlockQuote elements with a more HTML-like syntax.
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
public typealias blockquote = BlockQuote


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/blockquote
 */
// <blockquote>: The Block Quotation element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <blockquote>
// HTML
// element indicates that the enclosed text is an extended quotation. Usually, this is rendered visually by indentation (see
// Notes
// for how to change it). A URL for the source of the quotation may be given using the
// cite
// attribute, while a text representation of the source can be given using the
// <cite>
// element.
// Try it
// <div>
//  <blockquote cite="https://www.huxley.net/bnw/four.html">
//  <p>
//  Words can be like X-rays, if you use them properlyâtheyâll go through
//  anything. You read and youâre pierced.
//  </p>
//  </blockquote>
//  <p>âAldous Huxley, <cite>Brave New World</cite></p>
// </div>
// div:has(> blockquote) {
//  background-color: #ededed;
//  margin: 10px auto;
//  padding: 15px;
//  border-radius: 5px;
// }
// blockquote p::before {
//  content: "\201C";
// }
// blockquote p::after {
//  content: "\201D";
// }
// blockquote + p {
//  text-align: right;
// }
// Attributes
// This element's attributes include the
// global attributes
// .
// cite
// A URL that designates a source document or message for the information quoted. This attribute is intended to point to information explaining the context or the reference for the quote.
// Usage notes
// According to the specification, attribution for the quotation, if any, must be placed outside the
// <blockquote>
// element.
// To change the indentation applied to the quoted text, use the
// CSS
// margin-left
// and/or
// margin-right
// properties, or the
// margin
// shorthand property.
// To include shorter quotes inline rather than in a separate block, use the
// <q>
// (Quotation) element.
// Examples
// This example demonstrates the use of the
// <blockquote>
// element to quote a passage from
// RFC 1149
// ,
// A Standard for the Transmission of IP Datagrams on Avian Carriers
// .
// html
// <blockquote cite="https://datatracker.ietf.org/doc/html/rfc1149">
//  <p>
//  Avian carriers can provide high delay, low throughput, and low altitude
//  service. The connection topology is limited to a single point-to-point path
//  for each carrier, used with standard carriers, but many carriers can be used
//  without significant interference with each other, outside early spring. This
//  is because of the 3D ether space available to the carriers, in contrast to
//  the 1D ether used by IEEE802.3. The carriers have an intrinsic collision
//  avoidance system, which increases availability.
//  </p>
// </blockquote>
// Result
// Technical summary
// Content categories
// Flow content
// , sectioning root, palpable content.
// Permitted content
// Flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// blockquote
// Permitted ARIA roles
// Any
// DOM interface
// HTMLQuoteElement
// Specifications
// Specification
// HTML
// #
// the-blockquote-element
// Browser compatibility
// See also
// The
// <q>
// element for inline quotations.
// The
// <cite>
// element for source citations.
// The blockquote element
// via heydonworks.com (2024)