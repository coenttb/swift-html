///
/// Direction.swift
/// swift-html
///
/// Created by Claude on 09/04/2025.
///

import Foundation

/// Defines the direction of scrolling within a marquee element.
///
/// ## Usage Notes
///
/// - Used with the `<marquee>` element to control scrolling direction
/// - Possible values: `left`, `right`, `up`, and `down`
/// - Default value if not specified is `left`
///
/// ## Examples
///
/// ```html
/// <marquee direction="up">Text scrolls upward</marquee>
/// ```
public struct Direction: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "direction"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a direction value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Preset for left-to-right scrolling (default)
    public static let left: Self = Self("left")
    
    /// Preset for right-to-left scrolling
    public static let right: Self = Self("right")
    
    /// Preset for bottom-to-top scrolling
    public static let up: Self = Self("up")
    
    /// Preset for top-to-bottom scrolling
    public static let down: Self = Self("down")
}

extension Direction: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Direction: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}