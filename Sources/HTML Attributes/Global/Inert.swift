///
/// Inert.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation
import PointFreeHTML

/// Indicates that the element and all its descendants should be made inert.
///
/// The `inert` global attribute is a Boolean attribute that makes an element and all of its
/// descendants "inert" or non-interactive. When an element is marked as inert, it and all its
/// descendants are removed from the tab order, excluded from the accessibility tree, and
/// cannot be interacted with.
///
/// Modal dialogs created with `showModal()` are a special case - they don't inherit inertness
/// from their ancestors and must have the inert attribute explicitly set on them to become inert.
///
/// ## Effects of Inert
///
/// When an element is inert:
///
/// - Click events are not fired when the user clicks on the element
/// - The element cannot receive focus
/// - Content within the element cannot be found with browser's find-in-page feature
/// - Text selection within the element is prevented (similar to `user-select: none`)
/// - Editable content in the element cannot be edited
/// - The element and its content are hidden from assistive technologies
///
/// ## Usage Notes
///
/// - Can be applied to any HTML element but is typically used for entire sections
/// - Use `disabled` attribute (not `inert`) for individual interactive controls
/// - Provide clear visual and non-visual indications of inert content to users
/// - Commonly used for:
///   - Disabling sections of a page during modal dialogs
///   - Making offscreen or hidden content truly inaccessible
///   - Creating non-interactive views of otherwise interactive content
///
/// ## Accessibility Concerns
///
/// The `inert` attribute has significant accessibility implications. By default, there is no
/// visual indication that content is inert. As a developer, you should:
///
/// - Clearly indicate which content is active and which is inert
/// - Remember that users may be zoomed into a small section of content
/// - Consider adding visual styling to inert content for clarity
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <!-- Make a section of content non-interactive -->
/// <div inert>
///   <button>This button cannot be clicked</button>
///   <a href="#">This link cannot be followed</a>
///   <input type="text" placeholder="This field cannot be edited">
/// </div>
/// ```
///
/// Common use case with modal dialogs:
/// ```html
/// <!-- When dialog is shown, make the rest of the page inert -->
/// <div id="page-content" inert>
///   <!-- All page content is non-interactive while dialog is open -->
/// </div>
///
/// <dialog open>
///   <h2>Important Dialog</h2>
///   <p>This dialog is interactive while the rest of the page is inert.</p>
///   <button onclick="closeDialog()">Close</button>
/// </dialog>
/// ```
public enum Inert: Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "inert"
}

extension Inert: CustomStringConvertible {
    /// Returns the string representation of the inert attribute
    public var description: String {
        return ""
    }
}

extension HTML {
    /// Sets the inert attribute, making the element and all its descendants non-interactive
    @discardableResult
    public func inert() -> _HTMLAttributes<Self> {
        self.attribute(Inert.attribute)
    }
}
//
