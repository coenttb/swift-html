///
/// Novalidate.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes
import PointFreeHTML

/// An attribute that disables browser validation for form submissions.
///
/// The `novalidate` boolean attribute, when present, indicates that the form should not be
/// validated when submitted. This allows you to bypass the browser's built-in validation
/// features and handle validation yourself, typically with JavaScript.
///
/// ## Client-Side Validation
///
/// Modern browsers automatically validate form elements based on their attributes:
///
/// - Required fields (`required` attribute)
/// - Email format (`type="email"`)
/// - URL format (`type="url"`)
/// - Number constraints (`min`, `max`, `step` attributes)
/// - Text length (`minlength`, `maxlength` attributes)
/// - Pattern matching (`pattern` attribute)
///
/// The `novalidate` attribute lets you opt out of this built-in validation.
///
/// ## Use Cases
///
/// Disabling browser validation is useful when:
///
/// - You need custom validation rules that browser validation doesn't support
/// - You want to implement custom error messages or styling
/// - You're handling validation on the server side only
/// - You need to allow formats that browser validation would reject
/// - You need to submit a form with intentionally invalid data (e.g., for saving drafts)
///
/// ## Security Considerations
///
/// When using `novalidate`:
///
/// - Always implement proper server-side validation
/// - Client-side validation should be considered a UX enhancement, not a security feature
/// - Remember that users can bypass client-side validation regardless of this attribute
///
/// ## Usage Notes
///
/// - This is a boolean attribute, so its presence enables the feature
/// - Can be overridden by `formnovalidate` on submit buttons for specific submission paths
/// - Still fires form validation events that can be handled via JavaScript
/// - Doesn't prevent custom JavaScript validation you implement yourself
///
/// ## Examples
///
/// ```swift
/// // Form with browser validation disabled
/// HTML.form.action("/submit").method(.post).novalidate
///
/// // Form with validation, but a specific submit button that bypasses validation
/// HTML.form.action("/submit").method(.post") {
///     // Form fields with validation attributes...
///     input().type(.submit).value("Save as Draft").formnovalidate
/// }
/// ```
public enum Novalidate: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "novalidate"
}

extension Novalidate: CustomStringConvertible {
    /// Returns the string representation of the novalidate attribute
    public var description: String {
        switch self {
            
        }
    }
}

extension HTML {
    /// Add the novalidate attribute to disable browser validation for a form
    public var novalidate: _HTMLAttributes<Self> {
        self.attribute(Novalidate.attribute)
    }
//    
//    /// Add the novalidate attribute to disable browser validation for a form
//    @discardableResult
//    public var novalidate: _HTMLAttributes<Self> {
//        self.attribute(Novalidate.attribute, "")
//    }
//    
//    /// Add the formnovalidate attribute to a submit button or input
//    @discardableResult
//    public var formnovalidate: _HTMLAttributes<Self> {
//        self.attribute("formnovalidate", "")
//    }
//    
//    /// Create a form with validation disabled
//    public static func novalidateForm(
//        action: String,
//        method: String = "post",
//        @HTMLBuilder content: () -> HTML
//    ) -> HTML {
//        form()
//            .action(action)
//            .method(method)
//            .novalidate
//            .content(content)
//    }
}
