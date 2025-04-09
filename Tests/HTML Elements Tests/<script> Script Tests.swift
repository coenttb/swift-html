///
/// <script> Script Tests.swift
/// swift-html
///
/// Tests for the HTML Script element.
///
/// Created by Coen ten Thije Boonkkamp on 09/04/2025.
///

import XCTest
@testable import HTML_Elements
@testable import HTML_Attributes

final class ScriptTests: XCTestCase {
    func testBasicExternalScript() {
        let element = Script(src: Src("script.js")) {
            ""
        }
        
        XCTAssertEqual(Script.tag, "script")
        XCTAssertEqual(element.src?.description, "script.js")
    }
    
    func testInlineScript() {
        let scriptContent = "alert('Hello World!');"
        let element = Script {
            scriptContent
        }
        
        XCTAssertNil(element.src)
        // In a real implementation, we would test the rendered HTML output
        // to verify the content is included correctly
    }
    
    func testAsyncDeferAttributes() {
        let asyncScript = Script(src: Src("analytics.js"), async: Async(value: true)) {
            ""
        }
        
        let deferScript = Script(src: Src("ui-framework.js"), defer: Defer(value: true)) {
            ""
        }
        
        XCTAssertEqual(asyncScript.async?.value, true)
        XCTAssertNil(asyncScript.defer)
        
        XCTAssertEqual(deferScript.defer?.value, true)
        XCTAssertNil(deferScript.async)
    }
    
    func testModuleScript() {
        let moduleScript = Script(src: Src("module.js"), type: ScriptType.module) {
            ""
        }
        
        XCTAssertEqual(moduleScript.type?.description, "module")
    }
    
    func testImportMapScript() {
        let importMapContent = """
        {
          "imports": {
            "lodash": "/node_modules/lodash-es/lodash.js"
          }
        }
        """
        
        let importMapScript = Script(type: ScriptType.importmap) {
            importMapContent
        }
        
        XCTAssertEqual(importMapScript.type?.description, "importmap")
        // In a real implementation, we would test the rendered HTML output
        // to verify the content is included correctly
    }
    
    func testBlockingAttribute() {
        let blockingScript = Script(src: Src("critical.js"), blocking: Blocking.render) {
            ""
        }
        
        XCTAssertEqual(blockingScript.blocking?.description, "render")
    }
    
    func testIntegrityAttribute() {
        let hash = "sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
        let integrityScript = Script(src: Src("lib.js"), integrity: Integrity(hash)) {
            ""
        }
        
        XCTAssertEqual(integrityScript.integrity?.description, hash)
    }
    
    func testComplexScriptElement() {
        let element = Script(
            src: Src("app.js"),
            async: Async(value: true),
            defer: Defer(value: false),
            type: ScriptType.module,
            integrity: Integrity("sha384-hash"),
            referrerpolicy: Referrerpolicy("no-referrer"),
            fetchpriority: Fetchpriority.high,
            crossorigin: Crossorigin.anonymous
        ) {
            ""
        }
        
        XCTAssertEqual(element.src?.description, "app.js")
        XCTAssertEqual(element.async?.value, true)
        XCTAssertEqual(element.defer?.value, false)
        XCTAssertEqual(element.type?.description, "module")
        XCTAssertEqual(element.integrity?.description, "sha384-hash")
        XCTAssertEqual(element.referrerpolicy?.description, "no-referrer")
        XCTAssertEqual(element.fetchpriority?.description, "high")
        XCTAssertEqual(element.crossorigin?.description, "anonymous")
    }
}