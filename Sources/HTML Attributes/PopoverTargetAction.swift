///
/// PopoverTargetAction.swift
/// swift-html
///
/// Created by Claude on 04/09/2025.
///

import Foundation

/// Specifies the action to be performed on a popover element being controlled by a button.
///
/// The `popovertargetaction` attribute defines how a button interacts with its target popover.
/// When omitted, the default action is `toggle`.
///
/// ## Usage Notes
///
/// - Must be used with the `popovertarget` attribute
/// - Determines whether the button shows, hides, or toggles the popover
///
/// ## Example
///
/// ```html
/// <button popovertarget="my-popover" popovertargetaction="show">Show Popover</button>
/// <button popovertarget="my-popover" popovertargetaction="hide">Hide Popover</button>
/// <div id="my-popover" popover>Popover content</div>
/// ```
public struct PopoverTargetAction: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "popovertargetaction"
    
    /// The action to perform on the popover
    private let value: String
    
    /// Initialize with a popover action
    public init(_ value: String) {
        self.value = value
    }
    
    public static let show: Self = "show"
    public static let hide: Self = "hide"
    public static let toggle: Self = "toggle"

}

extension PopoverTargetAction: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}

extension PopoverTargetAction: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.value = value
    }
}
