///
/// Size.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that specifies the width or height of form controls.
///
/// The `size` attribute has different effects depending on the element it's used with:
/// - For `<input>` elements: Defines the width in characters (not pixels)
/// - For `<select>` elements: Defines the number of visible options in the dropdown
///
/// ## Usage Notes
///
/// - Must be a positive integer greater than zero
/// - Applies only to visual sizing, not validation constraints
/// - For `<input>`, affects width in characters, not pixels
/// - For `<select>`, determines how many options are visible without scrolling
/// - CSS properties that affect width will override this attribute
/// - Does not affect the actual number of characters that can be entered (see `maxlength` for that)
///
/// ## Element-Specific Behavior
///
/// ### For `<input>` Elements
/// - Defines the width in terms of average character width in the current font
/// - Does not limit how many characters can be entered
/// - Most useful for text-based input types
///
/// ### For `<select>` Elements
/// - Changes the height to show the specified number of options
/// - With `size="1"` (default): Displays as a dropdown
/// - With `size` > 1: Displays as a scrolling list box
/// - When combined with the `multiple` attribute, allows selecting multiple visible options
///
/// ## Examples
///
/// Input with a character width of 20:
/// ```html
/// <input type="text" size="20">
/// ```
///
/// Select showing 5 options at once:
/// ```html
/// <select size="5">
///   <option>Option 1</option>
///   <option>Option 2</option>
///   <option>Option 3</option>
///   <option>Option 4</option>
///   <option>Option 5</option>
///   <option>Option 6</option>
/// </select>
/// ```
public struct Size: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "size"
    
    /// The size value
    private let value: Int
    
    /// Initialize with a size value
    public init(_ value: Int) {
        // Ensure the value is a positive integer greater than zero
        self.value = max(1, value)
    }
    
    /// Create a size attribute for a standard text field (width for about 30 characters)
    public static let standardTextField = Size(30)
    
    /// Create a size attribute for a small text field (width for about 10 characters)
    public static let smallTextField = Size(10)
    
    /// Create a size attribute for a large text field (width for about 50 characters)
    public static let largeTextField = Size(50)
    
    /// Create a size attribute for a listbox showing multiple options (5 options visible)
    public static let standardListbox = Size(5)
}

extension Size: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = max(1, value)
    }
}

extension Size: CustomStringConvertible {
    /// Returns the string representation of the size value
    public var description: String {
        return String(self.value)
    }
}

extension HTML {
    /// Sets the size attribute on an element
    @discardableResult
    package func size(
        _ value: Size?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Size.attribute, value?.description)
    }
}
