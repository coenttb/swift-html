///
/// ScriptType.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 09/04/2025.
///

import Foundation

/// Represents the HTML type attribute for the `<script>` element.
///
/// The `type` attribute indicates the type of script represented. The most common values are:
/// - No type or empty string: Default behavior, indicates a classic JavaScript script
/// - `module`: Indicates the code is a JavaScript module
/// - `importmap`: Indicates the body contains an import map
/// - `speculationrules`: Indicates the body contains speculation rules
/// - Other MIME types: For embedding data or non-JavaScript code
///
/// ## Examples
///
/// ```html
/// <!-- Classic JavaScript (default) -->
/// <script src="script.js"></script>
///
/// <!-- JavaScript Module -->
/// <script type="module" src="module.js"></script>
///
/// <!-- Import Map -->
/// <script type="importmap">
///   {
///     "imports": {
///       "lodash": "/node_modules/lodash-es/lodash.js"
///     }
///   }
/// </script>
///
/// <!-- Data -->
/// <script type="application/json" id="data">
///   {"user": "John", "id": 123}
/// </script>
/// ```
public struct ScriptType: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "type"
    
    /// The script type value
    private let value: String
    
    /// Initialize with a custom type string
    public init(_ value: String) {
        self.value = value
    }
    
    /// JavaScript module
    public static let module = ScriptType("module")
    
    /// Import map
    public static let importmap = ScriptType("importmap")
    
    /// Speculation rules
    public static let speculationrules = ScriptType("speculationrules")
    
    /// JSON data
    public static let json = ScriptType("application/json")
    
    /// Text data
    public static let text = ScriptType("text/plain")
}

extension ScriptType: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

extension ScriptType: CustomStringConvertible {
    /// Returns the string representation of the type value
    public var description: String {
        return self.value
    }
}