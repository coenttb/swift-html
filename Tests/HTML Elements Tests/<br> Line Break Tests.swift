///
/// <br> Line Break Tests.swift
/// swift-html
///
/// Tests for the HTML br element implementation.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Elements

@Suite("BR Element Tests")
final class BRElementTests {
    
    @Test("BR element creates valid structure")
    func testBRElement() {
        let element = BR<String>()
        
        #expect(element.children.isEmpty)
        #expect(element.tag == "br")
    }
    
    @Test("BR element can be created with static property")
    func testStaticProperty() {
        let element = BR<String>.lineBreak
        
        #expect(element.children.isEmpty)
        #expect(element.tag == "br")
    }
    
    @Test("BR element can be created with lowercase typealias")
    func testLowercaseTypealias() {
        let element = br<String>()
        
        #expect(element.children.isEmpty)
        #expect(element.tag == "br")
    }
}