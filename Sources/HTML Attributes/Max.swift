///
/// Max.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML

/// An attribute that specifies the maximum value allowed for an input element or other form controls.
///
/// The `max` attribute defines the maximum value acceptable for the element. Values greater than
/// this maximum will cause the element to fail constraint validation. The format of the max value
/// depends on the element type.
///
/// ## Usage Notes
///
/// - Valid on numeric `<input>` types (number, range), date/time types (date, month, week, time, datetime-local),
///   and the `<progress>` and `<meter>` elements
/// - Must be greater than or equal to the `min` attribute if both are specified
/// - For `<progress>` and `<meter>`, defaults to 1 if omitted
/// - Elements with values exceeding the max will match the `:out-of-range` and `:invalid` CSS pseudo-classes
///
/// ## Value Format by Element Type
///
/// | Element Type       | Format          | Example               |
/// |-------------------|-----------------|------------------------|
/// | input[type=date]  | yyyy-mm-dd      | 2025-12-31            |
/// | input[type=month] | yyyy-mm         | 2025-12               |
/// | input[type=week]  | yyyy-W##        | 2025-W52              |
/// | input[type=time]  | HH:mm           | 23:59                 |
/// | input[type=datetime-local] | yyyy-mm-ddTHH:mm | 2025-12-31T23:59 |
/// | input[type=number] | numeric         | 100                   |
/// | input[type=range] | numeric         | 100                   |
/// | progress          | numeric         | 100                   |
/// | meter             | numeric         | 100                   |
///
/// ## Accessibility Considerations
///
/// When using the `max` attribute, ensure users understand the maximum requirements:
/// - Provide clear instructions, preferably within the `<label>` element
/// - For instructions outside labels, consider using `aria-labelledby` or `aria-describedby`
/// - Ensure error messages for out-of-range values are clear and descriptive
///
/// ## Examples
///
/// Numeric input with max value:
/// ```html
/// <input type="number" max="100" min="0">
/// ```
///
/// Date input with max value:
/// ```html
/// <input type="date" max="2025-12-31">
/// ```
///
/// Progress bar with max value:
/// ```html
/// <progress max="100" value="75">75%</progress>
/// ```
public struct Max: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "max"
    
    /// The maximum value
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
        
        self.value = formatter.string(from: date)
    }
    
    /// Date format types for the max attribute
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
    
    /// Create a max value for a date input
    public static func date(_ year: Int, month: Int, day: Int) -> Max {
        return Max(String(format: "%04d-%02d-%02d", year, month, day))
    }
    
    /// Create a max value for a month input
    public static func month(_ year: Int, month: Int) -> Max {
        return Max(String(format: "%04d-%02d", year, month))
    }
    
    /// Create a max value for a week input
    public static func week(_ year: Int, week: Int) -> Max {
        return Max(String(format: "%04d-W%02d", year, week))
    }
    
    /// Create a max value for a time input
    public static func time(_ hour: Int, minute: Int) -> Max {
        return Max(String(format: "%02d:%02d", hour, minute))
    }
    
    /// Create a max value for a datetime-local input
    public static func dateTimeLocal(_ year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Max {
        return Max(String(format: "%04d-%02d-%02dT%02d:%02d", year, month, day, hour, minute))
    }
}

extension Max: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Max: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension Max: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.value = String(value)
    }
}

extension Max: CustomStringConvertible {
    /// Returns the string representation of the max value
    public var description: String {
        return self.value
    }
}

extension HTML {
    
    /// Sets the max attribute on an element
    @discardableResult
    public func max(
        _ value: Max?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Max.attribute, value?.description)
    }

    /// Sets the max attribute with a date value and format
    @discardableResult
    public func max(
        date: Date,
        format: Max.DateFormat = .fullDate
    ) -> _HTMLAttributes<Self> {
        self.max(Max(date: date, format: format))
    }
}
