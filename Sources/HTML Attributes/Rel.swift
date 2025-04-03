///
/// Rel.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that defines the relationship between the current document and a linked resource.
///
/// The `rel` attribute specifies the relationship between the current document and the linked document
/// or resource. The value is a space-separated list of link types, each representing a specific relationship.
/// Different values are valid depending on the element where the attribute is used.
///
/// ## Usage Notes
///
/// - Valid on `<link>`, `<a>`, `<area>`, and `<form>` elements
/// - Each value must be a valid link relation token recognized by IANA, HTML Living Standard, or Microformats wiki
/// - Multiple values should be separated by spaces
/// - Some values are only valid on specific elements
/// - Values are case-insensitive
///
/// ## Common Link Types by Element
///
/// ### For `<link>` Elements
/// - `stylesheet` - Imports a style sheet
/// - `icon` - Defines a favicon or other icon for the document
/// - `canonical` - Defines the preferred URL for the current document
/// - `alternate` - Alternate version of the document (different language, format, etc.)
/// - `preload`, `prefetch`, `preconnect` - Resource hints for performance optimization
///
/// ### For `<a>` and `<area>` Elements
/// - `nofollow` - Indicates that search engines should not follow the link
/// - `noopener` - Prevents the linked document from accessing `window.opener`
/// - `noreferrer` - Prevents passing the referrer information
/// - `external` - Indicates that the link goes to an external site
/// - `me` - Indicates that the linked document represents the person who owns the current content
///
/// ### For `<form>` Elements
/// - `help` - Links to context-sensitive help
/// - `license` - Links to licensing information
/// - `next`, `prev` - Pagination links
/// - `search` - Links to a search function
///
/// ## Examples
///
/// External link with security attributes:
/// ```html
/// <a href="https://example.com" rel="external noopener noreferrer">External site</a>
/// ```
///
/// CSS stylesheet:
/// ```html
/// <link rel="stylesheet" href="styles.css">
/// ```
///
/// Multiple favicons for different devices:
/// ```html
/// <link rel="icon" href="favicon.ico">
/// <link rel="icon" type="image/svg+xml" href="icon.svg">
/// <link rel="apple-touch-icon" href="apple-touch-icon.png">
/// ```
public struct Rel: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "rel"
    
    /// The link relation values as a space-separated string
    private let value: String
    
    /// Initialize with a single link relation value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiple link relation values
    public init(_ values: [String]) {
        self.value = values.joined(separator: " ")
    }
    
    /// Initialize with multiple link relation values as variadic parameters
    public init(_ values: String...) {
        self.value = values.joined(separator: " ")
    }
    
    /// Initialize with link relation values
    public init(_ values: LinkType...) {
        self.value = values.map { $0.rawValue }.joined(separator: " ")
    }
    
    /// Initialize with link relation values
    public init(_ values: [LinkType]) {
        self.value = values.map { $0.rawValue }.joined(separator: " ")
    }
    
    /// Common link relation types
    public struct LinkType: CustomStringConvertible, RawRepresentable, ExpressibleByStringLiteral {
        
        public let rawValue: String
        
        public var description: String { rawValue }
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self = .init(rawValue: value)
        }

        public static let alternate: Self = "alternate"
        public static let author: Self = "author"
        public static let help: Self = "help"
        public static let license: Self = "license"
        public static let next: Self = "next"
        public static let prev: Self = "prev"
        public static let search: Self = "search"
        
        // Link-specific types
        public static let canonical: Self = "canonical"
        public static let stylesheet: Self = "stylesheet"
        public static let icon: Self = "icon"
        public static let manifest: Self = "manifest"
        public static let modulepreload: Self = "modulepreload"
        public static let preload: Self = "preload"
        public static let prefetch: Self = "prefetch"
        public static let preconnect: Self = "preconnect"
        public static let dns_prefetch: Self = "dns-prefetch"
        
        // Anchor-specific types
        public static let bookmark: Self = "bookmark"
        public static let external: Self = "external"
        public static let nofollow: Self = "nofollow"
        public static let noopener: Self = "noopener"
        public static let noreferrer: Self = "noreferrer"
        public static let tag: Self = "tag"
        public static let me: Self = "me"
        
        // Security/privacy related types
        public static let privacy_policy: Self = "privacy-policy"
        public static let terms_of_service: Self = "terms-of-service"
    }
    
    /// Create a rel value for external links with recommended security attributes
    public static let secureExternal = Rel([.external, .noopener, .noreferrer])
}

extension Rel: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Rel: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = String
    
    public init(arrayLiteral elements: String...) {
        self.value = elements.joined(separator: " ")
    }
}

extension Rel: CustomStringConvertible {
    /// Returns the string representation of the rel value
    public var description: String {
        return self.value
    }
}

extension HTML {
    
    /// Sets the rel attribute on an element
    @discardableResult
    public func rel(
        _ value: Rel?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Rel.attribute, value?.description)
    }
    
    /// Sets the rel attribute with a string value
    @discardableResult
    public func rel(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.rel(.init(value))
    }
    
    /// Sets the rel attribute with multiple string values
    @discardableResult
    public func rel(
        _ values: String...
    ) -> _HTMLAttributes<Self> {
        self.attribute(Rel.attribute, values.joined(separator: " "))
    }
    
    /// Sets the rel attribute with multiple link type values
    @discardableResult
    public func rel(
        _ values: Rel.LinkType...
    ) -> _HTMLAttributes<Self> {
        self.rel(Rel(values))
    }
}
