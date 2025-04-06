///
/// <base> Document Base URL Tests.swift
/// swift-html
///
/// Tests for the HTML base element implementation.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Elements
@testable import HTML_Attributes

@Suite("Base Element Tests")
final class BaseElementTests {
    
    @Test("Base element can be created with href attribute")
    func testBaseWithHref() {
        let element = Base(href: "https://example.com/")
        
        #expect(element.href == "https://example.com/")
        #expect(element.target == nil)
        
        // Verify configuration
        if case .href(let href) = element.configuration {
            #expect(href == "https://example.com/")
        } else {
            #expect(false, "Unexpected configuration type")
        }
    }
    
    @Test("Base element can be created with target attribute")
    func testBaseWithTarget() {
        let element = Base(target: .blank)
        
        #expect(element.href == nil)
        #expect(element.target == .blank)
        
        // Verify configuration
        if case .target(let target) = element.configuration {
            #expect(target == .blank)
        } else {
            #expect(false, "Unexpected configuration type")
        }
    }
    
    @Test("Base element can be created with both href and target attributes")
    func testBaseWithHrefAndTarget() {
        let element = Base(
            href: "https://example.com/",
            target: .self
        )
        
        #expect(element.href == "https://example.com/")
        #expect(element.target == .self)
        
        // Verify configuration
        if case .both(let href, let target) = element.configuration {
            #expect(href == "https://example.com/")
            #expect(target == .self)
        } else {
            #expect(false, "Unexpected configuration type")
        }
    }
    
    @Test("Base element can be created with configuration enum")
    func testBaseWithConfigurationEnum() {
        let element1 = Base(configuration: .href("https://example.com/"))
        #expect(element1.href == "https://example.com/")
        #expect(element1.target == nil)
        
        let element2 = Base(configuration: .target(.blank))
        #expect(element2.href == nil)
        #expect(element2.target == .blank)
        
        let element3 = Base(configuration: .both(href: "https://example.com/", target: .blank))
        #expect(element3.href == "https://example.com/")
        #expect(element3.target == .blank)
    }
    
    @Test("Base element can be created with lowercase typealias")
    func testLowercaseTypealias() {
        let element = base(href: "https://example.com/")
        
        #expect(element.href == "https://example.com/")
    }
}