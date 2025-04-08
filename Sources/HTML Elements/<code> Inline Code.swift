//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Code<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "code" }

    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias code = Code


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/code
 */
// <code>: The Inline Code element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <code>
// HTML
// element displays its contents styled in a fashion intended to indicate that the text is a short fragment of computer code. By default, the content text is displayed using the
// user agent's
// default monospace font.
// Try it
// <p>
//  The <code>push()</code> method adds one or more elements to the end of an
//  array and returns the new length of the array.
// </p>
// code {
//  background-color: #eee;
//  border-radius: 3px;
//  font-family: courier, monospace;
//  padding: 0 3px;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// A paragraph of text that includes
// <code>
// :
// html
// <p>
//  The function <code>selectAll()</code> highlights all the text in the input
//  field so the user can, for example, copy or delete the text.
// </p>
// Result
// Notes
// To represent multiple lines of code, wrap the
// <code>
// element within a
// <pre>
// element. The
// <code>
// element by itself only represents a single phrase of code or line of code.
// A CSS rule can be defined for the
// code
// selector to override the browser's default font face. Preferences set by the user might take precedence over the specified CSS.
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
// code
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
// the-code-element
// Browser compatibility
// See also
// <samp>
// <kbd>
// <var>
// <pre>