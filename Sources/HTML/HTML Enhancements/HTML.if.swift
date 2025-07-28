//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/10/2024.
//

import Foundation
import PointFreeHTML

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func `if`<T: HTML>(
        _ condition: Bool,
        then modification: (Self) -> T
    ) -> some HTML {
        if condition {
             modification(self)
        } else {
            // This requires that T can be initialized from Self
             self
        }
    }
}
