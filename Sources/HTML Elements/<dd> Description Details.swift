//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct DescriptionDetails<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dd" }

    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias dd = DescriptionDetails


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/dd
 */
// <dd>: The Description Details element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <dd>
// HTML
// element provides the description, definition, or value for the preceding term (
// <dt>
// ) in a description list (
// <dl>
// ).
// Try it
// <p>Cryptids of Cornwall:</p>
// <dl>
//  <dt>Beast of Bodmin</dt>
//  <dd>A large feline inhabiting Bodmin Moor.</dd>
//  <dt>Morgawr</dt>
//  <dd>A sea serpent.</dd>
//  <dt>Owlman</dt>
//  <dd>A giant owl-like creature.</dd>
// </dl>
// p,
// dt {
//  font-weight: bold;
// }
// dl,
// dd {
//  font-size: 0.9rem;
// }
// dd {
//  margin-bottom: 1em;
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
// .
// Tag omission
// The start tag is required. The end tag may be omitted if this element is
//  immediately followed by another
// <dd>
// element or a
// <dt>
// element, or if there is no more content in
//  the parent element.
// Permitted parents
// A
// <dl>
// or a
// <div>
// that is a child of a
// <dl>
// .
// This element can be used after a
// <dt>
// or another
// <dd>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-dd-element
// Browser compatibility
// See also
// <dl>
// <dt>