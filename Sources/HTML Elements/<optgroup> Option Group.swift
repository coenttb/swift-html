///
/// <optgroup> Option Group.swift
/// swift-html
///
/// Represents the HTML optgroup element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML option group element (`<optgroup>`), which creates a grouping of options within a `<select>` element.
///
/// The `OptionGroup` struct provides a type-safe way to create HTML option groups with various attributes.
///
/// ## Example
///
/// ```swift
/// select {
///     optgroup(label: "Theropods") {
///         option { "Tyrannosaurus" }
///         option { "Velociraptor" }
///         option { "Deinonychus" }
///     }
///     optgroup(label: "Sauropods") {
///         option { "Diplodocus" }
///         option { "Saltasaurus" }
///         option { "Apatosaurus" }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - The `label` attribute is mandatory when using this element
/// - Optgroup elements may not be nested
/// - Use optgroups to organize related options in a select element
///
public struct OptionGroup: Element {
    /// The HTML tag name
    public static var tag: String { "optgroup" }
    
    /// If set, none of the items in this option group is selectable.
    /// Often browsers grey out such control and it won't receive any browsing events,
    /// like mouse clicks or focus-related ones.
    public var disabled: Disabled?
    
    /// The name of the group of options, which the browser can use when labeling
    /// the options in the user interface. This attribute is mandatory if this element is used.
    public var label: String?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new OptionGroup element with the specified attributes.
    ///
    /// - Parameters:
    ///   - disabled: If set, none of the items in this option group will be selectable
    ///   - label: The name of the group of options (mandatory)
    ///   - content: The content of the element (typically `<option>` elements)
    public init(
        disabled: Disabled? = nil,
        label: String? = nil,
        
    ) {
        self.disabled = disabled
        self.label = label
        
    }
}

/// Lowercase typealias for creating OptionGroup elements with a more HTML-like syntax.
public typealias optgroup = OptionGroup
