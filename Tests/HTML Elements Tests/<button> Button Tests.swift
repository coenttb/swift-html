///
/// <button> Button Tests.swift
/// swift-html
///
/// Tests for the HTML button element implementation.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Elements
@testable import HTML_Attributes

@Suite("Button Element Tests")
final class ButtonElementTests {
    
    @Test("Button element creates valid basic structure")
    func testBasicButtonElement() {
        let button = Button {
            "Click me"
        }
        
        #expect(button.tag == "button")
        #expect(button.attributes["type"] == "submit")
        #expect(button.content() as? String == "Click me")
    }
    
    @Test("Button element can specify type")
    func testButtonWithType() {
        let button = Button(type: .reset) {
            "Reset Form"
        }
        
        #expect(button.attributes["type"] == "reset")
    }
    
    @Test("Button element can have button type")
    func testButtonWithButtonType() {
        let button = Button(type: .button) {
            "Plain Button"
        }
        
        #expect(button.attributes["type"] == "button")
    }
    
    @Test("Button can be disabled")
    func testDisabledButton() {
        let button = Button(disabled: true) {
            "Cannot Click"
        }
        
        #expect(button.attributes["disabled"] == "")
    }
    
    @Test("Button is enabled by default")
    func testEnabledButton() {
        let button = Button {
            "Clickable"
        }
        
        #expect(button.attributes["disabled"] == nil)
    }
    
    @Test("Button can have form-related attributes")
    func testButtonWithFormAttributes() {
        let button = Button(
            type: .submit,
            form: "contact-form",
            name: "submit-button",
            value: "submitted",
            formaction: "/submit",
            formenctype: .multipart,
            formmethod: .post,
            formnovalidate: true,
            formtarget: .blank
        ) {
            "Submit Form"
        }
        
        #expect(button.attributes["form"] == "contact-form")
        #expect(button.attributes["name"] == "submit-button")
        #expect(button.attributes["value"] == "submitted")
        #expect(button.attributes["formaction"] == "/submit")
        #expect(button.attributes["formenctype"] == "multipart/form-data")
        #expect(button.attributes["formmethod"] == "post")
        #expect(button.attributes["formnovalidate"] == "")
        #expect(button.attributes["formtarget"] == "_blank")
    }
    
    @Test("Button can use text form encoding")
    func testButtonWithTextEncoding() {
        let button = Button(formenctype: .text) {
            "Text Encoded"
        }
        
        #expect(button.attributes["formenctype"] == "text/plain")
    }
    
    @Test("Button can use URL form encoding")
    func testButtonWithUrlEncoding() {
        let button = Button(formenctype: .urlencoded) {
            "URL Encoded"
        }
        
        #expect(button.attributes["formenctype"] == "application/x-www-form-urlencoded")
    }
    
    @Test("Button can use GET form method")
    func testButtonWithGetMethod() {
        let button = Button(formmethod: .get) {
            "GET Method"
        }
        
        #expect(button.attributes["formmethod"] == "get")
    }
    
    @Test("Button can have autofocus")
    func testButtonWithAutofocus() {
        let button = Button(autofocus: true) {
            "Focused Button"
        }
        
        #expect(button.attributes["autofocus"] == "")
    }
    
    @Test("Button doesn't have autofocus by default")
    func testButtonWithoutAutofocus() {
        let button = Button {
            "Regular Button"
        }
        
        #expect(button.attributes["autofocus"] == nil)
    }
    
    @Test("Button can have form target with self")
    func testButtonWithSelfTarget() {
        let button = Button(formtarget: .`self`) {
            "Self Target"
        }
        
        #expect(button.attributes["formtarget"] == "_self")
    }
    
    @Test("Button can have form target with parent")
    func testButtonWithParentTarget() {
        let button = Button(formtarget: .parent) {
            "Parent Target"
        }
        
        #expect(button.attributes["formtarget"] == "_parent")
    }
    
    @Test("Button can have form target with top")
    func testButtonWithTopTarget() {
        let button = Button(formtarget: .top) {
            "Top Target"
        }
        
        #expect(button.attributes["formtarget"] == "_top")
    }
    
    @Test("Button can have custom attributes")
    func testButtonWithCustomAttributes() {
        let button = Button(attributes: ["data-test": "button-1", "aria-label": "Action Button"]) {
            "Custom Button"
        }
        
        #expect(button.attributes["data-test"] == "button-1")
        #expect(button.attributes["aria-label"] == "Action Button")
        #expect(button.attributes["type"] == "submit") // Default still applied
    }
    
    @Test("Button can combine standard and custom attributes")
    func testButtonWithCombinedAttributes() {
        let button = Button(
            type: .button,
            disabled: true,
            attributes: ["data-id": "primary-button"]
        ) {
            "Combined Attributes"
        }
        
        #expect(button.attributes["type"] == "button")
        #expect(button.attributes["disabled"] == "")
        #expect(button.attributes["data-id"] == "primary-button")
    }
    
    @Test("Button can be created with lowercase typealias")
    func testLowercaseTypealias() {
        let element = button {
            "Click me"
        }
        
        #expect(element.tag == "button")
        #expect(element.content() as? String == "Click me")
    }
    
    @Test("Button can be created with typed content")
    func testButtonWithTypedContent() {
        struct CustomContent: Equatable {
            let text: String
        }
        
        let customContent = CustomContent(text: "Hello")
        let button = Button<CustomContent> {
            customContent
        }
        
        #expect(button.content() as? CustomContent == customContent)
    }
}