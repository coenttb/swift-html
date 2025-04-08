//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Map<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "map" }
    
    public var name: Name?
    public let content: () -> HTML
    
    public init(
        name: Name? = nil,
        content: @escaping () -> HTML
    ) {
        self.name = name
        self.content = content
    }
}

public typealias map = Map


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/map
 */
// <map>: The Image Map element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <map>
// HTML
// element is used with
// <area>
// elements to define an image map (a clickable link area).
// Try it
// <map name="infographic">
//  <area
//  shape="poly"
//  coords="130,147,200,107,254,219,130,228"
//  href="https://developer.mozilla.org/docs/Web/HTML"
//  alt="HTML" />
//  <area
//  shape="poly"
//  coords="130,147,130,228,6,219,59,107"
//  href="https://developer.mozilla.org/docs/Web/CSS"
//  alt="CSS" />
//  <area
//  shape="poly"
//  coords="130,147,200,107,130,4,59,107"
//  href="https://developer.mozilla.org/docs/Web/JavaScript"
//  alt="JavaScript" />
// </map>
// <img
//  usemap="#infographic"
//  src="/shared-assets/images/examples/mdn-info2.png"
//  alt="MDN infographic" />
// img {
//  display: block;
//  margin: 0 auto;
//  width: 260px;
//  height: 232px;
// }
// Attributes
// This element includes the
// global attributes
// .
// name
// The
// name
// attribute gives the map a name so that it can be referenced. The attribute must be present and must have a non-empty value with no space characters. The value of the
// name
// attribute must not be equal to the value of the
// name
// attribute of another
// <map>
// element in the same document. If the
// id
// attribute is also specified, both attributes must have the same value.
// Examples
// Image map with two areas
// Click the left-hand parrot for JavaScript, or the right-hand parrot for CSS.
// HTML
// html
// <!-- Photo by Juliana e Mariana Amorim on Unsplash -->
// <map name="primary">
//  <area
//  shape="circle"
//  coords="75,75,75"
//  href="https://developer.mozilla.org/docs/Web/JavaScript"
//  target="_blank"
//  alt="JavaScript" />
//  <area
//  shape="circle"
//  coords="275,75,75"
//  href="https://developer.mozilla.org/docs/Web/CSS"
//  target="_blank"
//  alt="CSS" />
// </map>
// <img
//  usemap="#primary"
//  src="parrots.jpg"
//  alt="350 x 150 picture of two parrots" />
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , palpable content.
// Permitted content
// Any
// transparent
// element.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLMapElement
// Specifications
// Specification
// HTML
// #
// the-map-element
// Browser compatibility
// See also
// <a>
// <area>