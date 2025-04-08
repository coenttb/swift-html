//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Option<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "option" }
    
    public var disabled: Disabled?
    public var label: String?
    public var selected: Selected?
    public var value: Value
    
    public let content: () -> HTML
    
    public init(
        disabled: Disabled? = nil,
        label: String? = nil,
        selected: Selected? = nil,
        value: Value,
        content: @escaping () -> HTML
    ) {
        self.disabled = disabled
        self.label = label
        self.selected = selected
        self.value = value
        self.content = content
    }
}

public typealias option = Option



/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/option
 */
// <option>: The HTML Option element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <option>
// HTML
// element is used to define an item contained in a
// <select>
// , an
// <optgroup>
// , or a
// <datalist>
// element. As such,
// <option>
// can represent menu items in popups and other lists of items in an HTML document.
// Try it
// <label for="pet-select">Choose a pet:</label>
// <select id="pet-select">
//  <option value="">--Please choose an option--</option>
//  <option value="dog">Dog</option>
//  <option value="cat">Cat</option>
//  <option value="hamster">Hamster</option>
//  <option value="parrot">Parrot</option>
//  <option value="spider">Spider</option>
//  <option value="goldfish">Goldfish</option>
// </select>
// label {
//  font-family: sans-serif;
//  font-size: 1rem;
//  padding-right: 10px;
// }
// select {
//  font-size: 0.9rem;
//  padding: 2px 5px;
// }
// Attributes
// This element includes the
// global attributes
// .
// disabled
// If this Boolean attribute is set, this option is not checkable. Often browsers grey out such control and it won't receive any browsing event, like mouse clicks or focus-related ones. If this attribute is not set, the element can still be disabled if one of its ancestors is a disabled
// <optgroup>
// element.
// label
// This attribute is text for the label indicating the meaning of the option. If the
// label
// attribute isn't defined, its value is that of the element text content.
// selected
// If present, this Boolean attribute indicates that the option is initially selected. If the
// <option>
// element is the descendant of a
// <select>
// element whose
// multiple
// attribute is not set, only one single
// <option>
// of this
// <select>
// element may have the
// selected
// attribute.
// value
// The content of this attribute represents the value to be submitted with the form, should this option be selected. If this attribute is omitted, the value is taken from the text content of the option element.
// Styling with CSS
// Styling
// <option>
// elements has historically been highly limited.
// Customizable select elements
// explains newer features that enable their full customization, just like any regular DOM element.
// Legacy option styling
// In browsers that don't support the modern customization features (or legacy codebases where they can't be used), the styling available on
// <option>
// elements depends on the browser and operating system. Depending on the operating system, the
// font-size
// of the owning
// <select>
// is respected in Firefox and Chromium. Chromium may additionally allow
// color
// ,
// background-color
// ,
// font-family
// ,
// font-variant
// , and
// text-align
// to be set.
// You can find more details about legacy
// <option>
// styling in
// our guide to advanced form styling
// .
// Examples
// See
// <select>
// for examples.
// Technical summary
// Content categories
// None.
// Permitted content
// In traditional
// <select>
// elements, only text content is permitted, possibly with escaped characters (like
// &eacute;
// ). In
// customizable select elements
// ,
// <option>
// elements can have any arbitrary content.
// Tag omission
// The start tag is mandatory. The end tag is optional if this element is
//  immediately followed by another
// <option>
// element or an
// <optgroup>
// , or if the parent element has no
//  more content.
// Permitted parents
// A
// <select>
// , an
// <optgroup>
// or a
// <datalist>
// element.
// Implicit ARIA role
// option
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLOptionElement
// Specifications
// Specification
// HTML
// #
// the-option-element
// Browser compatibility
// See also
// Other form-related elements:
// <form>
// ,
// <legend>
// ,
// <label>
// ,
// <button>
// ,
// <select>
// ,
// <datalist>
// ,
// <optgroup>
// ,
// <fieldset>
// ,
// <textarea>
// ,
// <input>
// ,
// <output>
// ,
// <progress>
// and
// <meter>
// .
// Customizable select elements