//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/10/2024.
//

import Dependencies
import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func `if`<T: HTML>(
        _ condition: Bool,
        @HTMLBuilder then modification: (Self) -> T
    ) -> some HTML {
        if condition {
            modification(self)
        } else {
            self
        }
    }
}

extension HTML {
    @HTMLBuilder
    public func `if`<X>(
        `let` value: X?,
        @HTMLBuilder _ then: (Self, X) -> some HTML
    ) -> some HTML {
        if let value = value {
            then(self, value)
        } else {
            self
        }
    }
}
