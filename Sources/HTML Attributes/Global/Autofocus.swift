///
/// Autofocus.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Specifies that an element should be focused when the page loads or when a dialog containing
/// the element is displayed.
///
/// The `autofocus` attribute is a Boolean attribute that can be applied to any HTML element,
/// not just form controls. For example, it can be used on a `contenteditable` area.
///
/// ## Usage Notes
///
/// - Only one element in the document or dialog may have the `autofocus` attribute
/// - If multiple elements have the attribute, the first one will receive focus
/// - This attribute can be applied to any element, not just form controls
///
/// ## Accessibility Concerns
///
/// Automatically focusing a form control can cause usability issues:
/// - It can confuse visually-impaired people using screen-reading technology
/// - It can cause confusion for people with cognitive impairments
/// - When autofocus is assigned, screen-readers "teleport" their user to the form control without warning
/// - It can cause the page to scroll on load
/// - It may trigger dynamic keyboards to display on some touch devices
/// - Users may miss important content that precedes the autofocused element
///
/// ## Examples
///
/// ```html
/// <!-- Basic usage on an input field -->
/// <input name="q" autofocus />
///
/// <!-- On a textarea -->
/// <textarea autofocus></textarea>
///
/// <!-- On a contenteditable element -->
/// <div contenteditable autofocus>Editable content</div>
///
/// <!-- In a dialog -->
/// <dialog>
///   <form>
///     <input type="text" autofocus />
///     <button type="submit">Submit</button>
///   </form>
/// </dialog>
/// ```
public enum Autofocus: Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "autofocus"
}

extension Autofocus {
    /// Returns the string representation of the autofocus value
    public var description: String {
        switch self {
            
        }
    }
}

extension HTML {
    public var autofocus: _HTMLAttributes<Self> {
        self.attribute(Autofocus.attribute)
    }
}

