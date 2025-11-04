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
import PointFreeHTMLTestSupport
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
        <label class="color-ILzRW1 color-Hx6Lg1"><input type="text"></label>
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

        <swift-html-hstack class="column-gap-dnNPN1 size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-cvXVf align-items-msN8p3">
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

        <swift-html-hstack class="column-gap-6PqSI size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-Xai2x align-items-msN8p3">
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

        <swift-html-vstack class="row-gap-dnNPN1 max-width-C8uWv flex-direction-7gclL display-BvS8W3 align-items-msN8p3">
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

        <swift-html-vstack class="row-gap-8DJ5t4 max-width-C8uWv flex-direction-7gclL display-BvS8W3 align-items-cQlZY2">
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

        <swift-html-hstack class="column-gap-dnNPN1 size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-cvXVf align-items-msN8p3">
          <div>Left
          </div>
          <swift-html-spacer class="flex-grow-tzL8I2">
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

        <swift-html-vgrid class="width-C8uWv column-gap-dnNPN1 display-mqllb2 grid-template-columns-hE9y01 row-gap-dnNPN1">
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
      let columns: OrderedDictionary<CSSAtRuleTypes.Media?, [Int]> = [
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

        <swift-html-vgrid class="width-C8uWv column-gap-Fqw6a1 display-mqllb2 grid-template-columns-DrUWy row-gap-6PqSI column-gap-mELsu1 display-dKpjI2 grid-template-columns-ofQqx2 row-gap-WT66U">
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
