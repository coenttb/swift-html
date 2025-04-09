///
/// <output> Output.swift
/// swift-html
///
/// Represents the HTML Output element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML output element (`<output>`), which is a container element into which a site or app can inject 
/// the results of a calculation or the outcome of a user action.
///
/// The `Output` struct provides a type-safe way to create HTML output elements with various attributes.
///
/// ## Example
///
/// ```swift
/// output(for: ["a", "b"], name: "result") {
///     "60"
/// }
/// ```
///
/// ## Best Practices
///
/// - Use the `for` attribute to indicate which elements contributed to the calculation
/// - Use the `form` attribute to associate the output with a form outside its hierarchy
/// - Many browsers implement this element as an `aria-live` region, making it useful for accessibility
///
public struct Output<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "output" }
    
    /// A space-separated list of other elements' IDs, indicating that those elements contributed 
    /// input values to (or otherwise affected) the calculation.
    public var `for`: For?
    
    /// The form element to associate the output with (its form owner). 
    /// Allows associating the output with a form anywhere in the document.
    public var form: HTML_Attributes.Form.ID?
    
    /// The element's name. Used in the form.elements API.
    public var name: Name?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Output element with the specified attributes.
    ///
    /// - Parameters:
    ///   - for: IDs of elements that contributed to the calculation
    ///   - form: ID of the form to associate with
    ///   - name: Name of the output element
    ///   - content: The content of the element
    public init(
        `for`: For? = nil,
        form: HTML_Attributes.Form.ID? = nil,
        name: Name? = nil,
        content: @escaping () -> HTML
    ) {
        self.`for` = `for`
        self.form = form
        self.name = name
        self.content = content
    }
}

/// Lowercase typealias for creating Output elements with a more HTML-like syntax.
public typealias output = Output

