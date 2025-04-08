//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Main<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "main" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias main = Main


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/main
 */
// <main>: The Main element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <main>
// HTML
// element represents the dominant content of the
// <body>
// of a document. The main content area consists of content that is directly related to or expands upon the central topic of a document, or the central functionality of an application.
// Try it
// <header>Gecko facts</header>
// <main>
//  <p>
//  Geckos are a group of usually small, usually nocturnal lizards. They are
//  found on every continent except Antarctica.
//  </p>
//  <p>
//  Many species of gecko have adhesive toe pads which enable them to climb
//  walls and even windows.
//  </p>
// </main>
// header {
//  font:
//  bold 7vw Arial,
//  sans-serif;
// }
// A document mustn't have more than one
// <main>
// element that doesn't have the
// hidden
// attribute specified.
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The content of a
// <main>
// element should be unique to the document. Content that is repeated across a set of documents or document sections such as sidebars, navigation links, copyright information, site logos, and search forms shouldn't be included unless the search form is the main function of the page.
// <main>
// doesn't contribute to the document's outline; that is, unlike elements such as
// <body>
// , headings such as
// h2
// , and such,
// <main>
// doesn't affect the
// DOM's
// concept of the structure of the page. It's strictly informative.
// Accessibility
// Landmark
// The
// <main>
// element behaves like a
// main
// landmark
// role.
// Landmarks
// can be used by assistive technology to quickly identify and navigate to large sections of the document. Prefer using the
// <main>
// element over declaring
// role="main"
// , unless there are
// legacy browser support concerns
// .
// Skip navigation
// Skip navigation, also known as "skipnav", is a technique that allows an assistive technology user to quickly bypass large sections of repeated content (main navigation, info banners, etc.). This lets the user access the main content of the page faster.
// Adding an
// id
// attribute to the
// <main>
// element lets it be a target of a skip navigation link.
// html
// <body>
//  <a href="#main-content">Skip to main content</a>
//  <!-- navigation and header content -->
//  <main id="main-content">
//  <!-- main page content -->
//  </main>
// </body>
// WebAIM: "Skip Navigation" Links
// Reader mode
// Browser reader mode functionality looks for the presence of the
// <main>
// element, as well as
// heading
// and
// content sectioning elements
// when converting content into a specialized reader view.
// Building websites for Safari Reader Mode and other reading apps.
// Examples
// html
// <!-- other content -->
// <main>
//  <h1>Apples</h1>
//  <p>The apple is the pomaceous fruit of the apple tree.</p>
//  <article>
//  <h2>Red Delicious</h2>
//  <p>
//  These bright red apples are the most common found in many supermarkets.
//  </p>
//  <p>â¦</p>
//  <p>â¦</p>
//  </article>
//  <article>
//  <h2>Granny Smith</h2>
//  <p>These juicy, green apples make a great filling for apple pies.</p>
//  <p>â¦</p>
//  <p>â¦</p>
//  </article>
// </main>
// <!-- other content -->
// Result
// Technical summary
// Content categories
// Flow content
// , palpable content.
// Permitted content
// Flow content
// .
// Tag omission
// None; both the starting and ending tags are mandatory.
// Permitted parents
// Where
// flow content
// is expected, but only if it is a
// hierarchically correct
// main
// element
// .
// Implicit ARIA role
// main
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-main-element
// Browser compatibility
// See also
// Basic structural elements:
// <html>
// ,
// <head>
// ,
// <body>
// Section-related elements:
// <article>
// ,
// <aside>
// ,
// <footer>
// ,
// <header>
// , or
// <nav>
// ARIA: Main role