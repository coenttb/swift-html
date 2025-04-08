//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Head<HTML>: Element {
    
    public static var tag: String { "head" }
    
    /// The content of the aside element, which can include any flow content.
    ///
    /// This should contain content that is tangentially related to the surrounding content
    /// but could be removed without diminishing the meaning of the main content.
    public var content: () -> HTML
    
    /// Creates a new Aside element with the specified content.
    ///
    /// - Parameter content: The content of the aside element, typically including supplementary information
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias head = Head


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/head
 */
// <head>: The Document Metadata (Header) element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <head>
// HTML
// element contains machine-readable information (
// metadata
// ) about the document, like its
// title
// ,
// scripts
// , and
// style sheets
// . There can be only one
// <head>
// element in an HTML document.
// Note:
// <head>
// primarily holds information for machine processing, not human-readability. For human-visible information, like top-level headings and listed authors, see the
// <header>
// element.
// Attributes
// This element includes the
// global attributes
// .
// profile
// Deprecated
// The
// URI
// s of one or more metadata profiles, separated by
// white space
// .
// Examples
// html
// <!doctype html>
// <html lang="en-US">
//  <head>
//  <meta charset="UTF-8" />
//  <meta name="viewport" content="width=device-width" />
//  <title>Document title</title>
//  </head>
// </html>
// Technical summary
// Content categories
// None.
// Permitted content
// If the document is an
// <iframe>
// srcdoc
// document, or if title
//  information is available from a higher level protocol (like the
//  subject line in HTML email), zero or more elements of metadata
//  content.
// Otherwise, one or more elements of metadata content where exactly one
//  is a
// <title>
// element.
// Tag omission
// The start tag may be omitted if the first thing inside the
// <head>
// element is an element.
// The end tag may be
//  omitted if the first thing following the
// <head>
// element is not a space character or a comment.
// Permitted parents
// An
// <html>
// element, as its first child.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLHeadElement
// Specifications
// Specification
// HTML
// #
// the-head-element
// Browser compatibility
// See also
// Elements that can be used inside the
// <head>
// :
// <title>
// <base>
// <link>
// <style>
// <meta>
// <script>
// <noscript>
// <template>