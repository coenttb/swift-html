///
/// <area> Image Map Area.swift
/// swift-html
///
/// Represents the HTML area element for defining clickable areas in an image map.
///
/// Created by Claude on 04/05/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML area element (`<area>`), which defines a clickable area 
/// inside an image map.
///
/// The `Area` struct provides a type-safe way to create HTML area elements that define
/// geometric regions on an image associated with hypertext links. An image map 
/// allows different parts of a single image to link to different destinations.
///
/// This element must be used within a `<map>` element and works in conjunction with
/// `<img>` elements that have a `usemap` attribute referencing the map.
///
/// ## Examples
///
/// ```swift
/// map(name: "primary") {
///   area(
///     shape: .circle,
///     coords: "75,75,75",
///     href: "left.html",
///     alt: "Click to go Left"
///   )
///   area(
///     shape: .circle,
///     coords: "275,75,75",
///     href: "right.html", 
///     alt: "Click to go Right"
///   )
/// }
/// image(
///   src: "image.jpg",
///   alt: "Interactive image",
///   usemap: "#primary"
/// )
/// ```
///
/// ## Best Practices
///
/// - Always provide descriptive `alt` text for accessibility
/// - Use appropriately sized clickable areas for good user experience
/// - Ensure coordinate values are accurate
/// - For multi-device support, consider responsive design with media queries
/// - For complex shapes, consider using SVG with links as an alternative
///
/// - Note: When rendered, this generates an HTML `<area>` element with the 
///   appropriate attributes based on the configuration.
public struct Area: Element {
    public static var tag: String { "area" }
    
    /// The shape of the associated hot spot.
    ///
    /// This defines the geometry of the clickable area. The coordinate format
    /// in the `coords` attribute depends on which shape is selected.
    public var shape: Shape?
    
    /// The coordinates that define the shape.
    ///
    /// The format depends on the shape:
    /// - rect: x1,y1,x2,y2 (top-left and bottom-right corners)
    /// - circle: x,y,radius (center point and radius)
    /// - poly: x1,y1,x2,y2,...xn,yn (series of points forming a polygon)
    /// - default: no coords needed (entire region beyond defined shapes)
    ///
    /// Values are in CSS pixels.
    public var coords: String? {
        switch self.shape {
        case .circle(coords: let value), .poly(coords: let value), .rect(coords: let value): return value
        default: return nil
        }
    }
    
    /// Alternative text for the area.
    ///
    /// This text provides an alternative description when images are not displayed
    /// or for screen readers. Required when href is present for accessibility.
    public var alt: Alt?
    
    /// The URL for the hyperlink target.
    ///
    /// Defines the destination that will be loaded when the area is clicked.
    /// If omitted, the area does not represent a hyperlink.
    public var href: Href?
    
    /// Indicates that the linked resource should be downloaded rather than displayed.
    ///
    /// When present, suggests to the browser that the linked resource is intended to be
    /// downloaded rather than displayed in the browser.
    public var download: Download?
    
    /// A space-separated list of URLs to be notified if the link is followed.
    ///
    /// When the hyperlink is followed, the browser sends POST requests with the body PING
    /// to the URLs in this list (in the background). Typically used for tracking.
    public var ping: Ping?
    
    /// Indicates which referrer information to include when navigating to the target.
    ///
    /// Controls the `Referer` HTTP header attached to the request when following the link.
    public var referrerpolicy: ReferrerPolicy?
    
    /// Defines the relationship between the linked resource and the current document.
    ///
    /// A space-separated list of link relation types (e.g., "nofollow", "noopener").
    /// Only meaningful when href is present.
    public var rel: String?
    
    /// Defines where to display the linked resource.
    ///
    /// Specifies the browsing context (tab, window, iframe) where the linked URL will open.
    public var target: Target?
    
    /// Creates a new Area element with the specified attributes.
    ///
    /// - Parameters:
    ///   - shape: The shape geometry of the area
    ///   - coords: The coordinates defining the shape
    ///   - alt: Alternative text description (required when href is present)
    ///   - href: URL for the hyperlink target
    ///   - download: Whether the resource should be downloaded
    ///   - ping: URLs to be notified when the link is followed
    ///   - referrerpolicy: Referrer policy for the link
    ///   - rel: Link relation types
    ///   - target: Where to display the linked resource
    public init(
        shape: Shape? = nil,
        alt: Alt? = nil,
        href: Href? = nil,
        download: Download? = nil,
        ping: Ping? = nil,
        referrerpolicy: ReferrerPolicy? = nil,
        rel: String? = nil,
        target: Target? = nil
    ) {
        self.shape = shape
        self.alt = alt
        self.href = href
        self.download = download
        self.ping = ping
        self.referrerpolicy = referrerpolicy
        self.rel = rel
        self.target = target
    }
    
    /// Creates a new Area element with a link.
    ///
    /// - Parameters:
    ///   - shape: The shape geometry of the area
    ///   - coords: The coordinates defining the shape
    ///   - href: URL for the hyperlink target (required)
    ///   - alt: Alternative text description (required for accessibility)
    ///   - target: Where to display the linked resource
    public init(
        shape: Shape,
        href: Href,
        alt: Alt,
        target: Target? = nil
    ) {
        self.shape = shape
        self.href = href
        self.alt = alt
        self.target = target
    }
}

public typealias area = Area


// MARK: - Area-specific Types

extension Area {
    /// Shape of the area element's active region.
    ///
    /// Defines the geometry to use for the clickable area.
    public enum Shape: Sendable, Equatable {
        /// Rectangular region defined by two corner points.
        case rect(coords: String)
        
        /// Circular region defined by center point and radius.
        case circle(coords: String)
        
        /// Polygon region defined by a series of points.
        case poly(coords: String)
        
        /// The entire region beyond any defined shapes.
        case `default`
        
        public var label: String {
            switch self {
            case .rect: "rect"
            case .circle: "circle"
            case .poly: "poly"
            case .`default`: "default"
            }
        }
    }
    
    /// Target browsing context for the linked resource.
    ///
    /// Determines where the linked URL will be opened.
    public struct Target: Sendable, Equatable, ExpressibleByStringLiteral {
        /// Opens the link in the current browsing context (default).
        public static let `self`: Self = "_self"
        
        /// Opens the link in a new browsing context (tab or window).
        public static let blank: Self = "_blank"
        
        /// Opens the link in the parent browsing context, if any.
        public static let parent: Self = "_parent"
        
        /// Opens the link in the topmost browsing context.
        public static let top: Self = "_top"
        
        private let value: String
        
        public init(stringLiteral value: StringLiteralType) {
            self.value = value
        }
        
        /// Returns the string representation of the target.
        public var description: String { value }
    }
}
//
//// MARK: - Convenience Creators
//
//extension Area {
//    /// Creates a rectangular area in an image map.
//    ///
//    /// - Parameters:
//    ///   - x1: X coordinate of the top-left corner
//    ///   - y1: Y coordinate of the top-left corner
//    ///   - x2: X coordinate of the bottom-right corner
//    ///   - y2: Y coordinate of the bottom-right corner
//    ///   - href: URL for the hyperlink target
//    ///   - alt: Alternative text description
//    ///   - target: Where to display the linked resource
//    /// - Returns: An Area with rectangular shape
//    public static func rectangle(
//        x1: Int, y1: Int, x2: Int, y2: Int,
//        href: Href,
//        alt: Alt,
//        target: Target? = nil
//    ) -> Area {
//        let coords = "\(x1),\(y1),\(x2),\(y2)"
//        return Area(
//            shape: .rect,
//            coords: coords,
//            href: href,
//            alt: alt,
//            target: target
//        )
//    }
//    
//    /// Creates a circular area in an image map.
//    ///
//    /// - Parameters:
//    ///   - x: X coordinate of the center
//    ///   - y: Y coordinate of the center
//    ///   - radius: Radius of the circle
//    ///   - href: URL for the hyperlink target
//    ///   - alt: Alternative text description
//    ///   - target: Where to display the linked resource
//    /// - Returns: An Area with circular shape
//    public static func circle(
//        x: Int, y: Int, radius: Int,
//        href: Href,
//        alt: Alt,
//        target: Target? = nil
//    ) -> Area {
//        let coords = "\(x),\(y),\(radius)"
//        return Area(
//            shape: .circle,
//            coords: coords,
//            href: href,
//            alt: alt,
//            target: target
//        )
//    }
//    
//    /// Creates a polygon area in an image map.
//    ///
//    /// - Parameters:
//    ///   - points: Array of (x,y) coordinate pairs forming the polygon
//    ///   - href: URL for the hyperlink target
//    ///   - alt: Alternative text description
//    ///   - target: Where to display the linked resource
//    /// - Returns: An Area with polygon shape
//    public static func polygon(
//        points: [(Int, Int)],
//        href: Href,
//        alt: Alt,
//        target: Target? = nil
//    ) -> Area {
//        let coords = points.map { "\($0.0),\($0.1)" }.joined(separator: ",")
//        return Area(
//            shape: .poly,
//            coords: coords,
//            href: href,
//            alt: alt,
//            target: target
//        )
//    }
//    
//    /// Creates a default area in an image map (entire region beyond defined shapes).
//    ///
//    /// - Parameters:
//    ///   - href: URL for the hyperlink target
//    ///   - alt: Alternative text description
//    ///   - target: Where to display the linked resource
//    /// - Returns: An Area with default shape
//    public static func defaultArea(
//        href: Href,
//        alt: Alt,
//        target: Target? = nil
//    ) -> Area {
//        return Area(
//            shape: .default,
//            coords: nil,
//            href: href,
//            alt: alt,
//            target: target
//        )
//    }
//}

/// Lowercase typealias for creating Area elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `area` identifier when creating
/// HTML area elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// area(
///   shape: .circle,
///   coords: "75,75,75",
///   href: "section.html",
///   alt: "Go to section"
/// )
/// ```



/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/area
 */
// <area>: The Image Map Area element
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
// <area>
// HTML
// element defines an area inside an image map that has predefined clickable areas. An
// image map
// allows geometric areas on an image to be associated with
// hypertext links
// .
// This element is used only within a
// <map>
// element.
// Try it
// <map name="infographic">
//  <area
//  shape="poly"
//  coords="129,0,260,95,129,138"
//  href="https://developer.mozilla.org/docs/Web/HTTP"
//  alt="HTTP" />
//  <area
//  shape="poly"
//  coords="260,96,209,249,130,138"
//  href="https://developer.mozilla.org/docs/Web/HTML"
//  alt="HTML" />
//  <area
//  shape="poly"
//  coords="209,249,49,249,130,139"
//  href="https://developer.mozilla.org/docs/Web/JavaScript"
//  alt="JavaScript" />
//  <area
//  shape="poly"
//  coords="48,249,0,96,129,138"
//  href="https://developer.mozilla.org/docs/Web/API"
//  alt="Web APIs" />
//  <area
//  shape="poly"
//  coords="0,95,128,0,128,137"
//  href="https://developer.mozilla.org/docs/Web/CSS"
//  alt="CSS" />
// </map>
// <img
//  usemap="#infographic"
//  src="/shared-assets/images/examples/mdn-info.png"
//  alt="MDN infographic" />
// img {
//  display: block;
//  margin: 0 auto;
//  width: 260px;
//  height: 260px;
// }
// Attributes
// This element's attributes include the
// global attributes
// .
// alt
// A text string alternative to display on browsers that do not display images.
// The text should be phrased so that it presents the user with the same kind of choice as the image would offer when displayed without the alternative text.
// This attribute is required only if the
// href
// attribute is used.
// coords
// The
// coords
// attribute details the coordinates of the
// shape
// attribute in size, shape, and placement of an
// <area>
// .
// This attribute must not be used if
// shape
// is set to
// default
// .
// rect
// : the value is
// x1,y1,x2,y2
// .
// The value specifies the coordinates of the top-left and bottom-right corner of the rectangle.
// For example, in
// <area shape="rect" coords="0,0,253,27" href="#" target="_blank" alt="Mozilla">
// the coordinates are
// 0,0
// and
// 253,27
// , indicating the top-left and bottom-right corners of the rectangle, respectively.
// circle
// : the value is
// x,y,radius
// . Value specifies the coordinates of the circle center and the radius.
// For example:
// <area shape="circle" coords="130,136,60" href="#" target="_blank" alt="MDN">
// poly
// : the value is
// x1,y1,x2,y2,..,xn,yn
// . Value specifies the coordinates of the edges of the polygon.
// If the first and last coordinate pairs are not the same, the browser will add the last coordinate pair to close the polygon
// The values are numbers of CSS pixels.
// download
// This attribute, if present, indicates that the linked resource is intended to be downloaded rather than displayed in the browser.
// See
// <a>
// for a full description of the
// download
// attribute.
// href
// The hyperlink target for the area.
// Its value is a valid URL.
// This attribute may be omitted; if so, the
// <area>
// element does not represent a hyperlink.
// ping
// Contains a space-separated list of URLs to which, when the hyperlink is followed,
// POST
// requests with the body
// PING
// will be sent by the browser (in the background).
// Typically used for tracking.
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
// rel
// For anchors containing the
// href
// attribute, this attribute specifies the relationship of the target object to the link object.
// The value is a space-separated list of link types.
// The values and their semantics will be registered by some authority that might have meaning to the document author.
// The default relationship, if no other is given, is void. Use this attribute only if the
// href
// attribute is present.
// shape
// The shape of the associated hot spot. The specifications for HTML defines the values
// rect
// , which defines a rectangular region;
// circle
// , which defines a circular region;
// poly
// , which defines a polygon; and
// default
// , which indicates the entire region beyond any defined shapes.
// target
// A keyword or author-defined name of the
// browsing context
// to display the linked resource.
// The following keywords have special meanings:
// _self
// (default): Show the resource in the current browsing context.
// _blank
// : Show the resource in a new, unnamed browsing context.
// _parent
// : Show the resource in the parent browsing context of the current one, if the current page is inside a frame.
// If there is no parent, acts the same as
// _self
// .
// _top
// : Show the resource in the topmost browsing context (the browsing context that is an ancestor of the current one and has no parent).
// If there is no parent, acts the same as
// _self
// .
// Use this attribute only if the
// href
// attribute is present.
// Note:
// Setting
// target="_blank"
// on
// <area>
// elements implicitly provides the same
// rel
// behavior as setting
// rel="noopener"
// which does not set
// window.opener
// . See
// browser compatibility
// for support status.
// Examples
// html
// <map name="primary">
//  <area
//  shape="circle"
//  coords="75,75,75"
//  href="left.html"
//  alt="Click to go Left" />
//  <area
//  shape="circle"
//  coords="275,75,75"
//  href="right.html"
//  alt="Click to go Right" />
// </map>
// <img
//  usemap="#primary"
//  src="https://dummyimage.com/350x150"
//  alt="350 x 150 pic" />
// Result
// Technical summary
// Content categories
// Flow content
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
// Any element that accepts
// phrasing content
// . The
// <area>
// element must have an ancestor
// <map>
// , but it need not be a direct parent.
// Implicit ARIA role
// link
// when
// href
// attribute is present, otherwise
// generic
// Permitted ARIA roles
// No
// role
// permitted
// DOM interface
// HTMLAreaElement
// Specifications
// Specification
// HTML
// #
// the-area-element
// Browser compatibility