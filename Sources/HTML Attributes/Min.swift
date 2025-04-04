///
/// Min.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that specifies the minimum value allowed for an input element or other form controls.
///
/// The `min` attribute defines the minimum value acceptable for the element. Values less than
/// this minimum will cause the element to fail constraint validation. The format of the min value
/// depends on the element type.
///
/// ## Usage Notes
///
/// - Valid on numeric `<input>` types (number, range), date/time types (date, month, week, time, datetime-local),
///   and the `<meter>` element
/// - Must be less than or equal to the `max` attribute if both are specified
/// - For `<meter>`, defaults to 0 if omitted
/// - Elements with values below the min will match the `:out-of-range` and `:invalid` CSS pseudo-classes
/// - Affects the valid step values (which are calculated relative to the min value)
///
/// ## Value Format by Element Type
///
/// | Element Type       | Format          | Example               |
/// |-------------------|-----------------|------------------------|
/// | input[type=date]  | yyyy-mm-dd      | 2023-01-01            |
/// | input[type=month] | yyyy-mm         | 2023-01               |
/// | input[type=week]  | yyyy-W##        | 2023-W01              |
/// | input[type=time]  | HH:mm           | 09:00                 |
/// | input[type=datetime-local] | yyyy-mm-ddTHH:mm | 2023-01-01T09:00 |
/// | input[type=number] | numeric         | 0                     |
/// | input[type=range] | numeric         | 0                     |
/// | meter             | numeric         | 0                     |
///
/// ## Step Considerations
///
/// The `min` value serves as the base value for step calculations. Valid values are those that can be
/// reached from the min value by adding or subtracting multiples of the step value. For example:
/// - With `min="7.2"` and default `step="1"`, valid values are 7.2, 8.2, 9.2, etc.
/// - With `min="2"` and `step="2"`, valid values are 2, 4, 6, 8, etc.
///
/// ## Accessibility Considerations
///
/// When using the `min` attribute, ensure users understand the minimum requirements:
/// - Provide clear instructions, preferably within the `<label>` element
/// - For instructions outside labels, consider using `aria-labelledby` or `aria-describedby`
/// - Ensure error messages for out-of-range values are clear and descriptive
///
/// ## Examples
///
/// Numeric input with min value:
/// ```html
/// <input type="number" min="0" max="100">
/// ```
///
/// Date input with min value:
/// ```html
/// <input type="date" min="2023-01-01">
/// ```
///
/// Range input with min and step values:
/// ```html
/// <input type="range" min="0" step="5" max="100">
/// ```
public struct Min: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "min"
    
    /// The minimum value
    private let value: String
    
    /// Initialize with a string value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a date
    public init(date: Date, format: DateFormat = .fullDate) {
        let formatter: DateFormatter
        
        switch format {
        case .fullDate:
            formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
        case .month:
            formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM"
        case .week:
            // Week format requires custom handling for ISO week number
            let calendar = Calendar(identifier: .iso8601)
            let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
            if let year = components.yearForWeekOfYear, let week = components.weekOfYear {
                self.value = String(format: "%04d-W%02d", year, week)
                return
            } else {
                formatter = DateFormatter()
                formatter.dateFormat = "yyyy-'W'ww"
            }
        case .time:
            formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
        case .dateTimeLocal:
            formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        }
        
        self = .init(formatter.string(from: date))
    }
    
    /// Date format types for the min attribute
    public enum DateFormat {
        /// Full date (yyyy-MM-dd)
        case fullDate
        
        /// Month only (yyyy-MM)
        case month
        
        /// Week (yyyy-Www)
        case week
        
        /// Time (HH:mm)
        case time
        
        /// Local date and time (yyyy-MM-ddTHH:mm)
        case dateTimeLocal
    }
    
    /// Create a min value for a date input
    public static func date(_ year: Int, month: Int, day: Int) -> Min {
        return Min(String(format: "%04d-%02d-%02d", year, month, day))
    }
    
    /// Create a min value for a month input
    public static func month(_ year: Int, month: Int) -> Min {
        return Min(String(format: "%04d-%02d", year, month))
    }
    
    /// Create a min value for a week input
    public static func week(_ year: Int, week: Int) -> Min {
        return Min(String(format: "%04d-W%02d", year, week))
    }
    
    /// Create a min value for a time input
    public static func time(_ hour: Int, minute: Int) -> Min {
        return Min(String(format: "%02d:%02d", hour, minute))
    }
    
    /// Create a min value for a datetime-local input
    public static func dateTimeLocal(_ year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Min {
        return Min(String(format: "%04d-%02d-%02dT%02d:%02d", year, month, day, hour, minute))
    }
    
    /// Zero value for numeric inputs
    public static let zero = Min(0)
}

extension Min: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Min: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension Min: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.value = String(value)
    }
}

extension Min: CustomStringConvertible {
    /// Returns the string representation of the min value
    public var description: String {
        return self.value
    }
}

extension HTML {
    
    /// Sets the min attribute on an element
    @discardableResult
    package func min(
        _ value: Min?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Min.attribute, value?.description)
    }
    
    /// Sets the min attribute with a date value and format
    @discardableResult
    package func min(
        date: Date,
        format: Min.DateFormat = .fullDate
    ) -> _HTMLAttributes<Self> {
        self.min(Min(date: date, format: format))
    }
}
