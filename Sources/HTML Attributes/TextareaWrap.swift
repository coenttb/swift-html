//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

/// Indicates how a textarea should wrap text for form submission.
///
/// The `TextareaWrap` attribute is used with the `<textarea>` element to specify
/// how the content should be wrapped when submitting the form.
///
/// ## Values
///
/// - `.hard`: The browser inserts line breaks so that each line is no longer than the width
///            of the control; requires the `cols` attribute to be specified.
/// - `.soft`: The browser ensures all line breaks are CR+LF pairs, but doesn't add any additional ones.
///
public struct TextareaWrap: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "wrap"
    
    /// The wrap value
    private let value: String
    
    /// Initialize with a wrap value
    public init(_ value: String) {
        self.value = value
    }
    
    /// Line breaks are automatically inserted
    public static let hard = TextareaWrap("hard")
    
    /// Line breaks are not automatically inserted
    public static let soft = TextareaWrap("soft")
}

extension TextareaWrap: CustomStringConvertible {
    /// Returns the string representation of the wrap value
    public var description: String {
        return self.value
    }
}
