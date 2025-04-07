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

