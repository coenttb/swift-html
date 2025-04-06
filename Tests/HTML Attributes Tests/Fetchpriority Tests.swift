///
/// FetchPriority Tests.swift
/// swift-html
///
/// Tests for the HTML fetchpriority attribute implementation.
///
/// Created by Claude on 04/06/2025.
///

import Testing
@testable import HTML_Attributes

@Suite("FetchPriority Attribute Tests")
final class FetchPriorityTests {
    
    @Test("FetchPriority enum has correct raw values")
    func testFetchPriorityRawValues() {
        #expect(FetchPriority.high.rawValue == "high")
        #expect(FetchPriority.low.rawValue == "low")
        #expect(FetchPriority.auto.rawValue == "auto")
    }
    
    @Test("FetchPriority enum values are equatable")
    func testFetchPriorityEquatable() {
        #expect(FetchPriority.high == .high)
        #expect(FetchPriority.high != .low)
        #expect(FetchPriority.high != .auto)
        
        let highPriority: FetchPriority = .high
        let anotherHighPriority: FetchPriority = .high
        #expect(highPriority == anotherHighPriority)
    }
    
    @Test("FetchPriority enum conforms to Sendable")
    func testFetchPrioritySendable() {
        // This test verifies at compile-time that FetchPriority conforms to Sendable
        // No runtime assertions are needed
        let _: @Sendable (FetchPriority) -> Void = { _ in }
    }
    
    @Test("FetchPriority initializes from valid string raw values")
    func testFetchPriorityInitFromRawValue() {
        #expect(FetchPriority(rawValue: "high") == .high)
        #expect(FetchPriority(rawValue: "low") == .low)
        #expect(FetchPriority(rawValue: "auto") == .auto)
        #expect(FetchPriority(rawValue: "invalid") == nil)
    }
}
