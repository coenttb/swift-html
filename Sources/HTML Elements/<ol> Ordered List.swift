///
/// <ol> Ordered List.swift
/// swift-html
///
/// Represents the HTML ordered list element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML ordered list element (`<ol>`), which displays a numbered list of items.
///
/// The `OrderedList` struct provides a type-safe way to create HTML ordered lists with various attributes.
///
/// ## Example
///
/// ```swift
/// ol {
///     li { "Mix flour, baking powder, sugar, and salt." }
///     li { "In another bowl, mix eggs, milk, and oil." }
///     li { "Stir both mixtures together." }
///     li { "Fill muffin tray 3/4 full." }
///     li { "Bake for 20 minutes." }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use ordered lists when the sequence of the items is important (like steps in a process)
/// - Use `reversed` when counting down or showing items in reverse order
/// - Nest lists as needed to show hierarchical information
/// - For styling, prefer CSS over the `type` attribute when possible
///
public struct OrderedList: Element {
    /// The HTML tag name
    public static var tag: String { "ol" }
    
    /// Boolean attribute specifying that the list's items are in reverse order (high to low)
    public var reversed: HTML_Attributes.Reversed?
    
    /// Specifies the starting number for the list items
    public var start: HTML_Attributes.Start?
    
    /// Specifies the numbering type (1, a, A, i, I)
    public var type: HTML_Attributes.ListType?
    
    /// Creates a new OrderedList element with the specified attributes.
    ///
    /// - Parameters:
    ///   - reversed: Boolean attribute that reverses the order of items
    ///   - start: The starting number for the list
    ///   - type: The numbering type to use (list items)
    public init(
        reversed: HTML_Attributes.Reversed? = nil,
        start: HTML_Attributes.Start? = nil,
        type: HTML_Attributes.ListType? = nil
    ) {
        self.reversed = reversed
        self.start = start
        self.type = type
        
    }
}

/// Lowercase typealias for creating OrderedList elements with a more HTML-like syntax.
public typealias ol = OrderedList
