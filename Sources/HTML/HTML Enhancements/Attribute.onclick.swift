//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 26/08/2025.
//

import Foundation
import PointFreeHTML

extension HTML {
    public func onclick(_ content: String) -> some HTML {
        self.attribute("onclick", content)
    }
}
