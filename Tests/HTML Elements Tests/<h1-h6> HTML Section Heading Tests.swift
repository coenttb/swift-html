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
final class H1ElementTests {
    
    @Test("H1 element creates valid structure")
    func testH1Element() {
        let element = H1("This is a heading")
        
        #expect(element.children.count == 1)
        if let content = element.children[0] as? String {
            #expect(content == "This is a heading")
        } 
    }
    
    @Test("H1 element can have attributes")
    func testH1WithAttributes() {
        let element = H1("Heading with ID", ["id": "main-heading"])
        
        #expect(element.attributes["id"] == "main-heading")
    }
    
    @Test("H1 element can have multiple child nodes")
    func testH1WithMultipleChildren() {
        let element = H1(["Main ", "heading"])
        
        #expect(element.children.count == 2)
    }
}

@Suite("H2 Element Tests")
final class H2ElementTests {
    
    @Test("H2 element creates valid structure")
    func testH2Element() {
        let element = H2("This is a subheading")
        
        #expect(element.children.count == 1)
        if let content = element.children[0] as? String {
            #expect(content == "This is a subheading")
        } 
    }
    
    @Test("H2 element can have attributes")
    func testH2WithAttributes() {
        let element = H2("Subheading with class", ["class": "section-title"])
        
        #expect(element.attributes["class"] == "section-title")
    }
}

@Suite("H3 Element Tests")
final class H3ElementTests {
    
    @Test("H3 element creates valid structure")
    func testH3Element() {
        let element = H3("This is a smaller heading")
        
        #expect(element.children.count == 1)
        if let content = element.children[0] as? String {
            #expect(content == "This is a smaller heading")
        } 
    }
}

@Suite("H4 Element Tests")
final class H4ElementTests {
    
    @Test("H4 element creates valid structure")
    func testH4Element() {
        let element = H4("This is a level 4 heading")
        
        #expect(element.children.count == 1)
        if let content = element.children[0] as? String {
            #expect(content == "This is a level 4 heading")
        } 
    }
}

@Suite("H5 Element Tests")
final class H5ElementTests {
    
    @Test("H5 element creates valid structure")
    func testH5Element() {
        let element = H5("This is a level 5 heading")
        
        #expect(element.children.count == 1)
        if let content = element.children[0] as? String {
            #expect(content == "This is a level 5 heading")
        } 
    }
}

@Suite("H6 Element Tests")
final class H6ElementTests {
    
    @Test("H6 element creates valid structure")
    func testH6Element() {
        let element = H6("This is the smallest heading")
        
        #expect(element.children.count == 1)
        if let content = element.children[0] as? String {
            #expect(content == "This is the smallest heading")
        } 
    }
}
