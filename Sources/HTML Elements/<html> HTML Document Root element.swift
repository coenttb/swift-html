//<html>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/html
//
// <html>: The HTML Document / Root element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <html>
// HTML
// element represents the root (top-level element) of an HTML document, so it is also referred to as the
// root element
// . All other elements must be descendants of this element. There can be only one
// <html>
// element in a document.
// Attributes
// This element includes the
// global attributes
// .
// version
// Deprecated
// Specifies the version of the HTML
// Document Type Definition
// that governs the current document. This attribute is not needed, because it is redundant with the version information in the document type declaration.
// xmlns
// Specifies the
// XML
// Namespace
// of the document. Default value is
// "http://www.w3.org/1999/xhtml"
// . This is required in documents parsed with XML
// parsers
// , and optional in text/html documents.
// Accessibility
// While HTML does not require authors to specify
// <html>
// element start and ending tags, it is important for authors to do so as it will allow them to specify the
// lang
// for the webpage. Providing a
// lang
// attribute with a valid language tag according to
// RFC 5646: Tags for Identifying Languages (also known as BCP 47)
// on the
// <html>
// element will help screen reading technology determine the proper language to announce. The identifying language tag should describe the language used by the majority of the content of the page. Without it, screen readers will typically default to the operating system's set language, which may cause mispronunciations.
// Including a valid
// lang
// declaration on the
// <html>
// element also ensures that important metadata contained in the page's
// <head>
// , such as the page's
// <title>
// , are also announced properly.
// MDN Understanding WCAG, Guideline 3.1 explanations
// Understanding Success Criterion 3.1.1 | W3C Understanding WCAG 2.1
// Example
// html
// <!doctype html>
// <html lang="en">
//  <head>
//  <!-- â¦ -->
//  </head>
//  <body>
//  <!-- â¦ -->
//  </body>
// </html>
// Technical summary
// Content categories
// None.
// Permitted content
// One
// <head>
// element, followed by one
// <body>
// element.
// Tag omission
// The start tag may be omitted if the first thing inside the
// <html>
// element is not a comment.
// The end tag may
//  be omitted if the
// <html>
// element is not immediately
//  followed by a comment.
// Permitted parents
// None. This is the root element of a document.
// Implicit ARIA role
// document
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLHtmlElement
// Specifications
// Specification
// HTML
// #
// the-html-element
// Browser compatibility
// See also
// MathML top-level element:
// <math>
// SVG top-level element:
// <svg>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
