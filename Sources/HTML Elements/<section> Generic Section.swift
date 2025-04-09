//
//  <section> Generic Section.swift
//  swift-html
//
//  Represents the HTML section element.
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

/// Represents an HTML section element (`<section>`), which represents a generic standalone 
/// section of a document that doesn't have a more specific semantic element to represent it.
///
/// The `Section` struct provides a type-safe way to create HTML section elements with appropriate attributes.
/// Sections should always have a heading (h1-h6), with very few exceptions.
///
/// ## Example
///
/// ```swift
/// section {
///     h2 { "Introduction" }
///     p { "This document provides a guide to help with the important task of choosing the correct Apple." }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<section>` only if there isn't a more specific element to represent it
/// - Each section should typically include a heading (h1-h6) as a child element
/// - If content represents a standalone unit (like an article), use `<article>` instead
/// - If content represents tangential information, use `<aside>` instead
/// - If content represents the main content area, use `<main>` instead
/// - If you only need a styling wrapper, use `<div>` instead
///
public struct Section<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "section" }
    
    /// The element's class attribute
    public var `class`: HTML_Attributes.Class?
    
    /// The element's ID attribute
    public var id: HTML_Attributes.Id?
    
    /// The element's style attribute
    public var style: HTML_Attributes.Style?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Section element with the specified attributes.
    ///
    /// - Parameters:
    ///   - class: The CSS class name(s) to apply to the section
    ///   - id: The unique identifier for the section
    ///   - style: Inline CSS styles to apply to the section
    ///   - content: The content of the section
    public init(
        class: HTML_Attributes.Class? = nil,
        id: HTML_Attributes.Id? = nil,
        style: HTML_Attributes.Style? = nil,
        content: @escaping () -> HTML
    ) {
        self.class = `class`
        self.id = id
        self.style = style
        self.content = content
    }
}

/// Lowercase typealias for creating Section elements with a more HTML-like syntax.
public typealias section = Section

/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/section
 */
// <section>: The Generic Section element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <section>
// HTML
// element represents a generic standalone section of a document, which doesn't have a more specific semantic element to represent it. Sections should always have a heading, with very few exceptions.
// Try it
// <h1>Choosing an Apple</h1>
// <section>
//  <h2>Introduction</h2>
//  <p>
//  This document provides a guide to help with the important task of choosing
//  the correct Apple.
//  </p>
// </section>
// <section>
//  <h2>Criteria</h2>
//  <p>
//  There are many different criteria to be considered when choosing an Apple â
//  size, color, firmness, sweetness, tartness...
//  </p>
// </section>
// h1,
// h2 {
//  margin: 0;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// As mentioned above,
// <section>
// is a generic sectioning element, and should only be used if there isn't a more specific element to represent it. As an example, a navigation menu should be wrapped in a
// <nav>
// element, but a list of search results or a map display and its controls don't have specific elements, and could be put inside a
// <section>
// .
// Also consider these cases:
// If the contents of the element represent a standalone, atomic unit of content that makes sense syndicated as a standalone piece (e.g., a blog post or blog comment, or a newspaper article), the
// <article>
// element would be a better choice.
// If the contents represent useful tangential information that works alongside the main content, but is not directly part of it (like related links, or an author bio), use an
// <aside>
// .
// If the contents represent the main content area of a document, use
// <main>
// .
// If you are only using the element as a styling wrapper, use a
// <div>
// instead.
// To reiterate, each
// <section>
// should be identified, typically by including a heading (
// h1
// -
// h6
// element) as a child of the
// <section>
// element, wherever possible. See below for examples of where you might see a
// <section>
// without a heading.
// Examples
// Basic usage example
// Before
// html
// <div>
//  <h2>Heading</h2>
//  <p>Bunch of awesome content</p>
// </div>
// Result
// After
// html
// <section>
//  <h2>Heading</h2>
//  <p>Bunch of awesome content</p>
// </section>
// Result
// Using a section without a heading
// Circumstances where you might see
// <section>
// used without a heading are typically found in web application/UI sections rather than in traditional document structures. In a document, it doesn't really make any sense to have a separate section of content without a heading to describe its contents. Such headings are useful for all readers, but particularly useful for users of assistive technologies like screen readers, and they are also good for SEO.
// Consider however a secondary navigation mechanism. If the global navigation is already wrapped in a
// <nav>
// element, you could conceivably wrap a previous/next menu in a
// <section>
// :
// html
// <section>
//  <a href="#">Previous article</a>
//  <a href="#">Next article</a>
// </section>
// Or what about some kind of button bar for controlling your app? This might not necessarily want a heading, but it is still a distinct section of the document:
// html
// <section>
//  <button class="reply">Reply</button>
//  <button class="reply-all">Reply to all</button>
//  <button class="fwd">Forward</button>
//  <button class="del">Delete</button>
// </section>
// Result
// Depending on the content, including a heading could also be good for SEO, so it is an option to consider.
// Technical summary
// Content categories
// Flow content
// ,
// Sectioning content
// ,
// palpable content
// .
// Permitted content
// Flow content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// . Note that a
// <section>
// element must not be a
//  descendant of an
// <address>
// element.
// Implicit ARIA role
// region
// if the element has an
// accessible name
// , otherwise
// generic
// Permitted ARIA roles
// alert
// ,
// alertdialog
// ,
// application
// ,
// banner
// ,
// complementary
// ,
// contentinfo
// ,
// dialog
// ,
// document
// ,
// feed
// ,
// log
// ,
// main
// ,
// marquee
// ,
// navigation
// ,
// none
// ,
// note
// ,
// presentation
// ,
// search
// ,
// status
// ,
// tabpanel
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-section-element
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
// <footer>
// ,
// <address>
// Using HTML sections and outlines
// ARIA: Region role
// Why You Should Choose HTML5 article Over section
// , by Bruce Lawson