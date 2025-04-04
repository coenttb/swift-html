///
/// Elementtiming.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that marks an element for performance timing measurement.
///
/// The `elementtiming` attribute flags an element for performance tracking by the 
/// PerformanceObserver API using the "element" type. It allows developers to measure 
/// when specific important elements become visible to the user, which is useful for 
/// monitoring and optimizing page performance.
///
/// ## Usage Notes
///
/// - Can be applied to:
///   - `<img>` elements
///   - `<image>` elements inside SVG
///   - Poster images of `<video>` elements
///   - Elements with a background image
///   - Text-containing elements like `<p>`, `<h1>`, etc.
/// - The attribute value becomes an identifier for the element in performance entries
/// - In the DOM, this attribute is reflected as `Element.elementtiming`
/// - Requires a PerformanceObserver to capture and process the timing data
///
/// ## When to Use
///
/// Good candidates for element timing measurement include:
///
/// - Hero/main images for articles or product pages
/// - Critical text content (headings, product descriptions)
/// - Carousel images on shopping sites
/// - Video poster images
/// - Above-the-fold content that directly affects user experience
///
/// ## Browser Support
///
/// Element Timing is part of the Web Performance API but has limited browser support.
/// Check current compatibility before relying on it for critical features.
///
/// ## Examples
///
/// Timing a main image:
/// ```html
/// <img src="hero.jpg" alt="Hero image" elementtiming="hero-image">
/// ```
///
/// Timing important text:
/// ```html
/// <h1 elementtiming="page-title">Welcome to Our Website</h1>
/// ```
///
/// Timing a background image element:
/// ```html
/// <div class="banner" style="background-image:url(banner.jpg)" elementtiming="main-banner"></div>
/// ```
public struct Elementtiming: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "elementtiming"
    
    /// The identifier for the element in performance entries
    private let value: String
    
    /// Initialize with an identifier for the element
    public init(_ identifier: String) {
        self.value = identifier
    }
    
    /// Create an elementtiming value with a prefixed category for organization
    public init(category: String, name: String, separator: String = "-") {
        self.value = "\(category)\(separator)\(name)"
    }
    
    /// Common predefined timing categories for semantic naming
    public struct Category: Sendable, Equatable, ExpressibleByStringLiteral, CustomStringConvertible {
        private let value: String
        
        public init(_ value: String){
            self.value = value
        }
        
        public init(stringLiteral value: StringLiteralType) {
            self.value = value
        }
        /// Main page hero or feature element
        public static let hero: Self = "hero"
        
        /// Primary content elements
        public static let main: Self = "main"
        
        /// Header elements
        public static let header: Self = "header"
        
        /// Navigation elements
        public static let nav: Self = "nav"
        
        /// Footer elements
        public static let footer: Self = "footer"
        
        /// Image elements
        public static let image: Self = "image"
        
        /// Text content elements
        public static let text: Self = "text"
        
        /// Interactive elements
        public static let interactive: Self = "interactive"
        
        /// Layout or structural elements
        public static let layout: Self = "layout"
        
        /// Custom category
        public static let custom: Self = "custom"
        
        public var description: String { self.value }
    }
    
    /// Create an elementtiming value with a predefined category
    public init(category: Category, name: String, separator: String = "-") {
        if category == .custom {
            self.value = name
        } else {
            self.value = "\(category.description)\(separator)\(name)"
        }
    }
}

extension Elementtiming: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Elementtiming: CustomStringConvertible {
    /// Returns the string representation of the elementtiming value
    public var description: String {
        return self.value
    }
}

extension HTML {
    
    @discardableResult
    package func elementtiming(
        _ value: Elementtiming?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Elementtiming.attribute, value?.description)
    }
        
    /// Adds element timing with a categorized identifier
    @discardableResult
    package func elementtiming(
        category: Elementtiming.Category,
        name: String,
        separator: String = "-"
    ) -> _HTMLAttributes<Self> {
        self.elementtiming(Elementtiming(category: category, name: name, separator: separator))
    }
}
