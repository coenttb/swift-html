//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/10/2024.
//

import Foundation
import PointFreeHTML
import Dependencies

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func `if`<T: HTML>(
        _ condition: Bool,
        then modification: (Self) -> T
    ) -> some HTML {
        withEscapedDependencies { continuation in
            HTMLGroup {
                if condition {
                    continuation.yield {
                        modification(self)
                    }
                } else {
                    // This requires that T can be initialized from Self
                    self
                }
            }
        }
    }
}
