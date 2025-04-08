//<rb>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rb
//
// <rb>: The Ruby Base element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <rb>
// HTML
// element is used to delimit the base text component of a
// <ruby>
// annotation, i.e., the text that is being annotated. One
// <rb>
// element should wrap each separate atomic segment of the base text.
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Ruby annotations are for showing pronunciation of East Asian characters, like using Japanese furigana or Taiwanese bopomofo characters. The
// <rb>
// element is used to separate out each segment of the ruby base text.
// Even though
// <rb>
// is not a
// void element
// , it is common to just include the opening tag of each element in the source code, so that the ruby markup is less complex and easier to read. The browser can then fill in the full element in the rendered version.
// You need to include one
// <rt>
// element for each base segment/
// <rb>
// element that you want to annotate.
// Examples
// Using rb
// In this example, we provide an annotation for the original character equivalent of "Kanji":
// html
// <ruby>
//  <rb>æ¼¢</rb><rb>å­ </rb><rp>(</rp><rt>kan</rt><rt>ji</rt><rp>)</rp>
// </ruby>
// Note how we've included two
// <rb>
// elements, to delimit the two separate parts of the ruby base text. The annotation on the other hand is delimited by two
// <rt>
// elements.
// Result
// Separate annotations
// Note that we could also write this example with the two base text parts annotated completely separately. In this case we don't need to include
// <rb>
// elements:
// html
// <ruby>
//  æ¼¢ <rp>(</rp><rt>Kan</rt><rp>)</rp> å­ <rp>(</rp><rt>ji</rt><rp>)</rp>
// </ruby>
// Result
// See the article about the
// <ruby>
// element for further examples.
// Technical summary
// Content categories
// None.
// Permitted content
// As a child of a
// <ruby>
// element.
// Tag omission
// The end tag can be omitted if the element is immediately followed by an
// <rt>
// ,
// <rtc>
// , or
// <rp>
// element or another
// <rb>
// element, or if there is no more content in the
//  parent element.
// Permitted parents
// A
// <ruby>
// element.
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// rb
// Browser compatibility
// See also
// <ruby>
// <rt>
// <rp>
// <rtc>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
