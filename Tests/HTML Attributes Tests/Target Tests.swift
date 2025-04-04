import Foundation
import Testing
import HTML_Attributes
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Target Attribute Tests",
//    .snapshots(record: .all)
)
struct TargetTests {
    
    @Test("Initialize with string value")
    func initWithStringValue() {
        let target = Target("content-frame")
        #expect(target.description == "content-frame")
    }
    
    @Test("Initialize with string literal")
    func initWithStringLiteral() {
        let target: Target = "content-frame"
        #expect(target.description == "content-frame")
    }

    @Test("Blank target value")
    func blankTargetValue() {
        let target = Target.blank
        #expect(target.description == "_blank")
    }
    
    @Test("Parent target value")
    func parentTargetValue() {
        let target = Target.parent
        #expect(target.description == "_parent")
    }
    
    @Test("Top target value")
    func topTargetValue() {
        let target = Target.top
        #expect(target.description == "_top")
    }
    
    @Test("UnfencedTop target value")
    func unfencedTopTargetValue() {
        let target = Target.unfencedTop
        #expect(target.description == "_unfencedTop")
    }
    
    @Test("Named target factory method")
    func namedTargetFactoryMethod() {
        let target = Target.named("content-frame")
        #expect(target.description == "content-frame")
    }
}
