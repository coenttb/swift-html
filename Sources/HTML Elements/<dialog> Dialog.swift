///
/// <dialog> Dialog.swift
/// swift-html
///
/// Represents the HTML dialog element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML dialog element (`<dialog>`), which provides a modal or non-modal dialog box or other interactive component.
///
/// The `Dialog` struct provides a type-safe way to create HTML dialog elements with various attributes.
///
/// ## Examples
///
/// ```swift
/// dialog {
///     "Dialog content"
/// }
/// 
/// dialog(open: .init()) {
///     "This dialog is initially open"
///     form(method: .dialog) {
///         button {
///             "OK"
///         }
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - For modal dialogs, use JavaScript's `showModal()` method rather than the `open` attribute
/// - Include a mechanism to close the dialog (like a button with `method="dialog"`)
/// - Add the `autofocus` attribute to the element users should interact with first
/// - Do not add the `tabindex` attribute to the dialog element itself
/// - Ensure the dialog can be closed via the "Escape" key (handled automatically for modal dialogs)
///
/// ## Accessibility Considerations
///
/// - Set initial focus correctly with the `autofocus` attribute
/// - Always provide an explicit close button or mechanism
/// - Modal dialogs automatically make content outside inert, but care should be taken with non-modal dialogs
/// - When the dialog is opened with `showModal()`, it automatically gets `aria-modal="true"`
///
public struct Dialog: Element {
    /// The HTML tag name
    public static var tag: String { "dialog" }
    
    /// Indicates that the dialog box is active and available for interaction
    ///
    /// When the `open` attribute is not set, the dialog box will not be visible.
    /// It is recommended to use JavaScript's `showModal()` or `show()` methods
    /// rather than this attribute to display dialogs.
    public var open: Open?
    
    /// Creates a new Dialog element with the specified attributes.
    ///
    /// - Parameters:
    ///   - open: Indicates if the dialog is initially open
    public init(
        open: Open? = nil
    ) {
        self.open = open
        
    }
}

/// Lowercase typealias for creating Dialog elements with a more HTML-like syntax.
public typealias dialog = Dialog
