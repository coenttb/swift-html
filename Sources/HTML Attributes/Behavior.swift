///
/// Behavior.swift
/// swift-html
///
/// Created by Claude on 09/04/2025.
///

import Foundation

/// Defines how text is scrolled within a marquee element.
///
/// ## Usage Notes
///
/// - Used with the `<marquee>` element to control scrolling behavior
/// - Possible values: `scroll`, `slide`, and `alternate`
/// - Default value if not specified is `scroll`
///
/// ## Examples
///
/// ```html
/// <marquee behavior="alternate">Bouncing text</marquee>
/// ```
public struct Behavior: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "behavior"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a behavior value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Preset for scrolling behavior (default)
    /// Text scrolls in, then jumps back to the start and scrolls in again
    public static let scroll: Self = Self("scroll")
    
    /// Preset for sliding behavior
    /// Text scrolls in and stops at the edge of the marquee
    public static let slide: Self = Self("slide")
    
    /// Preset for alternate behavior
    /// Text bounces back and forth between the two edges of the marquee
    public static let alternate: Self = Self("alternate")
}

extension Behavior: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Behavior: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}