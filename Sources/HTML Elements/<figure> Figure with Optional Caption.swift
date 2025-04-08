//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Figure<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "figure" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias figure = Figure


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/figure
 */
// <figure>: The Figure with Optional Caption element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <figure>
// HTML
// element represents self-contained content, potentially with an optional caption, which is specified using the
// <figcaption>
// element. The figure, its caption, and its contents are referenced as a single unit.
// Try it
// <figure>
//  <img
//  src="/shared-assets/images/examples/elephant.jpg"
//  alt="Elephant at sunset" />
//  <figcaption>An elephant at sunset</figcaption>
// </figure>
// figure {
//  border: thin #c0c0c0 solid;
//  display: flex;
//  flex-flow: column;
//  padding: 5px;
//  max-width: 220px;
//  margin: auto;
// }
// img {
//  max-width: 220px;
//  max-height: 150px;
// }
// figcaption {
//  background-color: #222;
//  color: #fff;
//  font: italic smaller sans-serif;
//  padding: 3px;
//  text-align: center;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Usually a
// <figure>
// is an image, illustration, diagram, code snippet, etc., that is referenced in the main flow of a document, but that can be moved to another part of the document or to an appendix without affecting the main flow.
// A caption can be associated with the
// <figure>
// element by inserting a
// <figcaption>
// inside it (as the first or the last child). The first
// <figcaption>
// element found in the figure is presented as the figure's caption.
// The
// <figcaption>
// provides the
// accessible name
// for the parent
// <figure>
// .
// Examples
// Images
// html
// <!-- Just an image -->
// <figure>
//  <img src="favicon-192x192.png" alt="The beautiful MDN logo." />
// </figure>
// <!-- Image with a caption -->
// <figure>
//  <img src="favicon-192x192.png" alt="The beautiful MDN logo." />
//  <figcaption>MDN Logo</figcaption>
// </figure>
// Result
// Code snippets
// html
// <figure>
//  <figcaption>Get browser details using <code>navigator</code>.</figcaption>
//  <pre>
// function NavigatorExample() {
//  var txt;
//  txt = "Browser CodeName: " + navigator.appCodeName + "; ";
//  txt+= "Browser Name: " + navigator.appName + "; ";
//  txt+= "Browser Version: " + navigator.appVersion + "; ";
//  txt+= "Cookies Enabled: " + navigator.cookieEnabled + "; ";
//  txt+= "Platform: " + navigator.platform + "; ";
//  txt+= "User-agent header: " + navigator.userAgent + "; ";
//  console.log("NavigatorExample", txt);
// }
//  </pre>
// </figure>
// Result
// Quotations
// html
// <figure>
//  <figcaption><b>Edsger Dijkstra:</b></figcaption>
//  <blockquote>
//  If debugging is the process of removing software bugs, then programming must
//  be the process of putting them in.
//  </blockquote>
// </figure>
// Result
// Poems
// html
// <figure>
//  <p style="white-space:pre">
//  Bid me discourse, I will enchant thine ear, Or like a fairy trip upon the
//  green, Or, like a nymph, with long dishevelled hair, Dance on the sands, and
//  yet no footing seen: Love is a spirit all compact of fire, Not gross to
//  sink, but light, and will aspire.
//  </p>
//  <figcaption><cite>Venus and Adonis</cite>, by William Shakespeare</figcaption>
// </figure>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// palpable content
// .
// Permitted content
// A
// <figcaption>
// element, followed by
// flow content
// ; or flow content followed by a
// <figcaption>
// element; or flow content.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// Flow content
// .
// Implicit ARIA role
// figure
// Permitted ARIA roles
// With no
// figcaption
// descendant:
// any
// ,
//  otherwise no permitted roles
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-figure-element
// Browser compatibility
// See also
// The
// <figcaption>
// element.