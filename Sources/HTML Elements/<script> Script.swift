///
/// <script> Script.swift
/// swift-html
///
/// Represents the HTML Script element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<script>` element, which is used to embed executable code or data.
///
/// The `Script` struct provides a type-safe way to create HTML script elements with various attributes.
/// This element is typically used to embed or refer to JavaScript code, but can also be used with other
/// languages such as WebGL's GLSL shader programming language and JSON.
///
/// ## Basic Examples
///
/// ```swift
/// // External script
/// script.src("javascript.js")
///
/// // Inline script
/// script {
///     "alert('Hello World!');"
/// }
/// ```
///
/// ## Using Async and Defer
///
/// - `async`: Scripts will download in parallel to parsing and execute as soon as they are available.
///   Use when scripts run independently and don't depend on other scripts.
///
/// ```swift
/// script.src("analytics.js").async(true)
/// ```
///
/// - `defer`: Scripts will load in the order they appear and execute after the page content is loaded.
///   Use when scripts depend on the DOM being in place.
///
/// ```swift
/// script.src("ui-framework.js").defer(true)
/// ```
///
/// ## Module Scripts
///
/// ```swift
/// script.src("module.js").type(.module)
/// ```
///
/// ## Best Practices
///
/// - Use `async` for scripts that don't depend on other scripts or DOM elements
/// - Use `defer` for scripts that depend on the DOM being in place
/// - For critical functionality, consider placing scripts at the end of the body
/// - Use the `integrity` attribute for subresource integrity when loading external scripts
/// - Specify `type="module"` for ES modules
///
public struct Script<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "script" }
    
    /// The URL of an external script file
    public var src: HTML_Attributes.Src?
    
    /// Indicates that the script should be executed asynchronously
    public var async: HTML_Attributes.Async?
    
    /// Indicates that the script should be executed after the document has been parsed
    public var `defer`: HTML_Attributes.Defer?
    
    /// Indicates the type of script represented
    public var type: HTML_Attributes.ScriptType?
    
    /// Indicates integrity metadata for the script
    public var integrity: HTML_Attributes.Integrity?
    
    /// Indicates which referrer to send when fetching the script
    public var referrerpolicy: HTML_Attributes.Referrerpolicy?
    
    /// Indicates that the script should not be executed in browsers that support ES modules
    public var nomodule: HTML_Attributes.Nomodule?
    
    /// Provides a hint of the relative priority to use when fetching the script
    public var fetchpriority: HTML_Attributes.Fetchpriority?
    
    /// Explicitly indicates that certain operations should be blocked on the fetching of the script
    public var blocking: HTML_Attributes.Blocking?
    
    /// Indicates how the element handles crossorigin requests
    public var crossorigin: HTML_Attributes.Crossorigin?
    
    /// A cryptographic nonce for Content-Security-Policy
    public var nonce: HTML_Attributes.Nonce?
    
    /// For registration with the Attribution Reporting API
    public var attributionsrc: HTML_Attributes.AttributionSrc?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Script element with the specified attributes.
    ///
    /// - Parameters:
    ///   - src: The URL of an external script file
    ///   - async: Indicates that the script should be executed asynchronously
    ///   - defer: Indicates that the script should be executed after the document has been parsed
    ///   - type: Indicates the type of script represented
    ///   - integrity: Integrity metadata for subresource integrity
    ///   - referrerpolicy: Indicates which referrer to send when fetching the script
    ///   - nomodule: Indicates that the script should not be executed in browsers that support ES modules
    ///   - fetchpriority: Provides a hint of the relative priority for fetching
    ///   - blocking: Indicates operations that should be blocked on script fetching
    ///   - crossorigin: Indicates how the element handles crossorigin requests
    ///   - nonce: A cryptographic nonce for Content-Security-Policy
    ///   - attributionsrc: For registration with the Attribution Reporting API
    ///   - content: The content of the script element (inline script code or data)
    public init(
        src: HTML_Attributes.Src? = nil,
        async: HTML_Attributes.Async? = nil,
        defer: HTML_Attributes.Defer? = nil,
        type: HTML_Attributes.ScriptType? = nil,
        integrity: HTML_Attributes.Integrity? = nil,
        referrerpolicy: HTML_Attributes.Referrerpolicy? = nil,
        nomodule: HTML_Attributes.Nomodule? = nil,
        fetchpriority: HTML_Attributes.Fetchpriority? = nil,
        blocking: HTML_Attributes.Blocking? = nil,
        crossorigin: HTML_Attributes.Crossorigin? = nil,
        nonce: HTML_Attributes.Nonce? = nil,
        attributionsrc: HTML_Attributes.AttributionSrc? = nil,
        content: @escaping () -> HTML
    ) {
        self.src = src
        self.async = async
        self.defer = `defer`
        self.type = type
        self.integrity = integrity
        self.referrerpolicy = referrerpolicy
        self.nomodule = nomodule
        self.fetchpriority = fetchpriority
        self.blocking = blocking
        self.crossorigin = crossorigin
        self.nonce = nonce
        self.attributionsrc = attributionsrc
        self.content = content
    }
}

/// Lowercase typealias for creating Script elements with a more HTML-like syntax.
public typealias script = Script
