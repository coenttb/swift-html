///
/// Crossorigin.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// An attribute that controls how the element handles cross-origin requests.
///
/// The `crossorigin` attribute enables Cross-Origin Resource Sharing (CORS) for elements
/// that fetch external resources. It specifies whether to use CORS and if so, whether
/// to include credentials in cross-origin requests.
///
/// ## Usage Notes
///
/// - Valid on `<audio>`, `<img>`, `<link>`, `<script>`, and `<video>` elements
/// - Controls how cross-origin requests are handled
/// - When not specified, CORS is not used at all
/// - For web manifests requiring credentials, use `use-credentials`
///
/// ## Values
///
/// - `"anonymous"`: Sends CORS request without credentials (cookies, client certificates, etc.)
/// - `"use-credentials"`: Sends CORS request with credentials
/// - An empty string or invalid value is equivalent to `"anonymous"`
///
/// ## Element-Specific Behavior
///
/// When the attribute is not specified:
///
/// - For `<img>`, `<audio>`, `<video>`: When placed in `<canvas>`, the element is marked as tainted
/// - For `<script>`: Access to error logging via `window.onerror` is limited
/// - For `<link>`: Requests without appropriate CORS headers may be discarded
///
/// ## Examples
///
/// Loading a script without credentials:
/// ```html
/// <script src="https://example.com/script.js" crossorigin="anonymous"></script>
/// ```
///
/// Loading a web manifest with credentials:
/// ```html
/// <link rel="manifest" href="/app.webmanifest" crossorigin="use-credentials">
/// ```
public struct Crossorigin: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "crossorigin"
    
    /// The crossorigin policy value
    private let value: String
    
    /// Initialize with a raw value
    private init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a policy type
    public init(_ policy: Policy) {
        switch policy {
        case .anonymous:
            self.value = "anonymous"
        case .useCredentials:
            self.value = "use-credentials"
        }
    }
    
    /// The CORS policy represented by this attribute
    public enum Policy {
        /// Request uses CORS headers without credentials
        case anonymous
        
        /// Request uses CORS headers with credentials included
        case useCredentials
    }
    
    /// Use anonymous CORS (no credentials)
    public static var anonymous: Crossorigin {
        return Crossorigin(.anonymous)
    }
    
    /// Use CORS with credentials included
    public static var useCredentials: Crossorigin {
        return Crossorigin(.useCredentials)
    }
}

extension Crossorigin: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        if value == "use-credentials" {
            self.value = "use-credentials"
        } else {
            // Any invalid value or empty string defaults to "anonymous"
            self.value = "anonymous"
        }
    }
}

extension Crossorigin: CustomStringConvertible {
    /// Returns the string representation of the crossorigin value
    public var description: String {
        return self.value
    }
}
