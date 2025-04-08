//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Header<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "header" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias header = Header


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/header
 */
// <header>: The Header element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <header>
// HTML
// element represents introductory content, typically a group of introductory or navigational aids. It may contain some heading elements but also a logo, a search form, an author name, and other elements.
// Try it
// <header>
//  <a class="logo" href="#">Cute Puppies Express!</a>
// </header>
// <article>
//  <header>
//  <h1>Beagles</h1>
//  <time>08.12.2014</time>
//  </header>
//  <p>
//  I love beagles <em>so</em> much! Like, really, a lot. Theyâre adorable and
//  their ears are so, so snugly soft!
//  </p>
// </article>
// .logo {
//  background: left / cover
//  url("/shared-assets/images/examples/puppy-header.jpg");
//  display: flex;
//  height: 120px;
//  align-items: center;
//  justify-content: center;
//  font:
//  bold calc(1em + 2 * (100vw - 120px) / 100) "Dancing Script",
//  fantasy;
//  color: #ff0083;
//  text-shadow: #000 2px 2px 0.2rem;
// }
// header > h1 {
//  margin-bottom: 0;
// }
// header > time {
//  font: italic 0.7rem sans-serif;
// }
// Usage notes
// The
// <header>
// element has an identical meaning to the site-wide
// banner
// landmark role, unless nested within sectioning content. Then, the
// <header>
// element is not a landmark.
// The
// <header>
// element can define a global site header, described as a
// banner
// in the accessibility tree. It usually includes a logo, company name, search feature, and possibly the global navigation or a slogan. It is generally located at the top of the page.
// Otherwise, it is a
// section
// in the accessibility tree, and usually contains the surrounding section's heading (an
// h1
// â
// h6
// element) and optional subheading, but this is
// not
// required.
// Historical Usage
// The
// <header>
// element originally existed at the very beginning of HTML for headings. It is seen in
// the very first website
// . At some point, headings became
// <h1>
// through
// <h6>
// , allowing
// <header>
// to be free to fill a different role.
// Attributes
// This element only includes the
// global attributes
// .
// Accessibility
// The
// <header>
// element defines a
// banner
// landmark when its context is the
// <body>
// element. The HTML header element is not considered a banner landmark when it is descendant of an
// <article>
// ,
// <aside>
// ,
// <main>
// ,
// <nav>
// , or
// <section>
// element.
// Examples
// Page Header
// html
// <header>
//  <h1>Main Page Title</h1>
//  <img src="mdn-logo-sm.png" alt="MDN logo" />
// </header>
// Result
// Article Header
// html
// <article>
//  <header>
//  <h2>The Planet Earth</h2>
//  <p>
//  Posted on Wednesday, <time datetime="2017-10-04">4 October 2017</time> by
//  Jane Smith
//  </p>
//  </header>
//  <p>
//  We live on a planet that's blue and green, with so many things still unseen.
//  </p>
//  <p><a href="https://example.com/the-planet-earth/">Continue readingâ¦</a></p>
// </article>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// palpable content
// .
// Permitted content
// Flow content
// , but with no
// <header>
// or
// <footer>
// descendant.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// . Note that a
// <header>
// element must not be a
//  descendant of an
// <address>
// ,
// <footer>
// or another
// <header>
// element.
// Implicit ARIA role
// banner
// , or
// generic
// if a descendant of an
// article
// ,
// aside
// ,
// main
// ,
// nav
// or
// section
// element, or an element with
// role=
// article
// ,
// complementary
// ,
// main
// ,
// navigation
// or
// region
// Permitted ARIA roles
// group
// ,
// presentation
// or
// none
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-header-element
// Browser compatibility
// See also
// Other section-related elements:
// <body>
// ,
// <nav>
// ,
// <article>
// ,
// <aside>
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
// <footer>
// ,
// <section>
// ,
// <address>
// .