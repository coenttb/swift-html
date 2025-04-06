import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Meta Element Tests"
)
struct MetaTests {
    
    @Test("Create meta with charset")
    func createMetaWithCharset() {
        let m = Meta(
            charset: "utf-8"
        )
        
        #expect(m.charset == "utf-8")
        #expect(m.content == nil)
        #expect(m.httpEquiv == nil)
        #expect(m.name == nil)
    }
    
    @Test("Create meta with name and content")
    func createMetaWithNameAndContent() {
        let m = Meta(
            name: .description,
            content: "Page description for SEO"
        )
        
        #expect(m.name == .description)
        #expect(m.content == "Page description for SEO")
        #expect(m.charset == nil)
        #expect(m.httpEquiv == nil)
    }
    
    @Test("Create meta with custom name and content")
    func createMetaWithCustomNameAndContent() {
        let m = Meta(
            name: "og:title",
            content: "Open Graph Title"
        )
        
        #expect(m.name == "og:title")
        #expect(m.content == "Open Graph Title")
        #expect(m.charset == nil)
        #expect(m.httpEquiv == nil)
    }
    
    @Test("Create meta with http-equiv and content")
    func createMetaWithHttpEquivAndContent() {
        let m = Meta(
            httpEquiv: .refresh,
            content: "3;url=https://example.com"
        )
        
        #expect(m.httpEquiv == .refresh)
        #expect(m.content == "3;url=https://example.com")
        #expect(m.charset == nil)
        #expect(m.name == nil)
    }
    
    @Test("Create meta with custom http-equiv and content")
    func createMetaWithCustomHttpEquivAndContent() {
        let m = Meta(
            httpEquiv: "custom-header",
            content: "header-value"
        )
        
        #expect(m.httpEquiv == "custom-header")
        #expect(m.content == "header-value")
        #expect(m.charset == nil)
        #expect(m.name == nil)
    }
    
    @Test("Create meta with theme-color and media")
    func createMetaWithThemeColorAndMedia() {
        let m = Meta(
            name: .themeColor,
            content: "#4285f4",
            media: "(prefers-color-scheme: light)"
        )
        
        #expect(m.name == .themeColor)
        #expect(m.content == "#4285f4")
        #expect(m.media == "(prefers-color-scheme: light)")
    }
    
    @Test("Create meta with lowercase typealias")
    func createMetaWithLowercaseTypealias() {
        let m = meta(
            charset: "utf-8"
        )
        
        #expect(m.charset == "utf-8")
    }
    
    @Test("Use static utf8 factory method")
    func useStaticUtf8FactoryMethod() {
        let m = Meta.utf8
        
        #expect(m.charset == "utf-8")
    }
    
    @Test("Use static viewport factory method")
    func useStaticViewportFactoryMethod() {
        let m = Meta.viewport
        
        #expect(m.name == .viewport)
        #expect(m.content == "width=device-width, initial-scale=1")
    }
    
    @Test("Use static description factory method")
    func useStaticDescriptionFactoryMethod() {
        let m = Meta.description("Page description for testing")
        
        #expect(m.name == .description)
        #expect(m.content == "Page description for testing")
    }
    
    @Test("Use static themeColor factory method")
    func useStaticThemeColorFactoryMethod() {
        let m = Meta.themeColor("#ff0000", media: "(prefers-color-scheme: dark)")
        
        #expect(m.name == .themeColor)
        #expect(m.content == "#ff0000")
        #expect(m.media == "(prefers-color-scheme: dark)")
    }
    
    @Test("Use static redirect factory method")
    func useStaticRedirectFactoryMethod() {
        let m = Meta.redirect(after: 5, to: "https://example.com")
        
        #expect(m.httpEquiv == .refresh)
        #expect(m.content == "5;url=https://example.com")
    }
    
    @Test("Use static openGraph factory method")
    func useStaticOpenGraphFactoryMethod() {
        let m = Meta.openGraph(property: "og:image", content: "https://example.com/image.jpg")
        
        #expect(m.content == "https://example.com/image.jpg")
    }
    
    @Test("Test http-equiv enum values")
    func testHttpEquivEnumValues() {
        #expect(Meta.HttpEquiv.contentSecurityPolicy.description == "content-security-policy")
        #expect(Meta.HttpEquiv.contentType.description == "content-type")
        #expect(Meta.HttpEquiv.defaultStyle.description == "default-style")
        #expect(Meta.HttpEquiv.refresh.description == "refresh")
        #expect(Meta.HttpEquiv.xUaCompatible.description == "x-ua-compatible")
    }
    
    @Test("Test name enum values")
    func testNameEnumValues() {
        #expect(Meta.Name.application.description == "application-name")
        #expect(Meta.Name.author.description == "author")
        #expect(Meta.Name.description.description == "description")
        #expect(Meta.Name.generator.description == "generator")
        #expect(Meta.Name.keywords.description == "keywords")
        #expect(Meta.Name.referrer.description == "referrer")
        #expect(Meta.Name.themeColor.description == "theme-color")
        #expect(Meta.Name.robots.description == "robots")
        #expect(Meta.Name.viewport.description == "viewport")
    }
}
