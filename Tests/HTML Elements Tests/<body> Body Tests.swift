import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Body Element Tests"
)
struct BodyTests {
    
    @Test("Create basic body")
    func createBasicBody() {
        let b = Body<String>(
            content: { "Page content" }
        )
        
        // Verify the content closure returns the expected value
        #expect(b.content() == "Page content")
    }
    
    @Test("Create body with lowercase typealias")
    func createBodyWithLowercaseTypealias() {
        let b = body<String>(
            content: { "Page content using typealias" }
        )
        
        #expect(b.content() == "Page content using typealias")
    }
    
    @Test("Create body with complex content")
    func createBodyWithComplexContent() {
        let b = body<String>(
            content: {
                "Header section" +
                "Main content" +
                "Footer section"
            }
        )
        
        #expect(b.content() == "Header sectionMain contentFooter section")
    }
    
//    @SuppressWarnings(.deprecation)
    @Test("Create body with deprecated event handlers")
    func createBodyWithEventHandlers() {
        let b = Body<String>(
            onLoad: "initPage()",
            onResize: "handleResize()",
            content: { "Event handler test" }
        )
        
        #expect(b.onLoad == "initPage()")
        #expect(b.onResize == "handleResize()")
        #expect(b.content() == "Event handler test")
    }
}
