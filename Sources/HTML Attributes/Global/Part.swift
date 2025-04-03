///
/// Part.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Designates an element as a named part that can be styled from outside its shadow DOM.
///
/// The `part` global attribute assigns names to elements within a shadow DOM, making them accessible
/// for styling from outside the shadow boundary using the `::part()` CSS pseudo-element. This is a key
/// mechanism in the CSS Shadow Parts specification that helps balance encapsulation with styling
/// flexibility in Web Components.
///
/// Shadow DOM provides strong encapsulation for Web Components, isolating their DOM structure and
/// styles from the rest of the document. The `part` attribute creates controlled "style hooks"
/// that allow specific elements within the component to be styled from outside, without exposing
/// the entire internal structure.
///
/// ## Usage Notes
///
/// - Used on elements inside a shadow DOM
/// - Contains a space-separated list of part names
/// - Part names should follow standard CSS identifier rules
/// - Parts can be styled from ancestor documents using `::part(name)` CSS pseudo-element
/// - Often used with custom elements and Web Components
/// - For nested shadow DOMs, parts need to be exported using the `exportparts` attribute
///
/// ## Examples
///
/// HTML structure inside a Web Component's shadow DOM:
/// ```html
/// <template id="fancy-button-template">
///   <button part="button">
///     <span part="label"><slot></slot></span>
///     <span part="icon"></span>
///   </button>
/// </template>
/// ```
///
/// CSS from outside the shadow DOM:
/// ```css
/// fancy-button::part(button) {
///   background: linear-gradient(to right, #ff8a00, #da1b60);
///   border: none;
///   color: white;
/// }
///
/// fancy-button::part(label) {
///   text-transform: uppercase;
/// }
///
/// fancy-button::part(icon) {
///   background: url("icon.svg");
///   width: 16px;
///   height: 16px;
/// }
/// ```
///
/// Multiple part names:
/// ```html
/// <div part="container main-section">
///   <h2 part="heading section-title">Title</h2>
/// </div>
/// ```
public struct Part: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "part"
    
    /// The space-separated list of part names
    private let value: String
    
    /// Initialize with a single part name
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiple part names
    public init(_ values: [String]) {
        self.value = values.joined(separator: " ")
    }
    
    /// Initialize with multiple part names as variadic parameters
    public init(_ values: String...) {
        self.value = values.joined(separator: " ")
    }
}

extension Part: CustomStringConvertible {
    /// Returns the string representation of the part value
    public var description: String {
        return self.value
    }
}

extension Part: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension HTML {
    /// Sets the part attribute with a single part name
    @discardableResult
    public func part(
        _ partName: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Part.attribute, partName)
    }
    
    /// Sets the part attribute with multiple part names
    @discardableResult
    public func part(
        _ partNames: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Part.attribute, partNames.joined(separator: " "))
    }
    
    /// Sets the part attribute with multiple part names as variadic parameters
    @discardableResult
    public func part(
        _ partNames: String...
    ) -> _HTMLAttributes<Self> {
        self.part(partNames)
    }
    
    /// Sets the part attribute using a Part struct
    @discardableResult
    public func part(
        _ attribute: Part
    ) -> _HTMLAttributes<Self> {
        self.attribute(Part.attribute, attribute.description)
    }
}
