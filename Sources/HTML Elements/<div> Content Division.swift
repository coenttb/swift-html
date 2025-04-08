//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct ContentDivision<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "div" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias Div = ContentDivision
public typealias div = Div


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/div
 */
// <div>: The Content Division element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <div>
// HTML
// element is the generic container for flow content. It has no effect on the content or layout until styled in some way using
// CSS
// (e.g., styling is directly applied to it, or some kind of layout model like
// Flexbox
// is applied to its parent element).
// Try it
// <div class="warning">
//  <img
//  src="/shared-assets/images/examples/leopard.jpg"
//  alt="An intimidating leopard." />
//  <p>Beware of the leopard</p>
// </div>
// .warning {
//  border: 10px ridge #f00;
//  background-color: #ff0;
//  padding: 0.5rem;
//  display: flex;
//  flex-direction: column;
// }
// .warning img {
//  width: 100%;
// }
// .warning p {
//  font: small-caps bold 1.2rem sans-serif;
//  text-align: center;
// }
// As a "pure" container, the
// <div>
// element does not inherently represent anything. Instead, it's used to group content so it can be easily styled using the
// class
// or
// id
// attributes, marking a section of a document as being written in a different language (using the
// lang
// attribute), and so on.
// Attributes
// This element includes the
// global attributes
// .
// Note:
// The
// align
// attribute is obsolete; do not use it anymore. Instead, you should use CSS properties or techniques such as
// CSS Grid
// or
// CSS Flexbox
// to align and position
// <div>
// elements on the page.
// Usage notes
// The
// <div>
// element should be used only when no other semantic element (such as
// <article>
// or
// <nav>
// ) is appropriate.
// Accessibility
// The
// <div>
// element has
// an implicit role of
// generic
// , and not none. This may affect certain ARIA combination declarations that expect a direct descendant element with a certain role to function properly.
// Examples
// A basic example
// html
// <div>
//  <p>
//  Any kind of content here. Such as &lt;p&gt;, &lt;table&gt;. You name it!
//  </p>
// </div>
// Result
// A styled example
// This example creates a shadowed box by applying a style to the
// <div>
// using CSS. Note the use of the
// class
// attribute on the
// <div>
// to apply the style named
// "shadowbox"
// to the element.
// HTML
// html
// <div class="shadowbox">
//  <p>Here's a very interesting note displayed in a lovely shadowed box.</p>
// </div>
// CSS
// css
// .shadowbox {
//  width: 15em;
//  border: 1px solid #333;
//  box-shadow: 8px 8px 5px #444;
//  padding: 8px 12px;
//  background-image: linear-gradient(180deg, #fff, #ddd 40%, #ccc);
// }
// Result
// Technical summary
// Content categories
// Flow content
// ,
// palpable content
// .
// Permitted content
// Flow content
// .
// Or (in
// WHATWG
// HTML): If the parent is a
// <dl>
// element: one or more
// <dt>
// elements followed by one or more
// <dd>
// elements, optionally intermixed with
// <script>
// and
// <template>
// elements.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Or (in
// WHATWG
// HTML):
// <dl>
// element.
// Implicit ARIA role
// generic
// Permitted ARIA roles
// Any
// DOM interface
// HTMLDivElement
// Specifications
// Specification
// HTML
// #
// the-div-element
// Browser compatibility
// See also
// Semantic sectioning elements:
// <section>
// ,
// <article>
// ,
// <nav>
// ,
// <header>
// ,
// <footer>
// <span>
// element for styling of phrasing content