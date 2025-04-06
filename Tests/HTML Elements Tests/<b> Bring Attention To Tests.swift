///
/// <b> Bring Attention To Tests.swift
/// swift-html
///
/// Tests for the HTML b element implementation.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Elements

@Suite("B Element Tests")
final class BElementTests {
    
    @Test("B element creates valid structure")
    func testBElement() {
        let element = B {
            "This text should be bold"
        }
        
        #expect(element.content() == "This text should be bold")
    }
    
    @Test("B element can be created with lowercase typealias")
    func testLowercaseTypealias() {
        let element = b {
            "Bold text with lowercase typealias"
        }
        
        #expect(element.content() == "Bold text with lowercase typealias")
    }

}
