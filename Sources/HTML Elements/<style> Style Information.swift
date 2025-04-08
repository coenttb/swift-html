//<style>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/style
//
// <style>: The Style Information element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <style>
// HTML
// element contains style information for a document, or part of a document. It contains CSS, which is applied to the contents of the document containing the
// <style>
// element.
// Try it
// <style>
//  p {
//  color: #26b72b;
//  }
//  code {
//  font-weight: bold;
//  }
// </style>
// <p>
//  This text will be green. Inline styles take precedence over CSS included
//  externally.
// </p>
// <p style="color: blue">
//  The <code>style</code> attribute can override it, though.
// </p>
// p {
//  color: #f00;
// }
// The
// <style>
// element must be included inside the
// <head>
// of the document. In general, it is better to put your styles in external stylesheets and apply them using
// <link>
// elements.
// If you include multiple
// <style>
// and
// <link>
// elements in your document, they will be applied to the DOM in the order they are included in the document â make sure you include them in the correct order, to avoid unexpected cascade issues.
// In the same manner as
// <link>
// elements,
// <style>
// elements can include
// media
// attributes that contain
// media queries
// , allowing you to selectively apply internal stylesheets to your document depending on media features such as viewport width.
// Attributes
// This element includes the
// global attributes
// .
// blocking
// This attribute explicitly indicates that certain operations should be blocked on the fetching of critical subresources.
// @import
// -ed stylesheets are generally considered as critical subresources, whereas
// background-image
// and fonts are not. The operations that are to be blocked must be a space-separated list of blocking tokens listed below.
// render
// : The rendering of content on the screen is blocked.
// media
// This attribute defines which media the style should be applied to. Its value is a
// media query
// , which defaults to
// all
// if the attribute is missing.
// nonce
// A cryptographic nonce (number used once) used to allow inline styles in a
// style-src Content-Security-Policy
// . The server must generate a unique nonce value each time it transmits a policy. It is critical to provide a nonce that cannot be guessed as bypassing a resource's policy is otherwise trivial.
// title
// This attribute specifies
// alternative style sheet
// sets.
// Deprecated attributes
// type
// Deprecated
// This attribute should not be provided: if it is, the only permitted values are the empty string or a case-insensitive match for
// text/css
// .
// Examples
// A basic stylesheet
// In the following example, we apply a short stylesheet to a document:
// html
// <!doctype html>
// <html lang="en-US">
//  <head>
//  <meta charset="UTF-8" />
//  <title>Test page</title>
//  <style>
//  p {
//  color: red;
//  }
//  </style>
//  </head>
//  <body>
//  <p>This is my paragraph.</p>
//  </body>
// </html>
// Result
// Multiple style elements
// In this example we've included two
// <style>
// elements â notice how the conflicting declarations in the later
// <style>
// element override those in the earlier one, if they have equal
// specificity
// .
// html
// <!doctype html>
// <html lang="en-US">
//  <head>
//  <meta charset="UTF-8" />
//  <title>Test page</title>
//  <style>
//  p {
//  color: white;
//  background-color: blue;
//  padding: 5px;
//  border: 1px solid black;
//  }
//  </style>
//  <style>
//  p {
//  color: blue;
//  background-color: yellow;
//  }
//  </style>
//  </head>
//  <body>
//  <p>This is my paragraph.</p>
//  </body>
// </html>
// Result
// Including a media query
// In this example we build on the previous one, including a
// media
// attribute on the second
// <style>
// element so it is only applied when the viewport is less than 500px in width.
// html
// <!doctype html>
// <html lang="en-US">
//  <head>
//  <meta charset="UTF-8" />
//  <title>Test page</title>
//  <style>
//  p {
//  color: white;
//  background-color: blue;
//  padding: 5px;
//  border: 1px solid black;
//  }
//  </style>
//  <style media="all and (max-width: 500px)">
//  p {
//  color: blue;
//  background-color: yellow;
//  }
//  </style>
//  </head>
//  <body>
//  <p>This is my paragraph.</p>
//  </body>
// </html>
// Result
// Technical summary
// Content categories
// Metadata content
// .
// Permitted content
// Text content matching the
// type
// attribute, that is
// text/css
// .
// Tag omission
// Neither tag is omissible.
// Permitted parents
// Any element that accepts
// metadata content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLStyleElement
// Specifications
// Specification
// HTML
// #
// the-style-element
// Browser compatibility
// See also
// The
// <link>
// element, which allows us to apply external stylesheets to a document.
// Alternative Style Sheets

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
