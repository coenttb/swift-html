//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/09/2024.
//

import Foundation
import PointFreeHtml

public enum WhiteSpace: String, CaseIterable {
    case normal
    case nowrap
    case pre
    case preLine = "pre-line"
    case preWrap = "pre-wrap"
    case breakSpaces = "break-spaces"
}



extension WhiteSpace: CustomStringConvertible {
    public var description: String {
        return rawValue
    }
}
