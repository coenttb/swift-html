//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct OptionGroup<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "optgroup" }
    
    public var disabled: Disabled?
    public var label: String?
    
    public let content: () -> HTML
    
    public init(
        disabled: Disabled? = nil,
        label: String? = nil,
        content: @escaping () -> HTML
    ) {
        self.disabled = disabled
        self.label = label
        self.content = content
    }
}

public typealias optgroup = OptionGroup


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup
 */
// <optgroup>: The Option Group element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <optgroup>
// HTML
// element creates a grouping of options within a
// <select>
// element.
// In
// customizable
// <select>
// elements
// , the
// <legend>
// element is allowed as a child of
// <optgroup>
// , to provide a label that is easy to target and style. This replaces any text set in the
// <optgroup>
// element's
// label
// attribute, and it has the same semantics.
// Try it
// <label for="dino-select">Choose a dinosaur:</label>
// <select id="dino-select">
//  <optgroup label="Theropods">
//  <option>Tyrannosaurus</option>
//  <option>Velociraptor</option>
//  <option>Deinonychus</option>
//  </optgroup>
//  <optgroup label="Sauropods">
//  <option>Diplodocus</option>
//  <option>Saltasaurus</option>
//  <option>Apatosaurus</option>
//  </optgroup>
// </select>
// label {
//  display: block;
//  margin-bottom: 10px;
// }
// Note:
// Optgroup elements may not be nested.
// Attributes
// This element includes the
// global attributes
// .
// disabled
// If this Boolean attribute is set, none of the items in this option group is selectable. Often browsers grey out such control and it won't receive any browsing events, like mouse clicks or focus-related ones.
// label
// The name of the group of options, which the browser can use when labeling the options in the user interface. This attribute is mandatory if this element is used.
// Examples
// html
// <select>
//  <optgroup label="Group 1">
//  <option>Option 1.1</option>
//  </optgroup>
//  <optgroup label="Group 2">
//  <option>Option 2.1</option>
//  <option>Option 2.2</option>
//  </optgroup>
//  <optgroup label="Group 3" disabled>
//  <option>Option 3.1</option>
//  <option>Option 3.2</option>
//  <option>Option 3.3</option>
//  </optgroup>
// </select>
// Result
// Technical summary
// Content categories
// None.
// Permitted content
// Zero or more
// <option>
// elements. In
// customizable select elements
// , a
// <legend>
// element is permitted as a child of
// <optgroup>
// .
// Tag omission
// The start tag is mandatory. The end tag is optional if this element is
//  immediately followed by another
// <optgroup>
// element, or
//  if the parent element has no more content.
// Permitted parents
// A
// <select>
// element.
// Implicit ARIA role
// group
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLOptGroupElement
// Specifications
// Specification
// HTML
// #
// the-optgroup-element
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
// <option>
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