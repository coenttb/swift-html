import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Aside Element Tests"
)
struct AsideTests {
    
    @Test("Create basic aside")
    func createBasicAside() {
        let a = Aside<String>(
            content: { "Sidebar content" }
        )
        
        // Verify the content closure returns the expected value
        #expect(a.content() == "Sidebar content")
    }
    
    @Test("Create aside with lowercase typealias")
    func createAsideWithLowercaseTypealias() {
        let a = aside<String>(
            content: { "Note: This is important information" }
        )
        
        #expect(a.content() == "Note: This is important information")
    }
    
    @Test("Create aside with complex content")
    func createAsideWithComplexContent() {
        let a = aside<String>(
            content: {
                "Related fact: " +
                "The Rough-skinned Newt defends itself with a deadly neurotoxin."
            }
        )
        
        #expect(a.content() == "Related fact: The Rough-skinned Newt defends itself with a deadly neurotoxin.")
    }
}