///
/// <aside> Aside.swift
/// swift-html
///
/// Represents the HTML aside element for content tangentially related to the main content.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML aside element (`<aside>`), which defines content that is indirectly
/// related to the main content of the document.
///
/// The `Aside` struct provides a type-safe way to create HTML aside elements that represent
/// sidebars, call-out boxes, or other supporting content that enhances but isn't essential
/// to the main content.
///
/// ## Example
///
/// ```swift
/// article {
///   paragraph { "The Disney movie The Little Mermaid was first released to theatres in 1989." }
///   
///   aside {
///     paragraph { "The movie earned $87 million during its initial release." }
///   }
///   
///   paragraph { "More info about the movie..." }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use for content that could be removed without reducing the meaning of the main content
/// - Do not use for parenthesized text that's part of the main flow
/// - Common uses include sidebars, pull quotes, advertising, and supplementary information
/// - Don't place aside elements inside `<address>` elements
/// - The aside element has an implicit ARIA role of "complementary"
///
/// - Note: When rendered, this generates an HTML `<aside>` element with the appropriate
///   attributes based on the configuration.
public struct Aside<HTML>: Element {
    public static var tag: String { "aside" }
    
    /// The content of the aside element, which can include any flow content.
    ///
    /// This should contain content that is tangentially related to the surrounding content
    /// but could be removed without diminishing the meaning of the main content.
    public var content: () -> HTML
    
    /// Creates a new Aside element with the specified content.
    ///
    /// - Parameter content: The content of the aside element, typically including supplementary information
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

/// Lowercase typealias for creating Aside elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `aside` identifier when creating
/// HTML aside elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// aside {
///   paragraph { "This is supplementary information that enhances the main content." }
/// }
/// ```
public typealias aside = Aside


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/aside
 */
// <aside>: The Aside element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <aside>
// HTML
// element represents a portion of a document whose content is only indirectly related to the document's main content. Asides are frequently presented as sidebars or call-out boxes.
// Try it
// <p>
//  Salamanders are a group of amphibians with a lizard-like appearance, including
//  short legs and a tail in both larval and adult forms.
// </p>
// <aside>
//  <p>The Rough-skinned Newt defends itself with a deadly neurotoxin.</p>
// </aside>
// <p>
//  Several species of salamander inhabit the temperate rainforest of the Pacific
//  Northwest, including the Ensatina, the Northwestern Salamander and the
//  Rough-skinned Newt. Most salamanders are nocturnal, and hunt for insects,
//  worms and other small creatures.
// </p>
// aside {
//  width: 40%;
//  padding-left: 0.5rem;
//  margin-left: 0.5rem;
//  float: right;
//  box-shadow: inset 5px 0 5px -5px #29627e;
//  font-style: italic;
//  color: #29627e;
// }
// aside > p {
//  margin: 0.5rem;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// Do not use the
// <aside>
// element to tag parenthesized text, as this kind of text is considered part of the main flow.
// Examples
// Using <aside>
// This example uses
// <aside>
// to mark up a paragraph in an article. The paragraph is only indirectly related to the main article content:
// html
// <article>
//  <p>
//  The Disney movie <cite>The Little Mermaid</cite> was first released to
//  theatres in 1989.
//  </p>
//  <aside>
//  <p>The movie earned $87 million during its initial release.</p>
//  </aside>
//  <p>More info about the movieâ¦</p>
// </article>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// sectioning content
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
// . Note that an
// <aside>
// element must not be a
//  descendant of an
// <address>
// element.
// Implicit ARIA role
// complementary
// Permitted ARIA roles
// feed
// ,
// none
// ,
// note
// ,
// presentation
// ,
// region
// ,
// search
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-aside-element
// Browser compatibility
// See also
// Other section-related elements:
// <body>
// ,
// <article>
// ,
// <section>
// ,
// <nav>
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
// Using HTML sections and outlines
// ARIA: Complementary role