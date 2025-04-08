//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Noscript<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "noscript" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias noscript = Noscript


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/noscript
 */
// <noscript>: The Noscript element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <noscript>
// HTML
// element defines a section of HTML to be inserted if a script type on the page is unsupported or if scripting is currently turned off in the browser.
// Attributes
// This element only includes the
// global attributes
// .
// Examples
// html
// <noscript>
//  <!-- anchor linking to external file -->
//  <a href="https://www.mozilla.org/">External Link</a>
// </noscript>
// <p>Rocks!</p>
// Result with scripting enabled
// Rocks!
// Result with scripting disabled
// External Link
// Rocks!
// Technical summary
// Content categories
// Metadata content
// ,
// flow content
// ,
// phrasing content
// .
// Permitted content
// When scripting is disabled and when it is a descendant of the
// <head>
// element: in any order, zero or more
// <link>
// elements, zero or more
// <style>
// elements, and zero or more
// <meta>
// elements.
// When scripting is
//  disabled and when it isn't a descendant of the
// <head>
// element: any
// transparent content
// , but no
// <noscript>
// element must be among its
//  descendants.
// Otherwise: flow content or phrasing content.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// , if there are no ancestor
// <noscript>
// element, or in
//  a
// <head>
// element (but only for an HTML
//  document), here again if there are no ancestor
// <noscript>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-noscript-element
// Browser compatibility