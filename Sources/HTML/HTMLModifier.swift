//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/08/2025.
//

import Foundation
import HTMLCSSPointFreeHTML

public struct HTMLModifier {
    let style: (inout AnyHTML) -> Void
    
    public init(_ style: @escaping (inout AnyHTML) -> Void) {
        self.style = style
    }
    
    public func callAsFunction(_ html: inout AnyHTML) {
        style(&html)
    }
}
