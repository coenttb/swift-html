///
/// Multiple.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// A Boolean attribute that enables selection of multiple values in form controls.
///
/// The `multiple` attribute, when present, indicates that a form control allows the user
/// to select multiple values. Its behavior varies depending on the element it's applied to.
///
/// ## Usage Notes
///
/// This attribute is valid on:
///
/// ### `<select>` Elements
/// - Enables selection of multiple options
/// - Browser typically displays as a scrolling list box rather than a dropdown
/// - Users can select multiple options using platform-specific methods:
///   - Ctrl/Command/Shift + click (mouse users)
///   - Keyboard selection varies by browser
///
/// ### `<input type="file">` Elements
/// - Enables selection of multiple files
/// - File picker allows selection of multiple files using platform methods
/// - Without this attribute, only one file can be selected
///
/// ### `<input type="email">` Elements
/// - Allows entry of multiple comma-separated email addresses
/// - Browser validation will accept comma-separated addresses when present
/// - Without this attribute, a single email address is expected
///
/// ## Accessibility Considerations
///
/// - Provide clear instructions on how to select multiple items
/// - For email inputs, inform users to separate addresses with commas
/// - For select elements, inform users that multiple selections are possible
/// - Avoid setting `size="1"` on multiple selects as it harms usability
///
/// ## Examples
///
/// Multiple file selection:
/// ```html
/// <input type="file" multiple>
/// ```
///
/// Multiple email addresses:
/// ```html
/// <input type="email" multiple>
/// ```
///
/// Multiple select options:
/// ```html
/// <select multiple>
///   <option>Option 1</option>
///   <option>Option 2</option>
///   <option>Option 3</option>
/// </select>
/// ```
public struct Multiple: Attribute, ExpressibleByBooleanLiteral {
    fileprivate let value: Bool
    
    public init(booleanLiteral value: BooleanLiteralType) {
        self.value = value
    }
    
    /// The name of the HTML attribute
    public static let attribute: String = "multiple"
}
