///
/// <rtc> Ruby Text Container.swift
/// swift-html
///
/// Represents the HTML Ruby Text Container element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML Ruby Text Container element (`<rtc>`), which embraces semantic annotations 
/// of characters presented in ruby annotations.
///
/// The `RubyTextContainer` element is used to group ruby text (`<rt>`) elements when there are 
/// multiple levels of annotations. While this element is deprecated in modern HTML specifications, 
/// it is included for completeness.
///
/// ## Example
///
/// ```swift
/// ruby {
///     rb { "馬" }
///     rb { "來" }
///     rb { "西" }
///     rb { "亞" }
///     rtc {
///         rt { "mǎ" }
///         rt { "lái" }
///         rt { "xī" }
///         rt { "yà" }
///     }
///     rtc {
///         rt { "Malaysia" }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<rtc>` for complex ruby annotations with multiple levels (e.g., pronunciation and meaning)
/// - Include `<rt>` elements inside the `<rtc>` for specific annotations
/// - Note that this element is deprecated; consider simpler ruby structures for better compatibility
/// - Only use within a `<ruby>` element
///
public struct RubyTextContainer: Element {
    /// The HTML tag name
    public static var tag: String { "rtc" }
    
    /// Creates a new RubyTextContainer element with the specified attributes.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating RubyTextContainer elements with a more HTML-like syntax.
public typealias rtc = RubyTextContainer
