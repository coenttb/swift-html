import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Anchor Element Tests"
)
struct AnchorTests {
    
    @Test("Create basic anchor with href")
    func createBasicAnchor() {
        let a = Anchor<String>(
            href: "https://example.com",
            content: { "Visit Example" }
        )
        
        // Verify the href attribute was set correctly
        #expect(a.href?.description == "https://example.com")
        
        // Verify the content closure returns the expected value
        #expect(a.content() == "Visit Example")
    }
    
    @Test("Create anchor with multiple attributes")
    func createAnchorWithMultipleAttributes() {
        let a = Anchor<String>(
            download: Download("file.pdf"),
            href: "https://example.com/file.pdf",
            rel: "noopener noreferrer",
            target: .blank,
            content: { "Download PDF" }
        )
        
        #expect(a.href?.description == "https://example.com/file.pdf")
        #expect(a.download?.description == "file.pdf")
        #expect(a.target == .blank)
        #expect(a.rel?.description == "noopener noreferrer")
        #expect(a.content() == "Download PDF")
    }
    
    @Test("Create anchor with boolean download attribute")
    func createAnchorWithBooleanDownload() {
        let a = Anchor<String>(
            download: true,
            href: "https://example.com/file.pdf",
            content: { "Download PDF (browser chooses filename)" }
        )
        
        #expect(a.href?.description == "https://example.com/file.pdf")
        #expect(a.download?.description == "")
        #expect(a.download?.shouldInclude == true)
        #expect(a.content() == "Download PDF (browser chooses filename)")
    }
    
    @Test("Create anchor with excluded download attribute")
    func createAnchorWithExcludedDownload() {
        let a = Anchor<String>(
            download: false,
            href: "https://example.com/file.pdf",
            content: { "View PDF (no download)" }
        )
        
        #expect(a.href?.description == "https://example.com/file.pdf")
        #expect(a.download?.shouldInclude == false)
        #expect(a.content() == "View PDF (no download)")
    }
    
    @Test("Create anchor with mailto link")
    func createAnchorWithMailtoLink() {
        let emailHref = Href.email("contact@example.com", subject: "Hello")
        let a = Anchor<String>(
            href: emailHref,
            content: { "Contact Us" }
        )
        
        #expect(a.href?.description == "mailto:contact@example.com?subject=Hello")
        #expect(a.content() == "Contact Us")
    }
    
    @Test("Create anchor with tel link")
    func createAnchorWithTelLink() {
        let telHref = Href.tel("123-456-7890")
        let a = Anchor<String>(
            href: telHref,
            content: { "Call Us" }
        )
        
        #expect(a.href?.description == "tel:1234567890")
        #expect(a.content() == "Call Us")
    }
    
    @Test("Create anchor with fragment link")
    func createAnchorWithFragmentLink() {
        let fragmentHref = Href.anchor("section-id")
        let a = Anchor<String>(
            href: fragmentHref,
            content: { "Jump to Section" }
        )
        
        #expect(a.href?.description == "#section-id")
        #expect(a.content() == "Jump to Section")
    }
    
    @Test("Create anchor with lowercase typealias")
    func createAnchorWithLowercaseTypealias() {
        let a = anchor<String>(
            href: "https://example.com",
            content: { "Using typealias" }
        )
        
        #expect(a.href?.description == "https://example.com")
        #expect(a.content() == "Using typealias")
    }
    
    @Test("Create anchor with referrerpolicy using string")
    func createAnchorWithReferrerPolicy() {
        let a = Anchor<String>(
            href: "https://example.com",
            referrerpolicy: .noReferrer,
            content: { "No Referrer Link" }
        )
        
        #expect(a.href?.description == "https://example.com")
        #expect(a.referrerpolicy?.description == "no-referrer")
        #expect(a.content() == "No Referrer Link")
    }
    
    @Test("Create anchor with referrerpolicy using enum value")
    func createAnchorWithPredefinedReferrerPolicy() {
        let a = Anchor<String>(
            href: "https://example.com",
            referrerpolicy: .sameOrigin,
            content: { "Same Origin Referrer Link" }
        )
        
        #expect(a.href?.description == "https://example.com")
        #expect(a.referrerpolicy?.description == "same-origin")
        #expect(a.content() == "Same Origin Referrer Link")
    }
    
    @Test("Create anchor with attributionsrc as boolean")
    func createAnchorWithBooleanAttributionSrc() {
        let a = Anchor<String>(
            attributionsrc: true,
            href: "https://example.com",
            content: { "Track on same domain" }
        )
        
        #expect(a.href?.description == "https://example.com")
        #expect(a.attributionsrc?.description == "")
        #expect(a.attributionsrc?.shouldInclude == true)
        #expect(a.content() == "Track on same domain")
    }
    
    @Test("Create anchor with attributionsrc with URL")
    func createAnchorWithAttributionSrcURL() {
        let a = Anchor<String>(
            attributionsrc: "https://analytics.example/register-source",
            href: "https://example.com",
            content: { "Track on analytics domain" }
        )
        
        #expect(a.href?.description == "https://example.com")
        #expect(a.attributionsrc?.description == "https://analytics.example/register-source")
        #expect(a.attributionsrc?.shouldInclude == true)
        #expect(a.content() == "Track on analytics domain")
    }
    
    @Test("Create anchor with excluded attributionsrc")
    func createAnchorWithExcludedAttributionSrc() {
        let a = Anchor<String>(
            attributionsrc: false,
            href: "https://example.com",
            content: { "Don't track attribution" }
        )
        
        #expect(a.href?.description == "https://example.com")
        #expect(a.attributionsrc?.shouldInclude == false)
        #expect(a.content() == "Don't track attribution")
    }
}
