///
/// <iframe> Inline Frame.swift
/// swift-html
///
/// Represents the HTML inline frame element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML inline frame element (`<iframe>`), which embeds another HTML page into the current one.
///
/// The `InlineFrame` struct provides a type-safe way to create HTML iframe elements with various attributes.
///
/// ## Example
///
/// ```swift
/// iframe(src: "https://example.org", title: "Example Website") {
///     // No content as iframes are typically empty
/// }
/// ```
///
/// ## Accessibility
///
/// - Always include a descriptive `title` attribute to label the iframe's content for screen reader users
/// - The `title` should concisely describe what is being embedded
/// - Without a title, assistive technology users must navigate into the iframe to determine its content
///
/// ## Best Practices
///
/// - Use the `sandbox` attribute to restrict the embedded content's capabilities when embedding untrusted content
/// - Avoid using too many iframes on a single page as they consume additional memory and computing resources
/// - Use the `loading="lazy"` attribute for iframes that are not immediately visible on page load
/// - Specify both `width` and `height` attributes to prevent layout shifts as the page loads
public struct InlineFrame: Element {
    /// The HTML tag name
    public static var tag: String { "iframe" }
    
    /// The URL of the page to embed
    public var src: HTML_Attributes.Src?
    
    /// Inline HTML to embed, overriding the src attribute
    public var srcdoc: String?
    
    /// A targetable name for the embedded browsing context
    public var name: HTML_Attributes.Name?
    
    /// Controls restrictions applied to the content embedded in the iframe
    public var sandbox: String?
    
    /// Set to true if the iframe can activate fullscreen mode
    public var allowfullscreen: HTML_Attributes.Allowfullscreen?
    
    /// Specifies a Permissions Policy for the iframe
    public var allow: String?
    
    /// The width of the frame in CSS pixels (default is 300)
    public var width: HTML_Attributes.Width?
    
    /// The height of the frame in CSS pixels (default is 150)
    public var height: HTML_Attributes.Height?
    
    /// Indicates how the browser should load the iframe (eager or lazy)
    public var loading: String?
    
    /// Controls referrer policy when fetching the frame's resource
    public var referrerpolicy: HTML_Attributes.ReferrerPolicy?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new InlineFrame element with the specified attributes.
    ///
    /// - Parameters:
    ///   - src: The URL of the page to embed
    ///   - srcdoc: Inline HTML to embed, overriding the src attribute
    ///   - name: A targetable name for the embedded browsing context
    ///   - sandbox: Controls restrictions applied to the content embedded in the iframe
    ///   - allowfullscreen: Set to true if the iframe can activate fullscreen mode
    ///   - allow: Specifies a Permissions Policy for the iframe
    ///   - width: The width of the frame in CSS pixels
    ///   - height: The height of the frame in CSS pixels
    ///   - loading: Indicates how the browser should load the iframe
    ///   - referrerpolicy: Controls referrer policy when fetching the frame's resource
    ///   - content: The content of the element (typically empty for iframes)
    public init(
        src: HTML_Attributes.Src? = nil,
        srcdoc: String? = nil,
        name: HTML_Attributes.Name? = nil,
        sandbox: String? = nil,
        allowfullscreen: HTML_Attributes.Allowfullscreen? = nil,
        allow: String? = nil,
        width: HTML_Attributes.Width? = nil,
        height: HTML_Attributes.Height? = nil,
        loading: String? = nil,
        referrerpolicy: HTML_Attributes.ReferrerPolicy? = nil,
        
    ) {
        self.src = src
        self.srcdoc = srcdoc
        self.name = name
        self.sandbox = sandbox
        self.allowfullscreen = allowfullscreen
        self.allow = allow
        self.width = width
        self.height = height
        self.loading = loading
        self.referrerpolicy = referrerpolicy
        
    }
}

/// Lowercase typealias for creating InlineFrame elements with a more HTML-like syntax.
public typealias iframe = InlineFrame
