///
/// Integrity.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 06/04/2025.
/// Updated by Claude on 09/04/2025.
///

import Foundation

/// Represents the HTML `integrity` attribute, which contains inline metadata 
/// for verifying subresource integrity (SRI).
///
/// Subresource Integrity (SRI) is a security feature that enables browsers to verify
/// that resources fetched from external sources have been delivered without unexpected
/// manipulation. The browser verifies that a fetched resource's cryptographic hash 
/// matches the hash provided in the integrity attribute.
///
/// ## Format
/// 
/// The attribute value is a string containing one or more cryptographic hashes, each
/// prefixed by the hash algorithm used, and separated by spaces if more than one.
///
/// Supported hash algorithms include:
/// - `sha256`
/// - `sha384`
/// - `sha512`
///
/// ## Usage Notes
///
/// - Use this attribute with resources loaded from third-party servers
/// - The hash must be recalculated whenever the resource changes
/// - Different hash algorithms can be specified for backward compatibility
/// - This attribute is commonly used with `<script>` and `<link>` elements
///
/// ## Examples
///
/// ```html
/// <script 
///   src="https://example.com/example-framework.js" 
///   integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
///   crossorigin="anonymous">
/// </script>
/// ```
///
/// ## Security Benefits
///
/// - Mitigates the risk of CDN compromise or man-in-the-middle attacks
/// - Ensures resource integrity even when served from untrusted sources
/// - Provides defense against compromised third-party resources
///
public struct Integrity: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "integrity"
    
    /// The integrity hash value
    private let value: String
    
    /// Initialize with a hash value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Creates an integrity hash using the SHA-256 algorithm
    public static func sha256(_ hash: String) -> Integrity {
        return Integrity("sha256-\(hash)")
    }
    
    /// Creates an integrity hash using the SHA-384 algorithm
    public static func sha384(_ hash: String) -> Integrity {
        return Integrity("sha384-\(hash)")
    }
    
    /// Creates an integrity hash using the SHA-512 algorithm
    public static func sha512(_ hash: String) -> Integrity {
        return Integrity("sha512-\(hash)")
    }
}

extension Integrity: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Integrity: CustomStringConvertible {
    /// Returns the string representation of the integrity value
    public var description: String {
        return self.value
    }
}

