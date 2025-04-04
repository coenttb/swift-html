//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 04/04/2025.
//

import Foundation
import PointFreeHTML

extension _HTMLAttributes {
    public func attribute(
        _ value: String,
        _ condition: @autoclosure () -> Bool?
    ) -> _HTMLAttributes<Content> {
        let conditionResult = condition()
        if conditionResult == true {
            return self.attribute(value, "")
        } else {
            return self.attribute("", String?.none)
        }
    }
    
    public func attribute(
        _ name: String,
        _ value: (some CustomStringConvertible)? = ""
    ) -> _HTMLAttributes<Content> {
        self.attribute(name, value?.description)
    }
}

