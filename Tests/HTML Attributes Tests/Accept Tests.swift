import Foundation
import Testing
import HTML_Attributes
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Accept Attribute Tests",
//    .snapshots(record: .all)
)
struct AcceptTests {
    
    @Test("Initialize with string value")
    func initWithStringValue() {
        let accept = Accept("image/jpeg")
        #expect(accept.description == "image/jpeg")
    }
    
    @Test("Initialize with string literal")
    func initWithStringLiteral() {
        let accept: Accept = .init("image/png")
        #expect(accept.description == "image/png")
    }
//    
//    @Test("Initialize with array of strings")
//    func initWithArrayOfStrings() {
//        let accept = Accept(["image/jpeg", "image/png"])
//        #expect(accept.description == "image/jpeg, image/png")
//    }
//    
//    @Test("Initialize with variadic strings")
//    func initWithVariadicStrings() {
//        let accept = Accept("image/jpeg", "image/png", "image/gif")
//        #expect(accept.description == "image/jpeg, image/png, image/gif")
//    }
//
//    @Test("HTML extension with Accept instance")
//    func htmlExtensionWithAcceptInstance() {
//        let element = input().accept(Accept("image/*"))
//        #expect(element.attributes.first?.key == "accept")
//        #expect(element.attributes.first?.value == "image/*")
//    }
//    
//    @Test("HTML extension with string value")
//    func htmlExtensionWithStringValue() {
//        let element = input().accept("image/*")
//        #expect(element.attributes.first?.key == "accept")
//        #expect(element.attributes.first?.value == "image/*")
//    }
//    
//    @Test("HTML extension with Accept array")
//    func htmlExtensionWithAcceptArray() {
//        let element = input().accept([Accept("image/jpeg"), Accept("image/png")])
//        #expect(element.attributes.first?.key == "accept")
//        #expect(element.attributes.first?.value == "image/jpeg, image/png")
//    }
//    
//    @Test("HTML extension with variadic Accept parameters")
//    func htmlExtensionWithVariadicAcceptParams() {
//        let element = input().accept(Accept("image/jpeg"), Accept("image/png"))
//        #expect(element.attributes.first?.key == "accept")
//        #expect(element.attributes.first?.value == "image/jpeg, image/png")
//    }
}
