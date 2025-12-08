//
//  Spacer.swift
//  swift-html
//

import HTML_Rendering
import CSS

public struct Spacer: HTML.View {
    public init() {}
    public var body: some HTML.View {
        div {}
            .css
            .flexGrow(1)
    }
}
