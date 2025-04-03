///
/// Itemtype.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Specifies the vocabulary URL for microdata items.
///
/// The `itemtype` global attribute specifies the URL of the vocabulary that defines the
/// properties (`itemprop`) in a microdata structure. It works in conjunction with the
/// `itemscope` attribute, which establishes the scope of the item. Common vocabularies
/// include schema.org, which is supported by major search engines.
///
/// The value of this attribute must be one or more valid absolute URLs that point to
/// vocabularies defining item types. Multiple URLs must use the same vocabulary and
/// should be separated by spaces.
///
/// ## Usage Notes
///
/// - Can only be used on elements that have the `itemscope` attribute
/// - Defines the vocabulary (e.g., schema.org) for the item's properties
/// - The value must be one or more valid absolute URLs
/// - Multiple URLs must all point to the same vocabulary
/// - Commonly used vocabularies include schema.org types like Person, Event, Product, etc.
/// - Elements with both `itemscope` and `itemtype` may also have `itemid` for global identification
///
/// ## Examples
///
/// Basic usage for a person:
/// ```html
/// <div itemscope itemtype="https://schema.org/Person">
///   <span itemprop="name">Jane Doe</span>
///   <span itemprop="jobTitle">Professor</span>
///   <a href="mailto:jane@example.com" itemprop="email">jane@example.com</a>
/// </div>
/// ```
///
/// Multiple item types (though this is rare):
/// ```html
/// <div itemscope itemtype="https://schema.org/Person https://schema.org/Teacher">
///   <span itemprop="name">Jane Doe</span>
///   <span itemprop="jobTitle">Professor</span>
/// </div>
/// ```
///
/// Nested items with different types:
/// ```html
/// <div itemscope itemtype="https://schema.org/Product">
///   <span itemprop="name">Smartphone X</span>
///   <span itemprop="description">The latest smartphone with amazing features.</span>
///   
///   <div itemprop="offers" itemscope itemtype="https://schema.org/Offer">
///     <span itemprop="price">599.99</span>
///     <meta itemprop="priceCurrency" content="USD" />
///     <link itemprop="availability" href="https://schema.org/InStock" />
///   </div>
///   
///   <div itemprop="review" itemscope itemtype="https://schema.org/Review">
///     <span itemprop="reviewRating" itemscope itemtype="https://schema.org/Rating">
///       <meta itemprop="ratingValue" content="4.5" />
///     </span>
///     <span itemprop="author" itemscope itemtype="https://schema.org/Person">
///       <span itemprop="name">John Smith</span>
///     </span>
///   </div>
/// </div>
/// ```
public struct Itemtype: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "itemtype"
    
    /// The URL or space-separated list of URLs defining the vocabulary
    private let value: String
    
    /// Initialize with a single vocabulary URL
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiple vocabulary URLs
    public init(_ values: [String]) {
        self.value = values.joined(separator: " ")
    }
    
    /// Initialize with multiple vocabulary URLs as variadic parameters
    public init(_ values: String...) {
        self.value = values.joined(separator: " ")
    }
    
    /// Initialize with a schema.org type
    public init(schemaOrg type: String) {
        self.value = "https://schema.org/\(type)"
    }
}

extension Itemtype: CustomStringConvertible {
    /// Returns the string representation of the itemtype value
    public var description: String {
        return self.value
    }
}

extension Itemtype: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension HTML {
    /// Sets the itemtype attribute with a vocabulary URL
    @discardableResult
    public func itemtype(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemtype.attribute, value)
    }
    
    /// Sets the itemtype attribute with multiple vocabulary URLs
    @discardableResult
    public func itemtype(
        _ values: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemtype.attribute, values.joined(separator: " "))
    }
    
    /// Sets the itemtype attribute with multiple vocabulary URLs as variadic parameters
    @discardableResult
    public func itemtype(
        _ values: String...
    ) -> _HTMLAttributes<Self> {
        self.itemtype(values)
    }
    
    /// Sets the itemtype attribute using an Itemtype struct
    @discardableResult
    public func itemtype(
        _ attribute: Itemtype
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemtype.attribute, attribute.description)
    }
    
    /// Sets the itemtype attribute with a schema.org type
    @discardableResult
    public func itemtype(
        schemaOrg type: String
    ) -> _HTMLAttributes<Self> {
        self.itemtype(Itemtype(schemaOrg: type))
    }
}
