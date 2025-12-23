//
//  Spacer Tests.swift
//  swift-html
//
//  Tests for Spacer layout component
//

import HTML
import HTML_Rendering_TestSupport
import StandardsTestSupport
import Testing

extension Spacer {
    #TestSuites
}

// MARK: - Snapshot Tests

#if canImport(Darwin)
    extension Spacer.Test.Snapshot {
        @Test("Spacer pushes items apart in HStack")
        func spacer() {
            assertInlineSnapshot(
                of: HStack {
                    div { "Left" }
                    Spacer()
                    div { "Right" }
                },
                as: .html
            ) {
                """

                <div class="column-gap-0 size-1 flex-direction-2 display-3 vertical-align-4 align-items-5">
                  <div>Left
                  </div>
                  <div class="flex-grow-6">
                  </div>
                  <div>Right
                  </div>
                </div>
                """
            }
        }
    }
#endif
