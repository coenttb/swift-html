///
/// attributionsrc.swift
/// swift-html
///
/// Defines the HTML attributionsrc attribute for anchor elements.
///
/// Created by Claude on 04/05/2025.
///

import Foundation

/// Represents the HTML `attributionsrc` attribute, which is used in the Attribution Reporting API
/// to send an Attribution-Reporting-Eligible header.
///
/// This attribute is experimental and primarily used on `<a>` elements to register
/// a navigation-based attribution source. When the user clicks the link, the browser
/// stores source data provided in the Attribution-Reporting-Register-Source response header.
///
/// ## Usage
///
/// The attribute can be used in three ways:
///
/// 1. As a boolean attribute (`<a attributionsrc>`)
///    This sends the Attribution-Reporting-Eligible header to the same server
///    as the href attribute points to.
///
/// 2. With a URL value or multiple URLs (`<a attributionsrc="https://example.com/register-source">`)
///    This sends the Attribution-Reporting-Eligible header to the specified URL(s)
///    in addition to the resource origin.
///
/// 3. Explicitly absent (`<a>` without attributionsrc)
///    By specifying `false`, the attribute will be omitted entirely.
///
/// ## Example
///
/// ```swift
/// // Boolean usage
/// a(href: "https://example.com", attributionsrc: true) {
///     "Register attribution on current domain"
/// }
///
/// // With URL
/// a(href: "https://example.com", 
///   attributionsrc: "https://analytics.example/register-source") {
///     "Register attribution on analytics server"
/// }
///
/// // Explicitly not including the attribute
/// a(href: "https://example.com", attributionsrc: false) {
///     "Don't register attribution"
/// }
/// ```
///
/// ## Limitations
///
/// - This is an experimental feature and may change in future browser versions
/// - Only useful if the server is configured to handle Attribution Reporting API
/// - The `<a>` elements can only be used as attribution sources, not triggers
///
/// - Note: This attribute is still experimental as of 2025 and may not be supported 
///   in all browsers.
public struct AttributionSrc: Attribute, CustomStringConvertible {
    /// The name of the HTML attribute
    public static let attribute: String = "attributionsrc"
    
    /// The type of attribute value
    private enum Value: Sendable, Equatable {
        /// Boolean form (presence/absence of the attribute)
        case boolean(Bool)
        
        /// URL value (one or more URLs where the header should be sent)
        case urls(String)
    }
    
    /// The internal value representation
    private let value: Value
    
    /// Create a boolean attributionsrc attribute
    public init() {
        self.value = .boolean(true)
    }
    
    /// Create an attributionsrc attribute with a specific boolean value
    ///
    /// - Parameter include: Whether to include the attribute
    public init(_ include: Bool) {
        self.value = .boolean(include)
    }
    
    /// Create an attributionsrc attribute with one or more URLs
    ///
    /// - Parameter urls: A single URL or space-separated list of URLs where
    ///   the Attribution-Reporting-Eligible header should be sent
    public init(_ urls: String) {
        self.value = .urls(urls)
    }
    
    /// String representation of the attributionsrc attribute
    public var description: String {
        switch value {
        case .boolean:
            return ""  // Empty string for boolean attribute
        case .urls(let urls):
            return urls
        }
    }
    
    /// Whether the attribute should be included in HTML rendering
    public var shouldInclude: Bool {
        switch value {
        case .boolean(let include):
            return include
        case .urls:
            return true
        }
    }
}

/// Extension to allow creating an AttributionSrc attribute with a boolean literal
extension AttributionSrc: ExpressibleByBooleanLiteral {
    /// Initialize with a boolean literal
    ///
    /// - Parameter value: When true, creates a boolean attributionsrc attribute
    ///   When false, the attribute will not be included
    public init(booleanLiteral value: BooleanLiteralType) {
        self.init(value)
    }
}

/// Extension to allow creating an AttributionSrc attribute with a string literal
extension AttributionSrc: ExpressibleByStringLiteral {
    /// Initialize with a string literal
    ///
    /// - Parameter value: URL or space-separated list of URLs where the
    ///   Attribution-Reporting-Eligible header should be sent
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
