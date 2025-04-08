//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Paragraph<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "p" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias p = Paragraph


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/p
 */
// <p>: The Paragraph element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <p>
// HTML
// element represents a paragraph. Paragraphs are usually represented in visual media as blocks of text separated from adjacent blocks by blank lines and/or first-line indentation, but HTML paragraphs can be any structural grouping of related content, such as images or form fields.
// Paragraphs are
// block-level elements
// , and notably will automatically close if another block-level element is parsed before the closing
// </p>
// tag. See "Tag omission" below.
// Try it
// <p>
//  Geckos are a group of usually small, usually nocturnal lizards. They are found
//  on every continent except Antarctica.
// </p>
// <p>
//  Some species live in houses where they hunt insects attracted by artificial
//  light.
// </p>
// p {
//  margin: 10px 0;
//  padding: 5px;
//  border: 1px solid #999;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Note:
// The
// align
// attribute on
// <p>
// tags is obsolete and shouldn't be used.
// Accessibility
// Breaking up content into paragraphs helps make a page more accessible. Screen-readers and other assistive technology provide shortcuts to let their users skip to the next or previous paragraph, letting them skim content like how white space lets visual users skip around.
// Using empty
// <p>
// elements to add space between paragraphs is problematic for people who navigate with screen-reading technology. Screen readers may announce the paragraph's presence, but not any content contained within it â because there is none. This can confuse and frustrate the person using the screen reader.
// If extra space is desired, use
// CSS
// properties like
// margin
// to create the effect:
// css
// p {
//  margin-bottom: 2em; /* increase white space after a paragraph */
// }
// Examples
// HTML
// html
// <p>
//  This is the first paragraph of text. This is the first paragraph of text. This
//  is the first paragraph of text. This is the first paragraph of text.
// </p>
// <p>
//  This is the second paragraph. This is the second paragraph. This is the second
//  paragraph. This is the second paragraph.
// </p>
// Result
// Styling paragraphs
// By default, browsers separate paragraphs with a single blank line. Alternate separation methods, such as first-line indentation, can be achieved with
// CSS
// :
// HTML
// html
// <p>
//  Separating paragraphs with blank lines is easiest for readers to scan, but
//  they can also be separated by indenting their first lines. This is often used
//  to take up less space, such as to save paper in print.
// </p>
// <p>
//  Writing that is intended to be edited, such as school papers and rough drafts,
//  uses both blank lines and indentation for separation. In finished works,
//  combining both is considered redundant and amateurish.
// </p>
// <p>
//  In very old writing, paragraphs were separated with a special character: Â¶,
//  the <i>pilcrow</i>. Nowadays, this is considered claustrophobic and hard to
//  read.
// </p>
// <p>
//  How hard to read? See for yourself:
//  <button data-toggle-text="Oh no! Switch back!">
//  Use pilcrow for paragraphs
//  </button>
// </p>
// CSS
// css
// p {
//  margin: 0;
//  text-indent: 3ch;
// }
// p.pilcrow {
//  text-indent: 0;
//  display: inline;
// }
// p.pilcrow + p.pilcrow::before {
//  content: " Â¶ ";
// }
// JavaScript
// js
// document.querySelector("button").addEventListener("click", (event) => {
//  document.querySelectorAll("p").forEach((paragraph) => {
//  paragraph.classList.toggle("pilcrow");
//  });
//  [event.target.innerText, event.target.dataset.toggleText] = [
//  event.target.dataset.toggleText,
//  event.target.innerText,
//  ];
// });
// Result
// Technical summary
// Content categories
// Flow content
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// The start tag is required. The end tag may be omitted if the
// <p>
// element is immediately followed by an
// <address>
// ,
// <article>
// ,
// <aside>
// ,
// <blockquote>
// ,
// <details>
// ,
// <div>
// ,
// <dl>
// ,
// <fieldset>
// ,
// <figcaption>
// ,
// <figure>
// ,
// <footer>
// ,
// <form>
// ,
// h1
// ,
// h2
// ,
// h3
// ,
// h4
// ,
// h5
// ,
// h6
// ,
// <header>
// ,
// <hgroup>
// ,
// <hr>
// ,
// <main>
// ,
// <menu>
// ,
// <nav>
// ,
// <ol>
// ,
// <pre>
// ,
// <search>
// ,
// <section>
// ,
// <table>
// ,
// <ul>
// or another
// <p>
// element, or if there is no more content in the parent element and the
//  parent element is not an
// <a>
// ,
// <audio>
// ,
// <del>
// ,
// <ins>
// ,
// <map>
// ,
// <noscript>
// or
// <video>
// element,
//  or an autonomous custom element.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// paragraph
// Permitted ARIA roles
// Any
// DOM interface
// HTMLParagraphElement
// Specifications
// Specification
// HTML
// #
// the-p-element
// Browser compatibility
// See also
// <hr>
// <br>