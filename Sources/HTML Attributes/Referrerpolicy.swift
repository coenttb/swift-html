///
/// referrerpolicy.swift
/// swift-html
///
/// Defines the HTML referrerpolicy attribute for controlling referrer information.
///
/// Created by Claude on 04/05/2025.
///

import Foundation

/// Represents the HTML `referrerpolicy` attribute, which controls how much referrer information
/// is included when following links, loading images, or submitting forms.
///
/// The referrer policy affects the Referer HTTP header that is sent to the destination site,
/// specifying the URL of the page that linked to the current request. This attribute helps
/// control privacy and security aspects of navigation.
///
/// ## Usage
///
/// ```swift
/// // Prevent any referrer information from being sent
/// a(href: "https://example.com", referrerpolicy: .noReferrer) {
///     "Link with no referrer"
/// }
///
/// // Default browser behavior
/// a(href: "https://example.com", referrerpolicy: .strictOriginWhenCrossOrigin) {
///     "Link with default referrer policy"
/// }
/// ```
///
/// ## Security Considerations
///
/// - Using `.noReferrer` or `.sameOrigin` can protect user privacy.
/// - The `.unsafeUrl` policy leaks origins and paths from secure resources to insecure ones.
/// - If no policy is specified, browsers typically use `.strictOriginWhenCrossOrigin`.
///
/// This attribute is supported on various elements including `<a>`, `<area>`, `<img>`, `<iframe>`,
/// `<script>`, and `<link>` elements.
public enum Referrerpolicy: String, Attribute, CustomStringConvertible {
    public static let attribute: String = "referrerpolicy"
    
    /// No referrer information is sent
    case noReferrer = "no-referrer"
    
    /// No referrer sent when navigating from HTTPS to HTTP
    case noReferrerWhenDowngrade = "no-referrer-when-downgrade"
    
    /// Only send the origin (scheme, host, port) as the referrer
    case origin = "origin"
    
    /// Full URL for same-origin requests, just origin for cross-origin
    case originWhenCrossOrigin = "origin-when-cross-origin"
    
    /// Send referrer for same-origin requests only
    case sameOrigin = "same-origin"
    
    /// Send origin as referrer only when security level stays the same
    case strictOrigin = "strict-origin"
    
    /// Default behavior if none specified
    case strictOriginWhenCrossOrigin = "strict-origin-when-cross-origin"
    
    /// Send full URL as referrer (not recommended for security reasons)
    case unsafeUrl = "unsafe-url"
    
    public var description: String { rawValue }
    
    /// Initialize from a string, defaulting to strictOriginWhenCrossOrigin for invalid values
    public init(_ value: String) {
        switch value {
        case "no-referrer": self = .noReferrer
        case "no-referrer-when-downgrade": self = .noReferrerWhenDowngrade
        case "origin": self = .origin
        case "origin-when-cross-origin": self = .originWhenCrossOrigin
        case "same-origin": self = .sameOrigin
        case "strict-origin": self = .strictOrigin
        case "unsafe-url": self = .unsafeUrl
        default: self = .strictOriginWhenCrossOrigin
        }
    }
}

extension Referrerpolicy: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
