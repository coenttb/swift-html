///
/// Itemid.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Provides a unique, global identifier for an item in microdata.
///
/// The `itemid` global attribute is part of the HTML Microdata specification and provides
/// a unique global identifier for an item. This identifier allows search engines and other
/// parsers to recognize and process structured data within HTML documents.
///
/// Microdata is a way to embed machine-readable data in HTML documents. It's primarily used
/// for search engine optimization and to enable rich snippets in search results.
///
/// ## Usage Notes
///
/// - Can only be used on elements that have both `itemscope` and `itemtype` attributes
/// - Only relevant when the `itemtype` refers to a vocabulary that supports global identifiers
/// - The value should be a URL or URN (though the spec technically requires a URL)
/// - Commonly used with schema.org vocabularies for structured data
///
/// ## Examples
///
/// Basic usage for a book:
/// ```html
/// <div itemscope
///      itemtype="https://schema.org/Book"
///      itemid="urn:isbn:978-0374228484">
///   <h1 itemprop="name">Owls of the Eastern Ice</h1>
///   <p>By <span itemprop="author">Jonathan C. Slaght</span></p>
///   <meta itemprop="datePublished" content="2020-08-04"/>
/// </div>
/// ```
///
/// Product example:
/// ```html
/// <div itemscope
///      itemtype="https://schema.org/Product"
///      itemid="https://example.com/products/123">
///   <h2 itemprop="name">Smartphone X</h2>
///   <img itemprop="image" src="smartphone-x.jpg" alt="Smartphone X"/>
///   <div itemprop="description">Latest smartphone with amazing features.</div>
///   <div itemprop="offers" itemscope itemtype="https://schema.org/Offer">
///     <meta itemprop="priceCurrency" content="USD"/>
///     <meta itemprop="price" content="599.99"/>
///   </div>
/// </div>
/// ```
public struct Itemid: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "itemid"
    
    /// The global identifier value (URL or URN)
    private let value: String
    
    /// Initialize with a global identifier
    public init(_ value: String) {
        self.value = value
    }
}

extension Itemid: CustomStringConvertible {
    /// Returns the string representation of the itemid value
    public var description: String {
        return self.value
    }
}

extension Itemid: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}


extension HTML {
    /// Sets the itemid attribute with a global identifier
    @discardableResult
    public func itemid(
        _ identifier: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemid.attribute, Itemid.init(identifier).description)
    }
    
    /// Sets the itemid attribute using an Itemid struct
    @discardableResult
    public func itemid(
        _ value: Itemid
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemid.attribute, value.description)
    }
}
