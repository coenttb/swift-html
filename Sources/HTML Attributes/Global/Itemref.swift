///
/// Itemref.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// References elements that are not direct descendants of an item in microdata.
///
/// The `itemref` global attribute identifies elements that are not direct descendants of an item 
/// but still contain properties of that item. This allows microdata properties to be organized
/// flexibly throughout the document, regardless of DOM structure.
///
/// This attribute is used in conjunction with `itemscope` and specifies a list of IDs (without the
/// '#' prefix) of elements to be included in the item. The referenced elements can be located
/// anywhere in the document.
///
/// ## Usage Notes
///
/// - Only used on elements with the `itemscope` attribute
/// - Contains a space-separated list of element IDs
/// - The referenced elements provide additional properties for the item but are not themselves 
///   considered part of the item node
/// - Particularly useful for complex layouts where properties may be scattered throughout the document
/// - Can create circular references (items referencing each other), though parsers must handle this correctly
///
/// ## Examples
///
/// Basic usage with scattered properties:
/// ```html
/// <div id="amanda" itemscope>
///   <p>Name: <span itemprop="name">Amanda</span></p>
///   <p>Age: <span itemprop="age">28</span></p>
/// </div>
///
/// <div id="band" itemscope itemref="amanda">
///   <p>Band: <span itemprop="bandname">Jazz Band</span></p>
///   <p>Size: <span itemprop="size">12</span> players</p>
///   <!-- Amanda's properties (name, age) are also part of this item -->
/// </div>
/// ```
///
/// Multiple references:
/// ```html
/// <div id="name">
///   <p>Name: <span itemprop="name">Amanda</span></p>
/// </div>
///
/// <div id="details">
///   <p>Age: <span itemprop="age">28</span></p>
/// </div>
///
/// <div itemscope itemref="name details">
///   <p>Profession: <span itemprop="profession">Web Developer</span></p>
///   <!-- Both name and age properties are included in this item -->
/// </div>
/// ```
///
/// Nested items with references:
/// ```html
/// <div id="contact">
///   <p>Email: <span itemprop="email">amanda@example.com</span></p>
/// </div>
///
/// <div itemscope itemtype="https://schema.org/Person" itemref="contact">
///   <p>Name: <span itemprop="name">Amanda</span></p>
///   <div itemprop="address" itemscope>
///     <p>City: <span itemprop="addressLocality">San Francisco</span></p>
///   </div>
///   <!-- Email from the referenced element is also included -->
/// </div>
/// ```
public struct Itemref: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "itemref"
    
    /// The space-separated list of element IDs
    private let value: String
    
    /// Initialize with a single element ID
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiple element IDs
    public init(_ values: [String]) {
        self.value = values.joined(separator: " ")
    }
    
    /// Initialize with multiple element IDs as variadic parameters
    public init(_ values: String...) {
        self.value = values.joined(separator: " ")
    }
}

extension Itemref: CustomStringConvertible {
    /// Returns the string representation of the itemref value
    public var description: String {
        return self.value
    }
}

extension Itemref: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}
