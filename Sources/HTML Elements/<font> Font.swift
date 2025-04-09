///
/// <font> Font.swift
/// swift-html
///
/// Represents the HTML font element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML font element (`<font>`), which defines the font size, color and face for its content.
///
/// The `Font` struct provides a type-safe way to create HTML font elements with various attributes.
///
/// > Warning: This element is deprecated. Use CSS Fonts properties to style text instead.
///
/// ## Example
///
/// ```swift
/// font {
///     "Text with custom font"
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using this element as it is deprecated
/// - Use CSS styling with proper font properties instead
///
public struct Font: Element {
    /// The HTML tag name
    public static var tag: String { "font" }
    
    /// The color of the text
    public var color: HTML_Attributes.Color?
    
    /// The font face to use
    public var face: HTML_Attributes.Face?
    
    /// The font size
    public var size: HTML_Attributes.FontSize?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Font element with the specified attributes.
    ///
    /// - Parameters:
    ///   - color: The color of the text
    ///   - face: The font face to use
    ///   - size: The font size
    ///   - content: The content of the element
    public init(
        color: HTML_Attributes.Color? = nil,
        face: HTML_Attributes.Face? = nil,
        size: HTML_Attributes.FontSize? = nil,
        
    ) {
        self.color = color
        self.face = face
        self.size = size
        
    }
}

/// Lowercase typealias for creating Font elements with a more HTML-like syntax.
public typealias font = Font
