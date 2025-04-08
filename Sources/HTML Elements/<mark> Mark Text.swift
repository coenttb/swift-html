//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Mark<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "mark" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias mark = Mark


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/mark
 */
// <mark>: The Mark Text element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <mark>
// HTML
// element represents text which is
// marked
// or
// highlighted
// for reference or notation purposes due to the marked passage's relevance in the enclosing context.
// Try it
// <p>Search results for "salamander":</p>
// <hr />
// <p>
//  Several species of <mark>salamander</mark> inhabit the temperate rainforest of
//  the Pacific Northwest.
// </p>
// <p>
//  Most <mark>salamander</mark>s are nocturnal, and hunt for insects, worms, and
//  other small creatures.
// </p>
// mark {
//  /* Add your styles here */
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Typical use cases for
// <mark>
// include:
// When used in a quotation (
// <q>
// ) or block quote (
// <blockquote>
// ), it generally indicates text which is of special interest but is not marked in the original source material, or material which needs special scrutiny even though the original author didn't think it was of particular importance. Think of this like using a highlighter pen in a book to mark passages that you find of interest.
// Otherwise,
// <mark>
// indicates a portion of the document's content which is likely to be relevant to the user's current activity. This might be used, for example, to indicate the words that matched a search operation.
// Don't use
// <mark>
// for syntax highlighting purposes; instead, use the
// <span>
// element with appropriate CSS applied to it.
// Note:
// Don't confuse
// <mark>
// with the
// <strong>
// element;
// <mark>
// is used to denote content which has a degree of
// relevance
// , while
// <strong>
// indicates spans of text of
// importance
// .
// Accessibility
// The presence of the
// mark
// element is not announced by most screen reading technology in its default configuration. It can be made to be announced by using the CSS
// content
// property, along with the
// ::before
// and
// ::after
// pseudo-elements.
// css
// mark::before,
// mark::after {
//  clip-path: inset(100%);
//  clip: rect(1px, 1px, 1px, 1px);
//  height: 1px;
//  overflow: hidden;
//  position: absolute;
//  white-space: nowrap;
//  width: 1px;
// }
// mark::before {
//  content: " [highlight start] ";
// }
// mark::after {
//  content: " [highlight end] ";
// }
// Some people who use screen readers deliberately disable announcing content that creates extra verbosity. Because of this, it is important to not abuse this technique and only apply it in situations where not knowing content has been highlighted would adversely affect understanding.
// Short note on making your mark (more accessible) | The Paciello Group
// Tweaking Text Level Styles | Adrian Roselli
// Examples
// Marking text of interest
// In this first example, a
// <mark>
// element is used to mark some text within a quote which is of particular interest to the user.
// html
// <blockquote>
//  It is a period of civil war. Rebel spaceships, striking from a hidden base,
//  have won their first victory against the evil Galactic Empire. During the
//  battle, <mark>Rebel spies managed to steal secret plans</mark> to the Empire's
//  ultimate weapon, the DEATH STAR, an armored space station with enough power to
//  destroy an entire planet.
// </blockquote>
// Result
// Identifying context-sensitive passages
// This example demonstrates using
// <mark>
// to mark search results within a passage.
// html
// <p>
//  It is a dark time for the Rebellion. Although the Death Star has been
//  destroyed, <mark class="match">Imperial</mark> troops have driven the Rebel
//  forces from their hidden base and pursued them across the galaxy.
// </p>
// <p>
//  Evading the dreaded <mark class="match">Imperial</mark> Starfleet, a group of
//  freedom fighters led by Luke Skywalker has established a new secret base on
//  the remote ice world of Hoth.
// </p>
// To help distinguish the use of
// <mark>
// for search results from other potential usage, this example applies the custom class
// "match"
// to each match.
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
// Specifications
// Specification
// HTML
// #
// the-mark-element
// Browser compatibility