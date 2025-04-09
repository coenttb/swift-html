///
/// <frame> Frame.swift
/// swift-html
///
/// Represents the HTML frame element.
///
/// Created by Coen ten Thije Boonkkamp on 05/04/2025.
///

import Foundation
import HTML_Attributes

/// Represents an HTML frame element (`<frame>`), which defines a particular area in which another HTML document can be displayed.
///
/// The `Frame` struct provides a type-safe way to create HTML frame elements with various attributes.
/// A frame should be used within a `<frameset>` element.
///
/// > Note: The `<frame>` element is deprecated in HTML5. Consider using `<iframe>` instead
/// > for better performance and accessibility.
///
/// ## Example
///
/// ```swift
/// frameset {
///     frame(src: "https://example.com/page1.html")
///     frame(src: "https://example.com/page2.html", name: "content")
/// }
/// ```
///
/// ## Best Practices
///
/// - Avoid using frames when possible due to accessibility issues
/// - Use `<iframe>` instead for embedding content within a document
/// - Always provide descriptive names for frames to improve navigation
///
public struct Frame: Element {
    /// The HTML tag name
    public static var tag: String { "frame" }
    
    /// The URL of the document to be displayed in the frame
    public var src: Src?
    
    /// A name for the frame, used for targeting links
    public var name: Name?
    
    /// Prevents user from resizing the frame
    public var noresize: NoResize?
    
    /// Controls scrollbar appearance
    public var scrolling: Scrolling?
    
    /// Margins between frames (height)
    public var marginheight: MarginHeight?
    
    /// Margins between frames (width)
    public var marginwidth: MarginWidth?
    
    /// Controls frame border appearance
    public var frameborder: FrameBorder?
    
    /// Creates a new Frame element with the specified attributes.
    ///
    /// - Parameters:
    ///   - src: URL of the document to display in the frame
    ///   - name: Name for the frame (for targeting links)
    ///   - noresize: Whether to prevent user resizing
    ///   - scrolling: Scrollbar appearance control
    ///   - marginheight: Height of margins between frames
    ///   - marginwidth: Width of margins between frames
    ///   - frameborder: Frame border appearance
    public init(
        src: Src? = nil,
        name: Name? = nil,
        noresize: NoResize? = nil,
        scrolling: Scrolling? = nil,
        marginheight: MarginHeight? = nil,
        marginwidth: MarginWidth? = nil,
        frameborder: FrameBorder? = nil
    ) {
        self.src = src
        self.name = name
        self.noresize = noresize
        self.scrolling = scrolling
        self.marginheight = marginheight
        self.marginwidth = marginwidth
        self.frameborder = frameborder
    }
}

/// Lowercase typealias for creating Frame elements with a more HTML-like syntax.
public typealias frame = Frame

/// Represents the marginheight attribute for frame elements.
public struct MarginHeight: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "marginheight"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
}

extension MarginHeight: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension MarginHeight: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension MarginHeight: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}

/// Represents the marginwidth attribute for frame elements.
public struct MarginWidth: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "marginwidth"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
}

extension MarginWidth: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension MarginWidth: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension MarginWidth: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}

/// Represents the frameborder attribute for frame elements.
public struct FrameBorder: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "frameborder"
    
    /// The attribute value
    private let value: String
    
    /// Initialize with a value
    public init(_ value: String) {
        self.value = value
    }
}

extension FrameBorder: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension FrameBorder: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.value = String(value)
    }
}

extension FrameBorder: CustomStringConvertible {
    /// Returns the string representation of the attribute value
    public var description: String {
        return self.value
    }
}

/// Represents the scrolling attribute for frame elements.
public enum Scrolling: String, Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "scrolling"
    
    /// Force scrollbars to appear even when not needed
    case yes
    
    /// Prevent scrollbars from appearing even when needed
    case no
    
    /// Allow browser to add scrollbars when necessary (default)
    case auto
}
