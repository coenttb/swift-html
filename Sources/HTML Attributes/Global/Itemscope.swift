///
/// Itemscope.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Defines the scope of associated microdata items.
///
/// The `itemscope` global attribute is a boolean attribute that creates a new item in microdata,
/// establishing a group of name-value pairs associated with the element. This attribute is the
/// foundation of HTML microdata, which allows embedding machine-readable data within HTML documents.
///
/// When an element has an `itemscope` attribute, it creates a new item that can have properties
/// (defined by `itemprop` attributes) either on the element itself or on its descendants.
/// The `itemscope` attribute is typically used with `itemtype` to specify the vocabulary being used.
///
/// ## Usage Notes
///
/// - Can be applied to any HTML element
/// - Creates a new item in microdata when specified
/// - Usually paired with `itemtype` to define the vocabulary (e.g., schema.org)
/// - An element with `itemscope` that doesn't have an `itemtype` should have an `itemref`
/// - Often used with `id` to allow other items to reference this item
/// - Cannot have a value; it's a boolean attribute that is either present or not
///
/// ## Examples
///
/// Basic usage for a movie:
/// ```html
/// <div itemscope itemtype="https://schema.org/Movie">
///   <h1 itemprop="name">Avatar</h1>
///   <span itemprop="director">James Cameron</span>
///   <span itemprop="genre">Science Fiction</span>
///   <a href="https://youtu.be/trailer" itemprop="trailer">Watch Trailer</a>
/// </div>
/// ```
///
/// Nested items:
/// ```html
/// <div itemscope itemtype="https://schema.org/Person">
///   <span itemprop="name">Jane Doe</span>
///   <div itemprop="address" itemscope itemtype="https://schema.org/PostalAddress">
///     <span itemprop="streetAddress">123 Main St</span>
///     <span itemprop="addressLocality">Any Town</span>
///     <span itemprop="addressRegion">CA</span>
///   </div>
/// </div>
/// ```
///
/// Complex structure with multiple itemscope elements:
/// ```html
/// <div itemscope itemtype="https://schema.org/Recipe">
///   <h2 itemprop="name">Chocolate Cake</h2>
///   <span itemprop="description">A delicious chocolate cake recipe</span>
///   
///   <div itemprop="author" itemscope itemtype="https://schema.org/Person">
///     <span itemprop="name">Julia Child</span>
///   </div>
///   
///   <div itemprop="nutrition" itemscope itemtype="https://schema.org/NutritionInformation">
///     <span itemprop="calories">350 calories</span>
///   </div>
/// </div>
/// ```
public enum Itemscope: Attribute {
    /// A case representing the presence of the itemscope attribute
    case empty
    
    /// The name of the HTML attribute
    public static let attribute: String = "itemscope"
}

extension Itemscope: CustomStringConvertible {
    /// Returns an empty string, as itemscope is a boolean attribute
    public var description: String {
        return ""
    }
}

extension HTML {
    /// Sets the itemscope attribute, creating a new microdata item
    @discardableResult
    public func itemscope() -> _HTMLAttributes<Self> {
        self.attribute(Itemscope.attribute, "")
    }
    
    /// Sets the itemscope attribute using an Itemscope enum value
    @discardableResult
    public func itemscope(
        _ attribute: Itemscope
    ) -> _HTMLAttributes<Self> {
        self.attribute(Itemscope.attribute, attribute.description)
    }
}
