///
/// <var> Variable.swift
/// swift-html
///
/// Represents the HTML variable element for marking variables in mathematical expressions or programming contexts.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation

/// Represents an HTML variable element (`<var>`), which represents the name of a variable in a mathematical 
/// expression or a programming context.
///
/// The `Variable` struct provides a type-safe way to create HTML variable elements for marking up variable names
/// or placeholders in text.
///
/// ## Example
///
/// ```swift
/// p {
///     "The volume of a box is "
///     var { "l" }
///     " × "
///     var { "w" }
///     " × "
///     var { "h" }
///     ", where "
///     var { "l" }
///     " represents the length, "
///     var { "w" }
///     " the width and "
///     var { "h" }
///     " the height of the box."
/// }
/// ```
///
/// Example with programming variables:
///
/// ```swift
/// p {
///     "The variables "
///     var { "minSpeed" }
///     " and "
///     var { "maxSpeed" }
///     " control the minimum and maximum speed of the apparatus in revolutions per minute (RPM)."
/// }
/// ```
///
/// ## Best Practices
///
/// - Use `<var>` for variable names in mathematical expressions
/// - Use `<var>` for variable or parameter names in programming contexts
/// - Use `<var>` to denote placeholders in text that should be replaced with a specific value
/// - Do not use `<var>` for styling purposes - use CSS with appropriate semantic elements instead
///
/// ## Related Elements
///
/// - `<code>`: Use for code fragments or statements
/// - `<kbd>`: Use for user input or keyboard keys
/// - `<samp>`: Use for sample output from programs
///
/// ## Default Styling
///
/// Most browsers render the `<var>` element in an italicized font style, although this can vary
/// across browsers and can be overridden with CSS.
///
public struct Variable: Element {
    /// The HTML tag name
    public static var tag: String { "var" }
    
    /// Creates a new Variable element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating Variable elements with a more HTML-like syntax.
/// Note: Backticks are required since `var` is a reserved keyword in Swift.
public typealias `var` = Variable
