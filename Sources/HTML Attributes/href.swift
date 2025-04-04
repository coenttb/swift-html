///
/// href.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation

/// An attribute that specifies the URL that a hyperlink points to.
///
/// The `href` attribute is most commonly used on `<a>` elements to create hyperlinks,
/// but it's also used on several other elements like `<area>`, `<base>`, and `<link>`.
/// It defines the destination URL that the element links to.
///
/// ## Supported URL Schemes
///
/// Links are not restricted to HTTP-based URLs; they can use any URL scheme supported by browsers:
///
/// - HTTP and HTTPS URLs (e.g., `https://example.com`)
/// - Telephone numbers with `tel:` URLs (e.g., `tel:+1-234-567-8910`)
/// - Email addresses with `mailto:` URLs (e.g., `mailto:example@example.com`)
/// - SMS text messages with `sms:` URLs (e.g., `sms:+1-234-567-8910`)
/// - Local file paths with `file:` URLs (e.g., `file:///path/to/file.html`)
/// - Executable code with `javascript:` URLs (not recommended for security reasons)
///
/// ## URL Features
///
/// URLs can also include features to locate specific parts of the resource:
///
/// - Document fragments with hash symbols (e.g., `#section-id`)
/// - Specific text portions with text fragments (e.g., `#:~:text=Search%20Text`)
/// - Media fragments to specify time ranges in media files (e.g., `#t=10,20`)
///
/// ## Usage Notes
///
/// - For security reasons, use caution when creating links to `javascript:` URLs.
/// - When linking to external sites, consider using `rel="noopener"` to prevent security vulnerabilities.
/// - Links to non-HTTP protocols may not be supported by all browsers.
/// - Use absolute URLs when linking across domains and relative URLs for same-domain links.
/// - Empty `href` values (`href=""`) or omitted `href` attributes make the element act as a placeholder.
///
/// ## Examples
///
/// ```swift
/// // Basic external link
/// HTML.a.href("https://example.com").text("Visit Example.com")
///
/// // Link with a fragment
/// HTML.a.href("https://example.com/page#section").text("Go to Section")
///
/// // Email link
/// HTML.a.href(Href.email("example@example.com")).text("Contact Us")
///
/// // Phone link
/// HTML.a.href(Href.tel("123-456-7890")).text("Call Us")
///
/// // Relative link
/// HTML.a.href("/about").text("About Us")
/// ```
public struct Href: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "href"
    
    /// The URL value
    private let url: String
    
    /// Initialize with a URL string
    public init(_ url: String) {
        self.url = url
    }
    
    /// Initialize with a URL
    public init(_ url: URL) {
        self.url = url.absoluteString
    }
    
    /// Creates an email link (mailto:)
    public static func email(_ address: String, subject: String? = nil, body: String? = nil) -> Href {
        // Define a custom allowed character set that excludes ?, &, =, and other special chars
        var allowedCharacters = CharacterSet.urlQueryAllowed
        allowedCharacters.remove(charactersIn: "?&=+%")
        
        var url = "mailto:\(address)"
        
        if subject != nil || body != nil {
            url += "?"
            var queryParts: [String] = []
            
            if let subject = subject {
                // Properly encode the subject
                let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? subject
                queryParts.append("subject=\(encodedSubject)")
            }
            
            if let body = body {
                // Properly encode the body
                let encodedBody = body.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? body
                queryParts.append("body=\(encodedBody)")
            }
            
            url += queryParts.joined(separator: "&")
        }
        
        return Href(url)
    }
    
    /// Creates a telephone link (tel:)
    public static func tel(_ phoneNumber: String) -> Href {
        let formattedNumber = phoneNumber.replacingOccurrences(of: #"[^\d+]"#, with: "", options: .regularExpression)
        return Href("tel:\(formattedNumber)")
    }
    
    /// Creates an SMS link (sms:)
    public static func sms(_ phoneNumber: String, body: String? = nil) -> Href {
        let formattedNumber = phoneNumber.replacingOccurrences(of: #"[^\d+]"#, with: "", options: .regularExpression)
        
        if let body = body {
            // Define a custom allowed character set that excludes ?, &, =, and other special chars
            var allowedCharacters = CharacterSet.urlQueryAllowed
            allowedCharacters.remove(charactersIn: "?&=+%")
            
            // Properly encode the body
            let encodedBody = body.addingPercentEncoding(withAllowedCharacters: allowedCharacters) ?? body
            return Href("sms:\(formattedNumber)?body=\(encodedBody)")
        } else {
            return Href("sms:\(formattedNumber)")
        }
    }
    
    /// Creates a link with a fragment identifier (#section)
    public static func fragment(_ base: String, fragment: String) -> Href {
        let baseWithoutFragment = base.split(separator: "#")[0]
        let fragmentWithoutHash = fragment.hasPrefix("#") ? String(fragment.dropFirst()) : fragment
        return Href("\(baseWithoutFragment)#\(fragmentWithoutHash)")
    }
    
    /// Creates a link to a specific fragment on the current page
    public static func anchor(_ fragmentId: String) -> Href {
        let fragmentWithoutHash = fragmentId.hasPrefix("#") ? fragmentId : "#\(fragmentId)"
        return Href(fragmentWithoutHash)
    }
}

extension Href: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.url = value
    }
}

extension Href: CustomStringConvertible {
    /// Returns the string representation of the href value
    public var description: String {
        return self.url
    }
}

