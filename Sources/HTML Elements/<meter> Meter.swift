///
/// <meter> Meter.swift
/// swift-html
///
/// Represents the HTML meter element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML meter element (`<meter>`), which displays a scalar value within a known range or a fractional value.
///
/// The `Meter` struct provides a type-safe way to create HTML meter elements with various attributes
/// like min, max, low, high, optimum, and value.
///
/// ## Example
///
/// ```swift
/// meter(value: 75, min: 0, max: 100) {
///     "75%"
/// }
/// ```
///
/// ```swift
/// meter(value: 84, min: 0, low: 50, high: 80, max: 100) {
///     "84%"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<meter>` for measurements within a known range, like disk usage, not for progress indicators
/// - Always specify both `min` and `max` values when the value is not in the range 0-1
/// - Include text content that represents the same information for accessibility
/// - Use `low` and `high` to indicate thresholds for acceptable ranges
/// - Use `optimum` to indicate the ideal value within the range
///
public struct Meter<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "meter" }
    
    /// The current numeric value, which must be between the minimum and maximum values
    public var value: Value<Double>
    
    /// The lower numeric bound of the measured range (defaults to 0)
    public var min: Min?
    
    /// The upper numeric bound of the measured range (defaults to 1)
    public var max: Max?
    
    /// The upper numeric bound of the low end of the measured range
    public var low: Low?
    
    /// The lower numeric bound of the high end of the measured range
    public var high: High?
    
    /// The optimal numeric value, which must be within the range
    public var optimum: Optimum?
    
    /// The ID of the form element that the meter is associated with
    public var form: HTML_Attributes.Form.ID?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new meter element with the specified attributes.
    ///
    /// - Parameters:
    ///   - value: The current numeric value
    ///   - min: The lower bound of the range (defaults to 0)
    ///   - max: The upper bound of the range (defaults to 1)
    ///   - low: The upper bound of the low end of the range
    ///   - high: The lower bound of the high end of the range
    ///   - optimum: The optimal value within the range
    ///   - form: The ID of the form element that the meter is associated with
    ///   - content: The content of the element
    public init(
        value: Value<Double>,
        min: Min? = nil,
        max: Max? = nil,
        low: Low? = nil,
        high: High? = nil,
        optimum: Optimum? = nil,
        form: HTML_Attributes.Form.ID? = nil,
        content: @escaping () -> HTML
    ) {
        self.value = value
        self.min = min
        self.max = max
        self.low = low
        self.high = high
        self.optimum = optimum
        self.form = form
        self.content = content
    }
}

/// Lowercase typealias for creating Meter elements with a more HTML-like syntax.
public typealias meter = Meter
