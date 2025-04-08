//<ins>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ins
//
// <ins>: The Inserted Text element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <ins>
// HTML
// element represents a range of text that has been added to a document. You can use the
// <del>
// element to similarly represent a range of text that has been deleted from the document.
// Try it
// <p>&ldquo;You're late!&rdquo;</p>
// <del>
//  <p>&ldquo;I apologize for the delay.&rdquo;</p>
// </del>
// <ins cite="../how-to-be-a-wizard.html" datetime="2018-05">
//  <p>&ldquo;A wizard is never late &hellip;&rdquo;</p>
// </ins>
// del,
// ins {
//  display: block;
//  text-decoration: none;
//  position: relative;
// }
// del {
//  background-color: #fbb;
// }
// ins {
//  background-color: #d4fcbc;
// }
// del::before,
// ins::before {
//  position: absolute;
//  left: 0.5rem;
//  font-family: monospace;
// }
// del::before {
//  content: "â";
// }
// ins::before {
//  content: "+";
// }
// p {
//  margin: 0 1.8rem 0;
//  font-family: Georgia, serif;
//  font-size: 1rem;
// }
// Attributes
// This element includes the
// global attributes
// .
// cite
// This attribute defines the URI of a resource that explains the change, such as a link to meeting minutes or a ticket in a troubleshooting system.
// datetime
// This attribute indicates the time and date of the change and must be a valid date with an optional time string. If the value cannot be parsed as a date with an optional time string, the element does not have an associated timestamp. For the format of the string without a time, see
// Format of a valid date string
// . The format of the string if it includes both date and time is covered in
// Format of a valid local date and time string
// .
// Accessibility
// The presence of the
// <ins>
// element is not announced by most screen reading technology in its default configuration. It can be made to be announced by using the CSS
// content
// property, along with the
// ::before
// and
// ::after
// pseudo-elements.
// css
// ins::before,
// ins::after {
//  clip-path: inset(100%);
//  clip: rect(1px, 1px, 1px, 1px);
//  height: 1px;
//  overflow: hidden;
//  position: absolute;
//  white-space: nowrap;
//  width: 1px;
// }
// ins::before {
//  content: " [insertion start] ";
// }
// ins::after {
//  content: " [insertion end] ";
// }
// Some people who use screen readers deliberately disable announcing content that creates extra verbosity. Because of this, it is important to not abuse this technique and only apply it in situations where not knowing content has been inserted would adversely affect understanding.
// Short note on making your mark (more accessible) | The Paciello Group
// Tweaking Text Level Styles | Adrian Roselli
// Examples
// html
// <ins>This text has been inserted</ins>
// Result
// Technical summary
// Content categories
// Phrasing content
// ,
// flow content
// .
// Permitted content
// Transparent
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// insertion
// Permitted ARIA roles
// Any
// DOM interface
// HTMLModElement
// Specifications
// Specification
// HTML
// #
// the-ins-element
// Browser compatibility
// See also
// <del>
// element for marking deletion into a document

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
