///
/// <dfn> Definition.swift
/// swift-html
///
/// Represents the HTML Definition element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML Definition element (`<dfn>`), which indicates a term being defined.
///
/// The `<dfn>` element should be used in a complete definition statement, where the full definition 
/// of the term can be in one of the following:
/// - The ancestor paragraph (a block of text, sometimes marked by a `<p>` element)
/// - The `<dt>`/`<dd>` pairing
/// - The nearest section ancestor of the `<dfn>` element
///
/// ## Specifying the Term Being Defined
///
/// The term being defined is identified following these rules:
///
/// 1. If the `<dfn>` element has a `title` attribute, the value of the title attribute is considered 
///    to be the term being defined.
/// 2. If the `<dfn>` contains a single child element and does not have any text content of its own, 
///    and the child element is an `<abbr>` element with a title attribute itself, then the exact value 
///    of the `<abbr>` element's title is the term being defined.
/// 3. Otherwise, the text content of the `<dfn>` element is the term being defined.
///
/// ## Example
///
/// ```swift
/// dfn {
///     "validator"
/// }
/// ```
///
/// ## Linking to Definitions
///
/// If you include an `id` attribute on the `<dfn>` element, you can then link to it using `<a>` elements.
/// Such links should be uses of the term, with the intent being that the reader can quickly navigate to 
/// the term's definition.
///
/// ## Using Abbreviations
///
/// In some cases, you may wish to use an abbreviation for a term when defining it. This can be done by 
/// using the `<dfn>` and `<abbr>` elements together.
///
public struct Definition<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "dfn" }
    
    /// Title attribute that has special meaning with the `<dfn>` element.
    /// If present, its value is considered to be the term being defined.
    public var title: HTML_Attributes.Title?
    
    /// The element's content
    public let content: () -> HTML
    
    /// Creates a new Definition element with the specified content.
    ///
    /// - Parameters:
    ///   - title: If present, its value is considered to be the term being defined
    ///   - content: The content of the element
    public init(
        title: HTML_Attributes.Title? = nil,
        content: @escaping () -> HTML
    ) {
        self.title = title
        self.content = content
    }
}

/// Lowercase typealias for creating Definition elements with a more HTML-like syntax.
public typealias dfn = Definition