///
/// download.swift
/// swift-html
///
/// Defines the HTML download attribute for anchor and area elements.
///
/// Created by Claude on 04/05/2025.
///

import Foundation

/// Represents the HTML "download" attribute, which causes the browser to treat
/// a linked URL as a download rather than navigating to it.
///
/// This attribute can be used in two ways:
/// 1. As a boolean attribute (`<a download>`) - Browser will suggest filename
/// 2. With a value (`<a download="filename.pdf">`) - Suggests a specific filename
///
/// ## Usage
///
/// ```swift
/// // Boolean usage (browser chooses filename)
/// a(href: "document.pdf", download: true) {
///     "Download Document"
/// }
///
/// // With filename suggestion
/// a(href: "document.pdf", download: "financial-report-2025.pdf") {
///     "Download Financial Report"
/// }
///
/// // Explicitly not including the attribute
/// a(href: "document.pdf", download: false) {
///     "View Document"
/// }
/// ```
///
/// ## Behavior
///
/// Without a value, the browser will suggest a filename/extension, generated from various sources:
/// - The Content-Disposition HTTP header
/// - The final segment in the URL path
/// - The media type (from the Content-Type header, the start of a data: URL, or Blob.type)
///
/// With a filename value, it suggests the filename for the downloaded file.
/// Characters like `/` and `\` are converted to underscores (`_`).
/// Filesystems may forbid other characters in filenames, so browsers will adjust the name if necessary.
///
/// ## Limitations
///
/// - Only works for same-origin URLs, or the `blob:` and `data:` schemes.
/// - Browser handling varies by browser, user settings, and other factors.
/// - The user may be prompted before a download starts, or the file may be saved automatically,
///   or opened in an external application or the browser itself.
///
/// ## Content-Disposition Header Interaction
///
/// If the Content-Disposition header has different information from the download attribute:
/// - If the header specifies a filename, it takes priority over a filename specified in this attribute.
/// - If the header specifies a disposition of inline, modern browsers prioritize
///   this attribute and treat it as a download.
///
/// - Note: For security reasons, this attribute only works with same-origin URLs
///   or URLs using the blob: or data: schemes.
public struct Download: Attribute, CustomStringConvertible {
    /// The name of the HTML attribute
    public static let attribute: String = "download"
    
    /// The type of attribute value
    private enum Value: Sendable, Equatable {
        /// Boolean form (presence/absence of the attribute)
        case boolean(Bool)
        
        /// Value form (with a suggested filename)
        case withFilename(String)
    }
    
    /// The internal value representation
    private let value: Value
    
    /// Create a boolean download attribute (browser chooses filename)
    public init() {
        self.value = .boolean(true)
    }
    
    /// Create a download attribute with a specific boolean value
    ///
    /// - Parameter include: Whether to include the attribute
    public init(_ include: Bool) {
        self.value = .boolean(include)
    }
    
    /// Create a download attribute with a suggested filename
    ///
    /// - Parameter filename: The suggested filename for the downloaded file.
    ///   Characters like `/` and `\` will be converted to underscores by browsers.
    public init(_ filename: String) {
        self.value = .withFilename(filename)
    }
    
    /// String representation of the download attribute
    public var description: String {
        switch value {
        case .boolean:
            return ""  // Empty string for boolean attribute
        case .withFilename(let filename):
            return filename
        }
    }
    
    /// Whether the attribute should be included in HTML rendering
    public var shouldInclude: Bool {
        switch value {
        case .boolean(let include):
            return include
        case .withFilename:
            return true
        }
    }
}

/// Extension to allow creating a Download attribute with a boolean literal
extension Download: ExpressibleByBooleanLiteral {
    /// Initialize with a boolean literal
    ///
    /// - Parameter value: When true, creates a boolean download attribute
    ///   When false, the attribute will not be included
    public init(booleanLiteral value: BooleanLiteralType) {
        self.init(value)
    }
}

/// Extension to allow creating a Download attribute with a string literal
extension Download: ExpressibleByStringLiteral {
    /// Initialize with a string literal
    ///
    /// - Parameter value: The suggested filename for the downloaded file
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}
