///
/// ObjectData.swift
/// swift-html
///
/// Created by Claude on 09/04/2025.
///

import Foundation

/// Represents the HTML data attribute for the `<object>` element.
///
/// The `data` attribute specifies the URL of the resource to be used by the object.
/// This can be any type of media, document, or other resource the browser can display
/// or process. At least one of `data` or `type` attributes must be defined for the object element.
///
/// ## Usage Notes
///
/// - Specifies the URL of the resource to be embedded
/// - Can point to various file types like PDFs, videos, images, or HTML pages
/// - Local files or remote URLs are both supported
/// - If the browser cannot display the object, fallback content inside the element will be shown
///
/// ## Examples
///
/// ```html
/// <!-- Embed a PDF -->
/// <object data="document.pdf" type="application/pdf" width="600" height="400">
///   <p>Your browser doesn't support PDFs. <a href="document.pdf">Download the PDF</a> instead.</p>
/// </object>
///
/// <!-- Embed another HTML page -->
/// <object data="page.html" type="text/html" width="500" height="300">
///   <p>Unable to display the page.</p>
/// </object>
/// ```
public struct ObjectData: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "data"
    
    /// The URL value
    private let value: String
    
    /// Initialize with a URL string
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a URL object
    public init(_ url: URL) {
        self.value = url.absoluteString
    }
}

extension ObjectData: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension ObjectData: CustomStringConvertible {
    /// Returns the string representation of the URL value
    public var description: String {
        return self.value
    }
}