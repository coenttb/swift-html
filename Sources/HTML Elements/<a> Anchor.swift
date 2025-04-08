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
/// ## Best Practices
///
/// - Use descriptive link text that indicates where the link leads
/// - Avoid generic text like "click here" or "read more"
/// - When opening links in new tabs, use `rel="noopener"` for security
/// - Consider providing visual indicators for links that download files or open in new tabs
/// - Use the appropriate URL scheme based on the link's purpose (e.g., `mailto:` for email addresses)
///
/// - Note: When rendered, this generates an HTML `<a>` element with the appropriate
///   attributes based on the link configuration.
public struct Anchor<HTML>: Element {
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
    public var target: HTML_Attributes.Target?
    
    /// The content of the anchor, which can include text and other elements.
    ///
    /// The content should ideally indicate the link's destination to provide
    /// context for users, especially those using assistive technologies.
    public var content: () -> HTML
    
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
    ///   - content: The content of the anchor element
    public init(
        attributionsrc: HTML_Attributes.AttributionSrc? = nil,
        download: HTML_Attributes.Download? = nil,
        href: HTML_Attributes.Href? = nil,
        hreflang: HTML_Attributes.Hreflang? = nil,
        ping: HTML_Attributes.Ping? = nil,
        referrerpolicy: HTML_Attributes.ReferrerPolicy? = nil,
        rel: HTML_Attributes.Rel? = nil,
        target: HTML_Attributes.Target? = nil,
        content: @escaping () -> HTML
    ) {
        self.attributionsrc = attributionsrc
        self.download = download
        self.href = href
        self.hreflang = hreflang
        self.ping = ping
        self.referrerpolicy = referrerpolicy
        self.rel = rel
        self.target = target
        self.content = content
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




/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a
 */
// <a>: The Anchor element
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
// <a>
// HTML
// element (or
// anchor
// element), with
// its
// href
// attribute
// , creates a hyperlink to web pages, files, email addresses, locations in the same page, or anything else a URL can address.
// Content within each
// <a>
// should
// indicate the link's destination. If the
// href
// attribute is present, pressing the enter key while focused on the
// <a>
// element will activate it.
// Try it
// <p>You can reach Michael at:</p>
// <ul>
//  <li><a href="https://example.com">Website</a></li>
//  <li><a href="mailto:m.bluth@example.com">Email</a></li>
//  <li><a href="tel:+123456789">Phone</a></li>
// </ul>
// li {
//  margin-bottom: 0.5rem;
// }
// Attributes
// This element's attributes include the
// global attributes
// .
// attributionsrc
// Experimental
// Specifies that you want the browser to send an
// Attribution-Reporting-Eligible
// header. On the server-side this is used to trigger sending an
// Attribution-Reporting-Register-Source
// header in the response, to register a
// navigation-based attribution source
// .
// The browser stores the source data associated with the navigation-based attribution source (as provided in the
// Attribution-Reporting-Register-Source
// response header) when the user clicks the link. See the
// Attribution Reporting API
// for more details.
// There are two versions of this attribute that you can set:
// Boolean, i.e., just the
// attributionsrc
// name. This specifies that you want the
// Attribution-Reporting-Eligible
// header sent to the same server as the
// href
// attribute points to. This is fine when you are handling the attribution source registration on the same server.
// Value containing one or more URLs, for example:
// html
// attributionsrc="https://a.example/register-source
// https://b.example/register-source"
// This is useful in cases where the requested resource is not on a server you control, or you just want to handle registering the attribution source on a different server. In this case, you can specify one or more URLs as the value of
// attributionsrc
// . When the resource request occurs, the
// Attribution-Reporting-Eligible
// header will be sent to the URL(s) specified in
// attributionsrc
// in addition to the resource origin. These URLs can then respond with the
// Attribution-Reporting-Register-Source
// to complete registration.
// Note:
// Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.
// <a>
// elements cannot be used as attribution triggers, only sources.
// download
// Causes the browser to treat the linked URL as a download. Can be used with or without a
// filename
// value:
// Without a value, the browser will suggest a filename/extension, generated from various sources:
// The
// Content-Disposition
// HTTP header
// The final segment in the URL
// path
// The
// media type
// (from the
// Content-Type
// header, the start of a
// data:
// URL
// , or
// Blob.type
// for a
// blob:
// URL
// )
// filename
// : defining a value suggests it as the filename.
// /
// and
// \
// characters are converted to underscores (
// _
// ). Filesystems may forbid other characters in filenames, so browsers will adjust the suggested name if necessary.
// Note:
// download
// only works for
// same-origin URLs
// , or the
// blob:
// and
// data:
// schemes.
// How browsers treat downloads varies by browser, user settings, and other factors. The user may be prompted before a download starts, or the file may be saved automatically, or it may open automatically, either in an external application or in the browser itself.
// If the
// Content-Disposition
// header has different information from the
// download
// attribute, resulting behavior may differ:
// If the header specifies a
// filename
// , it takes priority over a filename specified in the
// download
// attribute.
// If the header specifies a disposition of
// inline
// , Chrome and Firefox prioritize the attribute and treat it as a download. Old Firefox versions (before 82) prioritize the header and will display the content inline.
// href
// The URL that the hyperlink points to. Links are not restricted to HTTP-based URLs â they can use any URL scheme supported by browsers:
// Telephone numbers with
// tel:
// URLs
// Email addresses with
// mailto:
// URLs
// SMS text messages with
// sms:
// URLs
// Executable code with
// javascript:
// URLs
// While web browsers may not support other URL schemes, websites can with
// registerProtocolHandler()
// Moreover other URL features can locate specific parts of the resource, including:
// Sections of a page with document fragments
// Specific text portions with
// text fragments
// Pieces of media files with media fragments
// hreflang
// Hints at the human language of the linked URL. No built-in functionality. Allowed values are the same as
// the global
// lang
// attribute
// .
// ping
// A space-separated list of URLs. When the link is followed, the browser will send
// POST
// requests with the body
// PING
// to the URLs. Typically for tracking.
// referrerpolicy
// How much of the
// referrer
// to send when following the link.
// no-referrer
// : The
// Referer
// header will not be sent.
// no-referrer-when-downgrade
// : The
// Referer
// header will not be sent to
// origin
// s without
// TLS
// (
// HTTPS
// ).
// origin
// : The sent referrer will be limited to the origin of the referring page: its
// scheme
// ,
// host
// , and
// port
// .
// origin-when-cross-origin
// : The referrer sent to other origins will be limited to the scheme, the host, and the port. Navigations on the same origin will still include the path.
// same-origin
// : A referrer will be sent for
// same origin
// , but cross-origin requests will contain no referrer information.
// strict-origin
// : Only send the origin of the document as the referrer when the protocol security level stays the same (HTTPSâHTTPS), but don't send it to a less secure destination (HTTPSâHTTP).
// strict-origin-when-cross-origin
// (default): Send a full URL when performing a same-origin request, only send the origin when the protocol security level stays the same (HTTPSâHTTPS), and send no header to a less secure destination (HTTPSâHTTP).
// unsafe-url
// : The referrer will include the origin
// and
// the path (but not the
// fragment
// ,
// password
// , or
// username
// ).
// This value is unsafe
// , because it leaks origins and paths from TLS-protected resources to insecure origins.
// rel
// The relationship of the linked URL as space-separated link types.
// target
// Where to display the linked URL, as the name for a
// browsing context
// (a tab, window, or
// <iframe>
// ). The following keywords have special meanings for where to load the URL:
// _self
// : The current browsing context. (Default)
// _blank
// : Usually a new tab, but users can configure browsers to open a new window instead.
// _parent
// : The parent browsing context of the current one. If no parent, behaves as
// _self
// .
// _top
// : The topmost browsing context. To be specific, this means the "highest" context that's an ancestor of the current one. If no ancestors, behaves as
// _self
// .
// _unfencedTop
// : Allows embedded
// fenced frames
// to navigate the top-level frame (i.e., traversing beyond the root of the fenced frame, unlike other reserved destinations). Note that the navigation will still succeed if this is used outside of a fenced frame context, but it will not act like a reserved keyword.
// Note:
// Setting
// target="_blank"
// on
// <a>
// elements implicitly provides the same
// rel
// behavior as setting
// rel="noopener"
// which does not set
// window.opener
// .
// type
// Hints at the linked URL's format with a
// MIME type
// . No built-in functionality.
// Deprecated attributes
// charset
// Deprecated
// Hinted at the
// character encoding
// of the linked URL.
// Note:
// This attribute is deprecated and
// should not be used by authors
// . Use the HTTP
// Content-Type
// header on the linked URL.
// coords
// Deprecated
// Used with
// the
// shape
// attribute
// . A comma-separated list of coordinates.
// name
// Deprecated
// Was required to define a possible target location in a page. In HTML 4.01,
// id
// and
// name
// could both be used on
// <a>
// , as long as they had identical values.
// Note:
// Use the global attribute
// id
// instead.
// rev
// Deprecated
// Specified a reverse link; the opposite of
// the
// rel
// attribute
// . Deprecated for being very confusing.
// shape
// Deprecated
// The shape of the hyperlink's region in an image map.
// Note:
// Use the
// <area>
// element for image maps instead.
// Accessibility
// Strong link text
// The content inside a link should indicate where the link goes
// , even out of context.
// Inaccessible, weak link text
// A sadly common mistake is to only link the words "click here" or "here":
// html
// <p>Learn more about our products <a href="/products">here</a>.</p>
// Result
// Strong link text
// Luckily, this is an easy fix, and it's actually shorter than the inaccessible version!
// html
// <p>Learn more <a href="/products">about our products</a>.</p>
// Result
// Assistive software has shortcuts to list all links on a page. However, strong link text benefits all users â the "list all links" shortcut emulates how sighted users quickly scan pages.
// onclick events
// Anchor elements are often abused as fake buttons by setting their
// href
// to
// #
// or
// javascript:void(0)
// to prevent the page from refreshing, then listening for their
// click
// events.
// These bogus
// href
// values cause unexpected behavior when copying/dragging links, opening links in a new tab/window, bookmarking, or when JavaScript is loading, errors, or is disabled. They also convey incorrect semantics to assistive technologies, like screen readers.
// Use a
// <button>
// instead. In general,
// you should only use a hyperlink for navigation to a real URL
// .
// External links and linking to non-HTML resources
// Links that open in a new tab/window via
// target="_blank"
// , or links that point to a download file should indicate what will happen when the link is followed.
// People experiencing low vision conditions, navigating with the aid of screen reading technology, or with cognitive concerns may be confused when a new tab, window, or application opens unexpectedly. Older screen-reading software may not even announce the behavior.
// Link that opens a new tab/window
// html
// <a target="_blank" href="https://www.wikipedia.org">
//  Wikipedia (opens in new tab)
// </a>
// Result
// Link to a non-HTML resource
// If an icon is used to signify link behavior, make sure it has an
// alt
// attribute
// to describe its purpose. In case the icon is missing, the
// alt
// attribute's content will still convey the link's behavior.
// html
// <p>
//  <a href="https://www.wikipedia.org/" target="_blank">
//  Wikipedia
//  <img src="new-tab.svg" width="14" alt="(Opens in new tab)" />
//  </a>
//  <br />
//  <a href="2017-annual-report.ppt">
//  2017 annual report
//  <img src="powerpoint.svg" width="14" alt="(PowerPoint file)" />
//  </a>
// </p>
// <p>
//  <a href="https://www.wikipedia.org/" target="_blank">
//  Wikipedia
//  <img src="missing-icon.svg" width="14" alt="(Opens in new tab)" />
//  </a>
//  <br />
//  <a href="2017-annual-report.ppt">
//  2017 annual report
//  <img src="missing-icon.svg" width="14" alt="(PowerPoint file)" />
//  </a>
// </p>
// Result
// WebAIM: Links and Hypertext - Hypertext Links
// MDN / Understanding WCAG, Guideline 3.2
// G200: Opening new windows and tabs from a link only when necessary
// G201: Giving users advanced warning when opening a new window
// Skip links
// A
// skip link
// is a link placed as early as possible in
// <body>
// content that points to the beginning of the page's main content. Usually, CSS hides a skip link offscreen until focused.
// html
// <body>
//  <a href="#content" class="skip-link">Skip to main content</a>
//  <header>â¦</header>
//  <!-- The skip link jumps to here -->
//  <main id="content"></main>
// </body>
// css
// .skip-link {
//  position: absolute;
//  top: -3em;
//  background: #fff;
// }
// .skip-link:focus {
//  top: 0;
// }
// Result
// Skip links let keyboard users bypass content repeated throughout multiple pages, such as header navigation.
// Skip links are especially useful for people who navigate with the aid of assistive technology such as switch control, voice command, or mouth sticks/head wands, where the act of moving through repetitive links can be laborious.
// WebAIM: "Skip Navigation" Links
// How-to: Use Skip Navigation links
// MDN / Understanding WCAG, Guideline 2.4 explanations
// Understanding Success Criterion 2.4.1
// Size and proximity
// Size
// Interactive elements, like links, should provide an area large enough that it is easy to activate them. This helps a variety of people, including those with motor control issues and those using imprecise inputs such as a touchscreen. A minimum size of 44Ã44
// CSS pixels
// is recommended.
// Text-only links in prose content are exempt from this requirement, but it's still a good idea to make sure enough text is hyperlinked to be easily activated.
// Understanding Success Criterion 2.5.5: Target Size
// Target Size and 2.5.5
// Quick test: Large touch targets
// Proximity
// Interactive elements, like links, placed in close visual proximity should have space separating them. Spacing helps people with motor control issues, who may otherwise accidentally activate the wrong interactive content.
// Spacing may be created using CSS properties like
// margin
// .
// Hand tremors and the giant-button-problem
// Examples
// Linking to an absolute URL
// HTML
// html
// <a href="https://www.mozilla.com">Mozilla</a>
// Result
// Linking to relative URLs
// HTML
// html
// <a href="//example.com">Scheme-relative URL</a>
// <a href="/en-US/docs/Web/HTML">Origin-relative URL</a>
// <a href="p">Directory-relative URL</a>
// <a href="./p">Directory-relative URL</a>
// <a href="../p">Parent-directory-relative URL</a>
// a {
//  display: block;
//  margin-bottom: 0.5em;
// }
// Result
// Linking to an element on the same page
// html
// <!-- <a> element links to the section below -->
// <p><a href="#Section_further_down">Jump to the heading below</a></p>
// <!-- Heading to link to -->
// <h2 id="Section_further_down">Section further down</h2>
// Result
// Note:
// You can use
// href="#top"
// or the empty fragment (
// href="#"
// ) to link to the top of the current page,
// as defined in the HTML specification
// .
// Linking to an email address
// To create links that open in the user's email program to let them send a new message, use the
// mailto:
// scheme:
// html
// <a href="mailto:nowhere@mozilla.org">Send email to nowhere</a>
// Result
// For details about
// mailto:
// URLs, such as including a subject or body, see
// Email links
// or
// RFC 6068
// .
// Linking to telephone numbers
// html
// <a href="tel:+49.157.0156">+49 157 0156</a>
// <a href="tel:+1(800)555-0123">(800) 555-0123</a>
// Result
// tel:
// link behavior varies with device capabilities:
// Cellular devices autodial the number.
// Most operating systems have programs that can make calls, like Skype or FaceTime.
// Websites can make phone calls with
// registerProtocolHandler
// , such as
// web.skype.com
// .
// Other behaviors include saving the number to contacts, or sending the number to another device.
// See
// RFC 3966
// for syntax, additional features, and other details about the
// tel:
// URL scheme.
// Using the download attribute to save a <canvas> as a PNG
// To save a
// <canvas>
// element's contents as an image, you can create a link where the
// href
// is the canvas data as a
// data:
// URL created with JavaScript and the
// download
// attribute provides the file name for the downloaded PNG file:
// Example painting app with save link
// HTML
// html
// <p>
//  Paint by holding down the mouse button and moving it.
//  <a href="" download="my_painting.png">Download my painting</a>
// </p>
// <canvas width="300" height="300"></canvas>
// CSS
// css
// html {
//  font-family: sans-serif;
// }
// canvas {
//  background: #fff;
//  border: 1px dashed;
// }
// a {
//  display: inline-block;
//  background: #69c;
//  color: #fff;
//  padding: 5px 10px;
// }
// JavaScript
// js
// const canvas = document.querySelector("canvas");
// const c = canvas.getContext("2d");
// c.fillStyle = "hotpink";
// let isDrawing;
// function draw(x, y) {
//  if (isDrawing) {
//  c.beginPath();
//  c.arc(x, y, 10, 0, Math.PI * 2);
//  c.closePath();
//  c.fill();
//  }
// }
// canvas.addEventListener("mousemove", (event) =>
//  draw(event.offsetX, event.offsetY),
// );
// canvas.addEventListener("mousedown", () => (isDrawing = true));
// canvas.addEventListener("mouseup", () => (isDrawing = false));
// document
//  .querySelector("a")
//  .addEventListener(
//  "click",
//  (event) => (event.target.href = canvas.toDataURL()),
//  );
// Result
// Security and privacy
// <a>
// elements can have consequences for users' security and privacy. See
// Referer
// header: privacy and security concerns
// for information.
// Using
// target="_blank"
// without
// rel="noreferrer"
// and
// rel="noopener"
// makes the website vulnerable to
// window.opener
// API exploitation attacks, although note that, in newer browser versions setting
// target="_blank"
// implicitly provides the same protection as setting
// rel="noopener"
// . See
// browser compatibility
// for details.
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// interactive content
// , palpable content.
// Permitted content
// Transparent
// , except that no descendant may be
// interactive content
// or an
// <a>
// element, and no descendant may have a specified
// tabindex
// attribute.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// flow content
// , but not other
// <a>
// elements.
// Implicit ARIA role
// link
// when
// href
// attribute is
//  present, otherwise
// generic
// Permitted ARIA roles
// When
// href
// attribute is present:
// button
// checkbox
// menuitem
// menuitemcheckbox
// menuitemradio
// option
// radio
// switch
// tab
// treeitem
// When
// href
// attribute is not present:
// any
// DOM interface
// HTMLAnchorElement
// Specifications
// Specification
// HTML
// #
// the-a-element
// Browser compatibility
// See also
// <link>
// is similar to
// <a>
// , but for metadata hyperlinks that are invisible to users.
// :link
// is a CSS pseudo-class that will match
// <a>
// elements with URL in
// href
// attribute that was not yet visited by the user.
// :visited
// is a CSS pseudo-class that will match
// <a>
// elements with URL in
// href
// attribute that was visited by the user in the past.
// :any-link
// is a CSS pseudo-class that will match
// <a>
// elements with
// href
// attribute.
// Text fragments
// are user-agent instructions added to URLs that allow content authors to link to specific text on a page, without IDs being required.