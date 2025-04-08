//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

public struct Picture<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "picture" }
    
    public let content: () -> HTML
    
    public init(
        content: @escaping () -> HTML
    ) {
        self.content = content
    }
}

public typealias picture = Picture


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/picture
 */
// <picture>: The Picture element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// March 2016
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <picture>
// HTML
// element contains zero or more
// <source>
// elements and one
// <img>
// element to offer alternative versions of an image for different display/device scenarios.
// The browser will consider each child
// <source>
// element and choose the best match among them. If no matches are foundâor the browser doesn't support the
// <picture>
// elementâthe URL of the
// <img>
// element's
// src
// attribute is selected. The selected image is then presented in the space occupied by the
// <img>
// element.
// Try it
// <!--Change the browser window width to see the image change.-->
// <picture>
//  <source
//  srcset="/shared-assets/images/examples/surfer.jpg"
//  media="(orientation: portrait)" />
//  <img src="/shared-assets/images/examples/painted-hand.jpg" alt="" />
// </picture>
// To decide which URL to load, the
// user agent
// examines each
// <source>
// 's
// srcset
// ,
// media
// , and
// type
// attributes to select a compatible image that best matches the current layout and capabilities of the display device.
// The
// <img>
// element serves two purposes:
// It describes the size and other attributes of the image and its presentation.
// It provides a fallback in case none of the offered
// <source>
// elements are able to provide a usable image.
// Common use cases for
// <picture>
// :
// Art direction.
// Cropping or modifying images for different
// media
// conditions (for example, loading a simpler version of an image which has too many details, on smaller displays).
// Offering alternative image formats
// , for cases where certain formats are not supported.
// Note:
// For example, newer formats like
// AVIF
// or
// WEBP
// have many advantages, but might not be supported by the browser. A list of supported image formats can be found in:
// Image file type and format guide
// .
// Saving bandwidth and speeding page load times
// by loading the most appropriate image for the viewer's display.
// If providing higher-density versions of an image for high-DPI (Retina) display, use
// srcset
// on the
// <img>
// element instead. This lets browsers opt for lower-density versions in data-saving modes, and you don't have to write explicit
// media
// conditions.
// Attributes
// This element includes only
// global attributes
// .
// Usage notes
// You can use the
// object-position
// property to adjust the positioning of the image within the element's frame, and the
// object-fit
// property to control how the image is resized to fit within the frame.
// Note:
// Use these properties on the child
// <img>
// element,
// not
// the
// <picture>
// element.
// Examples
// These examples demonstrate how different attributes of the
// <source>
// element change the selection of the image inside
// <picture>
// .
// The media attribute
// The
// media
// attribute specifies a media condition (similar to a media query) that the user agent will evaluate for each
// <source>
// element.
// If the
// <source>
// 's media condition evaluates to
// false
// , the browser skips it and evaluates the next element inside
// <picture>
// .
// html
// <picture>
//  <source srcset="mdn-logo-wide.png" media="(min-width: 600px)" />
//  <img src="mdn-logo-narrow.png" alt="MDN" />
// </picture>
// The srcset attribute
// The
// srcset
// attribute is used to offer a list of possible images based on size or the display's pixel density.
// It is composed of a comma-separated list of image descriptors. Each image descriptor is composed of a URL of the image, and
// either
// :
// a
// width descriptor
// , followed by a
// w
// (such as
// 300w
// );
// OR
// a
// pixel density descriptor
// , followed by an
// x
// (such as
// 2x
// ) to serve a high-res image for high-DPI screens.
// Make sure to note that:
// width and pixel density descriptors should not be used together
// a missing pixel density descriptor implies 1x
// duplicate descriptor values are not allowed (2x & 2x, 100w & 100w)
// The following example illustrates the usage of
// srcset
// attribute with the
// <source>
// element to specify a high-density and standard-resolution image:
// html
// <picture>
//  <source srcset="logo.png, logo-1.5x.png 1.5x" />
//  <img src="logo.png" alt="MDN Web Docs logo" height="320" width="320" />
// </picture>
// The
// srcset
// attribute can also be used on the
// <img>
// element without needing the
// <picture>
// element. The following example demonstrates how to use the
// srcset
// attribute to specify standard-resolution and high-density images, respectively:
// html
// <img
//  srcset="logo.png, logo-2x.png 2x"
//  src="logo.png"
//  height="320"
//  width="320"
//  alt="MDN Web Docs logo" />
// The
// sizes
// attribute is not mandatory when using srcset, but it is recommended to use it in order to provide additional information to the browser to help it select the best image source.
// Without sizes, the browser will use the default size of the image as specified by its dimensions in pixels. This may not be the best fit for all devices, especially if the image is displayed on different screen sizes or in different contexts.
// Please note that sizes will have its effect only if width dimension descriptors are provided with srcset instead of pixel ratio values (200w instead of 2x for example).
// For more information on using
// srcset
// , see the
// Responsive images
// documentation.
// The type attribute
// The
// type
// attribute specifies a
// MIME type
// for the resource URL(s) in the
// <source>
// element's
// srcset
// attribute. If the user agent does not support the given type, the
// <source>
// element is skipped.
// html
// <picture>
//  <source srcset="photo.avif" type="image/avif" />
//  <source srcset="photo.webp" type="image/webp" />
//  <img src="photo.jpg" alt="photo" />
// </picture>
// Technical summary
// Content categories
// Flow content
// , phrasing content, embedded content
// Permitted content
// Zero or more
// <source>
// elements, followed by one
// <img>
// element, optionally intermixed with
//  script-supporting elements.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that allows embedded content.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLPictureElement
// Specifications
// Specification
// HTML
// #
// the-picture-element
// Browser compatibility
// See also
// <img>
// element
// <source>
// element
// Positioning and sizing the picture within its frame:
// object-position
// and
// object-fit
// Image file type and format guide