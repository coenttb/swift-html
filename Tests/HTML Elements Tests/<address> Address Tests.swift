import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Address Element Tests"
)
struct AddressTests {
    
    @Test("Create basic address")
    func createBasicAddress() {
        let addr = Address<String>(
            content: { "123 Main St, City, Country" }
        )
        
        // Verify the content closure returns the expected value
        #expect(addr.content() == "123 Main St, City, Country")
    }
    
    @Test("Create address with lowercase typealias")
    func createAddressWithLowercaseTypealias() {
        let addr = address<String>(
            content: { "contact@example.com" }
        )
        
        #expect(addr.content() == "contact@example.com")
    }
    
    @Test("Create address with complex content")
    func createAddressWithComplexContent() {
        let addr = address<String>(
            content: {
                "Mozilla Foundation" +
                "331 E Evelyn Ave" +
                "Mountain View, CA 94041" +
                "USA"
            }
        )
        
        #expect(addr.content() == "Mozilla Foundation331 E Evelyn AveMountain View, CA 94041USA")
    }
}