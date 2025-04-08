//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Emphasis<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "em" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias em = Emphasis


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/em
 */
// <em>: The Emphasis element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <em>
// HTML
// element marks text that has stress emphasis. The
// <em>
// element can be nested, with each level of nesting indicating a greater degree of emphasis.
// Try it
// <p>Get out of bed <em>now</em>!</p>
// <p>We <em>had</em> to do something about it.</p>
// <p>This is <em>not</em> a drill!</p>
// em {
//  /* Add your styles here */
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <em>
// element is for words that have a stressed emphasis compared to surrounding text, which is often limited to a word or words of a sentence and affects the meaning of the sentence itself.
// Typically this element is displayed in italic type. However, it should not be used to apply italic styling; use the CSS
// font-style
// property for that purpose. Use the
// <cite>
// element to mark the title of a work (book, play, song, etc.). Use the
// <i>
// element to mark text that is in an alternate tone or mood, which covers many common situations for italics such as scientific names or words in other languages. Use the
// <strong>
// element to mark text that has greater importance than surrounding text.
// <i> vs. <em>
// Some developers may be confused by how multiple elements seemingly produce similar visual results.
// <em>
// and
// <i>
// are a common example, since they both italicize text. What's the difference? Which should you use?
// By default, the visual result is the same. However, the semantic meaning is different. The
// <em>
// element represents stress emphasis of its contents, while the
// <i>
// element represents text that is set off from the normal prose, such as a foreign word, fictional character thoughts, or when the text refers to the definition of a word instead of representing its semantic meaning. (The title of a work, such as the name of a book or movie, should use
// <cite>
// .)
// This means the right one to use depends on the situation. Neither is for purely decorative purposes, that's what CSS styling is for.
// Examples for
// <em>
// could be:
// html
// <p>Just <em>do</em> it already!</p>
// <p>We <em>had</em> to do something about it.</p>
// A person or software reading the text would pronounce the words in italics with an emphasis, using verbal stress.
// Examples for
// <i>
// could be:
// html
// <p>The word <i>the</i> is an article.</p>
// <p>The <i>Queen Mary</i> sailed last night.</p>
// Here, there is no added emphasis or importance on the word "Queen Mary". It is merely indicated that the object in question is not a queen named Mary but a ship named "Queen Mary".
// Examples
// In this example, the
// <em>
// element is used to highlight an implicit or explicit contrast between two ingredient lists:
// html
// <p>
//  Ice cream is made with milk, sweetener, and cream. Frozen custard, on the
//  other hand, is made of milk, cream, sweetener, and <em>egg yolks</em>.
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
// emphasis
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
// the-em-element
// Browser compatibility
// See also
// <i>