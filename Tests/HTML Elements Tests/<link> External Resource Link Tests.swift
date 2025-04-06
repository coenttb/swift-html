///
/// <link> External Resource Link Tests.swift
/// swift-html
///
/// Tests for the HTML link element implementation.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Elements
@testable import HTML_Attributes

@Suite("Link Element Tests")
final class LinkElementTests {
    
    @Test("Link element can be created with basic attributes")
    func testBasicLinkElement() {
        let element = Link(href: "styles.css", rel: "stylesheet")
        
        #expect(element.href == "styles.css")
        #expect(element.rel == "stylesheet")
    }
    
    @Test("Link element can be created with all attributes")
    func testLinkElementWithAllAttributes() {
        let element = Link(
            as: .font,
            blocking: .render,
            crossorigin: .anonymous,
            disabled: true,
            fetchpriority: .high,
            href: "font.woff2",
            hreflang: "en",
            imagesizes: "100vw",
            imagesrcset: "image.jpg 1x, image@2x.jpg 2x",
            integrity: "sha384-example",
            media: "screen and (min-width: 600px)",
            referrerpolicy: .noReferrer,
            rel: "preload",
            sizes: "16x16",
            title: "My Resource",
            type: "font/woff2"
        )
        
//        #expect(element.as == .font)
        #expect(element.blocking?.rawValue == "render")
        #expect(element.crossorigin == .anonymous)
        #expect(element.disabled == true)
        #expect(element.fetchpriority == .high)
        #expect(element.href == "font.woff2")
        #expect(element.hreflang == "en")
        #expect(element.imagesizes == "100vw")
        #expect(element.imagesrcset == "image.jpg 1x, image@2x.jpg 2x")
        #expect(element.integrity == "sha384-example")
        #expect(element.media == "screen and (min-width: 600px)")
        #expect(element.referrerpolicy == .noReferrer)
        #expect(element.rel == "preload")
        #expect(element.sizes == "16x16")
        #expect(element.title == "My Resource")
        #expect(element.type == "font/woff2")
    }
    
    @Test("Link element can be created with lowercase typealias")
    func testLowercaseTypealias() {
        let element = link(href: "styles.css", rel: "stylesheet")
        
        #expect(element.href == "styles.css")
        #expect(element.rel == "stylesheet")
    }
    
    @Test("Stylesheet factory method creates correct link")
    func testStylesheetFactory() {
        let element = Link.stylesheet(
            href: "styles.css",
            media: "screen",
            disabled: true,
            integrity: "sha384-example"
        )
        
        #expect(element.href == "styles.css")
        #expect(element.rel == "stylesheet")
        #expect(element.type == "text/css")
        #expect(element.media == "screen")
        #expect(element.disabled == true)
        #expect(element.integrity == "sha384-example")
    }
    
    @Test("Icon factory method creates correct link")
    func testIconFactory() {
        let element = Link.icon(
            href: "favicon.ico",
            sizes: "32x32",
            type: "image/x-icon"
        )
        
        #expect(element.href == "favicon.ico")
        #expect(element.rel == "icon")
        #expect(element.sizes == "32x32")
        #expect(element.type == "image/x-icon")
    }
    
    @Test("Preload factory method creates correct link")
    func testPreloadFactory() {
        let element = Link.preload(
            href: "font.woff2",
            as: .font,
            crossorigin: .anonymous,
            type: "font/woff2"
        )
        
        #expect(element.href == "font.woff2")
        #expect(element.rel == "preload")
        #expect(element.as == .font)
        #expect(element.crossorigin == .anonymous)
        #expect(element.type == "font/woff2")
    }
    
    @Test("As enum has correct values")
    func AsEnum() {
        #expect(Link.As.audio.rawValue == "audio")
        #expect(Link.As.document.rawValue == "document")
        #expect(Link.As.embed.rawValue == "embed")
        #expect(Link.As.fetch.rawValue == "fetch")
        #expect(Link.As.font.rawValue == "font")
        #expect(Link.As.image.rawValue == "image")
        #expect(Link.As.object.rawValue == "object")
        #expect(Link.As.script.rawValue == "script")
        #expect(Link.As.style.rawValue == "style")
        #expect(Link.As.track.rawValue == "track")
        #expect(Link.As.worker.rawValue == "worker")
    }
    
    @Test("Crossorigin enum has correct values")
    func testCrossoriginEnum() {
        #expect(Crossorigin.anonymous.rawValue == "anonymous")
        #expect(Crossorigin.useCredentials.rawValue == "use-credentials")
    }
    
    @Test("FetchPriority enum has correct values")
    func testFetchPriorityEnum() {
        #expect(FetchPriority.high.rawValue == "high")
        #expect(FetchPriority.low.rawValue == "low")
        #expect(FetchPriority.auto.rawValue == "auto")
    }
    
    @Test("Blocking structure works correctly")
    func testBlockingStruct() {
        let customBlocking = Link.Blocking(rawValue: "custom-value")
        #expect(customBlocking.rawValue == "custom-value")
        #expect(Link.Blocking.render.rawValue == "render")
    }
}
