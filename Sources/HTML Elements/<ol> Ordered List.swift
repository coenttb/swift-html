//<ol>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/ol
//
// <ol>: The Ordered List element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <ol>
// HTML
// element represents an ordered list of items â typically rendered as a numbered list.
// Try it
// <ol>
//  <li>Mix flour, baking powder, sugar, and salt.</li>
//  <li>In another bowl, mix eggs, milk, and oil.</li>
//  <li>Stir both mixtures together.</li>
//  <li>Fill muffin tray 3/4 full.</li>
//  <li>Bake for 20 minutes.</li>
// </ol>
// li {
//  font:
//  1rem "Fira Sans",
//  sans-serif;
//  margin-bottom: 0.5rem;
// }
// Attributes
// This element also accepts the
// global attributes
// .
// reversed
// This Boolean attribute specifies that the list's items are in reverse order. Items will be numbered from high to low.
// start
// An integer to start counting from for the list items. Always an Arabic numeral (1, 2, 3, etc.), even when the numbering
// type
// is letters or Roman numerals. For example, to start numbering elements from the letter "d" or the Roman numeral "iv," use
// start="4"
// .
// type
// Sets the numbering type:
// a
// for lowercase letters
// A
// for uppercase letters
// i
// for lowercase Roman numerals
// I
// for uppercase Roman numerals
// 1
// for numbers (default)
// The specified type is used for the entire list unless a different
// type
// attribute is used on an enclosed
// <li>
// element.
// Note:
// Unless the type of the list number matters (like legal or technical documents where items are referenced by their number/letter), use the CSS
// list-style-type
// property instead.
// Usage notes
// Typically, ordered list items display with a preceding
// marker
// , such as a number or letter.
// The
// <ol>
// and
// <ul>
// (or the synonym
// <menu>
// ) elements may nest as deeply as desired, alternating between
// <ol>
// ,
// <ul>
// (or
// <menu>
// ) as needed.
// The
// <ol>
// and
// <ul>
// elements both represent a list of items. The difference is with the
// <ol>
// element, the order is meaningful. For example:
// Steps in a recipe
// Turn-by-turn directions
// The list of ingredients in decreasing proportion on nutrition information labels
// To determine which list to use, try changing the order of the list items; if the meaning changes, use the
// <ol>
// element â otherwise you can use
// <ul>
// otherwise, or
// <menu>
// if your list is a menu.
// Examples
// Basic example
// html
// <ol>
//  <li>Fee</li>
//  <li>Fi</li>
//  <li>Fo</li>
//  <li>Fum</li>
// </ol>
// Result
// Using Roman Numeral type
// html
// <ol type="i">
//  <li>Introduction</li>
//  <li>List of Grievances</li>
//  <li>Conclusion</li>
// </ol>
// Result
// Using the start attribute
// html
// <p>Finishing places of contestants not in the winners' circle:</p>
// <ol start="4">
//  <li>Speedwalk Stu</li>
//  <li>Saunterin' Sam</li>
//  <li>Slowpoke Rodriguez</li>
// </ol>
// Result
// Nesting lists
// html
// <ol>
//  <li>first item</li>
//  <li>
//  second item
//  <!-- closing </li> tag is not here! -->
//  <ol>
//  <li>second item first subitem</li>
//  <li>second item second subitem</li>
//  <li>second item third subitem</li>
//  </ol>
//  </li>
//  <!-- Here's the closing </li> tag -->
//  <li>third item</li>
// </ol>
// Result
// Unordered list inside ordered list
// html
// <ol>
//  <li>first item</li>
//  <li>
//  second item
//  <!-- closing </li> tag is not here! -->
//  <ul>
//  <li>second item first subitem</li>
//  <li>second item second subitem</li>
//  <li>second item third subitem</li>
//  </ul>
//  </li>
//  <!-- Here's the closing </li> tag -->
//  <li>third item</li>
// </ol>
// Result
// Technical summary
// Content categories
// Flow content
// , and if the
// <ol>
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
// DOM interface
// HTMLOListElement
// Specifications
// Specification
// HTML
// #
// the-ol-element
// Browser compatibility
// See also
// Other list-related HTML Elements:
// <ul>
// ,
// <li>
// ,
// <menu>
// CSS properties that may be specially useful to style the
// <ol>
// element:
// the
// list-style
// property, to choose the way the ordinal displays
// CSS counters
// , to handle complex nested lists
// the
// line-height
// property, to simulate the deprecated
// compact
// attribute
// the
// margin
// property, to control the list indentation

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
