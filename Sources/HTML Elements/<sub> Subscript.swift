//
// <sub> Subscript.swift
// swift-html
//
// Represents the HTML subscript element.
//
// Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML subscript element (`<sub>`), which specifies inline text that should 
/// be displayed as subscript for typographical reasons.
///
/// Subscripts are typically rendered with a lowered baseline using smaller text.
///
/// ## Example
///
/// ```swift
/// sub {
///     "2"
/// }
/// ```
///
/// ## Usage Notes
///
/// - Use `<sub>` only for typographical reasons, not solely for presentation
/// - Appropriate use cases include:
///   - Footnote numbers
///   - Mathematical variable subscripts
///   - Chemical formulas (e.g., H₂O)
/// - For presentational subscripts, use CSS (e.g., `vertical-align: sub`)
///
public struct Subscript: Element {
    /// The HTML tag name
    public static var tag: String { "sub" }
    
    /// Creates a new subscript element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Subscript elements with a more HTML-like syntax.
public typealias sub = Subscript


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/sub
 */
// <sub>: The Subscript element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <sub>
// HTML
// element specifies inline text which should be displayed as subscript for solely typographical reasons. Subscripts are typically rendered with a lowered baseline using smaller text.
// Try it
// <p>
//  Almost every developer's favorite molecule is
//  C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>, also known as
//  "caffeine."
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
// <sub>
// element should be used only for typographical reasonsâthat is, to change the position of the text to comply with typographical conventions or standards, rather than solely for presentation or appearance purposes.
// For example, using
// <sub>
// to style the name of a company which uses altered baselines in their
// wordmark
// would not be appropriate; instead, CSS should be used. For example, you could use the
// vertical-align
// property with a declaration like
// vertical-align: sub
// or, to more precisely control the baseline shift,
// vertical-align: -25%
// .
// Appropriate use cases for
// <sub>
// include (but aren't necessarily limited to):
// Marking up footnote numbers. See
// Footnote numbers
// for an example.
// Marking up the subscript in mathematical variable numbers (although you may also consider using a
// MathML
// formula for this). See
// Variable subscripts
// .
// Denoting the number of atoms of a given element within a chemical formula (such as every developer's best friend, C
// 8
// H
// 10
// N
// 4
// O
// 2
// , otherwise known as "caffeine"). See
// Chemical formulas
// .
// Examples
// Footnote numbers
// Traditional footnotes are denoted using numbers which are rendered in subscript. This is a common use case for
// <sub>
// :
// html
// <p>
//  According to the computations by Nakamura, Johnson, and Mason<sub>1</sub> this
//  will result in the complete annihilation of both particles.
// </p>
// Result
// Variable subscripts
// In mathematics, families of variables related to the same concept (such as distances along the same axis) are represented using the same variable name with a subscript following. For example:
// html
// <p>
//  The horizontal coordinates' positions along the X-axis are represented as
//  <var>x<sub>1</sub></var> â¦ <var>x<sub>n</sub></var>.
// </p>
// Result
// Chemical formulas
// When writing a chemical formula, such as H
// 2
// 0, the number of atoms of a given element within the described molecule is represented using a subscripted number; in the case of water, the subscripted "2" indicates that there are two atoms of hydrogen in the molecule.
// Another example:
// html
// <p>
//  Almost every developer's favorite molecule is
//  C<sub>8</sub>H<sub>10</sub>N<sub>4</sub>O<sub>2</sub>, which is commonly known
//  as "caffeine."
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
// subscript
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
// <sup>
// HTML element that produces superscript. Note that you cannot use
// sup
// and
// sub
// both at the same time: you need to use
// MathML
// to produce both a superscript directly above a subscript next to the chemical symbol of an element, representing its atomic number and its nuclear number.
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
