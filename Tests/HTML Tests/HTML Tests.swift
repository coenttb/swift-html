//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import Dependencies
import Foundation
import HTML
import HTML_Rendering_TestSupport
import OrderedCollections
import Testing

extension SnapshotTests {
    @Suite("Tests")
    struct Tests {
        @Test("Label and input with light- and darkmode color")
        func labelAndInputWithLightAndDarkmodeColor() {
            assertInlineSnapshot(
                of: label { input.text }
                    .css.color(HTMLColor(light: .red, dark: .blue)),
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
}
