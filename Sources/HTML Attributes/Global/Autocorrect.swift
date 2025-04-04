///
/// Autocorrect.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Controls whether automatic correction of spelling and punctuation errors is enabled for editable text.
///
/// The `autocorrect` attribute is applicable to:
/// - `<input>` elements (except `password`, `email`, and `url` types, which don't support autocorrection)
/// - `<textarea>` elements
/// - Any element with `contenteditable` attribute set
///
/// The specific autocorrection behavior depends on the user agent and underlying device.
/// For example, macOS might rely on registered replacement text and punctuation,
/// while other platforms may use different approaches.
///
/// ## Usage Notes
///
/// - Editable elements have autocorrection enabled by default, except when inside a `<form>` element
/// - Elements inside a `<form>` may inherit their default value from the form
/// - Setting any value other than those listed below is always treated as `on`
/// - `<button>`, `<fieldset>`, `<input>`, `<output>`, `<select>`, and `<textarea>` elements 
///   inherit their default value from the containing `<form>` if it has been set
///
/// ## Examples
///
/// Basic usage:
/// ```html
/// <!-- Enable autocorrection (default for most elements) -->
/// <input id="vegetable" name="vegetable" type="text" autocorrect="on" />
///
/// <!-- Disable autocorrection -->
/// <input id="fruit" name="fruit" type="text" autocorrect="off" />
///
/// <!-- Using empty string (equivalent to "on") -->
/// <textarea id="notes" name="notes" autocorrect=""></textarea>
///
/// <!-- With contenteditable -->
/// <p contenteditable autocorrect="on">Editable content with autocorrection</p>
/// ```
public enum Autocorrect: String, Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "autocorrect"
    
    /// Enable automatic correction of spelling and punctuation errors (default for most elements)
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocorrect="on" />
    /// ```
    case on
    
    /// Enable automatic correction of spelling and punctuation errors (equivalent to "on")
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocorrect="" />
    /// ```
    case empty = "\"\""
    
    /// Disable automatic correction of editable text
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocorrect="off" />
    /// <textarea autocorrect="off"></textarea>
    /// ```
    case off
}

extension Autocorrect {
    /// Returns the string representation of the autocorrect value
    public var description: String {
        return self.rawValue
    }
}
