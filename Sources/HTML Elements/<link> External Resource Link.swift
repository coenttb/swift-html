///
/// <link> External Resource Link.swift
/// swift-html
///
/// Represents the HTML link element for specifying relationships between the current
/// document and external resources.
///
/// Created by Claude on 04/06/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML link element (`<link>`), which specifies relationships between the current
/// document and external resources such as stylesheets, icons, and other linked resources.
///
/// The `Link` struct provides a type-safe way to define external resource links for an HTML document.
/// These links are commonly used for stylesheets, icons, preloading resources, and establishing
/// other relationships with external files.
///
/// ## Examples
///
/// ```swift
/// // Link to stylesheet
/// link(href: "styles.css", rel: "stylesheet")
///
/// // Link to favicon
/// link(href: "favicon.ico", rel: "icon")
///
/// // Preload a font
/// link(href: "font.woff2", rel: "preload", as: .font, crossorigin: .anonymous)
///
/// // Define alternative stylesheet
/// link(href: "dark.css", rel: "alternate stylesheet", title: "Dark Theme")
/// ```
///
/// ## Usage Notes
///
/// - Link elements typically appear in the `<head>` section of an HTML document
/// - The `rel` attribute is required and defines the relationship to the linked resource
/// - The `href` attribute is usually required and specifies the URL of the resource
/// - Various other attributes control caching, prioritization, and resource loading behavior
///
/// - Note: When rendered, this generates an HTML `<link>` element with the specified attributes.
///   It is a void element and does not have a closing tag.
public struct Link: Element {
    public static var tag: String { "link" }
    
    /// The type of resource being loaded (for preload/modulepreload).
    public var `as`: As?
    
    /// Indicates which operations should be blocked on fetching the resource.
    ///
    /// Can only be used with rel="stylesheet" or rel="expect".
    public var blocking: HTML_Attributes.Blocking?
    
    /// Indicates whether CORS must be used when fetching the resource.
    public var crossorigin: HTML_Attributes.Crossorigin?
    
    /// For stylesheets, indicates whether the stylesheet should be loaded and applied.
    public var disabled: HTML_Attributes.Disabled?
    
    /// Provides a hint of the relative priority for fetching this resource.
    public var fetchpriority: HTML_Attributes.FetchPriority?
    
    /// Specifies the URL of the linked resource.
    public var href: HTML_Attributes.Href?
    
    /// Indicates the language of the linked resource.
    public var hreflang: HTML_Attributes.Hreflang?
    
    /// For preloaded images, has similar syntax and semantics as the sizes attribute.
    public var imagesizes: HTML_Attributes.ImageSizes?
    
    /// For preloaded images, has similar syntax and semantics as the srcset attribute.
    public var imagesrcset: HTML_Attributes.ImageSrcSet?
    
    /// Contains inline metadata for verifying the integrity of the resource.
    ///
    /// A base64-encoded cryptographic hash of the resource for subresource integrity.
    public var integrity: HTML_Attributes.Integrity?
    
    /// Specifies the media that the linked resource applies to.
    ///
    /// Used primarily for stylesheets to target specific media types/queries.
    public var media: HTML_Attributes.Media?
    
    /// Controls which referrer is sent when fetching the resource.
    public var referrerpolicy: HTML_Attributes.ReferrerPolicy?
    
    /// Defines the relationship of the linked document to the current document.
    ///
    /// This is a required attribute and must be a space-separated list of link types.
    /// Common values include:
    /// - stylesheet: Linked resource is a stylesheet
    /// - icon: Linked resource is an icon for the document
    /// - preload: Resource should be preloaded
    /// - alternate: Alternative version of the document
    /// - manifest: Web app manifest
    public var rel: HTML_Attributes.Rel?
    
    /// Defines the sizes of the icons for visual media contained in the resource.
    ///
    /// Must be present only if the rel contains "icon" or similar types.
    /// Format is either "any" for vector formats, or space-separated pairs like "16x16 32x32".
    public var sizes: HTML_Attributes.Sizes?
    
    /// Special semantics for stylesheet links to define default or alternate stylesheets.
    public var title: HTML_Attributes.Title?
    
    /// Defines the MIME type of the linked resource.
    ///
    /// Examples include "text/css" for stylesheets or "image/x-icon" for icons.
    public var type: HTML_Attributes.LinkType?
    
    /// Creates a new Link element with the specified attributes.
    ///
    /// - Parameters:
    ///   - `as`: The type of content being loaded (for preload/modulepreload)
    ///   - blocking: Operations to block during resource loading (for stylesheets/expect)
    ///   - crossorigin: Whether CORS must be used when fetching the resource
    ///   - disabled: Whether the stylesheet should be loaded and applied
    ///   - fetchpriority: Relative priority hint for fetching this resource
    ///   - href: URL of the linked resource
    ///   - hreflang: Language of the linked resource
    ///   - imagesizes: For preloaded images, similar to sizes attribute
    ///   - imagesrcset: For preloaded images, similar to srcset attribute
    ///   - integrity: Cryptographic hash for subresource integrity
    ///   - media: Media type/query that the resource applies to
    ///   - referrerpolicy: Which referrer to send when fetching the resource
    ///   - rel: Relationship of the linked resource to the document (required)
    ///   - sizes: Sizes of icons for visual media
    ///   - title: For stylesheets, defines default or alternate stylesheets
    ///   - type: MIME type of the linked resource
    public init(
        `as`: As? = nil,
        blocking: HTML_Attributes.Blocking? = nil,
        crossorigin: HTML_Attributes.Crossorigin? = nil,
        disabled: HTML_Attributes.Disabled? = nil,
        fetchpriority: HTML_Attributes.FetchPriority? = nil,
        href: HTML_Attributes.Href? = nil,
        hreflang: HTML_Attributes.Hreflang? = nil,
        imagesizes: HTML_Attributes.ImageSizes? = nil,
        imagesrcset: HTML_Attributes.ImageSrcSet? = nil,
        integrity: HTML_Attributes.Integrity? = nil,
        media: HTML_Attributes.Media? = nil,
        referrerpolicy: HTML_Attributes.ReferrerPolicy? = nil,
        rel: HTML_Attributes.Rel? = nil,
        sizes: HTML_Attributes.Sizes? = nil,
        title: HTML_Attributes.Title? = nil,
        type: LinkType? = nil
    ) {
        self.`as` = `as`
        self.blocking = blocking
        self.crossorigin = crossorigin
        self.disabled = disabled
        self.fetchpriority = fetchpriority
        self.href = href
        self.hreflang = hreflang
        self.imagesizes = imagesizes
        self.imagesrcset = imagesrcset
        self.integrity = integrity
        self.media = media
        self.referrerpolicy = referrerpolicy
        self.rel = rel
        self.sizes = sizes
        self.title = title
        self.type = type
    }
}

/// Lowercase typealias for creating Link elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `link` identifier when creating
/// HTML link elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// link(href: "styles.css", rel: "stylesheet")
/// ```
public typealias link = Link
