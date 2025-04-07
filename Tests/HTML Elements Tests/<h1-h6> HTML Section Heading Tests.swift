///
/// <h1-h6> HTML Section Heading Tests.swift
/// swift-html
///
/// Tests for the HTML h1-h6 element implementations.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Elements

@Suite("H1 Element Tests")
struct H1ElementTests {
    
    @Test("H1 element creates valid structure")
    func testH1Element() {
        let element = H1 { "This is a heading" }
        
        #expect(element.content() == "This is a heading")
    }
}

