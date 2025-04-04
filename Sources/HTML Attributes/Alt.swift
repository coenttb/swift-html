///
/// Alt.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that provides alternative text for images or other non-text content.
///
/// The `alt` attribute specifies alternate text for an area, input, or img element. It is used 
/// by screen readers to describe the image to users who cannot see it. It's also displayed if the 
/// image fails to load or when the user has disabled images in their browser.
///
/// ## Usage Notes
///
/// - Required for accessibility on `<img>` elements
/// - Should be descriptive but concise
/// - For `<img>`: Describes the image content and function
/// - For `<input type="image">`: Describes the function of the image button
/// - For `<area>`: Describes the function of the area in an image map
///
/// ## Guidelines for Writing Alt Text
///
/// - Keep it concise and descriptive (typically 125 characters or less)
/// - Don't use phrases like "image of" or "picture of" (screen readers already announce this)
/// - If the image is decorative only, use an empty string (`alt=""`) but don't omit the attribute
/// - For complex images, consider longer descriptions in surrounding text
/// - For functional images (like buttons), describe the function, not the visual
///
/// ## Examples
///
/// Basic usage for an image:
/// ```html
/// <img src="sunset.jpg" alt="Sunset over the mountains">
/// ```
///
/// For a logo that links to the homepage:
/// ```html
/// <a href="/">
///   <img src="logo.png" alt="Company Name Homepage">
/// </a>
/// ```
///
/// For a decorative image:
/// ```html
/// <img src="decorative-divider.png" alt="">
/// ```
///
/// For an image button:
/// ```html
/// <input type="image" src="search-icon.png" alt="Search">
/// ```
public struct Alt: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "alt"
    
    /// The alternative text value
    private let value: String
    
    /// Initialize with an alternative text value
    public init(_ value: String) {
        self.value = value
    }
}

extension Alt: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Alt: CustomStringConvertible {
    /// Returns the string representation of the alternative text
    public var description: String {
        return self.value
    }
}

extension HTML {
    /// Sets the alt attribute on an element
    @discardableResult
    package func alt(
        _ value: Alt?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Alt.attribute, value?.description)
    }
}
