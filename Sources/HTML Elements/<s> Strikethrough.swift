//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Strikethrough<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "s" }
    
    public let content: () -> HTML
    
    @available(*, deprecated)
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias s = Strikethrough


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/s
 */
// <s>: The Strikethrough element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <s>
// HTML
// element renders text with a strikethrough, or a line through it. Use the
// <s>
// element to represent things that are no longer relevant or no longer accurate. However,
// <s>
// is not appropriate when indicating document edits; for that, use the
// <del>
// and
// <ins>
// elements, as appropriate.
// Try it
// <p><s>There will be a few tickets available at the box office tonight.</s></p>
// <p>SOLD OUT!</p>
// s {
//  /* Add your styles here */
// }
// Attributes
// This element only includes the
// global attributes
// .
// Accessibility
// The presence of the
// s
// element is not announced by most screen reading technology in its default configuration. It can be made to be announced by using the CSS
// content
// property, along with the
// ::before
// and
// ::after
// pseudo-elements.
// css
// s::before,
// s::after {
//  clip-path: inset(100%);
//  clip: rect(1px, 1px, 1px, 1px);
//  height: 1px;
//  overflow: hidden;
//  position: absolute;
//  white-space: nowrap;
//  width: 1px;
// }
// s::before {
//  content: " [start of stricken text] ";
// }
// s::after {
//  content: " [end of stricken text] ";
// }
// Some people who use screen readers deliberately disable announcing content that creates extra verbosity. Because of this, it is important to not abuse this technique and only apply it in situations where not knowing content has been struck out would adversely affect understanding.
// Short note on making your mark (more accessible) | The Paciello Group
// Tweaking Text Level Styles | Adrian Roselli
// Examples
// css
// .sold-out {
//  text-decoration: line-through;
// }
// html
// <s>Today's Special: Salmon</s> SOLD OUT<br />
// <span class="sold-out">Today's Special: Salmon</span> SOLD OUT
// Result
// Technical summary
// Content categories
// Phrasing content
// ,
// flow content
// .
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
// deletion
// Permitted ARIA roles
// Any
// DOM interface
// HTMLElement
// Specifications
// Specification
// HTML
// #
// the-s-element
// Browser compatibility
// See also
// The
// <strike>
// element, alter ego of the
// <s>
// element, is obsolete and should not be used on websites anymore.
// The
// <del>
// element is to be used instead if the data has been
// deleted
// .
// The CSS
// text-decoration-line
// property is to be used to achieve the former visual aspect of the
// <s>
// element.