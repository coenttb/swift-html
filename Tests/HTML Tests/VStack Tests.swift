//
//  VStack Tests.swift
//  swift-html
//
//  Tests for VStack layout component
//

import HTML
import HTML_Rendering_TestSupport
import StandardsTestSupport
import Testing

enum VStackTests {
    #TestSuites
}

// MARK: - Snapshot Tests

#if canImport(Darwin)
    extension VStackTests.Test.Snapshot {
        @Test("VStack renders with default settings")
        func vstack() {
            assertInlineSnapshot(
                of: VStack {
                    div { "First item" }
                    div { "Second item" }
                },
                as: .html
            ) {
                """

                <div class="row-gap-0 max-width-1 flex-direction-2 display-3 align-items-4">
                  <div>First item
                  </div>
                  <div>Second item
                  </div>
                </div>
                """
            }
        }

        @Test("VStack with custom spacing and alignment")
        func vstackCustom() {
            assertInlineSnapshot(
                of: VStack(alignment: .start, spacing: .px(15)) {
                    div { "First item" }
                    div { "Second item" }
                },
                as: .html
            ) {
                """

                <div class="row-gap-0 max-width-1 flex-direction-2 display-3 align-items-4">
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
