//<rt>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rt
//
// <rt>: The Ruby Text element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <rt>
// HTML
// element specifies the ruby text component of a ruby annotation, which is used to provide pronunciation, translation, or transliteration information for East Asian typography. The
// <rt>
// element must always be contained within a
// <ruby>
// element.
// Try it
// <ruby>
//  æ¼¢ <rp>(</rp><rt>kan</rt><rp>)</rp> å­ <rp>(</rp><rt>ji</rt><rp>)</rp>
// </ruby>
// ruby {
//  font-size: 2em;
// }
// See the article about the
// <ruby>
// element for more examples.
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// Using ruby annotations
// This example provides Romaji transliteration for the kanji characters within the
// <ruby>
// element:
// html
// <ruby> æ¼¢ <rt>Kan</rt> å­ <rt>ji</rt> </ruby>
// body {
//  font-size: 22px;
// }
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// Phrasing content
// .
// Tag omission
// The end tag may be omitted if the
// <rt>
// element is
//  immediately followed by an
// <rt>
// or
// <rp>
// element, or if there is no more content in
//  the parent element
// Permitted parents
// A
// <ruby>
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
// the-rt-element
// Browser compatibility
// See also
// <ruby>
// <rp>
// <rb>
// <rtc>
// text-transform: full-size-kana

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
