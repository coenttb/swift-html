///
/// For.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// An attribute that establishes a relationship between elements.
///
/// The `for` attribute has two distinct uses depending on the element it's applied to:
///
/// 1. When used on a `<label>` element, it associates the label with a form control by referencing the control's `id`.
/// 2. When used on an `<output>` element, it lists the IDs of elements that contributed to the calculation or determination of the output's value.
///
/// ## Usage Notes
///
/// ### With `<label>` elements
///
/// - The value should be a single ID matching a form control
/// - Creates an explicit association between the label and the form control
/// - Clicking the label gives focus to the associated form control
/// - Important for accessibility and usability of forms
/// - Alternative to wrapping the form control inside the label element
///
/// ### With `<output>` elements
///
/// - The value should be a space-separated list of IDs
/// - Identifies which form elements contributed to the calculated result
/// - Useful for establishing relationships for accessibility tools
/// - Helps screen readers explain where the output value comes from
///
/// ## Examples
///
/// Associate a label with an input:
/// ```html
/// <label for="email">Email Address:</label>
/// <input type="email" id="email" name="email">
/// ```
///
/// Define input sources for an output:
/// ```html
/// <input type="number" id="a" value="10">
/// <input type="number" id="b" value="20">
/// <output for="a b">30</output>
/// ```
public struct For: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "for"
    
    /// The value of the for attribute (ID or space-separated list of IDs)
    private let value: String
    
    /// Initialize with an ID or space-separated list of IDs
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiple IDs for an output element
    public init(_ ids: [String]) {
        self.value = ids.joined(separator: " ")
    }
    
    /// Initialize with multiple IDs as variadic parameters for an output element
    public init(_ ids: String...) {
        self.value = ids.joined(separator: " ")
    }
    
    /// Initialize for a label element with a single control ID
    public static func label(_ controlId: String) -> For {
        return For(controlId)
    }
    
    /// Initialize for an output element with source element IDs
    public static func output(_ sourceIds: String...) -> For {
        return For(sourceIds)
    }
    
    /// Initialize for an output element with source element IDs
    public static func output(_ sourceIds: [String]) -> For {
        return For(sourceIds)
    }
}

extension For: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension For: CustomStringConvertible {
    /// Returns the string representation of the for value
    public var description: String {
        return self.value
    }
}
