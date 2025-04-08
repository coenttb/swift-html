//<embed>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/embed
//
// <embed>: The Embed External Content element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// January 2020
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <embed>
// HTML
// element embeds external content at the specified point in the document. This content is provided by an external application or other source of interactive content such as a browser plug-in.
// Try it
// <embed
//  type="video/mp4"
//  src="/shared-assets/videos/flower.mp4"
//  width="250"
//  height="200" />
// Note:
// This topic documents only the element that is defined as part of the
// HTML Living Standard
// . It does not address earlier, non-standardized implementation of the element.
// Keep in mind that most modern browsers have deprecated and removed support for browser plug-ins, so relying upon
// <embed>
// is generally not wise if you want your site to be operable on the average user's browser.
// Attributes
// This element's attributes include the
// global attributes
// .
// height
// The displayed height of the resource, in
// CSS pixels
// . This must be an absolute value; percentages are
// not
// allowed.
// src
// The URL of the resource being embedded.
// type
// The
// MIME type
// to use to select the plug-in to instantiate.
// width
// The displayed width of the resource, in
// CSS pixels
// . This must be an absolute value; percentages are
// not
// allowed.
// Usage notes
// You can use the
// object-position
// property to adjust the positioning of the embedded object within the element's frame.
// Note:
// The
// object-fit
// property has no effect on
// <embed>
// elements.
// Accessibility
// Use the
// title
// attribute
// on an
// embed
// element to label its content so that people navigating with assistive technology such as a screen reader can understand what it contains. The title's value should concisely describe the embedded content. Without a title, they may not be able to determine what its embedded content is. This context shift can be confusing and time-consuming, especially if the
// embed
// element contains interactive content like video or audio.
// Examples
// html
// <embed
//  type="video/quicktime"
//  src="movie.mov"
//  width="640"
//  height="480"
//  title="Title of my video" />
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , embedded content, interactive content,
// palpable content
// .
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// Any element that accepts embedded content.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// application
// ,
// document
// ,
// img
// ,
// none
// ,
// presentation
// DOM interface
// HTMLEmbedElement
// Specifications
// Specification
// HTML
// #
// the-embed-element
// Browser compatibility
// See also
// Other elements that are used for embedding content of various types include
// <audio>
// ,
// <canvas>
// ,
// <iframe>
// ,
// <img>
// ,
// <math>
// ,
// <object>
// ,
// <svg>
// , and
// <video>
// .
// Positioning and sizing the embedded content within its frame:
// object-position
// and
// object-fit

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

