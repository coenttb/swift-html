///
/// Crossorigin.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
/// Updated by Claude on 04/06/2025.
///

import Foundation

/// An enumeration that controls how the element handles cross-origin requests.
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
/// - `anonymous`: Sends CORS request without credentials (cookies, client certificates, etc.)
/// - `useCredentials`: Sends CORS request with credentials
/// - An empty string or invalid value is equivalent to `anonymous`
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
public enum Crossorigin: String, Sendable, Equatable, CustomStringConvertible {
    /// A cross-origin request is performed, but no credentials are sent
    case anonymous
    
    /// A cross-origin request is performed along with credentials
    case useCredentials = "use-credentials"
    
    /// The name of the HTML attribute
    public static let attribute: String = "crossorigin"
    
    /// Returns the string representation of the crossorigin value
    public var description: String {
        return self.rawValue
    }
    
    /// Initialize from a string, defaulting to anonymous for invalid values
    ///
    /// According to the HTML spec, any value other than "use-credentials"
    /// (including empty string or invalid values) should be treated as "anonymous".
    public init(_ value: String) {
        if value == "use-credentials" {
            self = .useCredentials
        } else {
            self = .anonymous
        }
    }
}

extension Crossorigin: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}