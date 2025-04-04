///
/// Nonce.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// A cryptographic nonce ("number used once") for Content Security Policy.
///
/// The `nonce` global attribute is used to define a cryptographic nonce that can be used by
/// Content Security Policy (CSP) to determine whether a specific resource fetch should be allowed to
/// proceed. This is particularly useful for whitelisting specific inline scripts or styles without
/// having to use the more permissive `unsafe-inline` CSP directive.
///
/// A nonce is a random, unique value that should be generated anew for each page load and
/// should be cryptographically secure (at least 128 bits of randomness, base64 encoded).
///
/// ## Security Considerations
///
/// - Nonces should be generated using a cryptographically secure random number generator
/// - Each nonce should be used only once (hence the name "number used once")
/// - The same nonce value must be included in both the HTML attribute and the CSP header
/// - For security reasons, browsers hide the nonce attribute from being read by JavaScript's
///   `getAttribute()` method (returns an empty string)
/// - The nonce can only be accessed via the DOM property: `element.nonce`
///
/// ## Usage Notes
///
/// - Only use nonces when you absolutely need inline scripts or styles
/// - For static inline scripts, consider using CSP hashes instead
/// - Always prefer linking to external script and style files when possible
/// - The nonce value must be generated server-side for each page request
/// - Must be paired with a CSP header that includes the same nonce value
///
/// ## Examples
///
/// Basic usage with a script element:
/// ```html
/// <script nonce="8IBTHwOdqNKAWeKl7plt8g==">
///   // JavaScript code here
/// </script>
/// ```
///
/// Usage with a style element:
/// ```html
/// <style nonce="dQw4w9WgXcQ">
///   /* CSS rules here */
/// </style>
/// ```
///
/// The corresponding CSP header would be:
/// ```
/// Content-Security-Policy: script-src 'nonce-8IBTHwOdqNKAWeKl7plt8g=='; style-src 'nonce-dQw4w9WgXcQ'
/// ```
///
/// Typical server-side nonce generation (example in Swift):
/// ```swift
/// import Foundation
///
/// func generateNonce() -> String {
///     var data = Data(count: 16) // 128 bits
///     _ = data.withUnsafeMutableBytes { SecRandomCopyBytes(kSecRandomDefault, 16, $0.baseAddress!) }
///     return data.base64EncodedString()
/// }
/// ```
public struct Nonce: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "nonce"
    
    /// The cryptographic nonce value
    private let value: String
    
    /// Initialize with a nonce value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Generate a cryptographically secure nonce
    public static func generate() -> Nonce {
        var data = Data(count: 16) // 128 bits
        _ = data.withUnsafeMutableBytes { SecRandomCopyBytes(kSecRandomDefault, 16, $0.baseAddress!) }
        return Nonce(data.base64EncodedString())
    }
}

extension Nonce: CustomStringConvertible {
    /// Returns the string representation of the nonce value
    public var description: String {
        return self.value
    }
}

extension Nonce: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
