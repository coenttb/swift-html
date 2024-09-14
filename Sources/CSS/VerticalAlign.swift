//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 14/09/2024.
//

import Foundation

public enum VerticalAlign: Sendable {
    case keyword(Keyword)
    case length(Length)
    case percentage(Double)
    
    public enum Keyword: String, Sendable {
        case baseline, sub, `super`, top, textTop = "text-top"
        case middle, bottom, textBottom = "text-bottom"
    }
}

extension VerticalAlign {
    public static let center: Self = .keyword(.middle)
    
    // Conveniences for keyword cases
    public static let baseline: Self = .keyword(.baseline)
    public static let sub: Self = .keyword(.sub)
    public static let `super`: Self = .keyword(.super)
    public static let top: Self = .keyword(.top)
    public static let textTop: Self = .keyword(.textTop)
    public static let middle: Self = .keyword(.middle)
    public static let bottom: Self = .keyword(.bottom)
    public static let textBottom: Self = .keyword(.textBottom)
}
