import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Abbreviation Element Tests"
)
struct AbbreviationTests {
    
    @Test("Create basic abbreviation")
    func createBasicAbbreviation() {
        let abbr = Abbreviation<String>(
            content: { "HTML" }
        )
        
        // Verify the content closure returns the expected value
        #expect(abbr.content() == "HTML")
    }
    
    @Test("Create abbreviation with lowercase typealias")
    func createAbbreviationWithLowercaseTypealias() {
        let abbr = abbr<String>(
            content: { "CSS" }
        )
        
        #expect(abbr.content() == "CSS")
    }
}
