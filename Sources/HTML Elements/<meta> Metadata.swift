///
/// <meta> Metadata.swift
/// swift-html
///
/// Represents the HTML meta element for document metadata.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML meta element (`<meta>`), which provides metadata about the document
/// that cannot be expressed by other HTML meta-related elements.
///
/// The `Meta` struct provides a type-safe way to create HTML meta elements for various
/// types of metadata, including character encoding, viewport settings, page descriptions,
/// and more. It is a void element (has no content) and uses different attribute combinations
/// to specify the type of metadata it provides.
///
/// Meta elements can provide four main types of metadata:
/// - Character encoding declaration (using the `charset` attribute)
/// - Document-level metadata (using the `name` and `content` attributes)
/// - Pragma directives (using the `http-equiv` and `content` attributes)
/// - User-defined metadata (using the `itemprop` attribute)
///
/// ## Examples
///
/// ```swift
/// // Character encoding
/// meta(charset: "utf-8")
///
/// // Viewport settings
/// meta(name: .viewport, content: "width=device-width, initial-scale=1")
///
/// // Page description
/// meta(name: .description, content: "A page about HTML metadata")
///
/// // Redirect
/// meta(httpEquiv: .refresh, content: "3;url=https://example.com")
/// ```
///
/// ## Best Practices
///
/// - Always include charset and viewport meta elements
/// - Place the charset declaration as early as possible in the head
/// - Include a description meta element for SEO (150-160 characters)
/// - Use Open Graph meta tags for better social media sharing
/// - Avoid using http-equiv="refresh" for accessibility reasons
///
/// - Note: When rendered, this generates an HTML `<meta>` element with the appropriate
///   attributes based on the metadata type.
public struct Meta: Element {
    public static var tag: String { "meta" }
    
    /// Declares the document's character encoding.
    ///
    /// In HTML5, the only valid value is "utf-8". The charset meta element
    /// should be placed as early as possible within the head element.
    public var charset: CharSet?
    
    /// Contains the value for the http-equiv or name attribute.
    ///
    /// The format and meaning of this attribute depends on which attribute
    /// it's paired with (name, http-equiv, or itemprop).
    public var content: String?
    
    /// Defines a pragma directive.
    ///
    /// Provides information equivalent to what can be given by a similarly named HTTP header.
    /// Uses the HttpEquiv enum for type-safe value selection.
    public var httpEquiv: HttpEquiv?
    
    /// Defines the media for which the theme color applies.
    ///
    /// Only used with `name="theme-color"`. Accepts a media query.
    public var media: String?
    
    /// Provides document-level metadata in terms of name-value pairs.
    ///
    /// Uses the Name enum for type-safe value selection of common metadata types.
    public var name: Name?
           
    /// Creates a new Meta element with custom attributes.
    ///
    /// Use this initializer when you need to set multiple or custom attributes.
    ///
    /// - Parameters:
    ///   - charset: The document's character encoding
    ///   - content: The value for the http-equiv or name attribute
    ///   - httpEquiv: Pragma directive
    ///   - media: Media query for theme-color
    ///   - name: Metadata name
    public init(
        charset: CharSet? = nil,
        content: String? = nil,
        httpEquiv: HttpEquiv? = nil,
        media: String? = nil,
        name: Name? = nil,
    ) {
        self.charset = charset
        self.content = content
        self.httpEquiv = httpEquiv
        self.media = media
        self.name = name
    }
        
    /// Creates a new Meta element with name and content.
    ///
    /// Use this initializer for document-level metadata like viewport settings,
    /// descriptions, authors, etc.
    ///
    /// - Parameters:
    ///   - name: The metadata name (from standard set)
    ///   - content: The metadata value
    ///   - media: Optional media query (only for theme-color)
    public init(
        name: Name,
        content: String,
        media: String? = nil
    ) {
        self.name = name
        self.content = content
        self.media = media
    }
    
    /// Creates a new Meta element with custom name and content.
    ///
    /// Use this initializer for document-level metadata using non-standard names.
    ///
    /// - Parameters:
    ///   - name: The custom metadata name
    ///   - content: The metadata value
    ///   - media: Optional media query
    public init(
        content: String,
        media: String? = nil
    ) {
        self.content = content
        self.media = media
    }
    
    /// Creates a new Meta element with http-equiv and content.
    ///
    /// Use this initializer for pragma directives like refresh, content-security-policy, etc.
    ///
    /// - Parameters:
    ///   - httpEquiv: The pragma directive name
    ///   - content: The directive value
    public init(
        httpEquiv: HttpEquiv,
        content: String
    ) {
        self.httpEquiv = httpEquiv
        self.content = content
    }
}

// MARK: - Convenient Factory Methods

extension Meta {
    /// Creates a meta element for UTF-8 character encoding.
    public static let utf8 = Meta(charset: "utf-8")
    
    /// Creates a meta element for responsive viewport.
    public static let viewport = Meta(
        name: .viewport,
        content: "width=device-width, initial-scale=1"
    )
    
    /// Creates a description meta element.
    ///
    /// - Parameter description: The page description (recommended 150-160 characters)
    /// - Returns: A meta element with name="description"
    public static func description(_ description: String) -> Meta {
        return Meta(name: .description, content: description)
    }
    
    /// Creates a theme-color meta element.
    ///
    /// - Parameters:
    ///   - color: The theme color (CSS color value)
    ///   - media: Optional media query for when the color applies
    /// - Returns: A meta element with name="theme-color"
    public static func themeColor(_ color: String, media: String? = nil) -> Meta {
        return Meta(name: .themeColor, content: color, media: media)
    }
    
    /// Creates a refresh meta element for redirecting to another URL.
    ///
    /// - Parameters:
    ///   - seconds: The number of seconds before redirecting
    ///   - url: The URL to redirect to
    /// - Returns: A meta element with http-equiv="refresh"
    ///
    /// - Warning: This method should be used with caution for accessibility reasons.
    ///   People using assistive technology may not have enough time to read the content
    ///   before being redirected.
    public static func redirect(after seconds: Int, to url: String) -> Meta {
        return Meta(httpEquiv: .refresh, content: "\(seconds);url=\(url)")
    }
    
    /// Creates a meta element for Open Graph protocol.
    ///
    /// - Parameters:
    ///   - property: The Open Graph property (e.g., "og:title", "og:description")
    ///   - content: The property value
    /// - Returns: A meta element with property and content attributes
    public static func openGraph(property: String, content: String) -> Meta {
        return Meta(name: .init(stringLiteral: property), content: content)
    }
}

/// Lowercase typealias for creating Meta elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `meta` identifier when creating
/// HTML meta elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// meta(name: .description, content: "Page description")
/// ```
public typealias meta = Meta


extension Meta {
    
    /// HTTP-equivalent values for pragma directives.
    ///
    /// These values correspond to particular HTTP headers and are used with
    /// the http-equiv attribute to provide document-level directives.
    public struct HttpEquiv: Sendable, Equatable, ExpressibleByStringLiteral, CustomStringConvertible {
        
        private let value: String
        /// Defines a content security policy for the page.
        public static let contentSecurityPolicy: Self = "content-security-policy"
        
        /// Declares the MIME type and character encoding.
        public static let contentType: Self = "content-type"
        
        /// Sets the name of the default CSS style sheet set.
        public static let defaultStyle: Self = "default-style"
        
        /// Specifies page reload or redirect behavior.
        public static let refresh: Self = "refresh"
        
        /// Specifies Internet Explorer compatibility mode.
        public static let xUaCompatible: Self = "x-ua-compatible"
        
        public var description: String { value }
        
        public init(stringLiteral value: String) {
            self.value = value
        }
    }
    
    /// Standard metadata names for the name attribute.
    ///
    /// These values are commonly used with the name attribute to provide
    /// various types of document-level metadata.
    public struct Name: Sendable, Equatable, ExpressibleByStringLiteral, CustomStringConvertible {
        
        private let value: String
        
        /// Name of the application that generated the document.
        public static let application: Self = "application-name"
        
        /// Name of the document's author.
        public static let author: Self = "author"
        
        /// Summary of the page's content.
        public static let description: Self = "description"
        
        /// Software that generated the document.
        public static let generator: Self = "generator"
        
        /// Comma-separated list of keywords relevant to the page.
        public static let keywords: Self = "keywords"
        
        /// Referrer policy for links away from the document.
        public static let referrer: Self = "referrer"
        
        /// Suggested color for customizing browser UI elements.
        public static let themeColor: Self = "theme-color"
        
        /// Instructions for search engine crawlers.
        public static let robots: Self = "robots"
        
        /// Settings for the visual viewport on mobile devices.
        public static let viewport: Self = "viewport"
        
        public var description: String { value }
        
        public init(stringLiteral value: String) {
            self.value = value
        }
    }
}
