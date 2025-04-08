//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Superscript<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "sup" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias sup = Superscript


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sup
 */
// <sup>: The Superscript element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <sup>
// HTML
// element specifies inline text which is to be displayed as superscript for solely typographical reasons. Superscripts are usually rendered with a raised baseline using smaller text.
// Try it
// <p>
//  The <em>Pythagorean theorem</em> is often expressed as the following equation:
// </p>
// <p>
//  <var>a<sup>2</sup></var> + <var>b<sup>2</sup></var> = <var>c<sup>2</sup></var>
// </p>
// p {
//  font:
//  1rem "Fira Sans",
//  sans-serif;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <sup>
// element should only be used for typographical reasonsâthat is, to change the position of the text to comply with typographical conventions or standards, rather than solely for presentation or appearance purposes.
// For example, to style the
// wordmark
// of a business or product which uses a raised baseline should be done using CSS (most likely
// vertical-align
// ) rather than
// <sup>
// . This would be done using, for example,
// vertical-align: super
// or, to shift the baseline up 50%,
// vertical-align: 50%
// .
// Appropriate use cases for
// <sup>
// include (but aren't necessarily limited to):
// Displaying exponents, such as "x
// 3
// ". It may be worth considering the use of
// MathML
// for these, especially in more complex cases. See
// Exponents
// under
// Examples
// below.
// Displaying
// superior lettering
// , which is used in some languages when rendering certain abbreviations. For example, in French, the word "mademoiselle" can be abbreviated "M
// lle
// "; this is an acceptable use case. See
// Superior lettering
// for examples.
// Representing ordinal numbers, such as "4
// th
// " instead of "fourth." See
// Ordinal numbers
// for examples.
// Examples
// Exponents
// Exponents, or powers of a number, are among the most common uses of superscripted text. For example:
// html
// <p>
//  One of the most common equations in all of physics is <var>E</var>=<var>m</var
//  ><var>c</var><sup>2</sup>.
// </p>
// Result
// Superior lettering
// Superior lettering is not technically the same thing as superscript. However, it is common to use
// <sup>
// to present superior lettering in HTML. Among the most common uses of superior lettering is the presentation of certain abbreviations in French:
// html
// <p>Robert a prÃ©sentÃ© son rapport Ã  M<sup>lle</sup> Bernard.</p>
// Result
// Ordinal numbers
// Ordinal numbers, such as "fourth" in English or "quinto" in Spanish may be abbreviated using numerals and language-specific text rendered in superscript:
// html
// <p>
//  The ordinal number "fifth" can be abbreviated in various languages as follows:
// </p>
// <ul>
//  <li>English: 5<sup>th</sup></li>
//  <li>French: 5<sup>Ã¨me</sup></li>
// </ul>
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
// superscript
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-sub-and-sup-elements
// Browser compatibility
// See also
// The
// <sub>
// HTML element that produces subscripts. Note that you cannot use
// sub
// and
// sup
// at the same time: you need to use
// MathML
// to produce both a superscript and a subscript next to the chemical symbol of an element, representing its atomic number and its nuclear number.
// The
// <msub>
// ,
// <msup>
// , and
// <msubsup>
// MathML elements.
// The CSS
// vertical-align
// property.