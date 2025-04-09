///
/// <fencedframe> Fenced Frame.swift
/// swift-html
///
/// Represents the HTML fencedframe element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML fencedframe element (`<fencedframe>`), which embeds another HTML page within a privacy-preserving container.
///
/// The `FencedFrame` element is similar to an iframe but with enhanced privacy features:
/// - Communication is restricted between the fencedframe content and its embedding site
/// - A fencedframe can access cross-site data only in controlled circumstances that preserve user privacy
/// - It cannot be manipulated via regular scripting
/// - Content can only be embedded via specific APIs like Protected Audience or Shared Storage
/// - Neither the fencedframe nor embedding context can access each other's DOM
///
/// ## Example
///
/// ```swift
/// fencedframe(
///     width: 640,
///     height: 320
/// ) {
///     // Content determined by API-generated config
/// }
/// ```
///
/// ## Accessibility
///
/// Use the `title` global attribute to provide a description of the embedded content for assistive technologies.
/// Without this label, users of screen readers would need to navigate into the fencedframe to understand its content.
///
public struct FencedFrame: Element {
    /// The HTML tag name
    public static var tag: String { "fencedframe" }
    
    /// Specifies a Permissions Policy for the fencedframe
    public var allow: FencedFrame.Allow?
    
    /// Height of the fencedframe in CSS pixels (default is 150)
    public var height: HTML_Attributes.Height?
    
    /// Width of the fencedframe in CSS pixels (default is 300)
    public var width: HTML_Attributes.Width?
    
    /// Creates a new FencedFrame element with the specified attributes.
    ///
    /// - Parameters:
    ///   - allow: Permissions Policy for the fencedframe
    ///   - height: Height in CSS pixels
    ///   - width: Width in CSS pixels
    public init(
        allow: FencedFrame.Allow? = nil,
        height: HTML_Attributes.Height? = nil,
        width: HTML_Attributes.Width? = nil
    ) {
        self.allow = allow
        self.height = height
        self.width = width
        
    }
}

/// Lowercase typealias for creating FencedFrame elements with a more HTML-like syntax.
public typealias fencedframe = FencedFrame

extension FencedFrame {
    public typealias Allow = String
}

