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
/// - Maximum canvas dimensions vary by browser and device (iOS devices limit to 4,096 x 4,096 pixels)
/// - Exceeding maximum dimensions will render the canvas unusable
///
/// ## Accessibility Considerations
///
/// - Always provide fallback content inside the canvas element for browsers that don't support it
/// - Canvas content is not inherently accessible to screen readers
/// - Consider alternative ways to present the information for accessibility
/// - In general, avoid using canvas in an accessible website or app if possible
///
/// ## Advanced Usage
/// 
/// - OffscreenCanvas API can be used to render canvas in a worker thread
/// - This prevents blocking the main thread during complex rendering operations
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