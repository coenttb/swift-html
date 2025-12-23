//
//  HStack Tests.swift
//  swift-html
//
//  Tests for HStack layout component
//

import HTML
import HTML_Rendering_TestSupport
import StandardsTestSupport
import Testing

enum HStackTests {
    #TestSuites
}

// MARK: - Snapshot Tests

#if canImport(Darwin)
extension HStackTests.Test.Snapshot {
    @Test("HStack renders with default settings")
    func hstack() {
        assertInlineSnapshot(
            of: HStack {
                div { "First item" }
                div { "Second item" }
            },
            as: .html
        ) {
            """

            <div class="column-gap-0 size-1 flex-direction-2 display-3 vertical-align-4 align-items-5">
              <div>First item
              </div>
              <div>Second item
              </div>
            </div>
            """
        }
    }

    @Test("HStack with custom spacing and alignment")
    func hstackCustom() {
        assertInlineSnapshot(
            of: HStack(alignment: .top, spacing: .px(20)) {
                div { "First item" }
                div { "Second item" }
            },
            as: .html
        ) {
            """

            <div class="column-gap-0 size-1 flex-direction-2 display-3 vertical-align-4 align-items-5">
              <div>First item
              </div>
              <div>Second item
              </div>
            </div>
            """
        }
    }
}
#endif
