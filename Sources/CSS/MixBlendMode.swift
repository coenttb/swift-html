//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Foundation

public enum MixBlendMode: String, Sendable, CaseIterable {
    case normal
    case multiply
    case screen
    case overlay
    case darken
    case lighten
    case colorDodge = "color-dodge"
    case colorBurn = "color-burn"
    case hardLight = "hard-light"
    case softLight = "soft-light"
    case difference
    case exclusion
    case hue
    case saturation
    case color
    case luminosity
    
    // Global values
    case inherit
    case initial
    case revert
    case revertLayer = "revert-layer"
    case unset
}

extension CSS.MixBlendMode: CustomStringConvertible {
    public var description: String {
        self.rawValue
    }
}

