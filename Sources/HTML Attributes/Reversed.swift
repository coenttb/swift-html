///
/// Reversed.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents the HTML `reversed` attribute, which specifies that the items of a list are in reverse order.
///
/// This Boolean attribute is used with the `<ol>` element to display list items in descending order
/// (from high to low).
///
/// ## Examples
///
/// ```html
/// <ol reversed>
///   <li>This will be item #3</li>
///   <li>This will be item #2</li>
///   <li>This will be item #1</li>
/// </ol>
/// ```
public struct Reversed: BooleanAttribute {
    /// The name of the HTML attribute
    public static let attribute: String = "reversed"
    
    /// The attribute value
    public var value: Bool
  
    /// Initialize with a boolean value
    public init(value: Bool = true) {
        self.value = value
    }
}

