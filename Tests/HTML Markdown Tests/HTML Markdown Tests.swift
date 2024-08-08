//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 08/08/2024.
//

import Foundation
import Testing
import HTML_Markdown

@Test
func markdown(){
    
    
    let markdown = createMarkdown {
        "1"
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
        ["2", "3"]
    }
    
    
    print(markdown)
    
}
func createMarkdown(@MarkdownBuilder _ content: () -> String) -> String {
    content()
}
