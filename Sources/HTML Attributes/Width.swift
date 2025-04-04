///
/// Width.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 04/04/2025.
///

import Foundation

/// An attribute that specifies the width of an element.
///
/// The `width` attribute defines the width of an element in pixels (for images, videos, and similar) 
/// or in other units when combined with CSS. It is primarily used with media elements to ensure proper 
/// layout before the media is loaded, preventing layout shifts.
///
/// ## Usage Notes
///
/// - Common on `<img>`, `<input type="image">`, `<video>`, `<canvas>`, and `<iframe>` elements
/// - For images, specifies the intrinsic width in CSS pixels
/// - For canvas, specifies the width in CSS pixels for the coordinate system
/// - Can be a number (interpreted as pixels) or a string with units
/// - Using both height and width helps prevent layout shifts during page load
///
/// ## Best Practices
///
/// - Always specify both height and width to maintain aspect ratio
/// - For responsive design, consider using CSS instead of the width attribute
/// - For images, use the intrinsic dimensions or an appropriately scaled value
/// - If you're only specifying one dimension, ensure the aspect ratio is preserved
///
/// ## Examples
///
/// Image with height and width attributes:
/// ```html
/// <img src="example.jpg" height="300" width="400" alt="Example image">
/// ```
///
/// Canvas with height and width:
/// ```html
/// <canvas height="200" width="300"></canvas>
/// ```
///
/// Video with height and width:
/// ```html
/// <video height="480" width="640" controls>
///   <source src="video.mp4" type="video/mp4">
/// </video>
/// ```
public struct Width: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "width"
    
    /// The width value
    private let value: String
    
    /// Initialize with a width value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a numeric width value (treated as pixels)
    public init(_ value: Int) {
        self.value = String(value)
    }
}

extension Width: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Width: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension Width: CustomStringConvertible {
    /// Returns the string representation of the width value
    public var description: String {
        return self.value
    }
}
