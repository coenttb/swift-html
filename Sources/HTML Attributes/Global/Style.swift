///
/// Style.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Defines inline CSS styles for an HTML element.
///
/// The `style` global attribute contains CSS styling declarations to be applied directly to an element.
/// It allows for element-specific styling without requiring an external stylesheet or a `<style>` tag
/// in the document head. The value consists of one or more CSS property-value pairs separated by
/// semicolons.
///
/// While the `style` attribute is widely supported and convenient for quick styling, it's generally
/// recommended to use external CSS stylesheets or CSS modules for maintainable styling. Inline styles
/// have higher specificity than external styles and can make it harder to maintain consistent design
/// across a website.
///
/// ## Usage Notes
///
/// - The value must be valid CSS syntax for declarations that would appear inside a CSS rule
/// - Multiple declarations must be separated by semicolons (`;`)
/// - No curly braces, selectors, or `@rules` are allowed
/// - Best used for one-off styling, testing, or dynamically generated styles
/// - Should not be used to convey semantic information
/// - For hiding elements, use the `hidden` attribute instead
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <div style="color: blue; background-color: yellow; padding: 5px;">
///   This is styled text
/// </div>
/// ```
///
/// Multiple properties:
/// ```html
/// <p style="font-family: Arial, sans-serif; font-size: 16px; line-height: 1.5; text-align: center;">
///   This paragraph has multiple style properties
/// </p>
/// ```
///
/// Using CSS variables:
/// ```html
/// <span style="color: var(--accent-color); font-weight: bold;">
///   This uses a CSS variable
/// </span>
/// ```
///
/// ## Best Practices
///
/// - Prefer external stylesheets for reusable styles
/// - Use class-based styling for consistent design systems
/// - Reserve inline styles for truly unique, one-off styling needs
/// - Consider using CSS-in-JS or styled components for component libraries
/// - Remember that inline styles override external styles due to CSS specificity rules
public struct Style: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "style"
    
    /// The CSS declarations
    private let value: String
    
    /// Initialize with CSS declarations as a string
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with CSS declarations as key-value pairs
    public init(_ declarations: [String: String]) {
        let formattedDeclarations = declarations.map { key, value in
            "\(key): \(value)"
        }.joined(separator: "; ")
        
        self.value = formattedDeclarations
    }
    
    /// Initialize with a dictionary of CSS properties and values
    public init(properties: [String: String]) {
        self.init(properties)
    }
}

extension Style: CustomStringConvertible {
    /// Returns the string representation of the style value
    public var description: String {
        return self.value
    }
}

extension Style: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Style: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, String)...) {
        let dict = Dictionary(uniqueKeysWithValues: elements)
        self.init(dict)
    }
}
