//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/09/2025.
//

import Foundation
import URLRouting

extension ParserPrinter where Input == URLRequestData {
    public func href(for route: Output) -> Href {
        Href(self.url(for: route))
    }
}
