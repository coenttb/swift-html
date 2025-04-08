//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct DescriptionTerm<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dt" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias dt = DescriptionTerm


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dt
 */
// <dt>: The Description Term element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <dt>
// HTML
// element specifies a term in a description or definition list, and as such must be used inside a
// <dl>
// element. It is usually followed by a
// <dd>
// element; however, multiple
// <dt>
// elements in a row indicate several terms that are all defined by the immediate next
// <dd>
// element.
// The subsequent
// <dd>
// (
// Description Details
// ) element provides the definition or other related text associated with the term specified using
// <dt>
// .
// Try it
// <p>Please use the following paint colors for the new house:</p>
// <dl>
//  <dt>Denim (semigloss finish)</dt>
//  <dd>Ceiling</dd>
//  <dt>Denim (eggshell finish)</dt>
//  <dt>Evening Sky (eggshell finish)</dt>
//  <dd>Layered on the walls</dd>
// </dl>
// p,
// dl {
//  font:
//  1rem "Fira Sans",
//  sans-serif;
// }
// dl > dt {
//  font-weight: normal;
//  font-style: oblique;
// }
// dd {
//  margin-bottom: 1rem;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// For examples, see the
// examples provided for the
// <dl>
// element
// .
// Technical summary
// Content categories
// None.
// Permitted content
// Flow content
// , but with no
// <header>
// ,
// <footer>
// , sectioning content or heading content
//  descendants.
// Tag omission
// The start tag is required. The end tag may be omitted if this element is
//  immediately followed by another
// <dt>
// element or a
// <dd>
// element, or if there is no more content in
//  the parent element.
// Permitted parents
// A
// <dl>
// or (in
// WHATWG
// HTML,
// W3C
// HTML 5.2 and later) a
// <div>
// that is a child of a
// <dl>
// .
// This element can be used before a
// <dd>
// or another
// <dt>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// listitem
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
// the-dt-element
// Browser compatibility
// See also
// <dl>
// <dd>