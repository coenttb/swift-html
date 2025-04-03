///
/// Spellcheck.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Controls whether spell checking is enabled for an element.
///
/// The `spellcheck` global attribute is an enumerated attribute that defines whether an element's
/// content should be checked for spelling errors. It serves as a hint to the browser, which may
/// or may not perform spell checking based on various factors, including the element's type,
/// editability, and browser capabilities.
///
/// When enabled, browsers typically highlight misspelled words in editable content areas,
/// providing visual feedback and sometimes offering suggested corrections. This behavior
/// is particularly relevant for form controls like text inputs and textareas, as well as
/// elements with the `contenteditable` attribute set to true.
///
/// ## Usage Notes
///
/// - Applies primarily to editable elements (inputs, textareas, contenteditable elements)
/// - Is a hint, not a command—browsers are not required to implement spell checking
/// - Default behavior varies by browser and element type if not explicitly specified
/// - Inherits the spellcheck state from the nearest ancestor if not set
/// - Non-editable elements generally don't show spelling errors even if spellcheck is true
///
/// ## Security and Privacy Considerations
///
/// The HTML specification does not regulate how spell checking is implemented. Some
/// implementations may send content to remote servers for checking, which could lead to
/// data leakage. Consider setting `spellcheck="false"` for elements that might contain
/// sensitive information like passwords, personal data, or confidential text.
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <textarea spellcheck="true">This text will be checked for spelling errors.</textarea>
/// <textarea spellcheck="false">This text will not be checked for spelling errors.</textarea>
/// ```
///
/// With contenteditable:
/// ```html
/// <div contenteditable="true" spellcheck="true">
///   Editable content with spell checking enabled.
/// </div>
/// ```
///
/// For form inputs:
/// ```html
/// <label for="comments">Comments:</label>
/// <input type="text" id="comments" name="comments" spellcheck="true">
///
/// <label for="password">Password:</label>
/// <input type="password" id="password" name="password" spellcheck="false">
/// ```
public enum Spellcheck: Attribute {
    /// Enable spell checking
    case `true`
    
    /// Disable spell checking
    case `false`
    
    /// The name of the HTML attribute
    public static let attribute: String = "spellcheck"
}

extension Spellcheck: CustomStringConvertible {
    /// Returns the string representation of the spellcheck value
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
    /// Sets the spellcheck attribute with a boolean value
    @discardableResult
    public func spellcheck(
        _ value: Bool
    ) -> _HTMLAttributes<Self> {
        self.attribute(Spellcheck.attribute, value ? "true" : "false")
    }
    
    /// Sets the spellcheck attribute using a Spellcheck enum value
    @discardableResult
    public func spellcheck(
        _ attribute: Spellcheck
    ) -> _HTMLAttributes<Self> {
        self.attribute(Spellcheck.attribute, attribute.description)
    }
}
