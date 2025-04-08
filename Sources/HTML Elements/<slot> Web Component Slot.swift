//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct WebComponentSlot<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "slot" }
    
    public var name: Name?
    public let content: () -> HTML
    
    public init(
        name: Name? = nil,
        content: @escaping () -> HTML
    ) {
        self.name = name
        self.content = content
    }
}

public typealias slot = WebComponentSlot


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/slot
 */
// <slot>: The Web Component Slot element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// January 2020
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <slot>
// HTML
// elementâpart of the
// Web Components
// technology suiteâis a placeholder inside a web component that you can fill with your own markup, which lets you create separate DOM trees and present them together.
// Attributes
// This element includes the
// global attributes
// .
// name
// The slot's name. When the slot's containing component gets rendered, the slot is rendered with the custom element's child that has a matching
// slot
// attribute. A
// named slot
// is a
// <slot>
// element with a
// name
// attribute. Unnamed slots have the name default to the empty string. Names should be unique per shadow root: if you have two slots with the same name, all of the elements with a matching
// slot
// attribute will be assigned to the first slot with that name.
// Examples
// html
// <template id="element-details-template">
//  <style>
//  details {
//  font-family: "Open Sans Light", Helvetica, Arial, sans-serif;
//  }
//  .name {
//  font-weight: bold;
//  color: #217ac0;
//  font-size: 120%;
//  }
//  h4 {
//  margin: 10px 0 -8px 0;
//  background: #217ac0;
//  color: white;
//  padding: 2px 6px;
//  border: 1px solid #cee9f9;
//  border-radius: 4px;
//  }
//  .attributes {
//  margin-left: 22px;
//  font-size: 90%;
//  }
//  .attributes p {
//  margin-left: 16px;
//  font-style: italic;
//  }
//  </style>
//  <details>
//  <summary>
//  <code class="name">
//  &lt;<slot name="element-name">NEED NAME</slot>&gt;
//  </code>
//  <span class="desc"><slot name="description">NEED DESCRIPTION</slot></span>
//  </summary>
//  <div class="attributes">
//  <h4>Attributes</h4>
//  <slot name="attributes"><p>None</p></slot>
//  </div>
//  </details>
//  <hr />
// </template>
// Note:
// You can see this complete example in action at
// element-details
// (see it
// running live
// ). In addition, you can find an explanation at
// Using templates and slots
// .
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// Permitted content
// Transparent
// Events
// slotchange
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLSlotElement
// Specifications
// Specification
// HTML
// #
// the-slot-element
// DOM
// #
// shadow-tree-slots
// Browser compatibility
// See also
// HTML
// <template>
// element
// HTML
// slot
// attribute
// CSS
// ::slotted
// pseudo-element
// CSS
// :has-slotted
// pseudo-class
// CSS scoping
// module