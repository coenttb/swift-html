//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct PlainText<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "plaintext" }
    
    public let content: () -> HTML
    
    @available(*, deprecated)
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias plaintext = PlainText


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/plaintext
 */
// <plaintext>: The Plain Text element (Deprecated)
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <plaintext>
// HTML
// element renders everything following the start tag as raw text, ignoring any following HTML. There is no closing tag, since everything after it is considered raw text.
// Warning:
// Do not use this element.
// <plaintext>
// is deprecated since HTML 2, and not all browsers implemented it. Browsers that did implement it didn't do so consistently.
// <plaintext>
// is obsolete; browsers that accept it may instead treat it as a
// <pre>
// element that still interprets HTML within.
// If
// <plaintext>
// is the first element on the page (other than any non-displayed elements, like
// <head>
// ), do not use HTML at all. Instead serve a text file with the
// text/plain
// MIME-type
// .
// Instead of
// <plaintext>
// , use the
// <pre>
// element or, if semantically accurate (such as for inline text), the
// <code>
// element. Escape any
// <
// ,
// >
// and
// &
// characters, to prevent browsers inadvertently parsing the element content as HTML.
// A monospaced font can be applied to any HTML element via a
// CSS
// font-family
// style with the
// monospace
// generic value.
// Attributes
// This element has no other attributes than the
// global attributes
// common to all elements.
// DOM interface
// This element implements the
// HTMLElement
// interface.
// Specifications
// Specification
// HTML
// #
// plaintext
// Browser compatibility
// See also
// The
// <pre>
// and
// <code>
// elements, which should be used instead.
// The
// <xmp>
// element, also obsolete, similar to
// <plaintext>
// .