///
/// Virtualkeyboardpolicy.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Controls virtual keyboard behavior for editable elements on touch devices.
///
/// The `virtualkeyboardpolicy` global attribute is an enumerated attribute that controls how the
/// on-screen virtual keyboard behaves when an editable element receives focus or is tapped on
/// devices without physical keyboards (like tablets and smartphones).
///
/// This attribute can be applied to any editable element, including `<input>`, `<textarea>`, and
/// elements with the `contenteditable` attribute.
///
/// ## Values
///
/// - **auto** (or empty string): The virtual keyboard automatically appears when the element
///   receives focus or is tapped. This is the default behavior.
///
/// - **manual**: Decouples the element's focus and tap events from the virtual keyboard's state.
///   The keyboard will not automatically appear, giving developers more control over keyboard
///   display through JavaScript.
///
/// ## Usage Notes
///
/// - This is an experimental technology with limited browser support
/// - Primarily useful for custom input experiences on touch devices
/// - When set to "manual", developers must programmatically show the keyboard
/// - Can help create custom inputs where keyboard appearance is controlled by specific user actions
/// - Only relevant on devices with virtual keyboards
///
/// ## Browser Support
///
/// As of 2024, support for this attribute is limited. Chrome and Chrome-based browsers (Edge, Opera)
/// have implemented it, but support in other browsers may be inconsistent. Always test thoroughly
/// across devices and provide fallbacks.
///
/// ## Examples
///
/// Automatic keyboard behavior (default):
/// ```html
/// <input type="text" virtualkeyboardpolicy="auto" placeholder="Keyboard appears on focus">
/// ```
///
/// Manual keyboard control:
/// ```html
/// <textarea virtualkeyboardpolicy="manual" placeholder="Keyboard won't appear automatically"></textarea>
/// ```
///
/// With contenteditable:
/// ```html
/// <div contenteditable="true" virtualkeyboardpolicy="manual">
///   Editable content without automatic keyboard.
/// </div>
/// ```
///
/// Usage with JavaScript to manually control the keyboard:
/// ```html
/// <input 
///   id="custom-input" 
///   type="text" 
///   virtualkeyboardpolicy="manual"
///   placeholder="Click the button to show keyboard"
/// >
/// <button onclick="document.getElementById('custom-input').focus(); navigator.virtualKeyboard.show();">
///   Show Keyboard
/// </button>
/// ```
public enum Virtualkeyboardpolicy: Attribute {
    /// Automatically shows the virtual keyboard when element is focused or tapped
    case auto
    
    /// Decouples focus and tap on the element from the virtual keyboard's state
    case manual
    
    /// The name of the HTML attribute
    public static let attribute: String = "virtualkeyboardpolicy"
}

extension Virtualkeyboardpolicy: CustomStringConvertible {
    /// Returns the string representation of the virtualkeyboardpolicy value
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .manual:
            return "manual"
        }
    }
}

extension HTML {
    /// Sets the virtualkeyboardpolicy attribute with a policy value
    @discardableResult
    public func virtualkeyboardpolicy(
        _ policy: Virtualkeyboardpolicy
    ) -> _HTMLAttributes<Self> {
        self.attribute(Virtualkeyboardpolicy.attribute, policy.description)
    }
    
    /// Sets the virtualkeyboardpolicy attribute to auto
    @discardableResult
    public func autoKeyboard() -> _HTMLAttributes<Self> {
        self.virtualkeyboardpolicy(.auto)
    }
    
    /// Sets the virtualkeyboardpolicy attribute to manual
    @discardableResult
    public func manualKeyboard() -> _HTMLAttributes<Self> {
        self.virtualkeyboardpolicy(.manual)
    }
}
