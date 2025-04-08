///
/// <canvas> Graphics Canvas.swift
/// swift-html
///
/// Represents the HTML canvas element for drawing graphics.
///
/// Created by Claude on 04/07/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML canvas element (`<canvas>`), which is used to draw graphics via scripting
/// (usually JavaScript) with either the Canvas API or WebGL API.
///
/// The `Canvas` struct provides a type-safe way to create HTML canvas elements. This element
/// is primarily used for rendering graphics, game graphics, data visualizations, photo manipulations,
/// and real-time video processing.
///
/// ## Example
///
/// ```swift
/// canvas(width: 300, height: 150) {
///     "Your browser does not support the canvas element."
/// }
/// ```
///
/// ## Dimensions
///
/// - The default canvas size is 300 pixels wide by 150 pixels high
/// - Specify dimensions with the `width` and `height` attributes
/// - It's recommended to set width and height attributes directly rather than using CSS
///   to avoid distortion
///
/// ## Accessibility Considerations
///
/// - Always provide fallback content inside the canvas element for browsers that don't support it
/// - Canvas content is not inherently accessible to screen readers
/// - Consider alternative ways to present the information for accessibility
///
/// - Note: When rendered, this generates an HTML `<canvas>` element that can be used 
///   for drawing graphics with JavaScript.
public struct Canvas<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "canvas" }
    
    /// The width of the canvas in CSS pixels (defaults to 300 if not specified)
    public var width: HTML_Attributes.Width?
    
    /// The height of the canvas in CSS pixels (defaults to 150 if not specified)
    public var height: HTML_Attributes.Height?
    
    /// The fallback content for browsers that don't support canvas
    public let content: () -> HTML
    
    /// Creates a new Canvas element with the specified dimensions and fallback content.
    ///
    /// - Parameters:
    ///   - width: The width of the canvas in CSS pixels
    ///   - height: The height of the canvas in CSS pixels
    ///   - content: The fallback content for browsers that don't support canvas
    public init(
        width: HTML_Attributes.Width? = nil,
        height: HTML_Attributes.Height? = nil,
        content: @escaping () -> HTML
    ) {
        self.width = width
        self.height = height
        self.content = content
    }
}

/// Lowercase typealias for creating Canvas elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `canvas` identifier when creating
/// HTML canvas elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// canvas(width: 300, height: 150) {
///     "Your browser does not support the canvas element."
/// }
/// ```
public typealias canvas = Canvas

/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/canvas
 */
// <canvas>: The Graphics Canvas element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// Learn more
// See full compatibility
// Report feedback
// Use the
// HTML
// <canvas>
// element
// with either the
// canvas scripting API
// or the
// WebGL API
// to draw graphics and animations.
// Attributes
// This element's attributes include the
// global attributes
// .
// height
// The height of the coordinate space in CSS pixels. Defaults to 150.
// moz-opaque
// Non-standard
// Deprecated
// Lets the canvas know whether translucency will be a factor. If the canvas knows there's no translucency, painting performance can be optimized. This is only supported by Mozilla-based browsers; use the standardized
// canvas.getContext('2d', { alpha: false })
// instead.
// width
// The width of the coordinate space in CSS pixels. Defaults to 300.
// Usage notes
// Alternative content
// You should provide alternate content inside the
// <canvas>
// block. That content will be rendered both on older browsers that don't support canvas and in browsers with JavaScript disabled.
// Closing
// </canvas>
// tag
// Unlike the
// <img>
// element, the
// <canvas>
// element
// requires
// the closing tag (
// </canvas>
// ).
// Sizing the canvas using CSS versus HTML
// The displayed size of the canvas can be changed using CSS, but if you do this the image is scaled during rendering to fit the styled size, which can make the final graphics rendering end up being distorted.
// It is better to specify your canvas dimensions by setting the
// width
// and
// height
// attributes directly on the
// <canvas>
// elements, either directly in the HTML or by using JavaScript.
// Maximum canvas size
// The exact maximum size of a
// <canvas>
// element depends on the browser and environment. While in most cases the maximum dimensions exceed 10,000 x 10,000 pixels, notably iOS devices limit the canvas size to only 4,096 x 4,096 pixels. See
// canvas size limits in different browsers and devices
// .
// Note:
// Exceeding the maximum dimensions or area renders the canvas unusable â drawing commands will not work.
// Using an offscreen canvas
// A canvas can be rendered using the
// OffscreenCanvas
// API where the document and canvas are decoupled.
// The benefit is that a
// worker thread
// can handle canvas rendering and the main thread of your web application is not blocked by canvas operations.
// By parallelizing work, other UI elements of your web application will remain responsive even if you are running complex graphics on an offscreen canvas.
// For more information, see the
// OffscreenCanvas
// API documentation.
// Accessibility
// Alternative content
// The
// <canvas>
// element on its own is just a bitmap and does not provide information about any drawn objects. Canvas content is not exposed to accessibility tools as semantic HTML is. In general, you should avoid using canvas in an accessible website or app. The following guides can help to make it more accessible.
// Canvas accessibility use cases
// Canvas element accessibility issues
// HTML Canvas Accessibility in Firefox 13 â by Steve Faulkner
// Best practices for interactive canvas elements
// Examples
// HTML
// This code snippet adds a canvas element to your HTML document. A fallback text is provided if a browser is unable to read or render the canvas.
// html
// <canvas width="120" height="120">
//  An alternative text describing what your canvas displays.
// </canvas>
// JavaScript
// Then in the JavaScript code, call
// HTMLCanvasElement.getContext()
// to get a drawing context and start drawing onto the canvas:
// js
// const canvas = document.querySelector("canvas");
// const ctx = canvas.getContext("2d");
// ctx.fillStyle = "green";
// // Add a rectangle at (10, 10) with size 100x100 pixels
// ctx.fillRect(10, 10, 100, 100);
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// embedded content
// , palpable content.
// Permitted content
// Transparent but with no
// interactive content
// descendants except for
// <a>
// elements,
// <button>
// elements,
// <input>
// elements whose
// type
// attribute is
// checkbox
// ,
// radio
// , or
// button
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// Any
// DOM interface
// HTMLCanvasElement
// Specifications
// Specification
// HTML
// #
// the-canvas-element
// Browser compatibility
// See also
// Canvas API
// Canvas tutorial
// OffscreenCanvas
// Canvas cheat sheet
// (2009)
// Canvas cheat sheet
// (pdf) (2015)
// Safari HTML canvas guide
// via Apple (2013)
// CanvasRenderingContext2D
// 2D drawing context for a canvas element
// via Apple.com
// WebGL
// API
// <img>
// SVG
// HTML video and audio