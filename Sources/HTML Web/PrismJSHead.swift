//
//  File.swift
//
//
//  Created by Coen ten Thije Boonkkamp on 25/07/2024.
//

import Foundation
import HTML

public struct PrismJSHead: HTML {
    
    private let languages: [String]
    private let style_string: String
    private let script_string: String
    
    public init(
        languages: [String] = [],
        style: String = "",
        script: String = ""
    ) {
        self.languages = languages
        self.script_string = script
        self.style_string = style
    }
    
    public var body: some HTML {
        style {
            style_string
        }
        script().src("//cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/prism.min.js")
        script().src(
            "//cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/line-highlight/prism-line-highlight.min.js"
        )
        HTMLForEach(self.languages) { lang in
            script().src("//cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-\(lang).min.js")
        }
        script {
            script_string
        }
    }
}
