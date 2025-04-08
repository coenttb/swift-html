//<source>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/source
//
// <source>: The Media or Image Source element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <source>
// HTML
// element specifies one or more media resources for the
// <picture>
// ,
// <audio>
// , and
// <video>
// elements. It is a
// void element
// , which means that it has no content and does not require a closing tag. This element is commonly used to offer the same media content in multiple file formats in order to provide compatibility with a broad range of browsers given their differing support for
// image file formats
// and
// media file formats
// .
// Try it
// <video controls width="250" height="200" muted>
//  <source src="/shared-assets/videos/flower.webm" type="video/webm" />
//  <source src="/shared-assets/videos/flower.mp4" type="video/mp4" />
//  Download the
//  <a href="/shared-assets/videos/flower.webm">WEBM</a>
//  or
//  <a href="/shared-assets/videos/flower.mp4">MP4</a>
//  video.
// </video>
// Attributes
// This element supports all
// global attributes
// . In addition, the following attributes can be used with it:
// type
// Specifies the
// MIME media type of the image
// or
// other media type
// , optionally including a
// codecs
// parameter
// .
// src
// Specifies the URL of the media resource. Required if the parent of
// <source>
// is
// <audio>
// or
// <video>
// . Not allowed if the parent is
// <picture>
// .
// srcset
// Specifies a comma-separated list of one or more image URLs and their descriptors. Required if the parent of
// <source>
// is
// <picture>
// . Not allowed if the parent is
// <audio>
// or
// <video>
// .
// The list consists of strings separated by commas, indicating a set of possible images for the browser to use. Each string is composed of:
// A URL specifying an image location.
// An optional width descriptorâa positive integer directly followed by
// "w"
// , such as
// 300w
// .
// An optional pixel density descriptorâa positive floating number directly followed by
// "x"
// , such as
// 2x
// .
// Each string in the list must have either a width descriptor or a pixel density descriptor to be valid. These two descriptors should not be used together; only one should be used consistently throughout the list. The value of each descriptor in the list must be unique. The browser chooses the most adequate image to display at a given point of time based on these descriptors. If the descriptors are not specified, the default value used is
// 1x
// . If the
// sizes
// attribute is also present, then each string must include a width descriptor. If the browser does not support
// srcset
// , then
// src
// will be used for the default image source.
// sizes
// Specifies a list of source sizes that describe the final rendered width of the image. Allowed if the parent of
// <source>
// is
// <picture>
// . Not allowed if the parent is
// <audio>
// or
// <video>
// .
// The list consists of source sizes separated by commas. Each source size is media condition-length pair. Before laying the page out, the browser uses this information to determine which image defined in
// srcset
// to display. Note that
// sizes
// will take effect only if width descriptors are provided with
// srcset
// , not pixel density descriptors (i.e.,
// 200w
// should be used instead of
// 2x
// ).
// media
// Specifies the
// media query
// for the resource's intended media.
// height
// Specifies the intrinsic height of the image in pixels. Allowed if the parent of
// <source>
// is a
// <picture>
// . Not allowed if the parent is
// <audio>
// or
// <video>
// .
// The height value must be an integer without any units.
// width
// Specifies the intrinsic width of the image in pixels. Allowed if the parent of
// <source>
// is a
// <picture>
// . Not allowed if the parent is
// <audio>
// or
// <video>
// .
// The width value must be an integer without any units.
// Usage notes
// The
// <source>
// element is a
// void element
// , which means that it not only has no content but also has no closing tag. That is, you
// never
// use
// </source>
// in your HTML.
// The browser goes through a list of
// <source>
// elements to find a format it supports. It uses the first one it can display. For each
// <source>
// element:
// If the
// type
// attribute isn't specified, the browser retrieves the media's type from the server and determines if it can be displayed. If the media can't be rendered, the browser checks the next
// <source>
// in the list.
// If the
// type
// attribute is specified, the browser immediately compares it with the media types it can display. If the type is not supported, the browser skips querying the server and directly checks the next
// <source>
// element.
// If none of the
// <source>
// elements provide a usable source:
// In the case of a
// <picture>
// element, the browser will fall back to using the image specified in the
// <picture>
// element's
// <img>
// child.
// In the case of an
// <audio>
// or
// <video>
// element, the browser will fall back to displaying the content included between the element's opening and closing tags.
// For information about image formats supported by web browsers and guidance on selecting appropriate formats to use, see our
// Image file type and format guide
// . For details on the video and audio media types you can use, see the
// Media type and format guide
// .
// Examples
// Using the
// type
// attribute with
// <video>
// This example demonstrates how to offer a video in different formats: WebM for browsers that support it, Ogg for those that support Ogg, and QuickTime for browsers that support QuickTime. If the
// <audio>
// or
// <video>
// element is not supported by the browser, a notice is displayed instead. If the browser supports the element but does not support any of the specified formats, an
// error
// event is raised on the
// <audio>
// or
// <video>
// element and the default media controls (if enabled) will indicate an error. For more details on which media file formats to use and their browser support, refer to our
// Media type and format guide
// .
// html
// <video controls>
//  <source src="foo.webm" type="video/webm" />
//  <source src="foo.ogg" type="video/ogg" />
//  <source src="foo.mov" type="video/quicktime" />
//  I'm sorry; your browser doesn't support HTML video.
// </video>
// Using the
// media
// attribute with
// <video>
// This example demonstrates how to offer an alternate source file for viewports above a certain width. When a user's browsing environment meets the specified
// media
// condition, the associated
// <source>
// element is chosen. The contents of its
// src
// attribute are then requested and rendered. If the
// media
// condition does not match, the browser will move on to the next
// <source>
// in the list. The second
// <source>
// option in the code below has no
// media
// condition, so it will be selected for all other browsing contexts.
// html
// <video controls>
//  <source src="foo-large.webm" media="(min-width: 800px)" />
//  <source src="foo.webm" />
//  I'm sorry; your browser doesn't support HTML video.
// </video>
// For more examples, the
// HTML video and audio
// article in the Learn area is a great resource.
// Using the
// media
// attribute with
// <picture>
// In this example, two
// <source>
// elements are included within
// <picture>
// , providing versions of an image to use when the available space exceeds certain widths. If the available width is less than the smallest of these widths, the browser will fall back to the image specified in the
// <img>
// element.
// html
// <picture>
//  <source srcset="mdn-logo-wide.png" media="(min-width: 800px)" />
//  <source srcset="mdn-logo-medium.png" media="(min-width: 600px)" />
//  <img src="mdn-logo-narrow.png" alt="MDN Web Docs" />
// </picture>
// With the
// <picture>
// element, you must always include an
// <img>
// with a fallback image. Also, make sure to add an
// alt
// attribute for accessibility, unless the image is purely decorative and irrelevant to the content.
// Using
// height
// and
// width
// attributes with
// <picture>
// In this example, three
// <source>
// elements with
// height
// and
// width
// attributes are included in a
// <picture>
// element.
// A
// media query
// allows the browser to select an image to display with the
// height
// and
// width
// attributes based on the
// viewport
// size.
// html
// <picture>
//  <source
//  srcset="landscape.png"
//  media="(min-width: 1000px)"
//  width="1000"
//  height="400" />
//  <source
//  srcset="square.png"
//  media="(min-width: 800px)"
//  width="800"
//  height="800" />
//  <source
//  srcset="portrait.png"
//  media="(min-width: 600px)"
//  width="600"
//  height="800" />
//  <img
//  src="fallback.png"
//  alt="Image used when the browser does not support the sources"
//  width="500"
//  height="400" />
// </picture>
// Technical summary
// Content categories
// None.
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// A media elementâ
// <audio>
// or
// <video>
// âand it must be placed before any
// flow content
// or
// <track>
// element.
// A
// <picture>
// element, and it must be placed
//  before the
// <img>
// element.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLSourceElement
// Specifications
// Specification
// HTML
// #
// the-source-element
// Browser compatibility
// See also
// <audio>
// element
// <picture>
// element
// <video>
// element
// Image file type and format guide
// Media type and format guide
// Web performance

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
