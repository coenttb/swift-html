//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct IdiomaticText<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "i" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias i = IdiomaticText


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/i
 */
// <i>: The Idiomatic Text element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <i>
// HTML
// element represents a range of text that is set off from the normal text for some reason, such as idiomatic text, technical terms, taxonomical designations, among others. Historically, these have been presented using italicized type, which is the original source of the
// <i>
// naming of this element.
// Try it
// <p>I looked at it and thought <i>This can't be real!</i></p>
// <p>
//  <i>Musa</i> is one of two or three genera in the family <i>Musaceae</i>; it
//  includes bananas and plantains.
// </p>
// <p>
//  The term <i>bandwidth</i> describes the measure of how much information can
//  pass through a data connection in a given amount of time.
// </p>
// i {
//  /* Add your styles here */
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Use the
// <i>
// element for text that is set off from the normal prose for readability reasons. This would be a range of text with different semantic meaning than the surrounding text. Among the use cases for the
// <i>
// element are spans of text representing a different quality or mode of text, such as:
// Alternative voice or mood
// Taxonomic designations (such as the genus and species "
// Homo sapiens
// ")
// Idiomatic terms from another language (such as "
// et cetera
// "); these should include the
// lang
// attribute to identify the language
// Technical terms
// Transliterations
// Thoughts (such as "She wondered,
// What is this writer talking about, anyway?
// ")
// Ship or vessel names in Western writing systems (such as "They searched the docks for the
// Empress of the Galaxy
// , the ship to which they were assigned.")
// In earlier versions of the HTML specification, the
// <i>
// element was merely a presentational element used to display text in italics, much like the
// <b>
// element was used to display text in bold letters. This is no longer true, as these tags now define semantics rather than typographic appearance. A browser will typically still display the contents of the
// <i>
// element in italic type, but is, by definition, no longer required to do so. To display text in italic type, authors should use the CSS
// font-style
// property.
// Be sure the text in question is not actually more appropriately marked up with another element.
// Use
// <em>
// to indicate stress emphasis.
// Use
// <strong>
// to indicate importance, seriousness, or urgency.
// Use
// <mark>
// to indicate relevance.
// Use
// <cite>
// to mark up the name of a work, such as a book, play, or song.
// Use
// <dfn>
// to mark up the defining instance of a term.
// Examples
// This example demonstrates using the
// <i>
// element to mark text that is in another language.
// html
// <p>
//  The Latin phrase <i lang="la">Veni, vidi, vici</i> is often mentioned in
//  music, art, and literature.
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
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-i-element
// Browser compatibility
// See also
// <em>
// Other italicized elements:
// <var>
// ,
// <dfn>
// ,
// <cite>
// ,
// <address>