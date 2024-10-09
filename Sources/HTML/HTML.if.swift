//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 09/10/2024.
//

import Foundation
import PointFreeHtml

extension HTML {
    @HTMLBuilder
    public func `if`(_ condition: Bool, @HTMLBuilder _ modification: (Self) -> some HTML) -> some HTML {
        if condition {
            modification(self)
        } else {
            self
        }
    }
}
