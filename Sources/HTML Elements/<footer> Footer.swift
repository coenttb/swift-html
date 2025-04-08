//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Footer<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "footer" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias footer = Footer


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/footer
 */
// <footer>: The Footer element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <footer>
// HTML
// element represents a footer for its nearest ancestor
// sectioning content
// or
// sectioning root
// element. A
// <footer>
// typically contains information about the author of the section, copyright data or links to related documents.
// Try it
// <article>
//  <h1>How to be a wizard</h1>
//  <ol>
//  <li>Grow a long, majestic beard.</li>
//  <li>Wear a tall, pointed hat.</li>
//  <li>Have I mentioned the beard?</li>
//  </ol>
//  <footer>
//  <p>Â© 2018 Gandalf</p>
//  </footer>
// </article>
// article {
//  min-height: 100%;
//  display: grid;
//  grid-template-rows: auto 1fr auto;
// }
// footer {
//  display: flex;
//  justify-content: center;
//  padding: 5px;
//  background-color: #45a1ff;
//  color: #fff;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Enclose information about the author in an
// <address>
// element that can be included into the
// <footer>
// element.
// When the nearest ancestor sectioning content or sectioning root element is the body element the footer applies to the whole page.
// The
// <footer>
// element is not sectioning content and therefore doesn't introduce a new section in the
// outline
// .
// Accessibility
// Prior to the release of Safari 13, the
// contentinfo
// landmark role
// was not properly exposed by
// VoiceOver
// . If needing to support legacy Safari browsers, add
// role="contentinfo"
// to the
// footer
// element to ensure the landmark will be properly exposed.
// Related:
// WebKit Bugzilla: 146930 â AX: HTML native elements (header, footer, main, aside, nav) should work the same as ARIA landmarks, sometimes they don't
// Examples
// html
// <body>
//  <h3>FIFA World Cup top goalscorers</h3>
//  <ol>
//  <li>Miroslav Klose, 16</li>
//  <li>Ronaldo NazÃ¡rio, 15</li>
//  <li>Gerd MÃ¼ller, 14</li>
//  </ol>
//  <footer>
//  <small>
//  Copyright Â© 2023 Football History Archives. All Rights Reserved.
//  </small>
//  </footer>
// </body>
// css
// footer {
//  text-align: center;
//  padding: 5px;
//  background-color: #abbaba;
//  color: #000;
// }
// Technical summary
// Content categories
// Flow content
// , palpable content.
// Permitted content
// Flow content
// , but with no
// <footer>
// or
// <header>
// descendants.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// . Note that a
// <footer>
// element must not be a
//  descendant of an
// <address>
// ,
// <header>
// or another
// <footer>
// element.
// Implicit ARIA role
// contentinfo
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
// element, or
//  an element with
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
// the-footer-element
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
// <hgroup>
// ,
// <header>
// ,
// <section>
// ,
// <address>
// ;
// Using HTML sections and outlines
// ARIA: Contentinfo role