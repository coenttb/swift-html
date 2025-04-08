//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Legend<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "legend" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias legend = Legend


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/legend
 */
// <legend>: The Field Set Legend element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <legend>
// HTML
// element represents a caption for the content of its parent
// <fieldset>
// .
// In
// customizable
// <select>
// elements
// , the
// <legend>
// element is allowed as a child of
// <optgroup>
// , to provide a label that is easy to target and style. This replaces any text set in the
// <optgroup>
// element's
// label
// attribute, and it has the same semantics.
// Try it
// <fieldset>
//  <legend>Choose your favorite monster</legend>
//  <input type="radio" id="kraken" name="monster" value="K" />
//  <label for="kraken">Kraken</label><br />
//  <input type="radio" id="sasquatch" name="monster" value="S" />
//  <label for="sasquatch">Sasquatch</label><br />
//  <input type="radio" id="mothman" name="monster" value="M" />
//  <label for="mothman">Mothman</label>
// </fieldset>
// legend {
//  background-color: #000;
//  color: #fff;
//  padding: 3px 6px;
// }
// input {
//  margin: 0.4rem;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// See
// <form>
// for examples on
// <legend>
// .
// Technical summary
// Content categories
// None.
// Permitted content
// Phrasing content
// and
// headings
// (h1âh6 elements).
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// A
// <fieldset>
// whose first child is this
// <legend>
// element. In
// customizable select elements
// , a
// <legend>
// element is permitted as a child of
// <optgroup>
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLLegendElement
// Specifications
// Specification
// HTML
// #
// the-legend-element
// Browser compatibility
// See also
// ARIA: Form role