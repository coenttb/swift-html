//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct NavigationSection<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "nav" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias nav = NavigationSection


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/nav
 */
// <nav>: The Navigation Section element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <nav>
// HTML
// element represents a section of a page whose purpose is to provide navigation links, either within the current document or to other documents. Common examples of navigation sections are menus, tables of contents, and indexes.
// Try it
// <nav class="crumbs">
//  <ol>
//  <li class="crumb"><a href="#">Bikes</a></li>
//  <li class="crumb"><a href="#">BMX</a></li>
//  <li class="crumb">Jump Bike 3000</li>
//  </ol>
// </nav>
// <h1>Jump Bike 3000</h1>
// <p>
//  This BMX bike is a solid step into the pro world. It looks as legit as it
//  rides and is built to polish your skills.
// </p>
// nav {
//  border-bottom: 1px solid black;
// }
// .crumbs ol {
//  list-style-type: none;
//  padding-left: 0;
// }
// .crumb {
//  display: inline-block;
// }
// .crumb a::after {
//  display: inline-block;
//  color: #000;
//  content: ">";
//  font-size: 80%;
//  font-weight: bold;
//  padding: 0 3px;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// It's not necessary for all links to be contained in a
// <nav>
// element.
// <nav>
// is intended only for a major block of navigation links; typically the
// <footer>
// element often has a list of links that don't need to be in a
// <nav>
// element.
// A document may have several
// <nav>
// elements, for example, one for site navigation and one for intra-page navigation.
// aria-labelledby
// can be used in such case to promote accessibility, see
// example
// .
// User agents, such as screen readers targeting disabled users, can use this element to determine whether to omit the initial rendering of navigation-only content.
// Examples
// In this example, a
// <nav>
// block is used to contain an unordered list (
// <ul>
// ) of links. With appropriate CSS, this can be presented as a sidebar, navigation bar, or drop-down menu.
// html
// <nav class="menu">
//  <ul>
//  <li><a href="#">Home</a></li>
//  <li><a href="#">About</a></li>
//  <li><a href="#">Contact</a></li>
//  </ul>
// </nav>
// The semantics of the
// nav
// element is that of providing links. However a
// nav
// element doesn't have to contain a list, it can contain other kinds of content as well. In this navigation block, links are provided in prose:
// html
// <nav>
//  <h2>Navigation</h2>
//  <p>
//  You are on my home page. To the north lies <a href="/blog">my blog</a>, from
//  whence the sounds of battle can be heard. To the east you can see a large
//  mountain, upon which many <a href="/school">school papers</a> are littered.
//  Far up this mountain you can spy a little figure who appears to be me,
//  desperately scribbling a <a href="/school/thesis">thesis</a>.
//  </p>
//  <p>
//  To the west are several exits. One fun-looking exit is labeled
//  <a href="https://games.example.com/">"games"</a>. Another more
//  boring-looking exit is labeled <a href="https://isp.example.net/">ISPâ¢</a>.
//  </p>
//  <p>
//  To the south lies a dark and dank <a href="/about">contacts page</a>.
//  Cobwebs cover its disused entrance, and at one point you see a rat run
//  quickly out of the page.
//  </p>
// </nav>
// Technical summary
// Content categories
// Flow content
// ,
// sectioning content
// , palpable content.
// Permitted content
// Flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// navigation
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
// the-nav-element
// Browser compatibility
// See also
// Other section-related elements:
// <body>
// ,
// <article>
// ,
// <section>
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
// <footer>
// ,
// <address>
// ;
// Sections and outlines of an HTML document
// .
// ARIA: Navigation role