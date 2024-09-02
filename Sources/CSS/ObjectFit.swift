//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/09/2024.
//

import Foundation

public enum ObjectFit: Sendable {
    case keyword(Keyword)
    case global(Global)
    
    public enum Keyword: String, Sendable {
        case fill
        case contain
        case cover
        case none
        case scaleDown = "scale-down"
    }
    
    public enum Global: String, Sendable {
        case inherit
        case initial
        case revert
        case revertLayer = "revert-layer"
        case unset
    }
}

extension ObjectFit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .global(let global):
            return global.rawValue
        }
    }
}

extension CSS.ObjectFit {
    public static let fill: Self = .keyword(.fill)
    public static let contain: Self = .keyword(.contain)
    public static let cover: Self = .keyword(.cover)
    public static let none: Self = .keyword(.none)
    public static let scaleDown: Self = .keyword(.scaleDown)
    
    public static let inherit: Self = .global(.inherit)
    public static let initial: Self = .global(.initial)
    public static let revert: Self = .global(.revert)
    public static let revertLayer: Self = .global(.revertLayer)
    public static let unset: Self = .global(.unset)
}

