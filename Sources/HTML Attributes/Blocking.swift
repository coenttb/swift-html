///
/// Blocking.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 08/04/2025.
///

import Foundation

/// Explicitly indicates that certain operations should be blocked on the fetching of critical subresources.
///
/// @import-ed stylesheets are generally considered as critical subresources, whereas background-image and fonts are not.
/// The operations that are to be blocked must be a space-separated list of blocking tokens.
///
/// ## Usage Notes
///
/// - `render`: The rendering of content on the screen is blocked.
///
/// ## Examples
///
/// ```html
/// <style blocking="render">
///   @import url("slow-loading-stylesheet.css");
/// </style>
/// ```
public struct Blocking: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "blocking"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with the "render" token
    public static var render: Self {
        return Self("render")
    }
}

extension Blocking: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Blocking: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}