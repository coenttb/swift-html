///
/// Slot.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Assigns an element to a specific slot in a shadow DOM.
///
/// The `slot` global attribute assigns an element to a specific slot in a shadow DOM shadow tree.
/// Elements with a `slot` attribute are inserted into the slot created by the `<slot>` element
/// whose `name` attribute matches the `slot` attribute's value. Multiple elements can be assigned
/// to the same slot by using the same slot name.
///
/// Slots are a key part of the Web Components architecture, allowing for content projection
/// from the light DOM (regular DOM) into specific locations within a shadow DOM. This enables
/// component authors to create flexible, customizable components with clearly defined insertion points.
///
/// ## Usage Notes
///
/// - Used on elements that are children of a custom element with a shadow DOM
/// - The value must match a `<slot>` element's `name` attribute within the shadow DOM
/// - Multiple elements can share the same slot name
/// - Elements without a slot attribute are assigned to the default (unnamed) slot if one exists
/// - If no matching slot exists for an element, it won't be rendered
/// - Not visible in the DOM tree, but influences where content appears in the rendered component
///
/// ## Examples
///
/// Simple named slots in a custom element:
/// ```html
/// <!-- Custom element definition -->
/// <template id="user-card-template">
///   <div class="user-card">
///     <div class="header">
///       <slot name="avatar"></slot>
///       <slot name="name">Default Name</slot>
///     </div>
///     <div class="content">
///       <slot></slot> <!-- Default/unnamed slot -->
///     </div>
///   </div>
/// </template>
///
/// <!-- Usage of the custom element -->
/// <user-card>
///   <img slot="avatar" src="avatar.jpg" alt="User Avatar">
///   <h3 slot="name">John Doe</h3>
///   <p>This content goes into the default slot.</p>
/// </user-card>
/// ```
///
/// Multiple elements assigned to the same slot:
/// ```html
/// <user-card>
///   <img slot="avatar" src="avatar.jpg" alt="User Avatar">
///   <h3 slot="name">John Doe</h3>
///   <span slot="name">(He/Him)</span>
///   <p>Profile information goes here.</p>
/// </user-card>
/// ```
///
/// Nested slots in complex components:
/// ```html
/// <complex-component>
///   <div slot="header">
///     <h2 slot="title">Main Title</h2>
///     <p slot="subtitle">Subtitle information</p>
///   </div>
///   <section slot="body">
///     <p>Content paragraph 1</p>
///     <p>Content paragraph 2</p>
///   </section>
///   <div slot="footer">
///     <button slot="action">Submit</button>
///   </div>
/// </complex-component>
/// ```
public struct Slot: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "slot"
    
    /// The name of the slot to assign the element to
    private let value: String
    
    /// Initialize with a slot name
    public init(_ value: String) {
        self.value = value
    }
}

extension Slot: CustomStringConvertible {
    /// Returns the string representation of the slot value
    public var description: String {
        return self.value
    }
}

extension Slot: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension HTML {
    /// Sets the slot attribute with a slot name
    @discardableResult
    public func slot(
        _ name: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Slot.attribute, name)
    }
    
    /// Sets the slot attribute using a Slot struct
    @discardableResult
    public func slot(
        _ attribute: Slot
    ) -> _HTMLAttributes<Self> {
        self.attribute(Slot.attribute, attribute.description)
    }
}
