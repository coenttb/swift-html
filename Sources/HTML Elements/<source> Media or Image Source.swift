///
/// <source> Media or Image Source.swift
/// swift-html
///
/// Represents the HTML <source> element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<source>` element, which specifies one or more media resources for 
/// `<picture>`, `<audio>`, and `<video>` elements.
///
/// The `Source` struct is a void element, meaning it has no content and does not require a closing tag.
/// This element is commonly used to offer the same media content in multiple file formats to provide
/// compatibility with a broad range of browsers given their differing support for image and media file formats.
///
/// ## Examples
///
/// ```swift
/// // For video elements with multiple formats
/// video {
///     source(src: "video.webm", type: "video/webm")
///     source(src: "video.mp4", type: "video/mp4")
///     "Your browser does not support HTML video."
/// }
///
/// // For responsive images with media queries
/// picture {
///     source(srcset: "large.jpg", media: "(min-width: 800px)")
///     source(srcset: "medium.jpg", media: "(min-width: 600px)")
///     img(src: "small.jpg", alt: "A responsive image")
/// }
/// ```
///
/// ## Best Practices
///
/// - Provide multiple source formats for maximum browser compatibility
/// - When used with `<picture>`, always include an `<img>` fallback
/// - Specify the `type` attribute to avoid unnecessary server requests
/// - For responsive images, use media queries with the `media` attribute
/// - For `<picture>`, use the `srcset` attribute; for `<audio>` and `<video>`, use the `src` attribute
///
public struct Source: Element {
    /// The HTML tag name
    public static var tag: String { "source" }
    
    /// The MIME media type of the resource
    public var type: String?
    
    /// The URL of the media resource (used with `<audio>` and `<video>`)
    public var src: HTML_Attributes.Src?
    
    /// A comma-separated list of image URLs and their descriptors (used with `<picture>`)
    public var srcset: HTML_Attributes.ImageSrcSet?
    
    /// A list of source sizes that describe the final rendered width of the image
    public var sizes: HTML_Attributes.Sizes?
    
    /// A media query for the resource's intended media
    public var media: HTML_Attributes.Media?
    
    /// The intrinsic height of the image in pixels (for `<picture>`)
    public var height: HTML_Attributes.Height?
    
    /// The intrinsic width of the image in pixels (for `<picture>`)
    public var width: HTML_Attributes.Width?
    
    /// Creates a new Source element with the specified attributes.
    ///
    /// - Parameters:
    ///   - type: The MIME media type of the resource
    ///   - src: The URL of the media resource (for `<audio>` and `<video>`)
    ///   - srcset: A comma-separated list of image URLs and their descriptors (for `<picture>`)
    ///   - sizes: A list of source sizes that describe the final rendered width of the image
    ///   - media: A media query for the resource's intended media
    ///   - height: The intrinsic height of the image in pixels (for `<picture>`)
    ///   - width: The intrinsic width of the image in pixels (for `<picture>`)
    public init(
        type: String? = nil,
        src: HTML_Attributes.Src? = nil,
        srcset: HTML_Attributes.ImageSrcSet? = nil,
        sizes: HTML_Attributes.Sizes? = nil,
        media: HTML_Attributes.Media? = nil,
        height: HTML_Attributes.Height? = nil,
        width: HTML_Attributes.Width? = nil
    ) {
        self.type = type
        self.src = src
        self.srcset = srcset
        self.sizes = sizes
        self.media = media
        self.height = height
        self.width = width
    }
}

/// Lowercase typealias for creating Source elements with a more HTML-like syntax.
public typealias source = Source
