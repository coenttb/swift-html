///
/// ObjectForm.swift
/// swift-html
///
/// Created by Claude on 09/04/2025.
///

import Foundation

/// Represents the HTML form attribute for the `<object>` element.
///
/// The `form` attribute associates an object element with a form. The value must be the ID of a
/// form element in the same document. This allows the object to be a part of a form even when
/// it's not nested within the form element.
///
/// ## Usage Notes
///
/// - Associates the object with a form using the form's ID
/// - Allows the object to be positioned anywhere in the document, not just inside the form
/// - Particularly useful for complex layouts where direct nesting isn't practical
///
/// ## Examples
///
/// ```html
/// <form id="myForm" action="/submit" method="post">
///   <!-- Form fields -->
/// </form>
///
/// <!-- Object associated with the form but positioned elsewhere -->
/// <object data="map.svg" type="image/svg+xml" form="myForm" width="600" height="400">
///   <p>Your browser doesn't support SVG</p>
/// </object>
/// ```
public struct ObjectForm: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "form"
    
    /// The form ID value
    private let value: String
    
    /// Initialize with a form ID
    public init(_ value: String) {
        self.value = value
    }
}

extension ObjectForm: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension ObjectForm: CustomStringConvertible {
    /// Returns the string representation of the form ID
    public var description: String {
        return self.value
    }
}