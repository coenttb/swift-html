//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Foundation
import HTMLCore

public enum TextAlign: String {
    case left
    case right
    case center
    case justify
    case start
    case end
    case matchParent = "match-parent"
    case justifyAll = "justify-all"
    
    public var description: String {
        return self.rawValue
    }
}

