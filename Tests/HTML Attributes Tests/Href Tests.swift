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
    
    @Test("Link renders correctly")
    func linkRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Visit Example"
            }
                .href("https://example.com"),
            as: .html
        ) {
            """
            <a href="https://example.com">Visit Example</a>
            """
        }
    }
    
    @Test("Email link renders correctly")
    func emailLinkRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Contact Us"
            }
                .emailLink("example@example.com"),
            as: .html
        ) {
            """
            <a href="mailto:example@example.com">Contact Us</a>
            """
        }
    }
    
    @Test("Email link with subject renders correctly")
    func emailLinkWithSubjectRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Contact Us"
            }
                .emailLink("example@example.com", subject: "Inquiry"),
            as: .html
        ) {
            """
            <a href="mailto:example@example.com?subject=Inquiry">Contact Us</a>
            """
        }
    }
    
    @Test("Telephone link renders correctly")
    func telephoneLinkRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Call Us"
            }
                .telLink("123-456-7890"),
            as: .html
        ) {
            """
            <a href="tel:1234567890">Call Us</a>
            """
        }
    }
    
    @Test("SMS link renders correctly")
    func smsLinkRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Text Us"
            }
                .smsLink("123-456-7890", body: "I have a question"),
            as: .html
        ) {
            """
            <a href="sms:1234567890?body=I%20have%20a%20question">Text Us</a>
            """
        }
    }
    
    @Test("Fragment link renders correctly")
    func fragmentLinkRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Go to Section 1"
            }
                .fragmentLink("section1"),
            as: .html
        ) {
            """
            <a href="#section1">Go to Section 1</a>
            """
        }
    }
    
    @Test("Complete navigation example renders correctly")
    func completeNavigationExampleRendersCorrectly() {
        assertInlineSnapshot(
            of: nav {
                ul {
                    li {
                        a {
                            "Home"
                        }
                            .href("https://example.com")
                    }
                    li {
                        a {
                            "About"
                        }
                            .href("https://example.com/about")
                    }
                    li {
                        a {
                            "Contact"
                        }
                            .href("https://example.com/contact")
                    }
                    li {
                        a {
                            "Email Us"
                        }
                            .emailLink("info@example.com")
                    }
                    li {
                        a {
                            "Call Us"
                        }
                            .telLink("123-456-7890")
                    }
                }
            },
            as: .html
        ) {
            """

            <nav>
              <ul>
                <li><a href="https://example.com">Home</a>
                </li>
                <li><a href="https://example.com/about">About</a>
                </li>
                <li><a href="https://example.com/contact">Contact</a>
                </li>
                <li><a href="mailto:info@example.com">Email Us</a>
                </li>
                <li><a href="tel:1234567890">Call Us</a>
                </li>
              </ul>
            </nav>
            """
        }
    }
}
