//<frame>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/frame
//
// <frame>
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <frame>
// HTML
// element defines a particular area in which another HTML document can be displayed. A frame should be used within a
// <frameset>
// .
// Using the
// <frame>
// element is not encouraged because of certain disadvantages such as performance problems and lack of accessibility for users with screen readers. Instead of the
// <frame>
// element,
// <iframe>
// may be preferred.
// Attributes
// Like all other HTML elements, this element supports the
// global attributes
// .
// src
// Deprecated
// This attribute specifies the document that will be displayed by the frame.
// name
// Deprecated
// This attribute is used for labeling frames. Without labeling, every link will open in the frame that it's in â the closest parent frame. See the
// target
// attribute for more information.
// noresize
// Deprecated
// This attribute prevents resizing of frames by users.
// scrolling
// Deprecated
// This attribute defines the existence of a scrollbar. If this attribute is not used, the browser adds a scrollbar when necessary. There are two choices: "yes" for forcing a scrollbar even when it is not necessary and "no" for forcing no scrollbar even when it
// is
// necessary.
// marginheight
// Deprecated
// This attribute defines the height of the margin between frames.
// marginwidth
// Deprecated
// This attribute defines the width of the margin between frames.
// frameborder
// Deprecated
// This attribute allows you to specify a frame's border.
// Example
// A frameset document
// A frameset document has a
// <frameset>
// element instead of a
// <body>
// element. The
// <frame>
// elements are placed within the
// <frameset>
// .
// html
// <!doctype html>
// <html lang="en-US">
//  <head>
//  <!-- Document metadata goes here -->
//  </head>
//  <frameset cols="400, 500">
//  <frame src="https://developer.mozilla.org/en/HTML/Element/iframe" />
//  <frame src="https://developer.mozilla.org/en/HTML/Element/frame" />
//  </frameset>
// </html>
// If you want to embed another HTML page into the
// <body>
// of a document, use an
// <iframe>
// element.
// Specifications
// Specification
// HTML
// #
// frame
// Browser compatibility
// See also
// <frameset>
// <iframe>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
