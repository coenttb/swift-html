//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Menu<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "menu" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias menu = Menu


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/menu
 */
// <menu>: The Menu element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <menu>
// HTML
// element is described in the HTML specification as a semantic alternative to
// <ul>
// , but treated by browsers (and exposed through the accessibility tree) as no different than
// <ul>
// . It represents an unordered list of items (which are represented by
// <li>
// elements).
// Try it
// <div class="news">
//  <a href="#">NASAâs Webb Delivers Deepest Infrared Image of Universe Yet</a>
//  <menu>
//  <li><button id="save">Save for later</button></li>
//  <li><button id="share">Share this news</button></li>
//  </menu>
// </div>
// .news {
//  background-color: bisque;
//  padding: 1em;
//  border: solid thin black;
// }
// menu {
//  list-style-type: none;
//  display: flex;
//  padding: 0;
//  margin-bottom: 0;
//  gap: 1em;
// }
// Attributes
// This element only includes the
// global attributes
// .
// Usage notes
// The
// <menu>
// and
// <ul>
// elements both represent an unordered list of items. The key difference is that
// <ul>
// primarily contains items for display, while
// <menu>
// represents a toolbar containing commands that the user can perform or activate.
// Note:
// In early versions of the HTML specification, the
// <menu>
// element had an additional use case as a context menu. This functionality is considered obsolete and is not in the specification.
// Examples
// Toolbar
// In this example, a
// <menu>
// is used to create a toolbar for an editing application.
// HTML
// html
// <menu>
//  <li><button onclick="copy()">Copy</button></li>
//  <li><button onclick="cut()">Cut</button></li>
//  <li><button onclick="paste()">Paste</button></li>
// </menu>
// Note that this is functionally no different from:
// html
// <ul>
//  <li><button onclick="copy()">Copy</button></li>
//  <li><button onclick="cut()">Cut</button></li>
//  <li><button onclick="paste()">Paste</button></li>
// </ul>
// CSS
// css
// menu,
// ul {
//  display: flex;
//  list-style: none;
//  padding: 0;
//  width: 400px;
// }
// li {
//  flex-grow: 1;
// }
// button {
//  width: 100%;
// }
// Result
// Technical summary
// Content categories
// Flow content
// . If the element's children include at least one
// <li>
// element:
// Palpable content
// .
// Permitted content
// Zero or more occurrences of
// <li>
// ,
// <script>
// , and
// <template>
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// .
// Implicit ARIA role
// list
// Permitted ARIA roles
// directory
// ,
// group
// ,
// listbox
// ,
// menu
// ,
// menubar
// ,
// none
// ,
// presentation
// ,
// radiogroup
// ,
// tablist
// ,
// toolbar
// or
// tree
// DOM interface
// HTMLMenuElement
// Specifications
// Specification
// HTML
// #
// the-menu-element
// Browser compatibility
// See also
// Other list-related HTML Elements:
// <ol>
// ,
// <ul>
// , and
// <li>
// .