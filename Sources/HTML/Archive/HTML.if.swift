//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/10/2024.
//

import Foundation
import PointFreeHTML


//make an HTML.if in the style of HTMLForEach
extension HTML {
    @HTMLBuilder
    public func `if`(
        _ condition: Bool,
        @HTMLBuilder _ modification: (Self) -> some HTML
    ) -> some HTML {
        if condition {
            modification(self)
        } else {
            self
        }
    }
}
