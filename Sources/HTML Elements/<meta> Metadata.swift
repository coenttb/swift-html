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


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta
 */
// <meta>: The metadata element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <meta>
// HTML
// element represents
// metadata
// that cannot be represented by other HTML meta-related elements, like
// <base>
// ,
// <link>
// ,
// <script>
// ,
// <style>
// or
// <title>
// .
// The type of metadata provided by the
// <meta>
// element can be one of the following:
// If the
// name
// attribute is set, the
// <meta>
// element provides
// document-level metadata
// , applying to the whole page.
// If the
// http-equiv
// attribute is set, the
// <meta>
// element is a
// pragma directive
// , providing information equivalent to what can be given by a similarly-named HTTP header.
// If the
// charset
// attribute is set, the
// <meta>
// element is a
// charset declaration
// , giving the character encoding in which the document is encoded.
// If the
// itemprop
// attribute is set, the
// <meta>
// element provides
// user-defined metadata
// .
// Attributes
// This element includes the
// global attributes
// .
// Note:
// The attribute
// name
// has a specific meaning for the
// <meta>
// element, and the
// itemprop
// attribute must not be set on the same
// <meta>
// element that has any existing
// name
// ,
// http-equiv
// or
// charset
// attributes.
// charset
// This attribute declares the document's character encoding. If the attribute is present, its value must be an ASCII case-insensitive match for the string
// "utf-8"
// , because UTF-8 is the only valid encoding for HTML5 documents.
// <meta>
// elements which declare a character encoding must be located entirely within the first 1024 bytes of the document.
// content
// This attribute contains the value for the
// http-equiv
// or
// name
// attribute, depending on which is used.
// http-equiv
// Defines a pragma directive. The attribute's name, short for
// http-equivalent
// , is because all the allowed values are names of particular HTTP headers:
// content-security-policy
// Allows page authors to define a
// content policy
// for the current page. Content policies mostly specify allowed server origins and script endpoints which help guard against cross-site scripting attacks.
// Also see
// Content-Security-Policy
// .
// content-type
// Declares the
// MIME type
// and the document's character encoding. The
// content
// attribute must have the value
// "text/html; charset=utf-8"
// if specified. This is equivalent to a
// <meta>
// element with the
// charset
// attribute specified and carries the same restriction on placement within the document.
// Note:
// Can only be used in documents served with a
// text/html
// â not in documents served with an XML MIME type.
// Also see
// Content-Type
// .
// default-style
// Sets the name of the default
// CSS style sheet
// set.
// x-ua-compatible
// If specified, the
// content
// attribute must have the value
// "IE=edge"
// . User agents are required to ignore this pragma.
// refresh
// This instruction specifies:
// The number of seconds until the page should be reloaded - if the
// content
// attribute's value is a non-negative integer.
// The number of seconds until the page should redirect to another - if the
// content
// attribute's value is a non-negative integer followed by
// ;url=
// and a valid URL.
// The timer starts when the page is
// completely loaded
// , which is after the
// load
// and
// pageshow
// events have both fired.
// Also see
// Refresh
// .
// Warning:
// Pages set with a
// refresh
// value run the risk of having the time interval being too short. People navigating with the aid of assistive technology such as a screen reader may be unable to read through and understand the page's content before being automatically redirected. The abrupt, unannounced updating of the page content may also be disorienting for people experiencing low vision conditions.
// MDN Understanding WCAG, Guideline 2.2 explanations
// MDN Understanding WCAG, Guideline 3.2 explanations
// Understanding Success Criterion 2.2.1 | W3C Understanding WCAG 2.0
// Understanding Success Criterion 2.2.4 | W3C Understanding WCAG 2.0
// Understanding Success Criterion 3.2.5 | W3C Understanding WCAG 2.0
// media
// The
// media
// attribute defines which media the theme color defined in the
// content
// attribute should be applied to. Its value is a
// media query
// , which defaults to
// all
// if the attribute is missing. This attribute is only relevant when the element's
// name
// attribute is set to
// theme-color
// . Otherwise, it has no effect, and should not be included.
// name
// The
// name
// and
// content
// attributes can be used together to provide document metadata in terms of name-value pairs, with the
// name
// attribute giving the metadata name, and the
// content
// attribute giving the value.
// See
// standard metadata names
// for details about the set of standard metadata names defined in the HTML specification.
// Examples
// html
// <meta charset="utf-8" />
// <!-- Redirect page after 3 seconds -->
// <meta http-equiv="refresh" content="3;url=https://www.mozilla.org" />
// Technical summary
// Content categories
// Metadata content
// . If the
// itemprop
// attribute is present:
// flow content
// ,
// phrasing content
// .
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// <meta charset>
// ,
// <meta http-equiv>
// : a
// <head>
// element. If the
// http-equiv
// is not an
//  encoding declaration, it can also be inside a
// <noscript>
// element, itself inside a
// <head>
// element.
// <meta name>
// : any element that accepts
// metadata content
// .
// <meta itemprop>
// : any element that accepts
// metadata content
// or
// flow content
// .
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLMetaElement
// Specifications
// Specification
// HTML
// #
// the-meta-element
// Browser compatibility
// See also
// Standard metadata names
// Learn:
// <meta>
// The viewport meta tag
