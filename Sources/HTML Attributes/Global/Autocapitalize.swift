///
/// Autocapitalize.swift
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 02/04/2025.
///

import Foundation

/// Controls whether and how user input should be automatically capitalized as it is entered by the user.
///
/// The `autocapitalize` attribute is used for:
/// - `<input>` and `<textarea>` elements
/// - Any element with `contenteditable` set
///
/// This attribute affects the behavior of input mechanisms such as virtual keyboards 
/// on mobile devices and voice input, but not physical keyboards.
///
/// ## Usage Notes
///
/// - When set on a `<form>` element, it sets the autocapitalize behavior for all contained `<input>`s and `<textarea>`s, 
///   overriding any autocapitalize values set on contained elements.
/// - Has no effect on the `url`, `email`, or `password` input types, where autocapitalization is never enabled.
/// - Default behavior varies between browsers:
///   - Chrome and Safari default to `on`/`sentences`
///   - Firefox defaults to `off`/`none`
///
/// ## Examples
///
/// Basic usage with different settings:
/// ```html
/// <!-- Default: no autocapitalize set -->
/// <input type="text" id="default" name="default" />
///
/// <!-- Turn off autocapitalize -->
/// <input type="text" id="off" name="off" autocapitalize="off" />
/// <input type="text" id="none" name="none" autocapitalize="none" />
///
/// <!-- Capitalize sentences (default in some browsers) -->
/// <input type="text" id="on" name="on" autocapitalize="on" />
/// <input type="text" id="sentences" name="sentences" autocapitalize="sentences" />
///
/// <!-- Capitalize the first letter of each word -->
/// <input type="text" id="words" name="words" autocapitalize="words" />
///
/// <!-- Capitalize all characters -->
/// <input type="text" id="characters" name="characters" autocapitalize="characters" />
///
/// <!-- With textarea -->
/// <textarea id="characters-ta" name="characters-ta" autocapitalize="characters">
/// </textarea>
///
/// <!-- With contenteditable -->
/// <p contenteditable autocapitalize="characters">
///   This content is editable and has autocapitalize="characters" set on it
/// </p>
/// ```
public enum Autocapitalize: String, Attribute, CaseIterable {
    /// The name of the HTML attribute
    public static let attribute: String = "autocapitalize"
    
    /// Do not automatically capitalize any text
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocapitalize="none" />
    /// ```
    case none
    
    /// Do not automatically capitalize any text (alias for `none`)
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocapitalize="off" />
    /// ```
    case off
    
    /// Automatically capitalize the first character of each sentence
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocapitalize="sentences" />
    /// ```
    case sentences
    
    /// Automatically capitalize the first character of each sentence (alias for `sentences`)
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocapitalize="on" />
    /// ```
    case on
    
    /// Automatically capitalize the first character of each word
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocapitalize="words" />
    /// ```
    case words
    
    /// Automatically capitalize every character
    ///
    /// Example:
    /// ```html
    /// <input type="text" autocapitalize="characters" />
    /// <p contenteditable autocapitalize="characters">Editable content</p>
    /// ```
    case characters
}

extension Autocapitalize {
    /// Returns the string representation of the autocapitalize value
    public var description: String {
        return self.rawValue
    }
}
