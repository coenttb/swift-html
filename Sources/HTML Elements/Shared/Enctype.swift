///
/// Enctype.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes
import PointFreeHTML

/// An attribute that specifies how form data should be encoded when submitted.
///
/// The `enctype` attribute defines the MIME type of the form submission. It is only
/// relevant when the form's method is POST, as it determines how the form data is
/// encoded before sending it to the server.
///
/// ## Available Encoding Types
///
/// - `application/x-www-form-urlencoded` (default): Standard form encoding
/// - `multipart/form-data`: Required for file uploads
/// - `text/plain`: Minimal encoding, useful for debugging
///
/// ## Encoding Type Characteristics
///
/// ### application/x-www-form-urlencoded
/// - Default encoding if enctype is not specified
/// - All characters are encoded (spaces converted to "+" and special characters to hex values)
/// - Form data is sent as a single block in the request body
/// - Format is similar to URL query parameters: `name1=value1&name2=value2`
/// - Not suitable for file uploads
///
/// ### multipart/form-data
/// - Required for forms that include file uploads
/// - Form data is sent in multiple parts, each with its own MIME type
/// - Preserves filenames, content types, and binary data
/// - More overhead than other encodings
/// - Used with `<input type="file">` elements
///
/// ### text/plain
/// - Minimal encoding (spaces remain spaces, no special character encoding)
/// - Each form field is sent on a new line
/// - Primarily useful for debugging, not recommended for production
/// - Format is: `name1=value1\r\nname2=value2`
///
/// ## Usage Notes
///
/// - Only applies to forms using the POST method
/// - Can be overridden by `formenctype` attributes on submit buttons
/// - Always use `multipart/form-data` when the form includes file uploads
/// - For most forms without file uploads, the default encoding is sufficient
///
/// ## Examples
///
/// ```swift
/// // Form with default encoding
/// HTML.form.action("/submit").method(.post)
///
/// // Form with file uploads
/// HTML.form.action("/upload").method(.post).enctype(.multipartFormData)
///
/// // Form for debugging
/// HTML.form.action("/debug").method(.post).enctype(.textPlain)
///
/// // Using string value
/// HTML.form.enctype("multipart/form-data")
/// ```
public struct Enctype: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "enctype"
    
    /// The encoding type value
    private let value: String
    
    /// Initialize with an encoding type value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Initialize with a predefined encoding type
    public init(_ type: EncodingType) {
        self.value = type.rawValue
    }
    
    /// Predefined form encoding types
    public enum EncodingType: String {
        /// Standard form encoding (default)
        case urlEncoded = "application/x-www-form-urlencoded"
        
        /// Required for file uploads
        case multipartFormData = "multipart/form-data"
        
        /// Minimal encoding, useful for debugging
        case textPlain = "text/plain"
    }
    
    /// Standard form encoding (default)
    public static let urlEncoded: Self = Self(.urlEncoded)
    
    /// Required for file uploads
    public static let multipartFormData: Self = Self(.multipartFormData)
    
    /// Minimal encoding, useful for debugging
    public static let textPlain: Self = Self(.textPlain)
}

extension Enctype: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension Enctype: CustomStringConvertible {
    /// Returns the string representation of the encoding type
    public var description: String {
        return self.value
    }
}

extension HTML {
    /// Add an enctype attribute to specify the form data encoding type
    @discardableResult
    public func enctype(
        _ value: Enctype?
    ) -> _HTMLAttributes<Self> {
        self.attribute(Enctype.attribute, value?.description)
    }
//    
//    /// Add an enctype attribute with a string value
//    @discardableResult
//    public func enctype(
//        _ value: String
//    ) -> _HTMLAttributes<Self> {
//        self.attribute(Enctype.attribute, value)
//    }
//    
//    /// Add an enctype attribute with a predefined encoding type
//    @discardableResult
//    public func enctype(
//        _ type: Enctype.EncodingType
//    ) -> _HTMLAttributes<Self> {
//        self.enctype(Enctype(type))
//    }
//    
//    /// Create a file upload form with the required enctype
//    @HTMLBuilder
//    public static func fileUploadForm(
//        action: String,
//        @HTMLBuilder content: () -> some HTML
//    ) -> some HTML {
//        form {
//            content()
//        }
//            .action(action)
//            .method(.post)
//            .enctype(.multipartFormData)
//    }
}
