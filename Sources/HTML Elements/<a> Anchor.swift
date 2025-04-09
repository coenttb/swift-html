///
/// <a> Anchor.swift
/// swift-html
///
/// Represents the HTML anchor element for creating hyperlinks.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML anchor element (`<a>`), which creates a hyperlink to web pages, files, email
/// addresses, locations in the same page, or anything else a URL can address.
///
/// The `Anchor` struct provides a type-safe way to create HTML hyperlinks with various attributes
/// that control the link's behavior and appearance. Content within each anchor should indicate
/// the link's destination.
///
/// ## Example
///
/// ```swift
/// anchor(
///     href: "https://example.com",
///     target: .blank,
///     rel: "noopener noreferrer"
/// ) {
///     "Visit Example Website"
/// }
/// ```
///
/// ## Examples for Common Uses
/// 
/// Email links:
/// ```swift
/// anchor(href: "mailto:contact@example.com") {
///     "Email Us"
/// }
/// ```
/// 
/// Telephone links:
/// ```swift
/// anchor(href: "tel:+15555555555") {
///     "Call Us: (555) 555-5555"
/// }
/// ```
/// 
/// In-page navigation:
/// ```swift
/// anchor(href: "#section-id") {
///     "Jump to Section"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use descriptive link text that indicates where the link leads
/// - Avoid generic text like "click here" or "read more"
/// - When opening links in new tabs, use `rel="noopener"` for security
/// - Consider providing visual indicators for links that download files or open in new tabs
/// - Use the appropriate URL scheme based on the link's purpose (e.g., `mailto:` for email addresses)
/// - For improved accessibility, make interactive links at least 44×44 CSS pixels in size
/// - Ensure adequate spacing between links placed in close proximity to avoid accidental activation
///
/// - Note: When rendered, this generates an HTML `<a>` element with the appropriate
///   attributes based on the link configuration.
public struct Anchor: Element {
    public static var tag: String { "a" }
    
    /// Indicates that Attribution-Reporting-Eligible header should be sent.
    ///
    /// Used to register a navigation-based attribution source for the Attribution Reporting API.
    /// Can be a boolean or a space-separated list of URLs where the header should be sent.
    /// 
    /// - Note: Still experimental as of 2025
    public var attributionsrc: HTML_Attributes.AttributionSrc?
    
    /// Causes the browser to treat the linked URL as a download.
    ///
    /// This attribute can be used with or without a filename value:
    ///
    /// - Without a value: The browser will suggest a filename/extension, generated from various sources:
    ///   - The Content-Disposition HTTP header
    ///   - The final segment in the URL path
    ///   - The media type (from the Content-Type header, data: URL, or Blob.type)
    ///
    /// - With a filename value: Suggests a filename for the downloaded file.
    ///   Characters like `/` and `\` are converted to underscores (`_`).
    ///   Browsers will adjust the suggested name if it contains characters forbidden by the filesystem.
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
    public var download: HTML_Attributes.Download?
    
    /// The URL that the hyperlink points to.
    ///
    /// This can be an absolute URL, relative URL, or special URL schemes like:
    /// - `mailto:` for email addresses
    /// - `tel:` for telephone numbers
    /// - `sms:` for text messages
    /// - Document fragments starting with `#` for in-page navigation
    public var href: HTML_Attributes.Href?
    
    /// Hints at the human language of the linked URL.
    ///
    /// This attribute indicates the language of the linked resource.
    /// Values are language codes like "en", "fr", "ja", etc.
    public var hreflang: HTML_Attributes.Hreflang?
    
    /// A space-separated list of URLs to ping when the link is followed.
    ///
    /// When the link is followed, the browser will send POST requests with the body PING to the URLs.
    /// Typically used for tracking.
    public var ping: HTML_Attributes.Ping?
    
    /// How much of the referrer to send when following the link.
    ///
    /// Controls the information included in the Referer header when navigating to the linked resource.
    /// Options include no-referrer, origin, same-origin, strict-origin, etc.
    public var referrerpolicy: HTML_Attributes.ReferrerPolicy?
    
    /// The relationship of the linked URL as space-separated link types.
    ///
    /// Common values include:
    /// - `nofollow` - Indicates search engines should not follow the link
    /// - `noopener` - Prevents the opened page from accessing the window.opener property
    /// - `noreferrer` - Prevents passing the referrer information to the linked page
    /// - `alternate`, `author`, `help`, `license`, etc.
    public var rel: HTML_Attributes.Rel?
    
    /// Where to display the linked URL, as the name for a browsing context.
    ///
    /// Specifies where to open the linked document:
    /// - `_self` - Current browsing context (default)
    /// - `_blank` - New tab/window
    /// - `_parent` - Parent browsing context
    /// - `_top` - Topmost browsing context
    /// - `_unfencedTop` - Allows embedded fenced frames to navigate the top-level frame
    ///
    /// Note: Setting `target="_blank"` on anchor elements implicitly provides the same 
    /// behavior as setting `rel="noopener"` in modern browsers.
    public var target: HTML_Attributes.Target?
    
    /// Creates a new Anchor element with the specified attributes.
    ///
    /// - Parameters:
    ///   - attributionsrc: Attribution source reporting configuration
    ///   - download: Whether the link should be treated as a download
    ///   - href: The URL that the hyperlink points to
    ///   - hreflang: Hints at the language of the linked resource
    ///   - ping: URLs to be notified when the link is followed
    ///   - referrerpolicy: How much referrer information to send
    ///   - rel: Relationship between the current document and linked resource
    ///   - target: Where to display the linked URL
    public init(
        attributionsrc: HTML_Attributes.AttributionSrc? = nil,
        download: HTML_Attributes.Download? = nil,
        href: HTML_Attributes.Href? = nil,
        hreflang: HTML_Attributes.Hreflang? = nil,
        ping: HTML_Attributes.Ping? = nil,
        referrerpolicy: HTML_Attributes.ReferrerPolicy? = nil,
        rel: HTML_Attributes.Rel? = nil,
        target: HTML_Attributes.Target? = nil
    ) {
        self.attributionsrc = attributionsrc
        self.download = download
        self.href = href
        self.hreflang = hreflang
        self.ping = ping
        self.referrerpolicy = referrerpolicy
        self.rel = rel
        self.target = target
    }
}

/// Lowercase typealias for creating Anchor elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `anchor` identifier when creating
/// HTML anchor elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// anchor(href: "https://example.com") {
///     "Visit Example Website"
/// }
/// ```
public typealias anchor = Anchor
