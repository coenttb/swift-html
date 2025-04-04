///
/// Action.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// An attribute that specifies the URL for form submission.
///
/// The `action` attribute defines the URL where the form's data should be sent when submitted.
/// This URL processes the form data and typically responds with a success or error page.
///
/// ## Processing Types
///
/// The action URL can point to:
///
/// - Server-side scripts or endpoints (e.g., `/submit`, `/process-form`)
/// - Full URLs to external services (e.g., `https://example.com/api/submit`)
/// - Relative paths within the same site (e.g., `contact-success.html`)
/// - Email addresses using `mailto:` protocol (not recommended for modern forms)
///
/// ## Usage Notes
///
/// - If the action attribute is omitted, the form submits to the current page's URL
/// - The action can be overridden by a `formaction` attribute on submit buttons
/// - This attribute is ignored when `method="dialog"` is used
/// - For security, always validate and sanitize form data on the server, regardless of client-side validation
/// - Consider using HTTPS URLs for form submission to protect user data
///
/// ## Form Alternatives
///
/// Modern web applications often use JavaScript to handle form submission instead of traditional form actions:
///
/// - AJAX-based form handling can provide a smoother user experience
/// - Single-page applications might use client-side routing and API calls
/// - For these approaches, set `action` to a fallback URL for non-JavaScript environments
///
/// ## Examples
///
/// ```swift
/// // Basic form with action
/// HTML.form.action("/submit").method("post")
///
/// // Form with action URL and additional attributes
/// HTML.form.action("https://example.com/process").method(.post).enctype(.multipartFormData)
///
/// // Form with hash URL for client-side handling
/// HTML.form.action("#").method("post").attribute("onsubmit", "return handleForm(this);")
///
/// // Form with no explicit action (submits to current URL)
/// HTML.form.method("post")
/// ```
public struct Action: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "action"
    
    /// The URL for form submission
    private let url: String
    
    /// Initialize with a URL string
    public init(_ url: String) {
        self.url = url
    }
    
    /// Initialize with a URL object
    public init(_ url: URL) {
        self.url = url.absoluteString
    }
    
    /// Creates a relative URL action within the same domain
    public static func relative(_ path: String) -> Action {
        // Make sure the path starts with a slash if it's not already
        let formattedPath = path.hasPrefix("/") ? path : "/\(path)"
        return Action(formattedPath)
    }
    
    /// Creates an absolute URL action to an external service
    public static func absolute(_ url: String) -> Action {
        return Action(url)
    }
    
    /// Creates an action pointing to the current page
    public static let current: Action = Action(".")
    
    /// Creates an action for client-side handling (no server submission)
    public static let clientSide: Action = Action("#")

}

extension Action: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.url = value
    }
}

extension Action: CustomStringConvertible {
    /// Returns the string representation of the action URL
    public var description: String {
        return self.url
    }
}

