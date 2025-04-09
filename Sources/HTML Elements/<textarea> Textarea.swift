///
/// <textarea> Textarea.swift
/// swift-html
///
/// Represents the HTML textarea element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML textarea element (`<textarea>`), which is a multi-line plain-text editing control.
///
/// The `Textarea` struct provides a type-safe way to create HTML textarea elements, useful when
/// you want to allow users to enter sizeable amounts of free-form text, such as comments or feedback.
///
/// ## Example
///
/// ```swift
/// form {
///     label(for: "story") { "Tell us your story:" }
///     textarea(id: "story", name: "story", rows: 5, cols: 33) {
///         "It was a dark and stormy night..."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always associate a `<textarea>` with a `<label>` using the `for` attribute for accessibility
/// - Specify `rows` and `cols` attributes for consistent sizing across browsers
/// - Consider using `maxlength` and `minlength` to control the amount of text users can enter
/// - Use `placeholder` as a hint, but not as a replacement for a proper label
/// - Use CSS for styling rather than relying on HTML attributes
/// - Consider disabling textarea resizing with CSS `resize: none` if needed
///
public struct Textarea<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "textarea" }
    
    /// Controls whether inputted text is automatically capitalized
    public var autocapitalize: HTML_Attributes.Autocapitalize?
    
    /// Controls whether entered text can be automatically completed by the browser
    public var autocomplete: HTML_Attributes.Autocomplete?
    
    /// Controls automatic spelling correction while editing
    public var autocorrect: HTML_Attributes.Autocorrect?
    
    /// Automatically focus the control when page loads
    public var autofocus: HTML_Attributes.Autofocus?
    
    /// The visible width of the text control, in average character widths
    public var cols: Int?
    
    /// Indicates the text directionality of the element contents
    public var dirname: HTML_Attributes.Dirname?
    
    /// Whether the control is disabled
    public var disabled: HTML_Attributes.Disabled?
    
    /// Associates the control with a form element
    public var form: HTML_Attributes.Form.ID?
    
    /// The element's ID
    public var id: HTML_Attributes.Id?
    
    /// Maximum number of characters allowed
    public var maxlength: HTML_Attributes.Maxlength?
    
    /// Minimum number of characters required
    public var minlength: HTML_Attributes.Minlength?
    
    /// Name of the control
    public var name: HTML_Attributes.Name?
    
    /// Hint to the user of what can be entered
    public var placeholder: HTML_Attributes.Placeholder?
    
    /// Whether the control is read-only
    public var readonly: HTML_Attributes.Readonly?
    
    /// Whether the control is required
    public var required: HTML_Attributes.Required?
    
    /// The number of visible text lines
    public var rows: Int?
    
    /// Whether the textarea is subject to spell-checking
    public var spellcheck: HTML_Attributes.Spellcheck?
    
    /// Indicates how the control wraps text for form submission
    public var wrap: TextareaWrap?
    
    /// The element's content (initial text value)
    public let content: () -> HTML
    
    /// Creates a new Textarea element with the specified attributes.
    ///
    /// - Parameters:
    ///   - autocapitalize: Controls how text input is automatically capitalized
    ///   - autocomplete: Controls browser's autocomplete feature
    ///   - autocorrect: Controls automatic spelling correction
    ///   - autofocus: Whether control should automatically get focus
    ///   - cols: Width of the control in character widths
    ///   - dirname: For text directionality
    ///   - disabled: Whether the control is disabled
    ///   - form: ID of the form this element belongs to
    ///   - id: Unique identifier for the element
    ///   - maxlength: Maximum allowed character count
    ///   - minlength: Minimum required character count
    ///   - name: Name of the control for form submission
    ///   - placeholder: Text hint shown when field is empty
    ///   - readonly: Whether field is read-only
    ///   - required: Whether field is required
    ///   - rows: Height of control in number of text lines
    ///   - spellcheck: Whether spelling should be checked
    ///   - wrap: How text should wrap for form submission
    ///   - content: The initial text content of the textarea
    public init(
        autocapitalize: HTML_Attributes.Autocapitalize? = nil,
        autocomplete: HTML_Attributes.Autocomplete? = nil,
        autocorrect: HTML_Attributes.Autocorrect? = nil,
        autofocus: HTML_Attributes.Autofocus? = nil,
        cols: Int? = nil,
        dirname: HTML_Attributes.Dirname? = nil,
        disabled: HTML_Attributes.Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil,
        id: HTML_Attributes.Id? = nil,
        maxlength: HTML_Attributes.Maxlength? = nil,
        minlength: HTML_Attributes.Minlength? = nil,
        name: HTML_Attributes.Name? = nil,
        placeholder: HTML_Attributes.Placeholder? = nil,
        readonly: HTML_Attributes.Readonly? = nil,
        required: HTML_Attributes.Required? = nil,
        rows: Int? = nil,
        spellcheck: HTML_Attributes.Spellcheck? = nil,
        wrap: TextareaWrap? = nil,
        content: @escaping () -> HTML
    ) {
        self.autocapitalize = autocapitalize
        self.autocomplete = autocomplete
        self.autocorrect = autocorrect
        self.autofocus = autofocus
        self.cols = cols
        self.dirname = dirname
        self.disabled = disabled
        self.form = form
        self.id = id
        self.maxlength = maxlength
        self.minlength = minlength
        self.name = name
        self.placeholder = placeholder
        self.readonly = readonly
        self.required = required
        self.rows = rows
        self.spellcheck = spellcheck
        self.wrap = wrap
        self.content = content
    }
}

/// Lowercase typealias for creating Textarea elements with a more HTML-like syntax.
public typealias textarea = Textarea

