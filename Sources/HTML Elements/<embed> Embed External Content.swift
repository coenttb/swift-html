///
/// <embed> Embed External Content.swift
/// swift-html
///
/// Represents the HTML embed element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<embed>` element, which embeds external content at the specified point in the document.
///
/// The `Embed` struct provides a type-safe way to create HTML embed elements with various attributes.
/// This content is provided by an external application or other source of interactive content such as a browser plug-in.
///
/// ## Example
///
/// ```swift
/// embed(
///     type: "video/mp4",
///     src: "video.mp4",
///     width: 640,
///     height: 480
/// )
/// ```
///
/// ## Best Practices
///
/// - Use the `title` attribute to provide information about the embedded content for screen readers.
/// - Keep in mind that most modern browsers have deprecated and removed support for browser plug-ins,
///   so relying upon `<embed>` is generally not wise for broad browser compatibility.
/// - Consider using more modern elements like `<video>`, `<audio>`, or `<iframe>` when possible.
///
public struct Embed: Element {
    /// The HTML tag name
    public static var tag: String { "embed" }
    
    /// The URL of the resource being embedded
    public var src: HTML_Attributes.Src?
    
    /// The MIME type to use to select the plug-in to instantiate
    public var type: HTML_Attributes.ScriptType?
    
    /// The displayed height of the resource in CSS pixels
    public var height: HTML_Attributes.Height?
    
    /// The displayed width of the resource in CSS pixels
    public var width: HTML_Attributes.Width?
    
    /// Creates a new Embed element with the specified attributes.
    ///
    /// - Parameters:
    ///   - src: The URL of the resource being embedded
    ///   - type: The MIME type to use to select the plug-in to instantiate
    ///   - width: The displayed width of the resource in CSS pixels
    ///   - height: The displayed height of the resource in CSS pixels
    public init(
        src: HTML_Attributes.Src? = nil,
        type: HTML_Attributes.ScriptType? = nil,
        width: HTML_Attributes.Width? = nil,
        height: HTML_Attributes.Height? = nil
    ) {
        self.src = src
        self.type = type
        self.width = width
        self.height = height
    }
}

/// Lowercase typealias for creating Embed elements with a more HTML-like syntax.
public typealias embed = Embed
