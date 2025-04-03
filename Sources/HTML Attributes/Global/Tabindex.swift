///
/// Tabindex.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Controls an element's participation in sequential keyboard navigation.
///
/// The `tabindex` global attribute allows developers to control whether elements can receive
/// keyboard focus, and their order in the sequential keyboard navigation flow (typically using
/// the Tab key). This attribute is crucial for implementing accessible interfaces, particularly
/// for users who navigate with keyboards or assistive technologies rather than pointing devices.
///
/// The attribute accepts an integer value, with different behaviors depending on the value:
///
/// - **Negative value** (usually -1): Element is not reachable via sequential keyboard navigation,
///   but can be focused programmatically via JavaScript's `focus()` method.
///
/// - **Zero (0)**: Element is included in sequential keyboard navigation in the natural document order,
///   after any elements with positive tabindex values.
///
/// - **Positive value**: Element is included in sequential keyboard navigation before elements with
///   tabindex="0" or no tabindex, with lower numbers focused before higher numbers.
///
/// ## Accessibility Best Practices
///
/// - **Prefer using tabindex="0" or tabindex="-1"** rather than positive values
/// - Avoid disrupting the natural tab order with positive values, as this can confuse users
/// - Use tabindex="-1" for elements that should be focusable programmatically but not via keyboard
/// - Don't use tabindex on non-interactive elements; use appropriate interactive elements instead
/// - Some elements are naturally focusable without tabindex (links, buttons, form controls, etc.)
/// - The maximum valid value is 32767
///
/// ## Usage Notes
///
/// - Many interactive elements are already focusable without needing tabindex
/// - Adding tabindex to a non-interactive element doesn't make it truly interactive
/// - The tabindex attribute must not be used on the `<dialog>` element
/// - Elements with tabindex can be focused programmatically and via mouse clicks
/// - Only the tabindex value controls whether an element is included in keyboard navigation
///
/// ## Examples
///
/// Making a div focusable but keeping it in the natural flow:
/// ```html
/// <div tabindex="0">This div can be focused with Tab key</div>
/// ```
///
/// Creating a programmatically focusable element:
/// ```html
/// <div tabindex="-1" id="error-message">This will be focused when an error occurs</div>
/// ```
///
/// Multiple tabindex values (not recommended, but shown for example):
/// ```html
/// <div tabindex="1">This is focused first</div>
/// <div tabindex="2">This is focused second</div>
/// <a href="https://example.com">This natural link is focused third</a>
/// <div tabindex="0">This is focused fourth</div>
/// ```
public struct Tabindex: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "tabindex"
    
    /// The tabindex value
    private let value: Int
    
    /// Initialize with a tabindex value
    public init(_ value: Int) {
        self.value = value
    }
    
    /// A constant for the common -1 value (not in tab order but focusable via script)
    public static let notTabbable = Tabindex(-1)
    
    /// A constant for the common 0 value (in natural tab order)
    public static let inDocumentOrder = Tabindex(0)
}

extension Tabindex: CustomStringConvertible {
    /// Returns the string representation of the tabindex value
    public var description: String {
        return String(self.value)
    }
}

extension HTML {
    /// Sets the tabindex attribute with an integer value
    @discardableResult
    public func tabindex(
        _ value: Int
    ) -> _HTMLAttributes<Self> {
        self.attribute(Tabindex.attribute, String(value))
    }
    
    /// Sets the tabindex attribute using a Tabindex struct
    @discardableResult
    public func tabindex(
        _ attribute: Tabindex
    ) -> _HTMLAttributes<Self> {
        self.attribute(Tabindex.attribute, attribute.description)
    }
    
    /// Makes the element not focusable via keyboard but focusable programmatically
    @discardableResult
    public func notTabbable() -> _HTMLAttributes<Self> {
        self.tabindex(Tabindex.notTabbable)
    }
    
    /// Makes the element focusable in the natural document order
    @discardableResult
    public func tabbableInDocumentOrder() -> _HTMLAttributes<Self> {
        self.tabindex(Tabindex.inDocumentOrder)
    }
}
