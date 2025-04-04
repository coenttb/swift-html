//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 02/04/2025.
//

public protocol Attribute: Sendable, Equatable {
    static var attribute: String { get }
}

