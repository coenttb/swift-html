//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Cite<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "cite" }
    

    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias cite = Cite


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/cite
 */
// <cite>: The Citation element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <cite>
// HTML
// element is used to mark up the title of a creative work. The reference may be in an abbreviated form according to context-appropriate conventions related to citation metadata.
// Try it
// <figure>
//  <blockquote>
//  <p>
//  It was a bright cold day in April, and the clocks were striking thirteen.
//  </p>
//  </blockquote>
//  <figcaption>
//  First sentence in
//  <cite
//  ><a href="http://www.george-orwell.org/1984/0.html"
//  >Nineteen Eighty-Four</a
//  ></cite
//  >
//  by George Orwell (Part 1, Chapter 1).
//  </figcaption>
// </figure>
// cite {
//  /* Add your styles here */
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// In the context of the
// <cite>
// element, a creative work could be, for example, one of the following:
// A book
// A research paper
// An essay
// A poem
// A musical score
// A song
// A play or film script
// A film
// A television show
// A game
// A sculpture
// A painting
// A theatrical production
// A play
// An opera
// A musical
// An exhibition
// A legal case report
// A computer program
// A website
// A web page
// A blog post or comment
// A forum post or comment
// A tweet
// A Facebook post
// A written or oral statement
// And so forth.
// To include a reference to the source of quoted material which is contained within a
// <blockquote>
// or
// <q>
// element, use the
// cite
// attribute on the element.
// Typically, browsers style the contents of a
// <cite>
// element in italics by default. To avoid this, apply the CSS
// font-style
// property to the
// <cite>
// element.
// Examples
// html
// <p>More information can be found in <cite>[ISO-0000]</cite>.</p>
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
// No corresponding role
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Up to Gecko 1.9.2 (Firefox 4)
//  inclusive, Firefox implements the
// HTMLSpanElement
// interface for this element.
// Specifications
// Specification
// HTML
// #
// the-cite-element
// Browser compatibility
// See also
// The element
// <blockquote>
// for long quotations.
// The element
// <q>
// for inline quotations and the
// cite
// attribute.