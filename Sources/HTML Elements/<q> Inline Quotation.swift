//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct InlineQuotation<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "q" }
    
    public var cite: HTML_Attributes.Cite?
    
    public let content: () -> HTML
    
    public init(
        cite: HTML_Attributes.Cite? = nil,
        content: @escaping () -> HTML
    ) {
        self.cite = cite
        self.content = content
    }
}

public typealias q = InlineQuotation


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/q
 */
// <q>: The Inline Quotation element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <q>
// HTML
// element indicates that the enclosed text is a short inline quotation. Most modern browsers implement this by surrounding the text in quotation marks. This element is intended for short quotations that don't require paragraph breaks; for long quotations use the
// <blockquote>
// element.
// Try it
// <p>
//  When Dave asks HAL to open the pod bay door, HAL answers:
//  <q
//  cite="https://www.imdb.com/title/tt0062622/quotes/?item=qt0396921&ref_=ext_shr_lnk">
//  I'm sorry, Dave. I'm afraid I can't do that.
//  </q>
// </p>
// q {
//  font-style: italic;
// }
// Attributes
// This element includes the
// global attributes
// .
// cite
// The value of this attribute is a URL that designates a source document or message for the information quoted. This attribute is intended to point to information explaining the context or the reference for the quote.
// Examples
// html
// <p>
//  According to Mozilla's website,
//  <q cite="https://www.mozilla.org/en-US/about/history/details/">
//  Firefox 1.0 was released in 2004 and became a big success.
//  </q>
// </p>
// Result
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
// Implicit ARIA role
// generic
// Permitted ARIA roles
// Any
// DOM interface
// HTMLQuoteElement
// Specifications
// Specification
// HTML
// #
// the-q-element
// Browser compatibility
// See also
// The
// <blockquote>
// element for long quotations.
// The
// <cite>
// element for source citations.