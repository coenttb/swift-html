//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import CSS_Standard

// MARK: - ColorConvertible Extension for HexColor Support

extension ColorConvertible {
    /// Creates a color from a HexColor value
    ///
    /// - Parameter hexColor: The HexColor instance
    /// - Returns: A color in hex format
    public static func hex(_ hexColor: HexColor) -> Self {
        return .color(.hex(hexColor))
    }
}
