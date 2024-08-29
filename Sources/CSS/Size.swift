//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import Foundation


public enum Size: Sendable {
    case single(Length)
    case double(width: Length, height: Length)
    case keyword(Keyword)
    case auto

    public enum Keyword: String, Sendable {
        case maxContent = "max-content"
        case minContent = "min-content"
        case fitContent = "fit-content"
        case containingBlock = "contain"
        case cover
    }
}

extension CSS.Size: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .single(.px(Double(value)))
    }
}

extension CSS.Size: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .single(.px(value))
    }
}

extension CSS.Size {
    public static func width(_ width: CSS.Length) -> Self {
        .single(width)
    }
    
    public static func height(_ height: CSS.Length) -> Self {
        .single(height)
    }
    
    public static func size(width: CSS.Length, height: CSS.Length) -> Self {
        .double(width: width, height: height)
    }
}

extension CSS.Size: CustomStringConvertible {
    public var description: String {
        switch self {
        case .single(let length):
            return length.description
        case .double(let width, let height):
            return "\(width) \(height)"
        case .keyword(let keyword):
            return keyword.rawValue
        case .auto:
            return "auto"
        }
    }
}

// Convenience initializers
extension CSS.Size {
    public static let maxContent: Self = .keyword(.maxContent)
    public static let minContent: Self = .keyword(.minContent)
    public static let fitContent: Self = .keyword(.fitContent)
    public static let contain: Self = .keyword(.containingBlock)
    public static let cover: Self = .keyword(.cover)
}
