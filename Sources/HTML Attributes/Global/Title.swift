///
/// Title.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Provides advisory information related to an element.
///
/// The `title` global attribute contains text representing advisory information related to the
/// element it belongs to. In most browsers, this text is displayed as a tooltip when the user
/// hovers over the element, although this behavior is inconsistent across browsers and devices.
///
/// While the `title` attribute can be applied to any HTML element, it has several specific
/// use cases where it's particularly important:
///
/// - Labeling `<iframe>` elements for assistive technology
/// - Providing the full expansion of abbreviations in `<abbr>` elements
/// - Creating alternate stylesheets when used with `<link rel="stylesheet">`
/// - Labeling controls in data tables
///
/// ## Accessibility Considerations
///
/// The `title` attribute has significant accessibility limitations:
/// 
/// - **Not accessible on touch devices**: Tooltips don't appear on touch-only devices
/// - **Not accessible via keyboard navigation**: Users can't easily access tooltips with keyboards
/// - **Inconsistent with assistive technology**: Screen readers may or may not announce title content
/// - **Difficult for users with motor impairments**: Requires precise pointer control
/// - **Not visible by default**: Content is hidden until mouse hover
///
/// For these reasons, avoid relying solely on the `title` attribute for important information.
/// Consider more accessible alternatives like visible text, aria-label, or custom tooltips.
///
/// ## Usage Notes
///
/// - Content can be multiline (linebreaks are represented by `\n` characters)
/// - If not specified, elements inherit title from their parent element
/// - Setting title="" prevents inheriting titles from ancestors
/// - For `<iframe>` elements, a descriptive title is important for accessibility
/// - For `<abbr>` elements, the title should be the full expansion of the abbreviation
/// - For form elements, prefer `<label>` over title for accessibility
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <div title="Additional information">Hover over me</div>
/// ```
///
/// For iframes (recommended use case):
/// ```html
/// <iframe title="Introduction to HTML" src="https://example.com/html-intro"></iframe>
/// ```
///
/// For abbreviations:
/// ```html
/// <abbr title="HyperText Markup Language">HTML</abbr>
/// ```
///
/// Multiline title:
/// ```html
/// <span title="First line of information
/// Second line of information">Hover for multiline info</span>
/// ```
///
/// Preventing title inheritance:
/// ```html
/// <div title="Parent tooltip">
///   <p>This inherits the parent's title</p>
///   <p title="">This has no tooltip</p>
/// </div>
/// ```
public struct Title: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "title"
    
    /// The title text
    private let value: String
    
    /// Initialize with title text
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with multiline title text
    public init(lines: [String]) {
        self.value = lines.joined(separator: "\n")
    }
    
    /// Initialize with multiline title text as variadic parameters
    public init(lines: String...) {
        self.value = lines.joined(separator: "\n")
    }
    
    /// Creates an empty title to prevent inheriting from ancestors
    public static let empty = Title("")
}

extension Title: CustomStringConvertible {
    /// Returns the string representation of the title value
    public var description: String {
        return self.value
    }
}

extension Title: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension HTML {
    /// Sets the title attribute with text
    @discardableResult
    public func title(
        _ value: String
    ) -> _HTMLAttributes<Self> {
        self.attribute(Title.attribute, value)
    }
    
    /// Sets the title attribute with multiline text
    @discardableResult
    public func title(
        lines: [String]
    ) -> _HTMLAttributes<Self> {
        self.attribute(Title.attribute, lines.joined(separator: "\n"))
    }
    
    /// Sets the title attribute with multiline text as variadic parameters
    @discardableResult
    public func title(
        lines: String...
    ) -> _HTMLAttributes<Self> {
        self.title(lines: lines)
    }
    
    /// Sets the title attribute using a Title struct
    @discardableResult
    public func title(
        _ attribute: Title
    ) -> _HTMLAttributes<Self> {
        self.attribute(Title.attribute, attribute.description)
    }
    
    /// Sets an empty title to prevent inheriting from ancestors
    @discardableResult
    public func noTitle() -> _HTMLAttributes<Self> {
        self.title(Title.empty)
    }
}
