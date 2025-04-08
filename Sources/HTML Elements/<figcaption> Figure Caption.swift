//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct FigureCaption<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "figcaption" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias figcaption = FigureCaption


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figcaption
 */
// <figcaption>: The Figure Caption element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <figcaption>
// HTML
// element represents a caption or legend describing the rest of the contents of its parent
// <figure>
// element, providing the
// <figure>
// an
// accessible description
// .
// Try it
// <figure>
//  <img
//  src="/shared-assets/images/examples/elephant.jpg"
//  alt="Elephant at sunset" />
//  <figcaption>An elephant at sunset</figcaption>
// </figure>
// figure {
//  border: thin #c0c0c0 solid;
//  display: flex;
//  flex-flow: column;
//  padding: 5px;
//  max-width: 220px;
//  margin: auto;
// }
// img {
//  max-width: 220px;
//  max-height: 150px;
// }
// figcaption {
//  background-color: #222;
//  color: #fff;
//  font: italic smaller sans-serif;
//  padding: 3px;
//  text-align: center;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// Please see the
// <figure>
// page for examples on
// <figcaption>
// .
// Technical summary
// Content categories
// None.
// Permitted content
// Flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// A
// <figure>
// element; the
// <figcaption>
// element must be its first or last child.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// group
// ,
// none
// ,
// presentation
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-figcaption-element
// Browser compatibility
// See also
// The
// <figure>
// element.