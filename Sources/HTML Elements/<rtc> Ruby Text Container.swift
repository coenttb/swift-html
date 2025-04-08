//<rtc>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/rtc
//
// <rtc>: The Ruby Text Container element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <rtc>
// HTML
// element embraces semantic annotations of characters presented in a ruby of
// <rb>
// elements used inside of
// <ruby>
// element.
// <rb>
// elements can have both pronunciation (
// <rt>
// ) and semantic (
// <rtc>
// ) annotations.
// Try it
// <ruby xml:lang="zh-Hant" style="ruby-position: under;">
//  <rbc>
//  <rb>é¦¬</rb><rp>(</rp><rt>mÇ</rt><rp>)</rp>
//  <rb>ä¾</rb><rp>(</rp><rt>lÃ¡i</rt><rp>)</rp>
//  <rb>è¥¿</rb><rp>(</rp><rt>xÄ«</rt><rp>)</rp>
//  <rb>äº</rb><rp>(</rp><rt>yÃ </rt><rp>)</rp>
//  </rbc>
//  <rtc xml:lang="en" style="ruby-position: over;">
//  <rp>(</rp><rt>Malaysia</rt><rp>)</rp>
//  </rtc>
// </ruby>
// ruby {
//  font-size: 2em;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// html
// <div class="info">
//  <ruby>
//  <rtc>
//  <rb>æ§</rb><rt>jiÃ¹</rt>
//  <rb>é</rb><rt>jÄ«n</rt>
//  <rb>å±±</rb><rt>shÄn</rt>
//  </rtc>
//  <rtc>San Francisco</rtc>
//  </ruby>
// </div>
// .info {
//  padding-top: 10px;
//  font-size: 36px;
// }
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// Phrasing content
// or
// <rt>
// elements.
// Tag omission
// The closing tag can be omitted if it is immediately followed by a
// <rb>
// ,
// <rtc>
// or
// <rt>
// element opening tag or by its parent
//  closing tag.
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
// rtc
// Browser compatibility
// See also
// <ruby>
// <rp>
// <rb>
// <rt>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
