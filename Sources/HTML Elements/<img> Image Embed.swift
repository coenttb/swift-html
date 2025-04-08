import Foundation
import HTML_Attributes

public struct Image: Element {
    public static var tag: String { "image" }
    
    public var src: Src?
    public var alt: Alt?
    public var loading: Image.Loading?
    
    public init(
        src: Src? = nil,
        alt: Alt? = nil,
        loading: Image.Loading? = nil
    ) {
        self.src = src
        self.alt = alt
        self.loading = loading
    }
}

extension Image {
    public init?(base64EncodedFromURL url: URL, description: String) {
        guard
            let imageData = try? Foundation.Data(contentsOf: url) else {
            return nil
        }
        
        let base64String = imageData.base64EncodedString()
        let mimeType = Image.mimeTypeForImage(relativeURL: url.relativeString)
        
        self.init(src: "data:\(mimeType);base64,\(base64String)", alt: .init(description))
    }
    
    private static func mimeTypeForImage(relativeURL: String) -> String {
        let pathExtension = (relativeURL as NSString).pathExtension.lowercased()
        switch pathExtension {
        case "jpg", "jpeg":
            return "image/jpeg"
        case "png":
            return "image/png"
        case "gif":
            return "image/gif"
        case "svg":
            return "image/svg+xml"
        default:
            return "application/octet-stream"
        }
    }
}

extension Image {
    public init?(baseURL: URL, base64EncodedFromURL relativeURL: String, description: String) {
        guard let fullURL = URL(string: relativeURL, relativeTo: baseURL) else {
            return nil
        }
        
        self.init(base64EncodedFromURL: fullURL, description: description)
    }
}


extension Image {
    /// Represents the CSS `loading` attribute that specifies how the browser should load an image.
    ///
    /// The `loading` attribute affects when and how resources like images and iframes
    /// are loaded relative to their visibility in the viewport. This can significantly
    /// impact page performance and data usage.
    ///
    /// ```
    ///    Loading behavior:
    ///
    ///    eager (default):            lazy:
    ///    +--------------+            +--------------+
    ///    | Image loads  |            | Placeholder  |
    ///    | immediately  |            | until near   |
    ///    | when page    |            | viewport     |
    ///    | is rendered  |            |              |
    ///    +--------------+            +--------------+
    ///                                      |
    ///                                      v
    ///                                +--------------+
    ///                                | Image loads  |
    ///                                | when user    |
    ///                                | scrolls near |
    ///                                | viewport     |
    ///                                +--------------+
    /// ```
    ///
    /// Example usage:
    /// ```swift
    /// let lazyLoading = Loading.lazy
    /// // HTML attribute: loading="lazy"
    ///
    /// let eagerLoading = Loading.eager
    /// // HTML attribute: loading="eager"
    /// ```
    ///
    /// - Note: This is primarily used as an HTML attribute rather than a CSS property,
    ///   but it's included in this library for completeness when working with HTML elements.
    ///
    /// - SeeAlso: [MDN Web Docs: loading attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img#attr-loading)
    public enum Loading: String, Attribute, CaseIterable, Sendable, Equatable {
        public static let attribute: String = "loading"
        
        /// Defers loading of the resource until it reaches a calculated distance from the viewport.
        /// Useful for conserving bandwidth and improving initial page load time.
        case lazy
        
        /// Loads the resource immediately, regardless of where it's located on the page (default browser behavior).
        case eager
    }

}


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img
 */
// <img>: The Image Embed element
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
// <img>
// HTML
// element embeds an image into the document.
// Try it
// <img
//  class="fit-picture"
//  src="/shared-assets/images/examples/grapefruit-slice.jpg"
//  alt="Grapefruit slice atop a pile of other slices" />
// .fit-picture {
//  width: 250px;
// }
// The above example shows usage of the
// <img>
// element:
// The
// src
// attribute is
// required
// , and contains the path to the image you want to embed.
// The
// alt
// attribute holds a textual replacement for the image, which is mandatory and
// incredibly useful
// for accessibility â screen readers read the attribute value out to their users so they know what the image means. Alt text is also displayed on the page if the image can't be loaded for some reason: for example, network errors, content blocking, or link rot.
// There are many other attributes to achieve various purposes:
// Referrer
// /
// CORS
// control for security and privacy: see
// crossorigin
// and
// referrerpolicy
// .
// Use both
// width
// and
// height
// to set the intrinsic size of the image, allowing it to take up space before it loads, to mitigate content layout shifts.
// Responsive image hints with
// sizes
// and
// srcset
// (see also the
// <picture>
// element and our
// Responsive images
// tutorial).
// Supported image formats
// The HTML standard doesn't list what image formats to support, so
// user agents
// may support different formats.
// Note:
// The
// Image file type and format guide
// provides comprehensive information about image formats and their web browser support.
// This section is just a summary!
// The image file formats that are most commonly used on the web are:
// APNG (Animated Portable Network Graphics)
// â Good choice for lossless animation sequences (GIF is less performant)
// AVIF (AV1 Image File Format)
// â Good choice for both images and animated images due to high performance.
// GIF (Graphics Interchange Format)
// â Good choice for
// simple
// images and animations.
// JPEG (Joint Photographic Expert Group image)
// â Good choice for lossy compression of still images (currently the most popular).
// PNG (Portable Network Graphics)
// â Good choice for lossless compression of still images (slightly better quality than JPEG).
// SVG (Scalable Vector Graphics)
// â Vector image format. Use for images that must be drawn accurately at different sizes.
// WebP (Web Picture format)
// â Excellent choice for both images and animated images
// Formats like
// WebP
// and
// AVIF
// are recommended as they perform much better than PNG, JPEG, GIF for both still and animated images.
// SVG remains the recommended format for images that must be drawn accurately at different sizes.
// Image loading errors
// If an error occurs while loading or rendering an image, and an
// onerror
// event handler has been set for the
// error
// event, that event handler will get called. This can happen in several situations, including:
// The
// src
// attribute is empty (
// ""
// ) or
// null
// .
// The
// src
// URL
// is the same as the URL of the page the user is currently on.
// The image is corrupted in some way that prevents it from being loaded.
// The image's metadata is corrupted in such a way that it's impossible to retrieve its dimensions, and no dimensions were specified in the
// <img>
// element's attributes.
// The image is in a format not supported by the
// user agent
// .
// Attributes
// This element includes the
// global attributes
// .
// alt
// Defines text that can replace the image in the page.
// Note:
// Browsers do not always display images. There are a number of situations in which a browser might not display images, such as:
// Non-visual browsers (such as those used by people with visual impairments)
// The user chooses not to display images (saving bandwidth, privacy reasons)
// The image is invalid or an
// unsupported type
// In these cases, the browser may replace the image with the text in the element's
// alt
// attribute. For these reasons and others, provide a useful value for
// alt
// whenever possible.
// Setting this attribute to an empty string (
// alt=""
// ) indicates that this image is
// not
// a key part of the content (it's decoration or a tracking pixel), and that non-visual browsers may omit it from
// rendering
// . Visual browsers will also hide the broken image icon if the
// alt
// attribute is empty and the image failed to display.
// This attribute is also used when copying and pasting the image to text, or saving a linked image to a bookmark.
// attributionsrc
// Experimental
// specifies that you want the browser to send an
// Attribution-Reporting-Eligible
// header along with the image request.
// On the server-side this is used to trigger sending an
// Attribution-Reporting-Register-Source
// or
// Attribution-Reporting-Register-Trigger
// header in the response, to register an image-based
// attribution source
// or
// attribution trigger
// , respectively. Which response header should be sent back depends on the value of the
// Attribution-Reporting-Eligible
// header that triggered the registration.
// The corresponding source or trigger event is set off once the browser receives the response containing the image file.
// Note:
// See the
// Attribution Reporting API
// for more details.
// There are two versions of this attribute that you can set:
// Boolean, i.e., just the
// attributionsrc
// name. This specifies that you want the
// Attribution-Reporting-Eligible
// header sent to the same server as the
// src
// attribute points to. This is fine when you are handling the attribution source or trigger registration on the same server. When registering an attribution trigger this property is optional, and a boolean value will be used if it is omitted.
// Value containing one or more URLs, for example:
// html
// <img
//  src="image-file.png"
//  alt="My image file description"
//  attributionsrc="https://a.example/register-source
//  https://b.example/register-source" />
// This is useful in cases where the requested resource is not on a server you control, or you just want to handle registering the attribution source on a different server. In this case, you can specify one or more URLs as the value of
// attributionsrc
// . When the resource request occurs the
// Attribution-Reporting-Eligible
// header will be sent to the URL(s) specified in
// attributionSrc
// in addition to the resource origin. These URLs can then respond with a
// Attribution-Reporting-Register-Source
// or
// Attribution-Reporting-Register-Trigger
// header as appropriate to complete registration.
// Note:
// Specifying multiple URLs means that multiple attribution sources can be registered on the same feature. You might for example have different campaigns that you are trying to measure the success of, which involve generating different reports on different data.
// crossorigin
// Indicates if the fetching of the image must be done using a
// CORS
// request. Image data from a
// CORS-enabled image
// returned from a CORS request can be reused in the
// <canvas>
// element without being marked "
// tainted
// ".
// If the
// crossorigin
// attribute is
// not
// specified, then a non-CORS request is sent (without the
// Origin
// request header), and the browser marks the image as tainted and restricts access to its image data, preventing its usage in
// <canvas>
// elements.
// If the
// crossorigin
// attribute
// is
// specified, then a CORS request is sent (with the
// Origin
// request header); but if the server does not opt into allowing cross-origin access to the image data by the origin site (by not sending any
// Access-Control-Allow-Origin
// response header, or by not including the site's origin in any
// Access-Control-Allow-Origin
// response header it does send), then the browser blocks the image from loading, and logs a CORS error to the devtools console.
// Allowed values:
// anonymous
// A CORS request is sent with credentials omitted (that is, no
// cookies
// ,
// X.509 certificates
// , or
// Authorization
// request header).
// use-credentials
// The CORS request is sent with any credentials included (that is, cookies, X.509 certificates, and the
// Authorization
// request header). If the server does not opt into sharing credentials with the origin site (by sending back the
// Access-Control-Allow-Credentials: true
// response header), then the browser marks the image as tainted and restricts access to its image data.
// If the attribute has an invalid value, browsers handle it as if the
// anonymous
// value was used. See
// CORS settings attributes
// for additional information.
// decoding
// This attribute provides a hint to the browser as to whether it should perform image decoding along with rendering the other DOM content in a single presentation step that looks more "correct" (
// sync
// ), or render and present the other DOM content first and then decode the image and present it later (
// async
// ). In practice,
// async
// means that the next paint does not wait for the image to decode.
// It is often difficult to perceive any noticeable effect when using
// decoding
// on static
// <img>
// elements. They'll likely be initially rendered as empty images while the image files are fetched (either from the network or from the cache) and then handled independently anyway, so the "syncing" of content updates is less apparent. However, the blocking of rendering while decoding happens, while often quite small,
// can
// be measured â even if it is difficult to observe with the human eye. See
// What does the image decoding attribute actually do?
// for a more detailed analysis (tunetheweb.com, 2023).
// Using different
// decoding
// types can result in more noticeable differences when dynamically inserting
// <img>
// elements into the DOM via JavaScript â see
// HTMLImageElement.decoding
// for more details.
// Allowed values:
// sync
// Decode the image synchronously along with rendering the other DOM content, and present everything together.
// async
// Decode the image asynchronously, after rendering and presenting the other DOM content.
// auto
// No preference for the decoding mode; the browser decides what is best for the user. This is the default value.
// elementtiming
// Marks the image for observation by the
// PerformanceElementTiming
// API. The value given becomes an identifier for the observed image element. See also the
// elementtiming
// attribute page.
// fetchpriority
// Provides a hint of the relative priority to use when fetching the image.
// Allowed values:
// high
// Fetch the image at a high priority relative to other images.
// low
// Fetch the image at a low priority relative to other images.
// auto
// Don't set a preference for the fetch priority.
// This is the default.
// It is used if no value or an invalid value is set.
// See
// HTMLImageElement.fetchPriority
// for more information.
// height
// The intrinsic height of the image, in pixels. Must be an integer without a unit.
// Note:
// Including
// height
// and
// width
// enables the
// aspect ratio
// of the image to be calculated by the browser prior to the image being loaded. This aspect ratio is used to reserve the space needed to display the image, reducing or even preventing a layout shift when the image is downloaded and painted to the screen. Reducing layout shift is a major component of good user experience and web performance.
// ismap
// This Boolean attribute indicates that the image is part of a
// server-side map
// . If so, the coordinates where the user clicked on the image are sent to the server.
// Note:
// This attribute is allowed only if the
// <img>
// element is a descendant of an
// <a>
// element with a valid
// href
// attribute. This gives users without pointing devices a fallback destination.
// loading
// Indicates how the browser should load the image:
// eager
// Loads the image immediately, regardless of whether or not the image is currently within the visible viewport (this is the default value).
// lazy
// Defers loading the image until it reaches a calculated distance from the viewport, as defined by the browser. The intent is to avoid the network and storage bandwidth needed to handle the image until it's reasonably certain that it will be needed. This generally improves the performance of the content in most typical use cases.
// Note:
// Loading is only deferred when JavaScript is enabled. This is an anti-tracking measure, because if a user agent supported lazy loading when scripting is disabled, it would still be possible for a site to track a user's approximate scroll position throughout a session, by strategically placing images in a page's markup such that a server can track how many images are requested and when.
// Note:
// Images with
// loading
// set to
// lazy
// will never be loaded if they do not intersect a visible part of an element, even if loading them would change that as unloaded images have a
// width
// and
// height
// of
// 0
// . Putting
// width
// and
// height
// on lazy-loaded images fixes this issue and is a best practice,
// recommended by the specification
// . Doing so also helps prevent layout shifts.
// referrerpolicy
// A string indicating which referrer to use when fetching the resource:
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
// sizes
// One or more strings separated by commas, indicating a set of source sizes. Each source size consists of:
// A
// media condition
// . This must be omitted for the last item in the list.
// A source size value.
// Media Conditions describe properties of the
// viewport
// , not of the
// image
// . For example,
// (max-height: 500px) 1000px
// proposes to use a source of 1000px width, if the
// viewport
// is not higher than 500px. Because a source size descriptor is used to specify the width to use for the image during layout of the page, the media condition is typically (but not necessarily) based on the
// width
// information.
// Source size values specify the intended display size of the image.
// User agents
// use the current source size to select one of the sources supplied by the
// srcset
// attribute, when those sources are described using width (
// w
// ) descriptors. The selected source size affects the
// intrinsic size
// of the image (the image's display size if no
// CSS
// styling is applied). If the
// srcset
// attribute is absent, or contains no values with a width descriptor, then the
// sizes
// attribute has no effect.
// A source size value can be any non-negative
// length
// . It must not use CSS functions other than the
// math functions
// . Units are interpreted in the same way as
// media queries
// , meaning that all relative length units are relative to the document root rather than the
// <img>
// element, so an
// em
// value is relative to the root font size, rather than the font size of the image.
// Percentage
// values are not allowed.
// Additionally, you can use the value
// auto
// to replace the whole list of sizes or the first entry in the list. It is only valid when combined with
// loading="lazy"
// , and resolves to the
// concrete size
// of the image.
// src
// The image
// URL
// . Mandatory for the
// <img>
// element. On
// browsers
// supporting
// srcset
// ,
// src
// is treated like a candidate image with a pixel density descriptor
// 1x
// , unless an image with this pixel density descriptor is already defined in
// srcset
// , or unless
// srcset
// contains
// w
// descriptors.
// srcset
// One or more strings separated by commas, indicating possible image sources for the
// user agent
// to use. Each string is composed of:
// A
// URL
// to an image
// Optionally, whitespace followed by one of:
// A width descriptor (a positive integer directly followed by
// w
// ). The width descriptor is divided by the source size given in the
// sizes
// attribute to calculate the effective pixel density.
// A pixel density descriptor (a positive floating point number directly followed by
// x
// ).
// If no descriptor is specified, the source is assigned the default descriptor of
// 1x
// .
// It is incorrect to mix width descriptors and pixel density descriptors in the same
// srcset
// attribute. Duplicate descriptors (for instance, two sources in the same
// srcset
// which are both described with
// 2x
// ) are also invalid.
// If the
// srcset
// attribute uses width descriptors, the
// sizes
// attribute must also be present, or the
// srcset
// itself will be ignored.
// The user agent selects any of the available sources at its discretion. This provides them with significant leeway to tailor their selection based on things like user preferences or
// bandwidth
// conditions. See our
// Responsive images
// tutorial for an example.
// width
// The intrinsic width of the image in pixels. Must be an integer without a unit.
// usemap
// The partial
// URL
// (starting with
// #
// ) of an
// image map
// associated with the element.
// Note:
// You cannot use this attribute if the
// <img>
// element is inside an
// <a>
// or
// <button>
// element.
// Deprecated attributes
// align
// Deprecated
// Aligns the image with its surrounding context. Use the
// float
// and/or
// vertical-align
// CSS
// properties instead of this attribute. Allowed values:
// top
// Equivalent to
// vertical-align: top
// or
// vertical-align: text-top
// middle
// Equivalent to
// vertical-align: -moz-middle-with-baseline
// bottom
// The default, equivalent to
// vertical-align: unset
// or
// vertical-align: initial
// left
// Equivalent to
// float: left
// right
// Equivalent to
// float: right
// border
// Deprecated
// The width of a border around the image. Use the
// border
// CSS
// property instead.
// hspace
// Deprecated
// The number of pixels of white space on the left and right of the image. Use the
// margin
// CSS property instead.
// longdesc
// Deprecated
// A link to a more detailed description of the image. Possible values are a
// URL
// or an element
// id
// .
// Note:
// This attribute is mentioned in the latest
// W3C
// version,
// HTML 5.2
// , but has been removed from the
// WHATWG
// 's
// HTML Living Standard
// . It has an uncertain future; authors should use a
// WAI
// -
// ARIA
// alternative such as
// aria-describedby
// or
// aria-details
// .
// name
// Deprecated
// A name for the element. Use the
// id
// attribute instead.
// vspace
// Deprecated
// The number of pixels of white space above and below the image. Use the
// margin
// CSS property instead.
// Styling with CSS
// <img>
// is a
// replaced element
// ; it has a
// display
// value of
// inline
// by default, but its default dimensions are defined by the embedded image's intrinsic values, like it were
// inline-block
// . You can set properties like
// border
// /
// border-radius
// ,
// padding
// /
// margin
// ,
// width
// ,
// height
// , etc. on an image.
// <img>
// has no baseline, so when images are used in an inline formatting context with
// vertical-align: baseline
// , the bottom of the image will be placed on the text baseline.
// You can use the
// object-position
// property to position the image within the element's box, and the
// object-fit
// property to adjust the sizing of the image within the box (for example, whether the image should fit the box or fill it even if clipping is required).
// Depending on its type, an image may have an intrinsic width and height. For some image types, however, intrinsic dimensions are unnecessary.
// SVG
// images, for instance, have no intrinsic dimensions if their root
// <svg>
// element doesn't have a
// width
// or
// height
// set on it.
// Accessibility
// Authoring meaningful alternate descriptions
// An
// alt
// attribute's value should provide a clear and concise text replacement for the image's content. It should not describe the presence of the image itself or the file name of the image. If the
// alt
// attribute is purposefully left off because the image has no textual equivalent, consider alternate methods to present what the image is trying to communicate.
// Don't
// html
// <img alt="image" src="penguin.jpg" />
// Do
// html
// <img alt="A Penguin on a beach." src="penguin.jpg" />
// An important accessibility test is to read the
// alt
// attribute content together with preceding textual content to see if it conveys the same meaning as the image. For example, if the image was preceded by the sentence "On my travels, I saw a cute little animal:", the
// Don't
// example could be read by a screen reader as "On my travels, I saw a cute little animal: image", which doesn't make sense. The
// Do
// example could be read by a screen reader as "On my travels, I saw a cute little animal: A Penguin on a beach.", which does make sense.
// For images used to trigger an action, for example, images nested inside an
// <a>
// or
// <button>
// element, consider describing the triggered action inside the
// alt
// attribute value. For example, you could write
// alt="next page"
// instead of
// alt="arrow right"
// . You could also consider adding an optional further description inside a
// title
// attribute; this may be read by screen readers if requested by the user.
// When an
// alt
// attribute is not present on an image, some screen readers may announce the image's file name instead. This can be a confusing experience if the file name isn't representative of the image's contents.
// An alt Decision Tree â¢ Images â¢ WAI Web Accessibility Tutorials
// Alt-texts: The Ultimate Guide â Axess Lab
// How to Design Great Alt Text: An Introduction | Deque
// MDN Understanding WCAG, Guideline 1.1 explanations
// Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0
// Identifying SVG as an image
// Due to a
// VoiceOver bug
// , VoiceOver does not correctly announce SVG images as images. Include
// role="img"
// to all
// <img>
// elements with SVG source files to ensure assistive technologies correctly announce the SVG as image content.
// html
// <img src="mdn.svg" alt="MDN" role="img" />
// The title attribute
// The
// title
// attribute is not an acceptable substitute for the
// alt
// attribute. Additionally, avoid duplicating the
// alt
// attribute's value in a
// title
// attribute declared on the same image. Doing so may cause some screen readers to announce the same text twice, creating a confusing experience.
// The
// title
// attribute should also not be used as supplemental captioning information to accompany an image's
// alt
// description. If an image needs a caption, use the
// figure
// and
// figcaption
// elements.
// The value of the
// title
// attribute is usually presented to the user as a tooltip, which appears shortly after the cursor stops moving over the image. While this
// can
// provide additional information to the user, you should not assume that the user will ever see it: the user may only have keyboard or touchscreen. If you have information that's particularly important or valuable for the user, present it inline using one of the methods mentioned above instead of using
// title
// .
// Using the HTML title attribute â updated | The Paciello Group
// Examples
// Alternative text
// The following example embeds an image into the page and includes alternative text for accessibility.
// html
// <img src="favicon144.png" alt="MDN" />
// Image link
// This example builds upon the previous one, showing how to turn the image into a link. To do so, nest the
// <img>
// tag inside the
// <a>
// . You should make the alternative text describe the resource the link is pointing to, as if you were using a text link instead.
// html
// <a href="https://developer.mozilla.org">
//  <img src="favicon144.png" alt="Visit the MDN site" />
// </a>
// Using the srcset attribute
// In this example we include a
// srcset
// attribute with a reference to a high-resolution version of the logo; this will be loaded instead of the
// src
// image on high-resolution devices. The image referenced in the
// src
// attribute is counted as a
// 1x
// candidate in
// user agents
// that support
// srcset
// .
// html
// <img src="favicon72.png" alt="MDN" srcset="favicon144.png 2x" />
// Using the srcset and sizes attributes
// The
// src
// attribute is ignored in
// user agents
// that support
// srcset
// when
// w
// descriptors are included. When the
// (max-width: 600px)
// media condition matches, the 200 pixel-wide image will load (it is the one that matches
// 200px
// most closely), otherwise the other image will load.
// html
// <img
//  src="clock-demo-200px.png"
//  alt="The time is 12:45."
//  srcset="clock-demo-200px.png 200w, clock-demo-400px.png 400w"
//  sizes="(max-width: 600px) 200px, 50vw" />
// Note:
// To see the resizing in action,
// view the example on a separate page
// , so you can actually resize the content area.
// Security and privacy concerns
// Although
// <img>
// elements have innocent uses, they can have undesirable consequences for user security and privacy. See
// Referer header: privacy and security concerns
// for more information and mitigations.
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// ,
// embedded content
// ,
// palpable content
// . If the element has a
// usemap
// attribute, it also is a part
//  of the interactive content category.
// Permitted content
// None; it is a
// void element
// .
// Tag omission
// Must have a start tag and must not have an end tag.
// Permitted parents
// Any element that accepts embedded content.
// Implicit ARIA role
// with non-empty
// alt
// attribute or no
// alt
// attribute:
// img
// with empty
// alt
// attribute:
// presentation
// Permitted ARIA roles
// with non-empty
// alt
// attribute:
// button
// checkbox
// link
// menuitem
// menuitemcheckbox
// menuitemradio
// option
// progressbar
// scrollbar
// separator
// slider
// switch
// tab
// treeitem
// with empty
// alt
// attribute,
// none
// or
// presentation
// with no
// alt
// attribute, no
// role
// permitted
// DOM interface
// HTMLImageElement
// Specifications
// Specification
// HTML
// #
// the-img-element
// Browser compatibility
// See also
// <picture>
// ,
// <object>
// , and
// <embed>
// elements
// object-fit
// ,
// object-position
// ,
// image-orientation
// ,
// image-rendering
// , and
// image-resolution
// : Image-related CSS properties.
// HTMLImageElement
// interface for this element
// HTML images
// Image file type and format guide
// Responsive images