//
//  Spacer.swift
//  swift-html
//

import CSS
import HTML_Rendering

public struct Spacer: HTML.View {
    public init() {}
    public var body: some HTML.View {
        div {}
            .css
            .flexGrow(1)
    }
}
