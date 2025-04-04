///
/// Hidden.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Indicates that the browser should not render the contents of the element.
///
/// The `hidden` global attribute is an enumerated attribute that specifies whether an element
/// should be hidden from the user. It can be used to hide elements that are not currently relevant
/// to the page or that are reserved for future use (for example, elements that can't be used until
/// the login process has been completed).
///
/// When an element is hidden, it is removed from the rendering tree and not displayed to the user.
/// This applies to all presentations, including screen readers. However, descendants of hidden elements
/// remain active, meaning script elements can still execute and form elements can still submit.
///
/// ## States
///
/// The hidden attribute has two possible states:
///
/// - **Hidden state**: The element is completely hidden from presentation (typically implemented with `display: none`)
/// - **Hidden until found state**: The element is hidden but can be revealed by the browser's "find in page"
///   feature or fragment navigation (typically implemented with `content-visibility: hidden`)
///
/// ## Usage Notes
///
/// - Can be applied to any HTML element
/// - Should not be used to hide content from only one presentation - hidden content is hidden from all presentations
/// - Hidden elements shouldn't be linked from non-hidden elements
/// - Web browsers typically implement the hidden state using `display: none`, which means:
///   - The element will not participate in page layout
///   - CSS that sets `display` to a value other than `none` will override the hidden attribute
/// - Elements in the hidden until found state:
///   - Will participate in page layout
///   - Will have margin, borders, padding, and background rendered
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <!-- Completely hide content -->
/// <p hidden>This content is not currently relevant.</p>
///
/// <!-- The following are equivalent -->
/// <div hidden>Hidden content</div>
/// <div hidden="">Also hidden content</div>
/// <div hidden="hidden">Hidden too</div>
/// ```
///
/// Using the until-found value (experimental):
/// ```html
/// <!-- Hidden but discoverable by search or fragment navigation -->
/// <div id="details" hidden="until-found">
///   These details are hidden until found by search or fragment navigation.
/// </div>
///
/// <!-- Link to the hidden content -->
/// <a href="#details">Show details</a>
/// ```
public enum Hidden: String, Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "hidden"
    
    /// Content is completely hidden (empty string value)
    ///
    /// Example:
    /// ```html
    /// <div hidden="">Hidden content</div>
    /// ```
    case empty = ""
    
    /// Content is completely hidden
    ///
    /// Example:
    /// ```html
    /// <div hidden="hidden">Hidden content</div>
    /// ```
    case hidden = "hidden"
    
    /// Content is hidden but discoverable by search or fragment navigation (experimental)
    ///
    /// When the browser's "find in page" feature or fragment navigation targets an element
    /// with this value, the browser will:
    /// 1. Fire a `beforematch` event on the hidden element
    /// 2. Remove the hidden attribute from the element
    /// 3. Scroll to the element
    ///
    /// Example:
    /// ```html
    /// <div id="section3" hidden="until-found">Hidden until found</div>
    /// ```
    case untilFound = "until-found"
}

extension Hidden: CustomStringConvertible {
    /// Returns the string representation of the hidden value
    public var description: String {
        return self.rawValue
    }
}
