//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 26/08/2025.
//

import HTML_Rendering
import CSS_Rendering

extension HTML.View {
    public func onclick(_ content: String) -> some HTML.View {
        self.attribute("onclick", content)
    }
}
