///
/// Usemap.swift
/// swift-html
///
/// Created by Claude on 09/04/2025.
///

import Foundation

/// Represents the HTML usemap attribute.
///
/// The `usemap` attribute specifies an image map to use with the image or object.
/// An image map is a set of clickable areas on an image, defined by `<map>` and `<area>` elements.
/// The value must be a hash-name reference to a `<map>` element (a '#' followed by the value of the
/// name attribute of a map element).
///
/// ## Usage Notes
///
/// - Used with `<img>` and `<object>` elements
/// - Must reference a `<map>` element by its name attribute
/// - The reference must start with a '#' character
/// - Makes the image or object interactive with clickable regions
/// - When used with `<object>`, it makes the element interactive content
///
/// ## Examples
///
/// ```html
/// <!-- Image with an image map -->
/// <img src="planets.jpg" width="145" height="126" usemap="#planetmap" alt="Planets">
///
/// <!-- Object with an image map -->
/// <object data="planets.jpg" width="145" height="126" usemap="#planetmap">
///   Alternative content
/// </object>
///
/// <!-- The map element defining the clickable areas -->
/// <map name="planetmap">
///   <area shape="rect" coords="0,0,82,126" href="sun.html" alt="Sun">
///   <area shape="circle" coords="90,58,3" href="mercury.html" alt="Mercury">
///   <area shape="circle" coords="124,58,8" href="venus.html" alt="Venus">
/// </map>
/// ```
public struct Usemap: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "usemap"
    
    /// The map name value (with or without '#')
    private let value: String
    
    /// Initialize with a map name
    /// - Parameter value: The map name (with or without '#')
    public init(_ value: String) {
        // Ensure the value starts with '#'
        if value.hasPrefix("#") {
            self.value = value
        } else {
            self.value = "#" + value
        }
    }
}

extension Usemap: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

extension Usemap: CustomStringConvertible {
    /// Returns the string representation of the usemap value
    public var description: String {
        return self.value
    }
}