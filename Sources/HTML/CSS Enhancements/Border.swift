//
//  Border.swift
//  swift-html
//
//  Border type definition with side configuration.
//

import CSS_Rendering
import CSS_Standard

public struct Border: Equatable, Sendable {
    public var sides: Set<Side>?
    public var width: BorderWidth?
    public var style: CSS_Standard.LineStyle?
    public var color: HTMLColor?

    public enum Side: String, Sendable, CaseIterable {
        case top, left, right, bottom

        public static let all: [Self] = allCases
    }

    public init(
        sides: Set<Side>? = nil,
        width: BorderWidth? = nil,
        style: CSS_Standard.LineStyle? = .solid,
        color: HTMLColor? = nil
    ) {
        self.width = width
        self.style = style
        self.color = color
        self.sides = sides
    }
}
