//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/04/2025.
//

import Foundation

public struct Scope: Attribute {
    /// The name of the HTML attribute
    public static let attribute: String = "scope"
    
    /// The scope value
    private let value: String
    
    /// Initialize with a scope value
    public init(_ value: String) {
        self.value = value
    }
    
    /// The header relates to all cells of the row it belongs to
    public static let row = Scope("row")
    
    /// The header relates to all cells of the column it belongs to
    public static let col = Scope("col")
    
    /// The header belongs to a rowgroup and relates to all of its cells
    public static let rowgroup = Scope("rowgroup")
    
    /// The header belongs to a colgroup and relates to all of its cells
    public static let colgroup = Scope("colgroup")
}

extension Scope: CustomStringConvertible {
    /// Returns the string representation of the scope value
    public var description: String {
        return self.value
    }
}
