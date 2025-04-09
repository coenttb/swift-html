///
/// <template> Content Template.swift
/// swift-html
///
/// Represents the HTML template element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML template element (`<template>`), which serves as a mechanism for holding
/// HTML fragments that are not rendered but can be used later via JavaScript or for creating shadow DOM.
///
/// The `ContentTemplate` struct provides a type-safe way to create HTML template elements that
/// can contain content that is not immediately rendered. This is particularly useful for client-side
/// templating and web components.
///
/// ## Example
///
/// ```swift
/// template(id: "productrow") {
///     tr {
///         td(class: "record") { }
///         td { }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Use the `id` attribute to easily reference the template from JavaScript
/// - Templates are not rendered by default; their content is accessed via JavaScript
/// - For web components, use templates with shadow DOM for encapsulation
/// - Include complete, valid HTML fragments inside templates
/// - Remember that CSS styles inside a template are not applied until the template is cloned and inserted into the document
/// - Consider using declarative shadow DOM by specifying `shadowrootmode` attribute when appropriate
///
public struct ContentTemplate: Element {
    /// The HTML tag name
    public static var tag: String { "template" }

    /// Creates a shadow root for the parent element in "open" or "closed" mode
    public var shadowrootmode: HTML_Attributes.ShadowRootMode?
    
    /// When true, cloning the shadow host will include a shadow root in the copy
    public var shadowrootclonable: HTML_Attributes.ShadowRootClonable?
    
    /// When true, focus is delegated to the first focusable element in the shadow tree
    public var shadowrootdelegatesfocus: HTML_Attributes.ShadowRootDelegatesFocus?
    
    /// Creates a new ContentTemplate element with the specified attributes.
    ///
    /// - Parameters:
    ///   - shadowrootmode: Specifies "open" or "closed" mode for declarative shadow DOM
    ///   - shadowrootclonable: Whether shadow roots are cloned with their hosts
    ///   - shadowrootdelegatesfocus: Whether focus should be delegated in the shadow tree
    public init(
        shadowrootmode: HTML_Attributes.ShadowRootMode? = nil,
        shadowrootclonable: HTML_Attributes.ShadowRootClonable? = nil,
        shadowrootdelegatesfocus: HTML_Attributes.ShadowRootDelegatesFocus? = nil
    ) {
        self.shadowrootmode = shadowrootmode
        self.shadowrootclonable = shadowrootclonable
        self.shadowrootdelegatesfocus = shadowrootdelegatesfocus
        
    }
}

/// Lowercase typealias for creating ContentTemplate elements with a more HTML-like syntax.
public typealias template = ContentTemplate

