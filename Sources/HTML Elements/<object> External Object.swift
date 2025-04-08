//<object>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/object
//
// <object>: The External Object element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <object>
// HTML
// element represents an external resource, which can be treated as an image, a nested browsing context, or a resource to be handled by a plugin.
// Try it
// <object
//  type="video/mp4"
//  data="/shared-assets/videos/flower.mp4"
//  width="250"
//  height="200"></object>
// Attributes
// This element includes the
// global attributes
// .
// archive
// Deprecated
// A space-separated list of URIs for archives of resources for the object.
// border
// Deprecated
// The width of a border around the control, in pixels.
// classid
// Deprecated
// The URI of the object's implementation. It can be used together with, or in place of, the
// data
// attribute.
// codebase
// Deprecated
// The base path used to resolve relative URIs specified by
// classid
// ,
// data
// , or
// archive
// . If not specified, the default is the base URI of the current document.
// codetype
// Deprecated
// The content type of the data specified by
// classid
// .
// data
// The address of the resource as a valid URL. At least one of
// data
// and
// type
// must be defined.
// declare
// Deprecated
// The presence of this Boolean attribute makes this element a declaration only. The object must be instantiated by a subsequent
// <object>
// element. Repeat the
// <object>
// element completely each time the resource is reused.
// form
// The form element, if any, that the object element is associated with (its
// form owner
// ). The value of the attribute must be an ID of a
// <form>
// element in the same document.
// height
// The height of the displayed resource, as in
// <integer>
// in
// CSS pixels
// .
// name
// The name of valid browsing context (HTML5), or the name of the control (HTML 4).
// standby
// Deprecated
// A message that the browser can show while loading the object's implementation and data.
// type
// The
// content type
// of the resource specified by
// data
// . At least one of
// data
// and
// type
// must be defined.
// usemap
// Deprecated
// A hash-name reference to a
// <map>
// element; that is a '#' followed by the value of a
// name
// of a map element.
// width
// The width of the display resource, as in
// <integer>
// in
// CSS pixels
// .
// Examples
// Embed a video
// HTML
// html
// <object
//  type="video/webm"
//  data="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"
//  width="600"
//  height="140">
//  <img src="path/image.jpg" alt="useful image description" />
// </object>
// Result
// If the video in the example fails to load, the user will be provided with an image as fallback content. The
// <img>
// tag is used to display an image. We include the
// src
// attribute set to the path to the image we want to embed. We also include the
// alt
// attribute, which provides the image with an accessible name. If the image also fails to load, the content of the
// alt
// attribute will be displayed.
// Technical summary
// Content categories
// Flow content
// ;
// phrasing content
// ;
// embedded content
// , palpable content; if the element has a
// usemap
// attribute,
// interactive content
// ;
// listed
// ,
// submittable
// form-associated
// element.
// Permitted content
// zero or more
// <param>
// elements, then
// transparent
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// embedded content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// application
// ,
// document
// ,
// img
// DOM interface
// HTMLObjectElement
// Specifications
// Specification
// HTML
// #
// the-object-element
// Browser compatibility
// See also
// <embed>
// <param>

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
