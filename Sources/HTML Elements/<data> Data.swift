//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct Data<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "data" }
    
    public var value: Value<String>
    
    public let content: () -> HTML
    
    public init(
        value: Value<String>,
        content: @escaping () -> HTML
    ) {
        self.value = value
        self.content = content
    }
}

public typealias data = Data


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/data
 */
// <data>: The Data element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// October 2017
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <data>
// HTML
// element links a given piece of content with a machine-readable translation. If the content is time- or date-related, the
// <time>
// element must be used.
// Try it
// <p>New Products:</p>
// <ul>
//  <li><data value="398">Mini Ketchup</data></li>
//  <li><data value="399">Jumbo Ketchup</data></li>
//  <li><data value="400">Mega Jumbo Ketchup</data></li>
// </ul>
// data:hover::after {
//  content: " (ID " attr(value) ")";
//  font-size: 0.7em;
// }
// Attributes
// This element's attributes include the
// global attributes
// .
// value
// This attribute specifies the machine-readable translation of the content of the element.
// Examples
// The following example displays product names but also associates each name with a product number.
// html
// <p>New Products</p>
// <ul>
//  <li><data value="398">Mini Ketchup</data></li>
//  <li><data value="399">Jumbo Ketchup</data></li>
//  <li><data value="400">Mega Jumbo Ketchup</data></li>
// </ul>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// generic
// Permitted ARIA roles
// Any
// DOM interface
// HTMLDataElement
// Specifications
// Specification
// HTML
// #
// the-data-element
// Browser compatibility
// See also
// The HTML
// <time>
// element.
