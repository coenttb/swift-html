//
//  LazyVGrid Tests.swift
//  swift-html
//
//  Tests for LazyVGrid layout component
//

import HTML
import HTML_Rendering_TestSupport
import OrderedCollections
import StandardsTestSupport
import Testing

@testable import HTML

enum LazyVGridTests {
    #TestSuites
}

extension LazyVGridTests.Test {
    typealias Snapshot = Test.Snapshot
}

// MARK: - Snapshot Tests

extension LazyVGridTests.Test.Snapshot {
    @Test("LazyVGrid with simple columns")
    func lazyVGrid() {
        assertInlineSnapshot(
            of: LazyVGrid(columns: [1, 2]) {
                div { "Item 1" }
                div { "Item 2" }
                div { "Item 3" }
            },
            as: .html
        ) {
            """

            <div class="grid-template-columns-0 display-1 width-2">
              <div>Item 1
              </div>
              <div>Item 2
              </div>
              <div>Item 3
              </div>
            </div>
            """
        }
    }

    @Test("LazyVGrid with media queries")
    func lazyVGridWithMediaQueries() {
        let columns: OrderedDictionary<CSS_Standard.Media?, [Int]> = [
            nil: [1],
            .desktop: [1, 1],
        ]

        assertInlineSnapshot(
            of: LazyVGrid(
                columns: columns,
                horizontalSpacing: .px(10),
                verticalSpacing: .px(20)
            ) {
                div { "Item 1" }
                div { "Item 2" }
            },
            as: .html
        ) {
            """

            <div class="row-gap-0 column-gap-1 grid-template-columns-2 display-3 width-4">
              <div>Item 1
              </div>
              <div>Item 2
              </div>
            </div>
            """
        }
    }
}
