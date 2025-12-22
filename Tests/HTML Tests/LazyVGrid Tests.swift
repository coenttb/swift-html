//
//  LazyVGrid Tests.swift
//  swift-html
//
//  Tests for LazyVGrid layout component
//

import HTML
import HTML_Rendering_TestSupport
import Layout
import OrderedCollections
import StandardsTestSupport
import Testing

@testable import HTML

enum LazyVGridTests {
    #TestSuites
}

// MARK: - Snapshot Tests

extension LazyVGridTests.Test.Snapshot {
    @Test("LazyVGrid with fractions columns")
    func lazyVGrid() {
        assertInlineSnapshot(
            of: LazyVGrid(columns: .fractions([1, 2])) {
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
        assertInlineSnapshot(
            of: LazyVGrid(
                columns: [
                    nil: .count(1),
                    .desktop: .fractions([1, 1]),
                ],
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

    @Test("LazyVGrid with count columns")
    func lazyVGridWithCount() {
        assertInlineSnapshot(
            of: LazyVGrid(columns: .count(3)) {
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

    @Test("LazyVGrid with autoFit columns")
    func lazyVGridWithAutoFit() {
        assertInlineSnapshot(
            of: LazyVGrid(columns: .autoFit(minWidth: 200)) {
                div { "Item 1" }
                div { "Item 2" }
            },
            as: .html
        ) {
            """

            <div class="grid-template-columns-0 display-1 width-2">
              <div>Item 1
              </div>
              <div>Item 2
              </div>
            </div>
            """
        }
    }
}
