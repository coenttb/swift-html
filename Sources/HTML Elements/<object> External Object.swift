///
/// <object> External Object.swift
/// swift-html
///
/// Represents the HTML object element.
///
/// Created by Claude on 09/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML `<object>` element, which embeds external resources such as images, 
/// audio, video, PDFs, or content to be handled by browser plugins.
///
/// The Object element provides a versatile way to include external content in a web page.
/// It can be used for multimedia, PDFs, web pages, Flash (legacy), and more. The element
/// also supports fallback content for browsers that cannot display the resource.
///
/// ## Example
///
/// ```swift
/// object(
///     data: "document.pdf",
///     type: .pdf,
///     width: 600,
///     height: 400
/// ) {
///     p {
///         "Your browser doesn't support PDFs. "
///         a(href: "document.pdf") {
///             "Download the PDF"
///         }
///         " instead."
///     }
/// }
/// ```
///
/// ## Best Practices
///
/// - Always provide fallback content within the object for browsers that can't render the resource
/// - Specify both data and type attributes whenever possible
/// - Set width and height attributes to prevent layout shifts
/// - Consider accessibility implications - ensure content is accessible to all users
/// - For images, audio, or video, prefer the specialized elements (<img>, <audio>, <video>)
/// - For modern web applications, avoid using object for Flash content
///
public struct ExternalObject: Element {
    /// The HTML tag name
    public static var tag: String { "object" }
    
    /// The URL of the resource to embed
    public var data: HTML_Attributes.ObjectData?
    
    /// The content type (MIME type) of the embedded resource
    public var type: HTML_Attributes.ObjectType?
    
    /// The form element that the object is associated with
    public var form: HTML_Attributes.ObjectForm?
    
    /// The name of the browsing context or control
    public var name: HTML_Attributes.Name?
    
    /// The height of the object in pixels
    public var height: HTML_Attributes.Height?
    
    /// The width of the object in pixels
    public var width: HTML_Attributes.Width?
    
    /// Specifies an image map for the object
    public var usemap: HTML_Attributes.Usemap?
    
    /// Creates a new object element with the specified attributes.
    ///
    /// - Parameters:
    ///   - data: The URL of the resource to embed
    ///   - type: The MIME type of the resource
    ///   - form: The ID of the form element this object is associated with
    ///   - name: The name of the object
    ///   - height: The height of the object in pixels
    ///   - width: The width of the object in pixels
    ///   - usemap: Reference to an image map
    public init(
        data: HTML_Attributes.ObjectData? = nil,
        type: HTML_Attributes.ObjectType? = nil,
        form: HTML_Attributes.ObjectForm? = nil,
        name: HTML_Attributes.Name? = nil,
        height: HTML_Attributes.Height? = nil,
        width: HTML_Attributes.Width? = nil,
        usemap: HTML_Attributes.Usemap? = nil
    ) {
        self.data = data
        self.type = type
        self.form = form
        self.name = name
        self.height = height
        self.width = width
        self.usemap = usemap
        
    }
}

/// Lowercase typealias for creating Object elements with a more HTML-like syntax.
public typealias object = ExternalObject
