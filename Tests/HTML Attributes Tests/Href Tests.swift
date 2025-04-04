import Foundation
import Testing
import HTML_Attributes
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Href Attribute Tests"
//    .snapshots(record: .all)
)
struct HrefTests {
    
    @Test("Initialize with string value")
    func initWithStringValue() {
        let href = Href("https://example.com")
        #expect(href.description == "https://example.com")
    }
    
    @Test("Initialize with string literal")
    func initWithStringLiteral() {
        let href: Href = "https://example.com"
        #expect(href.description == "https://example.com")
    }
    
    @Test("Initialize with URL")
    func initWithURL() {
        let url = URL(string: "https://example.com")!
        let href = Href(url)
        #expect(href.description == "https://example.com")
    }
    
    @Test("Create email link")
    func createEmailLink() {
        let href = Href.email("example@example.com")
        #expect(href.description == "mailto:example@example.com")
    }
    
    @Test("Create email link with subject")
    func createEmailLinkWithSubject() {
        let href = Href.email("example@example.com", subject: "Hello")
        #expect(href.description == "mailto:example@example.com?subject=Hello")
    }
    
    @Test("Create email link with subject and body")
    func createEmailLinkWithSubjectAndBody() {
        let href = Href.email("example@example.com", subject: "Hello", body: "How are you?")
        #expect(href.description == "mailto:example@example.com?subject=Hello&body=How%20are%20you%3F")
    }
    
    @Test("Create telephone link")
    func createTelephoneLink() {
        let href = Href.tel("123-456-7890")
        #expect(href.description == "tel:1234567890")
    }
    
    @Test("Create SMS link")
    func createSMSLink() {
        let href = Href.sms("123-456-7890")
        #expect(href.description == "sms:1234567890")
    }
    
    @Test("Create SMS link with body")
    func createSMSLinkWithBody() {
        let href = Href.sms("123-456-7890", body: "Hello there!")
        #expect(href.description == "sms:1234567890?body=Hello%20there!")
    }
    
    @Test("Create fragment link")
    func createFragmentLink() {
        let href = Href.fragment("https://example.com/page", fragment: "section")
        #expect(href.description == "https://example.com/page#section")
    }
    
    @Test("Create fragment link with hash already in fragment")
    func createFragmentLinkWithHashAlreadyInFragment() {
        let href = Href.fragment("https://example.com/page", fragment: "#section")
        #expect(href.description == "https://example.com/page#section")
    }
    
    @Test("Create anchor link")
    func createAnchorLink() {
        let href = Href.anchor("section")
        #expect(href.description == "#section")
    }
    
    @Test("Create anchor link with hash already in anchor")
    func createAnchorLinkWithHashAlreadyInAnchor() {
        let href = Href.anchor("#section")
        #expect(href.description == "#section")
    }
}
