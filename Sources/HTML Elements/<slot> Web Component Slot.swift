///
/// <slot> Web Component Slot.swift
/// swift-html
///
/// Represents the HTML slot element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<slot>` element, which is part of the Web Components technology suite.
///
/// The `<slot>` element serves as a placeholder inside a web component that you can fill with your own markup,
/// which lets you create separate DOM trees and present them together.
///
/// ## Example
///
/// ```swift
/// slot(name: "header") {
///     "Default content if no slotted content is provided"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use named slots to create specific insertion points in your web components
/// - Provide default content inside slots that will be displayed if no slotted content is provided
/// - Ensure slot names are unique within a shadow root
/// - Remember that unnamed slots (without a name attribute) will capture all unassigned content
///
public struct WebComponentSlot: Element {
    /// The HTML tag name
    public static var tag: String { "slot" }
    
    /// The slot's name. 
    /// When the slot's containing component gets rendered, the slot is rendered with the 
    /// custom element's child that has a matching slot attribute.
    public var name: Name?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new WebComponentSlot element with the specified attributes.
    ///
    /// - Parameters:
    ///   - name: The slot's name. Elements with a matching slot attribute will be inserted here.
    ///   - content: The default content of the slot, shown when no slotted content is provided
    public init(
        name: Name? = nil,
        
    ) {
        self.name = name
        
    }
}

/// Lowercase typealias for creating WebComponentSlot elements with a more HTML-like syntax.
public typealias slot = WebComponentSlot
