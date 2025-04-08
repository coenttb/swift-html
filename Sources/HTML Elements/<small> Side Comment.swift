//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Small<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "small" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias small = Small


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/small
 */
// <small>: the side comment element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <small>
// HTML
// element represents side-comments and small print, like copyright and legal text, independent of its styled presentation. By default, it renders text within it one font-size smaller, such as from
// small
// to
// x-small
// .
// Try it
// <p>
//  MDN Web Docs is a learning platform for Web technologies and the software that
//  powers the Web.
// </p>
// <hr />
// <p>
//  <small
//  >The content is licensed under a Creative Commons Attribution-ShareAlike 2.5
//  Generic License.</small
//  >
// </p>
// small {
//  font-size: 0.7em;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// Basic usage
// html
// <p>
//  This is the first sentence.
//  <small>This whole sentence is in small letters.</small>
// </p>
// Result
// CSS alternative
// html
// <p>
//  This is the first sentence.
//  <span style="font-size:0.8em">This whole sentence is in small letters.</span>
// </p>
// Result
// Notes
// Although the
// <small>
// element, like the
// <b>
// and
// <i>
// elements, may be perceived to violate the principle of separation between structure and presentation, all three are valid in HTML. Authors are encouraged to use their best judgement when determining whether to use
// <small>
// or CSS.
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// .
// Permitted content
// Phrasing content
// Tag omission
// None; must have both a start tag and an end tag.
// Permitted parents
// Any element that accepts
// phrasing content
// , or any element that accepts
// flow content
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
// the-small-element
// Browser compatibility
// See also
// <b>
// <sub>
// and
// <sup>
// <font>
// <style>
// HTML 4.01 Specification:
// Font Styles