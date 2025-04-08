//<big>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/big
//
// <big>: The Bigger Text element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <big>
// HTML
// deprecated element renders the enclosed text at a font size one level larger than the surrounding text (
// medium
// becomes
// large
// , for example). The size is capped at the browser's maximum permitted font size.
// Warning:
// This element has been removed from the specification and shouldn't be used anymore. Use the CSS
// font-size
// property to adjust the font size.
// Attributes
// This element has no other attributes than the
// global attributes
// , common to all elements.
// Examples
// Here we see examples showing the use of
// <big>
// followed by an example showing how to accomplish the same results using modern CSS syntax instead.
// Using big
// This example uses the obsolete
// <big>
// element to increase the size of some text.
// HTML
// html
// <p>
//  This is the first sentence.
//  <big>This whole sentence is in bigger letters.</big>
// </p>
// Result
// Using CSS
// font-size
// This example uses the CSS
// font-size
// property to increase the font size by one level.
// CSS
// css
// .bigger {
//  font-size: larger;
// }
// HTML
// html
// <p>
//  This is the first sentence.
//  <span class="bigger">This whole sentence is in bigger letters.</span>
// </p>
// Result
// DOM interface
// This element implements the
// HTMLElement
// interface.
// Specifications
// Specification
// HTML
// #
// big
// Browser compatibility
// See also
// CSS:
// font-size
// ,
// font
// HTML:
// <small>
// ,
// <font>
// ,
// <style>
// HTML 4.01 Specification:
// Font Styles

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
