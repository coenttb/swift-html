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
    
    @Test("Input with accept attribute renders correctly")
    func inputWithAcceptAttributeRendersCorrectly() {
        assertInlineSnapshot(
            of: input()
                .attribute("type", "file")
                .accept("image/*"),
            as: .html
        ) {
            """
            <input accept="image/*" type="file">
            """
        }
    }
    
    @Test("Input with multiple file types renders correctly")
    func inputWithMultipleFileTypesRendersCorrectly() {
        assertInlineSnapshot(
            of: input()
                .attribute("type", "file")
                .accept([".pdf", ".doc", ".docx"]),
            as: .html
        ) {
            """
            <input accept=".pdf, .doc, .docx" type="file">
            """
        }
    }
    
    @Test("Input with MIME types renders correctly")
    func inputWithMimeTypesRendersCorrectly() {
        assertInlineSnapshot(
            of: input()
                .attribute("type", "file")
                .accept("application/pdf", "application/msword"),
            as: .html
        ) {
            """
            <input accept="application/pdf, application/msword" type="file">
            """
        }
    }
    
    @Test("Input with mixed accept types renders correctly")
    func inputWithMixedAcceptTypesRendersCorrectly() {
        assertInlineSnapshot(
            of: input()
                .attribute("type", "file")
                .accept("image/*", ".pdf", "application/msword"),
            as: .html
        ) {
            """
            <input accept="image/*, .pdf, application/msword" type="file">
            """
        }
    }
    
    @Test("Form with file input renders correctly")
    func formWithFileInputRendersCorrectly() {
        assertInlineSnapshot(
            of: form {
                label()
                    .for("fileUpload")
//                    .text("Upload Images:")
                
                input()
                    .id("fileUpload")
//                    .attribute("type", "file")
                    .accept(.image)
                    .multiple
            },
            as: .html
        ) {
            """

            <form><label for="fileUpload"></label><input multiple accept="image/*" id="fileUpload">
            </form>
            """
        }
    }
}
