///
/// Writingsuggestions.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Controls browser-provided writing suggestions in editable elements.
///
/// The `writingsuggestions` global attribute is an enumerated attribute that controls whether
/// browser-provided writing suggestions are enabled for an element. These suggestions typically
/// appear as greyed-out text after the cursor that completes the user's sentence or word
/// as they type in editable fields.
///
/// While writing suggestions can be helpful to users, developers might want to disable them
/// in certain scenarios, such as when implementing custom autocomplete features or when
/// the suggestions might interfere with specialized input fields.
///
/// ## Usage Notes
///
/// - Can be applied to editable elements like `<input>` and `<textarea>`
/// - Can also be applied to container elements to control suggestions for all editable elements within
/// - Writing suggestions are enabled by default in supporting browsers
/// - This attribute has limited browser support (primarily Safari as of 2024)
/// - Use this attribute when browser suggestions might conflict with custom suggestions
///
/// ## Values
///
/// - **true** (or empty attribute): Enables browser-provided writing suggestions
/// - **false**: Disables browser-provided writing suggestions
///
/// ## Examples
///
/// Disabling writing suggestions on an input:
/// ```html
/// <input type="text" writingsuggestions="false" placeholder="No browser suggestions here">
/// ```
///
/// Enabling writing suggestions explicitly:
/// ```html
/// <textarea writingsuggestions="true">Browser suggestions are enabled</textarea>
/// ```
///
/// Applied to a form section:
/// ```html
/// <form writingsuggestions="false">
///   <input type="text" name="code" placeholder="Enter code">
///   <textarea name="technical-details">Technical details here</textarea>
/// </form>
/// ```
///
/// Mixed usage on a page:
/// ```html
/// <div>
///   <input type="text" placeholder="Default suggestions enabled">
///   <input type="text" writingsuggestions="false" placeholder="Suggestions disabled">
/// </div>
/// ```
public enum Writingsuggestions: Attribute {
    /// Enables browser-provided writing suggestions
    case `true`
    
    /// Disables browser-provided writing suggestions
    case `false`
    
    /// The name of the HTML attribute
    public static let attribute: String = "writingsuggestions"
}

extension Writingsuggestions: CustomStringConvertible {
    /// Returns the string representation of the writingsuggestions value
    public var description: String {
        switch self {
        case .true:
            return "true"
        case .false:
            return "false"
        }
    }
}

extension HTML {
    /// Sets the writingsuggestions attribute with a boolean value
    @discardableResult
    public func writingsuggestions(
        _ enabled: Bool
    ) -> _HTMLAttributes<Self> {
        self.attribute(Writingsuggestions.attribute, enabled ? "true" : "false")
    }
    
    /// Sets the writingsuggestions attribute using a Writingsuggestions enum value
    @discardableResult
    public func writingsuggestions(
        _ attribute: Writingsuggestions
    ) -> _HTMLAttributes<Self> {
        self.attribute(Writingsuggestions.attribute, attribute.description)
    }
    
    /// Enables browser-provided writing suggestions
    @discardableResult
    public func enableWritingSuggestions() -> _HTMLAttributes<Self> {
        self.writingsuggestions(Writingsuggestions.true)
    }
    
    /// Disables browser-provided writing suggestions
    @discardableResult
    public func disableWritingSuggestions() -> _HTMLAttributes<Self> {
        self.writingsuggestions(Writingsuggestions.false)
    }
}
