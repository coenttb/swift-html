//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import Dependencies
import Foundation
import HTML
import OrderedCollections
import HTML_Renderable_TestSupport
import Testing

extension SnapshotTests {
    @Suite("Tests")
    struct Tests {
        @Test("Label and input with light- and darkmode color")
        func labelAndInputWithLightAndDarkmodeColor() {
            assertInlineSnapshot(
                of: label { input.text }
                    .color(light: .red, dark: .blue),
                as: .html
            ) {
                """
                <label class="color-0 color-1"><input type="text"></label>
                """
            }
        }

        @Test("HStack")
        func hstack() {
            assertInlineSnapshot(
                of: HStack {
                    div { "First item" }
                    div { "Second item" }
                },
                as: .html
            ) {
                """

                <swift-html-hstack class="align-items-0 vertical-align-1 display-2 flex-direction-3 size-4 column-gap-5">
                  <div>First item
                  </div>
                  <div>Second item
                  </div>
                </swift-html-hstack>
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

                <swift-html-hstack class="align-items-0 vertical-align-1 display-2 flex-direction-3 size-4 column-gap-5">
                  <div>First item
                  </div>
                  <div>Second item
                  </div>
                </swift-html-hstack>
                """
            }
        }

        @Test("VStack")
        func vstack() {
            assertInlineSnapshot(
                of: VStack {
                    div { "First item" }
                    div { "Second item" }
                },
                as: .html
            ) {
                """

                <swift-html-vstack class="align-items-0 display-1 flex-direction-2 max-width-3 row-gap-4">
                  <div>First item
                  </div>
                  <div>Second item
                  </div>
                </swift-html-vstack>
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

                <swift-html-vstack class="align-items-0 display-1 flex-direction-2 max-width-3 row-gap-4">
                  <div>First item
                  </div>
                  <div>Second item
                  </div>
                </swift-html-vstack>
                """
            }
        }

        @Test("Spacer")
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

                <swift-html-hstack class="align-items-0 vertical-align-1 display-2 flex-direction-3 size-4 column-gap-5">
                  <div>Left
                  </div>
                  <swift-html-spacer class="flex-grow-6">
                  </swift-html-spacer>
                  <div>Right
                  </div>
                </swift-html-hstack>
                """
            }
        }

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

                <swift-html-vgrid class="width-0 display-1 grid-template-columns-2 column-gap-3 row-gap-4">
                  <div>Item 1
                  </div>
                  <div>Item 2
                  </div>
                  <div>Item 3
                  </div>
                </swift-html-vgrid>
                """
            }
        }

        @Test("LazyVGrid with media queries")
        func lazyVGridWithMediaQueries() {
            let columns: OrderedDictionary<HTML.AtRule.Media?, [Int]> = [
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

                <swift-html-vgrid class="width-0 display-1 grid-template-columns-2 column-gap-3 row-gap-4">
                  <div>Item 1
                  </div>
                  <div>Item 2
                  </div>
                </swift-html-vgrid>
                """
            }
        }
    }
}
