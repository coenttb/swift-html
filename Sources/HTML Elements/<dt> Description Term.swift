///
/// <dt> Description Term.swift
/// swift-html
///
/// Represents the HTML description term element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML description term element (`<dt>`), which specifies a term in a description or definition list.
///
/// The `DescriptionTerm` element must be used inside a `<dl>` element. It is usually followed by a `<dd>` element;
/// however, multiple `<dt>` elements in a row indicate several terms that are all defined by the immediate next
/// `<dd>` element.
///
/// ## Example
///
/// ```swift
/// dl {
///     dt {
///         "Denim (semigloss finish)"
///     }
///     dd {
///         "Ceiling"
///     }
///     dt {
///         "Denim (eggshell finish)"
///     }
///     dt {
///         "Evening Sky (eggshell finish)"
///     }
///     dd {
///         "Layered on the walls"
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always use `<dt>` as a child of a `<dl>` element or a `<div>` that is a child of a `<dl>`.
/// - The `<dt>` element should be followed by a `<dd>` element or another `<dt>` element.
/// - Multiple `<dt>` elements in a row indicate multiple terms defined by the next `<dd>` element.
///
public struct DescriptionTerm: Element {
    /// The HTML tag name
    public static var tag: String { "dt" }
    
    /// Creates a new DescriptionTerm element.
    public init(
        
    ) {
        
    }
}

/// Lowercase typealias for creating DescriptionTerm elements with a more HTML-like syntax.
public typealias dt = DescriptionTerm
