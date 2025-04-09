//
//  DateTime.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/04/2025.
//

import Foundation

/// Represents the HTML `datetime` attribute used with the `<time>` element.
///
/// The `datetime` attribute provides a machine-readable format for dates and times.
/// It can represent various time formats including:
///
/// - Year (YYYY)
/// - Year-month (YYYY-MM)
/// - Date (YYYY-MM-DD)
/// - Time (HH:MM, HH:MM:SS)
/// - Local date and time (YYYY-MM-DDTHH:MM)
/// - Time zone offsets (Z, +HHMM, -HH:MM)
/// - Durations (PNNT...)
///
/// ## Examples
///
/// ```html
/// <time datetime="2018-07-07">July 7</time>
/// <time datetime="20:00">8:00 PM</time>
/// <time datetime="PT2H30M">2h 30m</time>
/// ```
public struct DateTime: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "datetime"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a string value
    public init(_ value: String) {
        self.value = value
    }
}

extension DateTime: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension DateTime: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}
