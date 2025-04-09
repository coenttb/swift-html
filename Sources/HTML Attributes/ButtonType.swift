//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/04/2025.
//

import Foundation

/// Button types that define how a button behaves
public enum ButtonType: String, Attribute {   
    
    public static let attribute: String = "type"
    
    /// Submits the form data (default behavior)
    case submit
    
    /// Resets the form data to its initial values
    case reset
    
    /// No default behavior, typically used with JavaScript
    case button
}
