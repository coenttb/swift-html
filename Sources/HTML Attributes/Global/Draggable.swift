///
/// Draggable.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Specifies whether an element is draggable or not.
///
/// The `draggable` global attribute is an enumerated attribute that indicates whether
/// the element can be dragged, either with native browser behavior or the HTML Drag and Drop API.
/// This attribute is part of the HTML5 specification and enables rich drag-and-drop functionality
/// in web applications.
///
/// ## Usage Notes
///
/// - Can be applied to any HTML element that falls under the HTML namespace (not SVG elements)
/// - Must be specified with an explicit value (`true` or `false`) - shorthand syntax is not allowed
/// - If not specified, defaults to `auto`, which enables browser's default drag behavior:
///   - By default, only text selections, images, and links can be dragged
///   - For other elements, the `ondragstart` event handler must be set for drag to work
/// - To make drag and drop fully functional, JavaScript event handlers are typically needed
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <!-- Make an element draggable -->
/// <div draggable="true">Drag me</div>
///
/// <!-- Explicitly disable dragging on an image (which is draggable by default) -->
/// <img src="image.png" draggable="false" alt="Non-draggable image" />
/// ```
///
/// With JavaScript event handlers:
/// ```html
/// <div draggable="true" 
///      ondragstart="event.dataTransfer.setData('text/plain', 'Dragged data')">
///   Drag me
/// </div>
///
/// <div ondrop="event.preventDefault(); console.log(event.dataTransfer.getData('text/plain'));"
///      ondragover="event.preventDefault()">
///   Drop zone
/// </div>
/// ```
public enum Draggable: String, Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "draggable"
    
    /// Element can be dragged
    ///
    /// Example:
    /// ```html
    /// <div draggable="true">Drag me</div>
    /// ```
    case `true` = "true"
    
    /// Element cannot be dragged
    ///
    /// Example:
    /// ```html
    /// <img src="image.png" draggable="false" alt="Non-draggable image" />
    /// ```
    case `false` = "false"
    
    /// Browser default dragging behavior
    ///
    /// This is the default if the attribute is not specified. 
    /// Only text selections, images, and links can be dragged by default.
    ///
    /// Example:
    /// ```html
    /// <div draggable="auto">Uses default browser behavior</div>
    /// ```
    case auto = "auto"
}

extension Draggable: CustomStringConvertible {
    /// Returns the string representation of the draggable value
    public var description: String {
        return self.rawValue
    }
}
