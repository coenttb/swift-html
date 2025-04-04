///
/// Exportparts.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Allows selection and styling of elements within nested shadow trees by exporting their part names.
///
/// The `exportparts` global attribute enables shadow tree parts to be visible and styleable
/// outside the immediate parent DOM. This is particularly important for working with Web Components
/// that have nested shadow DOM trees, allowing for consistent styling across component boundaries.
///
/// The shadow DOM is an isolated DOM structure where identifiers, classes, and styles are encapsulated,
/// preventing external CSS from affecting elements within. The `part` attribute exposes elements to
/// the parent DOM for styling with the `::part()` pseudo-element, but only to the immediate parent.
/// The `exportparts` attribute solves this limitation by making parts visible to ancestors beyond
/// the immediate parent.
///
/// ## Usage Notes
///
/// - Used on shadow host elements (elements with shadow DOM attached)
/// - Value is a comma-separated list of part names to export
/// - Can optionally remap part names using a colon syntax (`originalName:exposedName`)
/// - Works in conjunction with the `part` attribute and `::part()` CSS pseudo-element
/// - Primarily used with Web Components and custom elements
///
/// ## Examples
///
/// Basic usage - exporting parts with same names:
/// ```html
/// <template id="ancestor-component">
///   <nested-component exportparts="base, header, body"></nested-component>
/// </template>
/// ```
///
/// Remapping part names when exporting:
/// ```html
/// <template id="ancestor-component">
///   <nested-component 
///     exportparts="base:card__base, header:card__header, footer:card__footer">
///   </nested-component>
/// </template>
/// ```
///
/// CSS targeting of exported parts:
/// ```css
/// /* With remapped names */
/// ::part(card__header) {
///   font-weight: bold;
/// }
///
/// /* With original names (when not remapped) */
/// ::part(body) {
///   color: red;
///   font-style: italic;
/// }
/// ```
public struct Exportparts: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "exportparts"
    
    /// The part mappings to export
    private let partMappings: [PartMapping]
    
    /// Initialize with part names to export
    public init(_ partNames: [String]) {
        self.partMappings = partNames.map { PartMapping(originalName: $0, exposedName: $0) }
    }
    
    /// Initialize with part names to export as variadic parameters
    public init(_ partNames: String...) {
        self.partMappings = partNames.map { PartMapping(originalName: $0, exposedName: $0) }
    }
    
    /// Initialize with explicit part name mappings
    public init(_ mappings: [PartMapping]) {
        self.partMappings = mappings
    }
    
    /// A mapping from original part name to exposed part name
    public struct PartMapping: Sendable, Equatable {
        /// The original part name in the shadow DOM
        public let originalName: String
        
        /// The name to expose to ancestor DOMs
        public let exposedName: String
        
        /// Initialize with original and exposed part names
        public init(originalName: String, exposedName: String) {
            self.originalName = originalName
            self.exposedName = exposedName
        }
        
        /// The string representation of this mapping
        public var description: String {
            if originalName == exposedName {
                return originalName
            } else {
                return "\(originalName):\(exposedName)"
            }
        }
    }
}

extension Exportparts: CustomStringConvertible {
    /// Returns the string representation of the exportparts value
    public var description: String {
        return self.partMappings.map { $0.description }.joined(separator: ", ")
    }
}
