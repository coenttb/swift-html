//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/09/2024.
//

import Foundation
import PointFreeHtml

public enum WordBreak: String, CaseIterable {
    case normal
    case breakAll = "break-all"
    case keepAll = "keep-all"
    case breakWord = "break-word"
}

public enum OverflowWrap: String, CaseIterable {
    case normal
    case breakWord = "break-word"
    case anywhere
}

extension WordBreak: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}

extension OverflowWrap: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}
