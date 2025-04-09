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
/
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
    public var blocking: Blocking?
    
    /// Indicates whether CORS must be used when fetching the resource.
    public var crossorigin: Crossorigin?
    
    /// For stylesheets, indicates whether the stylesheet should be loaded and applied.
    public var disabled: HTML_Attributes.Disabled?
    
    /// Provides a hint of the relative priority for fetching this resource.
    public var fetchpriority: HTML_Attributes.FetchPriority?
    
    /// Specifies the URL of the linked resource.
    public var href: HTML_Attributes.Href?
    
    /// Indicates the language of the linked resource.
    public var hreflang: HTML_Attributes.Hreflang?
    
    /// For preloaded images, has similar syntax and semantics as the sizes attribute.
    public var imagesizes: ImageSizes?
    
    /// For preloaded images, has similar syntax and semantics as the srcset attribute.
    public var imagesrcset: ImageSrcSet?
    
    /// Contains inline metadata for verifying the integrity of the resource.
    ///
    /// A base64-encoded cryptographic hash of the resource for subresource integrity.
    public var integrity: Integrity?
    
    /// Specifies the media that the linked resource applies to.
    ///
    /// Used primarily for stylesheets to target specific media types/queries.
    public var media: String?
    
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
    public var rel: String?
    
    /// Defines the sizes of the icons for visual media contained in the resource.
    ///
    /// Must be present only if the rel contains "icon" or similar types.
    /// Format is either "any" for vector formats, or space-separated pairs like "16x16 32x32".
    public var sizes: String?
    
    /// Special semantics for stylesheet links to define default or alternate stylesheets.
    public var title: String?
    
    /// Defines the MIME type of the linked resource.
    ///
    /// Examples include "text/css" for stylesheets or "image/x-icon" for icons.
    public var type: String?
    
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
        blocking: Blocking? = nil,
        crossorigin: HTML_Attributes.Crossorigin? = nil,
        disabled: HTML_Attributes.Disabled? = nil,
        fetchpriority: HTML_Attributes.FetchPriority? = nil,
        href: HTML_Attributes.Href? = nil,
        hreflang: HTML_Attributes.Hreflang? = nil,
        imagesizes: HTML_Attributes.ImageSizes? = nil,
        imagesrcset: HTML_Attributes.ImageSrcSet? = nil,
        integrity: HTML_Attributes.Integrity? = nil,
        media: String? = nil,
        referrerpolicy: HTML_Attributes.ReferrerPolicy? = nil,
        rel: String? = nil,
        sizes: String? = nil,
        title: String? = nil,
        type: String? = nil
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
    
    /// Creates a stylesheet link element.
    ///
    /// - Parameters:
    ///   - href: URL of the stylesheet
    ///   - media: Optional media query for the stylesheet
    ///   - disabled: Whether the stylesheet should be initially disabled
    ///   - integrity: Optional integrity hash for subresource integrity
    /// - Returns: A Link element configured for a stylesheet
    public static func stylesheet(
        href: HTML_Attributes.Href,
        media: String? = nil,
        disabled: HTML_Attributes.Disabled? = nil,
        integrity: Integrity? = nil
    ) -> Link {
        Link(
            crossorigin: nil,
            disabled: disabled,
            href: href,
            integrity: integrity,
            media: media,
            rel: "stylesheet",
            type: "text/css"
        )
    }
    
    /// Creates an icon link element.
    ///
    /// - Parameters:
    ///   - href: URL of the icon
    ///   - sizes: Optional sizes specification (e.g., "16x16" or "32x32")
    ///   - type: Optional MIME type of the icon
    /// - Returns: A Link element configured for a favicon
    public static func icon(
        href: HTML_Attributes.Href,
        sizes: String? = nil,
        type: String? = nil
    ) -> Link {
        Link(
            href: href,
            rel: "icon",
            sizes: sizes,
            type: type
        )
    }
    
    /// Creates a preload link element.
    ///
    /// - Parameters:
    ///   - href: URL of the resource to preload
    ///   - as: The type of content being loaded
    ///   - crossorigin: Whether CORS must be used when fetching the resource
    ///   - type: Optional MIME type of the resource
    /// - Returns: A Link element configured for preloading a resource
    public static func preload(
        href: HTML_Attributes.Href,
        as: As,
        crossorigin: Crossorigin? = nil,
        type: String? = nil
    ) -> Link {
        Link(
            as: `as`,
            crossorigin: crossorigin,
            href: href,
            rel: "preload",
            type: type
        )
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


extension Link {
    /// The type of resource being loaded by the link.
    ///
    /// This attribute is required when `rel="preload"` has been set on the link element,
    /// optional when `rel="modulepreload"` has been set, and otherwise should not be used.
    ///
    /// It specifies the type of content being loaded, which is necessary for request matching,
    /// application of correct content security policy, and setting of correct Accept request header.
    public enum As: String, Sendable, Equatable {
        /// For `<audio>` elements
        case audio
        /// For `<iframe>` and `<frame>` elements
        case document
        /// For `<embed>` elements
        case embed
        /// For fetch, XHR requests
        case fetch
        /// For CSS @font-face
        case font
        /// For images and SVGs
        case image
        /// For `<object>` elements
        case object
        /// For `<script>` elements, Worker importScripts
        case script
        /// For stylesheets
        case style
        /// For `<track>` elements
        case track
        /// For Worker, SharedWorker
        case worker
    }

    
    /// Defines which operations should be blocked on the fetching of an external resource.
    ///
    /// This can only be used when the rel attribute contains "expect" or "stylesheet".
    public struct Blocking: RawRepresentable, Sendable, Equatable {
        public var rawValue: String
        
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        /// The rendering of content on the screen is blocked
        public static let render = Blocking(rawValue: "render")
    }
}


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/link
 */
// <link>: The External Resource Link element
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
// <link>
// HTML
// element specifies relationships between the current document and an external resource.
// This element is most commonly used to link to
// stylesheets
// , but is also used to establish site icons (both "favicon" style icons and icons for the home screen and apps on mobile devices) among other things.
// Try it
// <link href="/shared-assets/misc/link-element-example.css" rel="stylesheet" />
// <p>This text will be red as defined in the external stylesheet.</p>
// <p style="color: blue">
//  The <code>style</code> attribute can override it, though.
// </p>
// To link an external stylesheet, you'd include a
// <link>
// element inside your
// <head>
// like this:
// html
// <link href="main.css" rel="stylesheet" />
// This example provides the path to the stylesheet inside an
// href
// attribute and a
// rel
// attribute with a value of
// stylesheet
// . The
// rel
// stands for "relationship", and is one of the key features of the
// <link>
// element â the value denotes how the item being linked to is related to the containing document.
// There are a number of other common types you'll come across. For example, a link to the site's favicon:
// html
// <link rel="icon" href="favicon.ico" />
// There are a number of other icon
// rel
// values, mainly used to indicate special icon types for use on various mobile platforms, e.g.:
// html
// <link
//  rel="apple-touch-icon"
//  sizes="114x114"
//  href="apple-icon-114.png"
//  type="image/png" />
// The
// sizes
// attribute indicates the icon size, while the
// type
// contains the MIME type of the resource being linked.
// These provide useful hints to allow the browser to choose the most appropriate icon available.
// You can also provide a media type or query inside a
// media
// attribute; this resource will then only be loaded if the media condition is true. For example:
// html
// <link href="print.css" rel="stylesheet" media="print" />
// <link
//  href="mobile.css"
//  rel="stylesheet"
//  media="screen and (max-width: 600px)" />
// Some interesting new performance and security features have been added to the
// <link>
// element too. Take this example:
// html
// <link
//  rel="preload"
//  href="myFont.woff2"
//  as="font"
//  type="font/woff2"
//  crossorigin="anonymous" />
// A
// rel
// value of
// preload
// indicates that the browser should preload this resource (see
// rel="preload"
// for more details), with the
// as
// attribute indicating the specific class of content being fetched.
// The
// crossorigin
// attribute indicates whether the resource should be fetched with a
// CORS
// request.
// Other usage notes:
// A
// <link>
// element can occur either in the
// <head>
// or
// <body>
// element, depending on whether it has a
// link type
// that is
// body-ok
// .
// For example, the
// stylesheet
// link type is body-ok, and therefore
// <link rel="stylesheet">
// is permitted in the body.
// However, this isn't a good practice to follow; it makes more sense to separate your
// <link>
// elements from your body content, putting them in the
// <head>
// .
// When using
// <link>
// to establish a favicon for a site, and your site uses a Content Security Policy (CSP) to enhance its security, the policy applies to the favicon.
// If you encounter problems with the favicon not loading, verify that the
// Content-Security-Policy
// header's
// img-src
// directive
// is not preventing access to it.
// The HTML and XHTML specifications define event handlers for the
// <link>
// element, but it is unclear how they would be used.
// Under XHTML 1.0,
// void elements
// such as
// <link>
// require a trailing slash:
// <link />
// .
// WebTV supports the use of the value
// next
// for
// rel
// to preload the next page in a document series.
// Attributes
// This element includes the
// global attributes
// .
// as
// This attribute is required when
// rel="preload"
// has been set on the
// <link>
// element, optional when
// rel="modulepreload"
// has been set, and otherwise should not be used.
// It specifies the type of content being loaded by the
// <link>
// , which is necessary for request matching, application of correct
// content security policy
// , and setting of correct
// Accept
// request header.
// Furthermore,
// rel="preload"
// uses this as a signal for request prioritization.
// The table below lists the valid values for this attribute and the elements or resources they apply to.
// Value
// Applies To
// audio
// <audio>
// elements
// document
// <iframe>
// and
// <frame>
// elements
// embed
// <embed>
// elements
// fetch
// fetch, XHR
// Note:
// This value also requires
// <link>
// to contain the crossorigin attribute, see
// CORS-enabled fetches
// .
// font
// CSS @font-face
// Note:
// This value also requires
// <link>
// to contain the crossorigin attribute, see
// CORS-enabled fetches
// .
// image
// <img>
// and
// <picture>
// elements with
//  srcset or imageset attributes, SVG
// <image>
// elements,
//  CSS
// *-image
// rules
// object
// <object>
// elements
// script
// <script>
// elements, Worker
// importScripts
// style
// <link rel=stylesheet>
// elements, CSS
// @import
// track
// <track>
// elements
// video
// <video>
// elements
// worker
// Worker, SharedWorker
// blocking
// This attribute explicitly indicates that certain operations should be blocked on the fetching of an external resource. It must only be used when the
// rel
// attribute contains
// expect
// or
// stylesheet
// keywords. The operations that are to be blocked must be a space-separated list of blocking tokens listed below.
// render
// : The rendering of content on the screen is blocked.
// crossorigin
// This
// enumerated
// attribute indicates whether
// CORS
// must be used when fetching the resource.
// CORS-enabled images
// can be reused in the
// <canvas>
// element without being
// tainted
// .
// The allowed values are:
// anonymous
// A cross-origin request (i.e., with an
// Origin
// HTTP header) is performed, but no credential is sent (i.e., no cookie, X.509 certificate, or HTTP Basic authentication).
// If the server does not give credentials to the origin site (by not setting the
// Access-Control-Allow-Origin
// HTTP header) the resource will be tainted and its usage restricted.
// use-credentials
// A cross-origin request (i.e., with an
// Origin
// HTTP header) is performed along with a credential sent (i.e., a cookie, certificate, and/or HTTP Basic authentication is performed).
// If the server does not give credentials to the origin site (through
// Access-Control-Allow-Credentials
// HTTP header), the resource will be
// tainted
// and its usage restricted.
// If the attribute is not present, the resource is fetched without a
// CORS
// request (i.e., without sending the
// Origin
// HTTP header), preventing its non-tainted usage. If invalid, it is handled as if the enumerated keyword
// anonymous
// was used.
// See
// CORS settings attributes
// for additional information.
// disabled
// For
// rel="stylesheet"
// only, the
// disabled
// Boolean attribute indicates whether the described stylesheet should be loaded and applied to the document.
// If
// disabled
// is specified in the HTML when it is loaded, the stylesheet will not be loaded during page load.
// Instead, the stylesheet will be loaded on-demand, if and when the
// disabled
// attribute is changed to
// false
// or removed.
// Setting the
// disabled
// property in the DOM causes the stylesheet to be removed from the document's
// Document.styleSheets
// list.
// fetchpriority
// Provides a hint of the relative priority to use when fetching a resource of a particular type.
// Allowed values:
// high
// Fetch the resource at a high priority relative to other resources of the same type.
// low
// Fetch the resource at a low priority relative to other resources of the same type.
// auto
// Don't set a preference for the fetch priority.
// This is the default.
// It is used if no value or an invalid value is set.
// See
// HTMLLinkElement.fetchPriority
// for more information.
// href
// This attribute specifies the
// URL
// of the linked resource. A URL can be absolute or relative.
// hreflang
// This attribute indicates the language of the linked resource.
// It is purely advisory.
// Allowed values are specified by
// RFC 5646: Tags for Identifying Languages (also known as BCP 47)
// .
// Use this attribute only if the
// href
// attribute is present.
// imagesizes
// For
// rel="preload"
// and
// as="image"
// only, the
// imagesizes
// attribute has similar syntax and semantics as the
// sizes
// attribute that indicates to preload the appropriate resource used by an
// img
// element with corresponding values for its
// srcset
// and
// sizes
// attributes.
// imagesrcset
// For
// rel="preload"
// and
// as="image"
// only, the
// imagesrcset
// attribute has similar syntax and semantics as the
// srcset
// attribute that indicates to preload the appropriate resource used by an
// img
// element with corresponding values for its
// srcset
// and
// sizes
// attributes.
// integrity
// Contains inline metadata â a base64-encoded cryptographic hash of the resource (file) you're telling the browser to fetch.
// The browser can use this to verify that the fetched resource has been delivered without unexpected manipulation.
// The attribute must only be specified when the
// rel
// attribute is specified to
// stylesheet
// ,
// preload
// , or
// modulepreload
// .
// See
// Subresource Integrity
// .
// media
// This attribute specifies the media that the linked resource applies to. Its value must be a media type /
// media query
// .
// This attribute is mainly useful when linking to external stylesheets â it allows the user agent to pick the best adapted one for the device it runs on.
// referrerpolicy
// A string indicating which referrer to use when fetching the resource:
// no-referrer
// means that the
// Referer
// header will not be sent.
// no-referrer-when-downgrade
// means that no
// Referer
// header will be sent when navigating to an origin without TLS (HTTPS).
// This is a user agent's default behavior, if no policy is otherwise specified.
// origin
// means that the referrer will be the origin of the page, which is roughly the scheme, the host, and the port.
// origin-when-cross-origin
// means that navigating to other origins will be limited to the scheme, the host, and the port, while navigating on the same origin will include the referrer's path.
// unsafe-url
// means that the referrer will include the origin and the path (but not the fragment, password, or username).
// This case is unsafe because it can leak origins and paths from TLS-protected resources to insecure origins.
// rel
// This attribute names a relationship of the linked document to the current document. The attribute must be a space-separated list of
// link type values
// .
// sizes
// This attribute defines the sizes of the icons for visual media contained in the resource.
// It must be present only if the
// rel
// contains a value of
// icon
// or a non-standard type such as Apple's
// apple-touch-icon
// .
// It may have the following values:
// any
// , meaning that the icon can be scaled to any size as it is in a vector format, like
// image/svg+xml
// .
// a white-space separated list of sizes, each in the format
// <width in pixels>x<height in pixels>
// or
// <width in pixels>X<height in pixels>
// . Each of these sizes must be contained in the resource.
// Note:
// Most icon formats are only able to store one single icon; therefore, most of the time, the
// sizes
// attribute contains only one entry.
// Microsoft's ICO format and Apple's ICNS format can store multiple icon sizes in a single file. ICO has better browser support, so you should use this format if cross-browser support is a concern.
// title
// The
// title
// attribute has special semantics on the
// <link>
// element.
// When used on a
// <link rel="stylesheet">
// it defines a
// default or an alternate stylesheet
// .
// type
// This attribute is used to define the type of the content linked to.
// The value of the attribute should be a MIME type such as
// text/html
// ,
// text/css
// , and so on.
// The common use of this attribute is to define the type of stylesheet being referenced (such as
// text/css
// ), but given that CSS is the only stylesheet language used on the web, not only is it possible to omit the
// type
// attribute, but is actually now recommended practice.
// It is also used on
// rel="preload"
// link types, to make sure the browser only downloads file types that it supports.
// Non-standard attributes
// target
// Deprecated
// Defines the frame or window name that has the defined linking relationship or that will show the rendering of any linked resource.
// Obsolete attributes
// charset
// Deprecated
// This attribute defines the character encoding of the linked resource.
// The value is a space- and/or comma-delimited list of character sets as defined in
// RFC 2045
// .
// The default value is
// iso-8859-1
// .
// Note:
// To produce the same effect as this obsolete attribute, use the
// Content-Type
// HTTP header on the linked resource.
// rev
// Deprecated
// The value of this attribute shows the relationship of the current document to the linked document, as defined by the
// href
// attribute.
// The attribute thus defines the reverse relationship compared to the value of the
// rel
// attribute.
// Link type values
// for the attribute are similar to the possible values for
// rel
// .
// Note:
// Instead of
// rev
// , you should use the
// rel
// attribute with the opposite
// link type value
// .
// For example, to establish the reverse link for
// made
// , specify
// author
// . Also, this attribute doesn't stand for "revision" and must not be used with a version number, even though many sites misuse it in this way.
// Examples
// Including a stylesheet
// To include a stylesheet in a page, use the following syntax:
// html
// <link href="style.css" rel="stylesheet" />
// Providing alternative stylesheets
// You can also specify
// alternative style sheets
// .
// The user can choose which style sheet to use by choosing it from the
// View > Page Style
// menu.
// This provides a way for users to see multiple versions of a page.
// html
// <link href="default.css" rel="stylesheet" title="Default Style" />
// <link href="fancy.css" rel="alternate stylesheet" title="Fancy" />
// <link href="basic.css" rel="alternate stylesheet" title="Basic" />
// Providing icons for different usage contexts
// You can include links to several icons on the same page, and the browser will choose which one works best for its particular context using the
// rel
// and
// sizes
// values as hints.
// html
// <!-- iPad Pro with high-resolution Retina display: -->
// <link
//  rel="apple-touch-icon"
//  sizes="167x167"
//  href="/apple-touch-icon-167x167.png" />
// <!-- 3x resolution iPhone: -->
// <link
//  rel="apple-touch-icon"
//  sizes="180x180"
//  href="/apple-touch-icon-180x180.png" />
// <!-- non-Retina iPad, iPad mini, etc.: -->
// <link
//  rel="apple-touch-icon"
//  sizes="152x152"
//  href="/apple-touch-icon-152x152.png" />
// <!-- 2x resolution iPhone and other devices: -->
// <link rel="apple-touch-icon" href="/apple-touch-icon-120x120.png" />
// <!-- basic favicon -->
// <link rel="icon" href="/favicon.ico" />
// For information about what
// sizes
// to choose for Apple icons, see
// Apple's documentation on configuring web applications
// and the referenced
// Apple human interface guidelines
// . Usually, it is sufficient to provide a large image, such as 192x192, and let the browser scale it down as needed, but you may want to provide images with different levels of detail for different sizes, as the Apple design guideline recommends. Providing smaller icons for lower resolutions also saves bandwidth.
// It may not be necessary to provide
// <link>
// elements at all. For example, browsers automatically request
// /favicon.ico
// from the root of a site, and Apple also automatically requests
// /apple-touch-icon-[size].png
// ,
// /apple-touch-icon.png
// , etc. However, providing explicit links protects you against changes to these conventions.
// Conditionally loading resources with media queries
// You can provide a media type or query inside a
// media
// attribute;
// this resource will then only be loaded if the media condition is true. For example:
// html
// <link href="print.css" rel="stylesheet" media="print" />
// <link href="mobile.css" rel="stylesheet" media="all" />
// <link
//  href="desktop.css"
//  rel="stylesheet"
//  media="screen and (min-width: 600px)" />
// <link
//  href="highres.css"
//  rel="stylesheet"
//  media="screen and (min-resolution: 300dpi)" />
// Stylesheet load events
// You can determine when a style sheet has been loaded by watching for a
// load
// event to fire on it; similarly, you can detect if an error has occurred while processing a style sheet by watching for an
// error
// event:
// html
// <link rel="stylesheet" href="mystylesheet.css" id="my-stylesheet" />
// <script>
//  const stylesheet = document.getElementById("my-stylesheet");
//  stylesheet.onload = () => {
//  // Do something interesting; the sheet has been loaded
//  };
//  stylesheet.onerror = () => {
//  console.log("An error occurred loading the stylesheet!");
//  };
// </script>
// Note:
// The
// load
// event fires once the stylesheet and all of its imported content has been loaded and parsed, and immediately before the styles start being applied to the content.
// Preload examples
// You can find a number of
// <link rel="preload">
// examples in
// Preloading content with
// rel="preload"
// .
// Blocking rendering till a resource is fetched
// You can include
// render
// token inside a
// blocking
// attribute;
// the rendering of the page will be blocked till the resource is fetched. For example:
// html
// <link blocking="render" rel="stylesheet" href="example.css" crossorigin />
// Technical summary
// Content categories
// Metadata content.
//  If
// itemprop
// is present:
// Flow content
// and
// phrasing content
// .
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// Any element that accepts metadata elements.
//  If
// itemprop
// is present: any element that accepts
// phrasing content
// .
// Implicit ARIA role
// link
// with
// href
// attribute
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLLinkElement
// Specifications
// Specification
// HTML
// #
// the-link-element
// Browser compatibility
// See also
// Link
// HTTP header
