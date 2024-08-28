//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum Display: Sendable {
    case outside(Outside)
    case inside(Inside)
    case listitem
    case `internal`(Internal)
    case box(Box)
    case legacy(Legacy)
    case global(Global)

    public enum Outside: String, Sendable {
        case block
        case inline
        case runIn = "run-in"
    }

    public enum Inside: String, Sendable {
        case flow
        case flowRoot = "flow-root"
        case table
        case flex
        case grid
        case ruby
    }

    public enum Internal: String, Sendable {
        case tableRowGroup = "table-row-group"
        case tableHeaderGroup = "table-header-group"
        case tableFooterGroup = "table-footer-group"
        case tableRow = "table-row"
        case tableCell = "table-cell"
        case tableColumnGroup = "table-column-group"
        case tableColumn = "table-column"
        case tableCaption = "table-caption"
        case rubyBase = "ruby-base"
        case rubyText = "ruby-text"
        case rubyBaseContainer = "ruby-base-container"
        case rubyTextContainer = "ruby-text-container"
    }

    public enum Box: String, Sendable {
        case contents
        case none
    }

    public enum Legacy: String, Sendable {
        case inlineBlock = "inline-block"
        case inlineTable = "inline-table"
        case inlineFlex = "inline-flex"
        case inlineGrid = "inline-grid"
    }

    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }
}

// Convenience static properties
extension Display {
    public static let block = Self.outside(.block)
    public static let inline = Self.outside(.inline)
    public static let runIn = Self.outside(.runIn)
    
    public static let flow = Self.inside(.flow)
    public static let flowRoot = Self.inside(.flowRoot)
    public static let table = Self.inside(.table)
    public static let flex = Self.inside(.flex)
    public static let grid = Self.inside(.grid)
    public static let ruby = Self.inside(.ruby)
    
    
    public static let tableRowGroup = Self.internal(.tableRowGroup)
    public static let tableHeaderGroup = Self.internal(.tableHeaderGroup)
    public static let tableFooterGroup = Self.internal(.tableFooterGroup)
    public static let tableRow = Self.internal(.tableRow)
    public static let tableCell = Self.internal(.tableCell)
    public static let tableColumnGroup = Self.internal(.tableColumnGroup)
    public static let tableColumn = Self.internal(.tableColumn)
    public static let tableCaption = Self.internal(.tableCaption)
    public static let rubyBase = Self.internal(.rubyBase)
    public static let rubyText = Self.internal(.rubyText)
    public static let rubyBaseContainer = Self.internal(.rubyBaseContainer)
    public static let rubyTextContainer = Self.internal(.rubyTextContainer)
    
    public static let contents = Self.box(.contents)
    public static let none = Self.box(.none)
    
    public static let inlineBlock = Self.legacy(.inlineBlock)
    public static let inlineTable = Self.legacy(.inlineTable)
    public static let inlineFlex = Self.legacy(.inlineFlex)
    public static let inlineGrid = Self.legacy(.inlineGrid)
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension Display: CustomStringConvertible {
    public var description: String {
        switch self {
        case .outside(let outside):
            return outside.rawValue
        case .inside(let inside):
            return inside.rawValue
        case .listitem:
            return "list-item"
        case .internal(let internalDisplay):
            return internalDisplay.rawValue
        case .box(let box):
            return box.rawValue
        case .legacy(let legacy):
            return legacy.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}
