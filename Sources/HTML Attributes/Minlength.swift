///
/// Minlength.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// An attribute that specifies the minimum number of characters required in a text input.
///
/// The `minlength` attribute defines the minimum number of characters (technically UTF-16 code units)
/// that a user is required to enter into an `<input>` or `<textarea>` element for the input to be
/// considered valid.
///
/// ## Usage Notes
///
/// - Valid on `<input>` (with text-based types) and `<textarea>` elements
/// - Value must be a non-negative integer (0 or greater)
/// - Measured in UTF-16 code units (equivalent to character count for most scripts)
/// - If specified, must be less than or equal to `maxlength` (if present)
/// - Does not imply the field is required - an empty value is still valid even with minlength
/// - Only validates when the user has entered a non-empty value
///
/// ## Validation
///
/// If the text value is non-empty and shorter than the minlength:
/// - The field will fail constraint validation
/// - The `ValidityState.tooShort` property will be `true`
/// - The element will match the `:invalid` CSS pseudo-class
/// - Most browsers will display an error message on submission
///
/// Note that validation only occurs when the value is changed by the user, not programmatically.
///
/// ## Examples
///
/// Require at least 5 characters in a text input:
/// ```html
/// <input type="text" minlength="5">
/// ```
///
/// Set both minimum and maximum length for user comments:
/// ```html
/// <textarea minlength="10" maxlength="500"></textarea>
/// ```
///
/// Required field with minimum length:
/// ```html
/// <input type="text" minlength="3" required>
/// ```
public struct Minlength: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "minlength"
    
    /// The minimum length value
    private let value: Int
    
    /// Initialize with a minimum length value
    public init(_ value: Int) {
        // Ensure value is non-negative
        self.value = max(0, value)
    }
    
    /// Create a minlength attribute with the given number of characters 
    public static func characters(_ count: Int) -> Minlength {
        return Minlength(count)
    }
    
    /// Minimum length of zero (effectively no minimum)
    public static let none = Minlength(0)
}

extension Minlength: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = max(0, value)
    }
}

extension Minlength: CustomStringConvertible {
    /// Returns the string representation of the minlength value
    public var description: String {
        return String(self.value)
    }
}
