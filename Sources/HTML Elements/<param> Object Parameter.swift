///
/// <param> Object Parameter.swift
/// swift-html
///
/// Represents the HTML param element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<param>` element, which defines parameters for an `<object>` element.
///
/// The `Param` struct provides a type-safe way to create HTML parameter elements.
/// This is a void element that must not have any content.
///
/// > Note: This element is deprecated. Though some browsers might still support it, it may have already
/// > been removed from the relevant web standards or may only be kept for compatibility purposes.
///
/// ## Example
///
/// ```swift
/// object {
///     param(name: "movie", value: "movie.swf")
///     param(name: "quality", value: "high")
/// }
/// ```
///
/// ## Best Practices
///
/// - Modern web applications should prefer other technologies instead of the `<object>` and `<param>` elements
/// - For embedding media, consider using `<video>`, `<audio>`, or `<picture>` elements instead
/// - For embedding other content, consider using `<iframe>` or more modern web components
///
public struct Param: Element {
    /// The HTML tag name
    public static var tag: String { "param" }
    
    /// Name of the parameter
    public var name: HTML_Attributes.Name?
    
    /// Value of the parameter
    public var value: HTML_Attributes.Value<String>?
    
    /// Creates a new Param element with the specified attributes.
    ///
    /// - Parameters:
    ///   - name: Name of the parameter
    ///   - value: Value of the parameter
    public init(
        name: HTML_Attributes.Name? = nil,
        value: HTML_Attributes.Value<String>? = nil
    ) {
        self.name = name
        self.value = value
    }
}

/// Lowercase typealias for creating Param elements with a more HTML-like syntax.
public typealias param = Param
