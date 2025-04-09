///
/// PopoverTarget.swift
/// swift-html
///
/// Created by Claude on 04/09/2025.
///

import Foundation

/// Specifies the ID of a popover element to be controlled by a button.
///
/// The `popovertarget` attribute turns a button element into a popover control button.
/// When specified, it creates an implicit accessibility relationship between the button
/// and popover, and enables convenient positioning using CSS anchor positioning.
///
/// ## Usage Notes
///
/// - Use this with the `popovertargetaction` attribute to control how the button interacts with the popover
/// - The value should be the ID of the popover element to control
///
/// ## Example
///
/// ```html
/// <button popovertarget="my-popover">Toggle Popover</button>
/// <div id="my-popover" popover>Popover content</div>
/// ```
public struct PopoverTarget: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "popovertarget"
    
    /// The ID of the popover element to control
    private let value: String
    
    /// Initialize with a popover element ID
    public init(_ value: String) {
        self.value = value
    }
}

extension PopoverTarget: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension PopoverTarget: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}
