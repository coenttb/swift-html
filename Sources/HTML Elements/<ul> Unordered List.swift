//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct UnorderedList<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "ul" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias ul = UnorderedList


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ul
 */
// <ul>: The Unordered List element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <ul>
// HTML
// element represents an unordered list of items, typically rendered as a bulleted list.
// Try it
// <ul>
//  <li>Milk</li>
//  <li>
//  Cheese
//  <ul>
//  <li>Blue cheese</li>
//  <li>Feta</li>
//  </ul>
//  </li>
// </ul>
// li {
//  list-style-type: circle;
// }
// li li {
//  list-style-type: square;
// }
// Attributes
// This element includes the
// global attributes
// .
// compact
// Deprecated
// This Boolean attribute hints that the list should be rendered in a compact style. The interpretation of this attribute depends on the
// user agent
// , and it doesn't work in all browsers.
// Warning:
// Do not use this attribute, as it has been deprecated: use
// CSS
// instead. To give a similar effect as the
// compact
// attribute, the CSS property
// line-height
// can be used with a value of
// 80%
// .
// type
// Deprecated
// This attribute sets the bullet style for the list. The values defined under HTML3.2 and the transitional version of HTML 4.0/4.01 are:
// circle
// disc
// square
// A fourth bullet type has been defined in the WebTV interface, but not all browsers support it:
// triangle
// .
// If not present and if no
// CSS
// list-style-type
// property applies to the element, the user agent selects a bullet type depending on the nesting level of the list.
// Warning:
// Do not use this attribute, as it has been deprecated; use the
// CSS
// list-style-type
// property instead.
// Usage notes
// The
// <ul>
// element is for grouping a collection of items that do not have a numerical ordering, and their order in the list is meaningless. Typically, unordered-list items are displayed with a bullet, which can be of several forms, like a dot, a circle, or a square. The bullet style is not defined in the HTML description of the page, but in its associated CSS, using the
// list-style-type
// property.
// The
// <ul>
// and
// <ol>
// elements may be nested as deeply as desired. Moreover, the nested lists may alternate between
// <ol>
// and
// <ul>
// without restriction.
// The
// <ol>
// and
// <ul>
// elements both represent a list of items. They differ in that, with the
// <ol>
// element, the order is meaningful. To determine which one to use, try changing the order of the list items; if the meaning is changed, the
// <ol>
// element should be used, otherwise you can use
// <ul>
// .
// Examples
// Basic example
// html
// <ul>
//  <li>first item</li>
//  <li>second item</li>
//  <li>third item</li>
// </ul>
// Result
// Nesting a list
// html
// <ul>
//  <li>first item</li>
//  <li>
//  second item
//  <!-- Look, the closing </li> tag is not placed here! -->
//  <ul>
//  <li>second item first subitem</li>
//  <li>
//  second item second subitem
//  <!-- Same for the second nested unordered list! -->
//  <ul>
//  <li>second item second subitem first sub-subitem</li>
//  <li>second item second subitem second sub-subitem</li>
//  <li>second item second subitem third sub-subitem</li>
//  </ul>
//  </li>
//  <!-- Closing </li> tag for the li that
//  contains the third unordered list -->
//  <li>second item third subitem</li>
//  </ul>
//  <!-- Here is the closing </li> tag -->
//  </li>
//  <li>third item</li>
// </ul>
// Result
// Ordered list inside unordered list
// html
// <ul>
//  <li>first item</li>
//  <li>
//  second item
//  <!-- Look, the closing </li> tag is not placed here! -->
//  <ol>
//  <li>second item first subitem</li>
//  <li>second item second subitem</li>
//  <li>second item third subitem</li>
//  </ol>
//  <!-- Here is the closing </li> tag -->
//  </li>
//  <li>third item</li>
// </ul>
// Result
// Technical summary
// Content categories
// Flow content
// , and if the
// <ul>
// element's children include at least
//  one
// <li>
// element,
// palpable content
// .
// Permitted content
// Zero or more
// <li>
// ,
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
// ,
// tree
// DOM Interface
// HTMLUListElement
// Specifications
// Specification
// HTML
// #
// the-ul-element
// Browser compatibility
// See also
// Other list-related HTML Elements:
// <ol>
// ,
// <li>
// ,
// <menu>
// CSS properties that may be specially useful to style the
// <ul>
// element:
// the
// list-style
// property, to choose the way the ordinal displays.
// CSS counters
// , to handle complex nested lists.
// the
// line-height
// property, to simulate the deprecated
// compact
// attribute.
// the
// margin
// property, to control the list indentation.