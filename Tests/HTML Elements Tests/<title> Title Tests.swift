import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Title Element Tests"
)
struct TitleTests {
    
    @Test("Create basic title")
    func createBasicTitle() {
        let t = Title<String>(
            content: { "Page Title" }
        )
        
        // Verify the content closure returns the expected value
        #expect(t.content() == "Page Title")
    }
    
    @Test("Create title with lowercase typealias")
    func createTitleWithLowercaseTypealias() {
        let t = title<String>(
            content: { "Document Title" }
        )
        
        #expect(t.content() == "Document Title")
    }
    
    @Test("Create title with complex content")
    func createTitleWithComplexTitle() {
        let t = title<String>(
            content: { "Product Page - Company Name | Website" }
        )
        
        #expect(t.content() == "Product Page - Company Name | Website")
    }
}