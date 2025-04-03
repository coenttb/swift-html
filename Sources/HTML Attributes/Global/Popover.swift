///
/// Popover.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Designates an element as a popover element that appears above other page content.
///
/// The `popover` global attribute creates a popover element, which is initially hidden and appears
/// above other content in the top layer when activated. Popovers are part of the Popover API,
/// a standard way to create popup UI elements like dialogs, menus, and tooltips without needing
/// custom JavaScript implementations.
///
/// Popovers can be controlled in multiple ways:
/// - Using associated control elements with the `popovertarget` attribute
/// - Using JavaScript methods like `showPopover()`, `hidePopover()`, and `togglePopover()`
/// - Through "light dismiss" behaviors like clicking outside or pressing the Escape key
///
/// ## Popover Types
///
/// There are three types of popovers, each with different behaviors:
///
/// - **auto**: The default type. Can be "light dismissed" by clicking outside or pressing Escape.
///   Showing one auto popover will generally close other auto popovers unless they're nested.
///
/// - **manual**: Must be explicitly shown and hidden; cannot be light dismissed. Multiple manual
///   popovers can be shown simultaneously without affecting each other.
///
/// - **hint**: Do not close auto popovers when displayed, but will close other hint popovers.
///   Can be light dismissed and typically used for tooltips or contextual help.
///
/// ## Usage Notes
///
/// - Popovers appear in the top layer, above all other content
/// - They are not affected by parent elements' position or overflow styling
/// - Empty value (`popover=""`) or just `popover` is equivalent to `popover="auto"`
/// - Control elements use `popovertarget` to reference popover elements by ID
/// - Browser support for the Popover API began in 2023 and is still expanding
///
/// ## Examples
///
/// Basic auto popover with a button:
/// ```html
/// <button popovertarget="my-popover">Open Popover</button>
/// <div popover id="my-popover">Hello, I'm a popover!</div>
/// ```
///
/// Manual popover that must be explicitly controlled:
/// ```html
/// <button popovertarget="settings-popover">Settings</button>
/// <div popover="manual" id="settings-popover">
///   <h2>Settings</h2>
///   <form>
///     <!-- Settings form content -->
///     <button popovertarget="settings-popover" popovertargetaction="hide">Close</button>
///   </form>
/// </div>
/// ```
///
/// Hint popover for tooltip:
/// ```html
/// <button 
///   id="help-button" 
///   aria-describedby="help-popover"
///   onmouseover="document.getElementById('help-popover').showPopover()"
///   onmouseout="document.getElementById('help-popover').hidePopover()">
///   ?
/// </button>
/// <div popover="hint" id="help-popover">Click this button for help</div>
/// ```
public enum Popover: Attribute {
    /// Auto popover that can be light dismissed and will close other auto popovers
    case auto
    
    /// Manual popover that cannot be light dismissed and won't close other popovers
    case manual
    
    /// Hint popover that can be light dismissed but won't close auto popovers
    case hint
    
    /// The name of the HTML attribute
    public static let attribute: String = "popover"
}

extension Popover: CustomStringConvertible {
    /// Returns the string representation of the popover value
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .manual:
            return "manual"
        case .hint:
            return "hint"
        }
    }
}

extension HTML {
    /// Sets the popover attribute as a boolean (equivalent to popover="auto")
    @discardableResult
    public func popover() -> _HTMLAttributes<Self> {
        self.attribute(Popover.attribute, "")
    }
    
    /// Sets the popover attribute with a specific type
    @discardableResult
    public func popover(
        _ type: Popover
    ) -> _HTMLAttributes<Self> {
        self.attribute(Popover.attribute, type.description)
    }
    
    /// Sets the popover attribute with a value
    @discardableResult
    public func popover(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Popover.attribute, value)
    }
}

/// The popovertarget attribute that associates a control element with a popover
public struct PopoverTarget: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "popovertarget"
    
    /// The ID of the target popover element
    private let value: String
    
    /// Initialize with the ID of the target popover element
    public init(_ value: String) {
        self.value = value
    }
}

extension PopoverTarget: CustomStringConvertible {
    /// Returns the string representation of the popovertarget value
    public var description: String {
        return self.value
    }
}

extension PopoverTarget: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension HTML {
    /// Sets the popovertarget attribute with the ID of the target popover
    @discardableResult
    public func popovertarget(
        _ id: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTarget.attribute, id)
    }
    
    /// Sets the popovertarget attribute using a PopoverTarget struct
    @discardableResult
    public func popovertarget(
        _ attribute: PopoverTarget
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTarget.attribute, attribute.description)
    }
}

/// The popovertargetaction attribute that defines the action for a control element
public enum PopoverTargetAction: Attribute {
    /// Toggle the popover between shown and hidden
    case toggle
    
    /// Show the popover
    case show
    
    /// Hide the popover
    case hide
    
    /// The name of the HTML attribute
    public static let attribute: String = "popovertargetaction"
}

extension PopoverTargetAction: CustomStringConvertible {
    /// Returns the string representation of the popovertargetaction value
    public var description: String {
        switch self {
        case .toggle:
            return "toggle"
        case .show:
            return "show"
        case .hide:
            return "hide"
        }
    }
}

extension HTML {
    /// Sets the popovertargetaction attribute with an action
    @discardableResult
    public func popovertargetaction(
        _ action: PopoverTargetAction
    ) -> _HTMLAttributes<Self> {
        self.attribute(PopoverTargetAction.attribute, action.description)
    }
}
