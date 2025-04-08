//<rp>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rp
//
// <rp>: The Ruby Fallback Parenthesis element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <rp>
// HTML
// element is used to provide fall-back parentheses for browsers that do not support display of ruby annotations using the
// <ruby>
// element. One
// <rp>
// element should enclose each of the opening and closing parentheses that wrap the
// <rt>
// element that contains the annotation's text.
// Try it
// <ruby>
//  æ¼¢ <rp>(</rp><rt>kan</rt><rp>)</rp> å­ <rp>(</rp><rt>ji</rt><rp>)</rp>
// </ruby>
// ruby {
//  font-size: 2em;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Ruby annotations are for showing pronunciation of East Asian characters, like using Japanese furigana or Taiwanese bopomofo characters. The
// <rp>
// element is used in the case of lack of
// <ruby>
// element support; the
// <rp>
// content provides what should be displayed in order to indicate the presence of a ruby annotation, usually parentheses.
// Examples
// Using ruby annotations
// This example uses ruby annotations to display the
// Romaji
// equivalents for each character.
// html
// <ruby>
//  æ¼¢ <rp>(</rp><rt>Kan</rt><rp>)</rp> å­ <rp>(</rp><rt>ji</rt><rp>)</rp>
// </ruby>
// body {
//  font-size: 22px;
// }
// Result
// See the article about the
// <ruby>
// element for further examples.
// Without ruby support
// If your browser does not support ruby annotations, the result looks like this instead:
// æ¼¢ (Kan) å­ (ji)
// body {
//  font-size: 22px;
// }
// Technical summary
// Content categories
// None.
// Permitted content
// Text
// Tag omission
// The end tag can be omitted if the element is immediately followed by an
// <rt>
// or another
// <rp>
// element,
//  or if there is no more content in the parent element.
// Permitted parents
// A
// <ruby>
// element.
// <rp>
// must
//  be positioned immediately before or after an
// <rt>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-rp-element
// Browser compatibility
// See also
// <ruby>
// <rt>
// <rb>
// <rtc>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
