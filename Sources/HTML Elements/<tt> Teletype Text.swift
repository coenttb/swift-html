//<tt>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/tt
//
// <tt>: The Teletype Text element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <tt>
// HTML
// element creates inline text which is presented using the
// user agent's
// default monospace font face. This element was created for the purpose of rendering text as it would be displayed on a fixed-width display such as a teletype, text-only screen, or line printer.
// The terms
// non-proportional
// ,
// monotype
// , and
// monospace
// are used interchangeably and have the same general meaning: they describe a typeface whose characters are all the same number of pixels wide.
// This element is obsolete, however. You should use the more semantically helpful
// <code>
// ,
// <kbd>
// ,
// <samp>
// , or
// <var>
// elements for inline text that needs to be presented in monospace type, or the
// <pre>
// tag for content that should be presented as a separate block.
// Note:
// If none of the semantic elements are appropriate for your use case (for example, if you need to show some content in a non-proportional font), you should consider using the
// <span>
// element, styling it as desired using CSS. The
// font-family
// property is a good place to start.
// Attributes
// This element only includes the
// global attributes
// Examples
// Basic example
// This example uses
// <tt>
// to show text entered into, and output by, a terminal application.
// html
// <p>
//  Enter the following at the telnet command prompt:
//  <code>set localecho</code><br />
//  The telnet client should display: <tt>Local Echo is on</tt>
// </p>
// Result
// Overriding the default font
// You can override the browser's default fontâif the browser permits you to do so, which it isn't required to doâusing CSS:
// CSS
// css
// tt {
//  font-family: "Lucida Console", "Menlo", "Monaco", "Courier", monospace;
// }
// HTML
// html
// <p>
//  Enter the following at the telnet command prompt:
//  <code>set localecho</code><br />
//  The telnet client should display: <tt>Local Echo is on</tt>
// </p>
// Result
// Usage notes
// The
// <tt>
// element is, by default, rendered using the browser's default non-proportional font. You can override this using CSS by creating a rule using the
// tt
// selector, as seen in the example
// Overriding the default font
// above.
// Note:
// User-configured changes to the default monospace font setting may take precedence over your CSS.
// Although this element wasn't officially deprecated in HTML 4.01, its use was discouraged in favor of the semantic elements and/or CSS. The
// <tt>
// element is obsolete in HTML 5.
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
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// tt
// Browser compatibility
// See also
// The semantic
// <code>
// ,
// <var>
// ,
// <kbd>
// , and
// <samp>
// elements
// The
// <pre>
// element for displaying preformatted text blocks

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
