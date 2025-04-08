//<hr>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/hr
//
// <hr>: The Thematic Break (Horizontal Rule) element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <hr>
// HTML
// element represents a thematic break between paragraph-level elements: for example, a change of scene in a story, or a shift of topic within a section.
// Try it
// <p>Â§1: The first rule of Fight Club is: You do not talk about Fight Club.</p>
// <hr />
// <p>Â§2: The second rule of Fight Club is: Always bring cupcakes.</p>
// hr {
//  border: none;
//  border-top: 3px double #333;
//  color: #333;
//  overflow: visible;
//  text-align: center;
//  height: 5px;
// }
// hr::after {
//  background: #fff;
//  content: "Â§";
//  padding: 0 4px;
//  position: relative;
//  top: -13px;
// }
// Historically, this has been presented as a horizontal rule or line. While it may still be displayed as a horizontal rule in visual browsers, this element is now defined in semantic terms, rather than presentational terms, so if you wish to draw a horizontal line, you should do so using appropriate CSS.
// Attributes
// This element's attributes include the
// global attributes
// .
// align
// Deprecated
// Non-standard
// Sets the alignment of the rule on the page. If no value is specified, the default value is
// left
// .
// color
// Deprecated
// Non-standard
// Sets the color of the rule through color name or hexadecimal value.
// noshade
// Deprecated
// Non-standard
// Sets the rule to have no shading.
// size
// Deprecated
// Non-standard
// Sets the height, in pixels, of the rule.
// width
// Deprecated
// Non-standard
// Sets the length of the rule on the page through a pixel or percentage value.
// Example
// HTML
// html
// <p>
//  This is the first paragraph of text. This is the first paragraph of text. This
//  is the first paragraph of text. This is the first paragraph of text.
// </p>
// <hr />
// <p>
//  This is the second paragraph of text. This is the second paragraph of text.
//  This is the second paragraph of text. This is the second paragraph of text.
// </p>
// Result
// Technical summary
// Content categories
// Flow content
// .
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// Any element that accepts
// flow content
// <select>
// element
// Implicit ARIA role
// separator
// Permitted ARIA roles
// presentation
// or
// none
// DOM interface
// HTMLHRElement
// Specifications
// Specification
// HTML
// #
// the-hr-element
// Browser compatibility
// See also
// <p>
// <hr>
// in
// <select>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
