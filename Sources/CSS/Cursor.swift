//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 28/08/2024.
//

import Foundation

public enum Cursor: Sendable {
    case keyword(Keyword)
    case url(String, fallback: Keyword?)
    case global(Global)

    public enum Keyword: String, Sendable {
        case auto, `default`
        case none, contextMenu, help, pointer, progress, wait
        case cell, crosshair, text, verticalText
        case alias, copy, move, noDrop, notAllowed
        case allScroll, colResize, rowResize
        case nResize, eResize, sResize, wResize
        case neResize, nwResize, seResize, swResize
        case ewResize, nsResize, neswResize, nwseResize
        case zoomIn, zoomOut, grab, grabbing
    }

    public enum Global: String, Sendable {
        case inherit, initial, revert
        case revertLayer = "revert-layer"
        case unset
    }
}
// Convenience static properties
extension CSS.Cursor {
    public static let auto = Self.keyword(.auto)
    public static let `default` = Self.keyword(.default)
    public static let none = Self.keyword(.none)
    public static let contextMenu = Self.keyword(.contextMenu)
    public static let help = Self.keyword(.help)
    public static let pointer = Self.keyword(.pointer)
    public static let progress = Self.keyword(.progress)
    public static let wait = Self.keyword(.wait)
    public static let cell = Self.keyword(.cell)
    public static let crosshair = Self.keyword(.crosshair)
    public static let text = Self.keyword(.text)
    public static let verticalText = Self.keyword(.verticalText)
    public static let alias = Self.keyword(.alias)
    public static let copy = Self.keyword(.copy)
    public static let move = Self.keyword(.move)
    public static let noDrop = Self.keyword(.noDrop)
    public static let notAllowed = Self.keyword(.notAllowed)
    public static let allScroll = Self.keyword(.allScroll)
    public static let colResize = Self.keyword(.colResize)
    public static let rowResize = Self.keyword(.rowResize)
    public static let nResize = Self.keyword(.nResize)
    public static let eResize = Self.keyword(.eResize)
    public static let sResize = Self.keyword(.sResize)
    public static let wResize = Self.keyword(.wResize)
    public static let neResize = Self.keyword(.neResize)
    public static let nwResize = Self.keyword(.nwResize)
    public static let seResize = Self.keyword(.seResize)
    public static let swResize = Self.keyword(.swResize)
    public static let ewResize = Self.keyword(.ewResize)
    public static let nsResize = Self.keyword(.nsResize)
    public static let neswResize = Self.keyword(.neswResize)
    public static let nwseResize = Self.keyword(.nwseResize)
    public static let zoomIn = Self.keyword(.zoomIn)
    public static let zoomOut = Self.keyword(.zoomOut)
    public static let grab = Self.keyword(.grab)
    public static let grabbing = Self.keyword(.grabbing)
    
    public static let inherit = Self.global(.inherit)
    public static let initial = Self.global(.initial)
    public static let revert = Self.global(.revert)
    public static let revertLayer = Self.global(.revertLayer)
    public static let unset = Self.global(.unset)
}

// CustomStringConvertible conformance
extension CSS.Cursor: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .url(let urlString, let fallback):
            if let fallback = fallback {
                return "url(\(urlString)), \(fallback.rawValue)"
            } else {
                return "url(\(urlString))"
            }
        case .global(let global):
            return global.rawValue
        }
    }
}
