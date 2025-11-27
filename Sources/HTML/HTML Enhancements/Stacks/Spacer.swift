//
//  Spacer.swift
//  swift-html
//

import HTML_Rendering

public struct Spacer: HTML.View {
    public init() {}
    public var body: some HTML.View {
        tag("swift-html-spacer")
            .css
            .flexGrow(1)
    }
}
