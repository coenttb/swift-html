//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation


public struct LineBreakOpportunity<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "wbr" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias wbr = LineBreakOpportunity


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/wbr
 */
// <wbr>: The Line Break Opportunity element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <wbr>
// HTML
// element represents a word break opportunityâa position within text where the browser may optionally break a line, though its line-breaking rules would not otherwise create a break at that location.
// Try it
// <div id="example-paragraphs">
//  <p>FernstraÃenbauprivatfinanzierungsgesetz</p>
//  <p>FernstraÃen<wbr />bau<wbr />privat<wbr />finanzierungs<wbr />gesetz</p>
//  <p>FernstraÃen&shy;bau&shy;privat&shy;finanzierungs&shy;gesetz</p>
// </div>
// #example-paragraphs {
//  background-color: white;
//  overflow: hidden;
//  resize: horizontal;
//  width: 9rem;
//  border: 2px dashed #999;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Notes
// On UTF-8 encoded pages,
// <wbr>
// behaves like the
// U+200B ZERO-WIDTH SPACE
// code point. In particular, it behaves like a Unicode bidi BN code point, meaning it has no effect on
// bidi
// -ordering:
// <div dir=rtl>123,<wbr>456</div>
// displays, when not broken on two lines,
// 123,456
// and not
// 456,123
// .
// For the same reason, the
// <wbr>
// element does not introduce a hyphen at the line break point. To make a hyphen appear only at the end of a line, use the soft hyphen character entity (
// &shy;
// ) instead.
// Examples
// The Yahoo Style Guide
// recommends
// breaking a URL
// before
// punctuation
// , to avoid leaving a punctuation mark at the end of the line, which the reader might mistake for the end of the URL.
// html
// <p>
//  http://this<wbr />.is<wbr />.a<wbr />.really<wbr />.long<wbr />.example<wbr />.com/With<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages
// </p>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// .
// Permitted content
// Empty
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// Any element that accepts
// phrasing content
// .
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
// the-wbr-element
// Browser compatibility
// See also
// overflow-wrap
// word-break
// hyphens
// The
// <br>
// element