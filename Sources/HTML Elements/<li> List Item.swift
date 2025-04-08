//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct ListItem<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "li" }
    
    public var value: Int?
    public let content: () -> HTML
    
    public init(
        value: Int? = nil,
        content: @escaping () -> HTML
    ) {
        self.value = value
        self.content = content
    }
}

public typealias li = ListItem


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li
 */
// <li>: The List Item element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <li>
// HTML
// element is used to represent an item in a list. It must be contained in a parent element: an ordered list (
// <ol>
// ), an unordered list (
// <ul>
// ), or a menu (
// <menu>
// ). In menus and unordered lists, list items are usually displayed using bullet points. In ordered lists, they are usually displayed with an ascending counter on the left, such as a number or letter.
// Try it
// <p>Apollo astronauts:</p>
// <ul>
//  <li>Neil Armstrong</li>
//  <li>Alan Bean</li>
//  <li>Peter Conrad</li>
//  <li>Edgar Mitchell</li>
//  <li>Alan Shepard</li>
// </ul>
// p,
// li {
//  font:
//  1rem "Fira Sans",
//  sans-serif;
// }
// p {
//  font-weight: bold;
// }
// Attributes
// This element includes the
// global attributes
// .
// value
// This integer attribute indicates the current ordinal value of the list item as defined by the
// <ol>
// element. The only allowed value for this attribute is a number, even if the list is displayed with Roman numerals or letters. List items that follow this one continue numbering from the value set. This attribute has no meaning for unordered lists (
// <ul>
// ) or for menus (
// <menu>
// ).
// type
// Deprecated
// This character attribute indicates the numbering type:
// a
// : lowercase letters
// A
// : uppercase letters
// i
// : lowercase Roman numerals
// I
// : uppercase Roman numerals
// 1
// : numbers
// This type overrides the one used by its parent
// <ol>
// element, if any.
// Note:
// This attribute has been deprecated; use the CSS
// list-style-type
// property instead.
// Examples
// For more detailed examples, see the
// <ol>
// and
// <ul>
// pages.
// Ordered list
// html
// <ol>
//  <li>first item</li>
//  <li>second item</li>
//  <li>third item</li>
// </ol>
// Result
// Ordered list with a custom value
// html
// <ol type="I">
//  <li value="3">third item</li>
//  <li>fourth item</li>
//  <li>fifth item</li>
// </ol>
// Result
// Unordered list
// html
// <ul>
//  <li>first item</li>
//  <li>second item</li>
//  <li>third item</li>
// </ul>
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// Flow content
// .
// Tag omission
// The end tag can be omitted if the list item is immediately followed by
//  another
// <li>
// element, or if there is no more
//  content in its parent element.
// Permitted parents
// An
// <ul>
// ,
// <ol>
// , or
// <menu>
// element. Though not a conforming usage,
//  the obsolete
// <dir>
// can also be a parent.
// Implicit ARIA role
// listitem
// when child of an
// ol
// ,
// ul
// or
// menu
// Permitted ARIA roles
// menuitem
// ,
// menuitemcheckbox
// ,
// menuitemradio
// ,
// option
// ,
// none
// ,
// presentation
// ,
// radio
// ,
// separator
// ,
// tab
// ,
// treeitem
// DOM interface
// HTMLLIElement
// Specifications
// Specification
// HTML
// #
// the-li-element
// Browser compatibility
// See also
// Other list-related HTML Elements:
// <ul>
// ,
// <ol>
// ,
// <menu>
// , and the obsolete
// <dir>
// ;
// CSS properties that may be specially useful to style the
// <li>
// element:
// the
// list-style
// property, to choose the way the ordinal is displayed,
// CSS counters
// , to handle complex nested lists,
// the
// margin
// property, to control the indent of the list item.