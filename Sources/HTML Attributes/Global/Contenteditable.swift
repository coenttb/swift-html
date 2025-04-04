///
/// Contenteditable.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// A global attribute that indicates whether the element's content is editable by the user.
///
/// The `contenteditable` attribute is an enumerated attribute that specifies if the element can
/// be edited directly by the user. When enabled, the browser provides a way for users to edit
/// the content within the element.
///
/// ## Usage Notes
///
/// - Can be applied to any HTML element
/// - When enabled, the element becomes interactive and can receive focus
/// - Nested editable elements don't automatically participate in tab navigation (use `tabindex="0"` to enable)
/// - If not specified or value is invalid, the value is inherited from the parent element
/// - You can customize the text insertion caret color with the CSS `caret-color` property
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <div contenteditable="true">This content can be edited by users.</div>
/// ```
///
/// Using plaintext-only mode (no rich formatting):
/// ```html
/// <div contenteditable="plaintext-only">Edit this text (formatting will be stripped).</div>
/// ```
///
/// With no value (equivalent to "true"):
/// ```html
/// <blockquote contenteditable>Edit this quote.</blockquote>
/// ```
///
/// Explicitly disabling editability:
/// ```html
/// <div contenteditable="false">This content cannot be edited directly.</div>
/// ```
public enum Contenteditable: String, Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "contenteditable"
    
    /// Element is editable (with rich formatting preserved when pasting)
    ///
    /// Example:
    /// ```html
    /// <div contenteditable="true">Editable content</div>
    /// ```
    case `true` = "true"
    
    /// Element is editable - equivalent to true (with rich formatting preserved when pasting)
    ///
    /// Example:
    /// ```html
    /// <div contenteditable>Editable content</div>
    /// ```
    case empty = ""
    
    /// Element is not editable
    ///
    /// Example:
    /// ```html
    /// <div contenteditable="false">Non-editable content</div>
    /// ```
    case `false` = "false"
    
    /// Element is editable but only as plain text (formatting is removed when pasting)
    ///
    /// Example:
    /// ```html
    /// <div contenteditable="plaintext-only">Plain text editing only</div>
    /// ```
    case plaintextOnly = "plaintext-only"
}

extension Contenteditable {
    /// Returns the string representation of the contenteditable value
    public var description: String {
        return self.rawValue
    }
}
