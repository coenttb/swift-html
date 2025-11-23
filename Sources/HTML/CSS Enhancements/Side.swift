//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 17/04/2025.
//


public enum Side: Sendable, Hashable {
    case top(LengthPercentage)
    case bottom(LengthPercentage)
    case left(LengthPercentage)
    case right(LengthPercentage)
}
