//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 10/04/2025.
//

import HTML
import Testing
import Foundation
import Dependencies
import InlineSnapshotTesting
import OrderedCollections

@Suite(
    "Tests",
    .snapshots(record: .failed)
)
struct Tests {
    @Test("Label and input with light- and darkmode color")
    func labelAndInputWithLightAndDarkmodeColor() {
        assertInlineSnapshot(
            of: label { input.text }
                .color(light: .red, dark: .blue),
            as: .html
        ) {
            """
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .color-xzFcW{color:@media (prefers-color-scheme: light) { #cc3333 } @media (prefers-color-scheme: dark) { #3399ff }}

                </style>
              </head>
              <body><label class="color-xzFcW"><input type="text"></label>
              </body>
            </html>
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .column-gap-dnNPN1{column-gap:1rem}
            .size-C8uWv{size:100%}
            .flex-direction-jlten2{flex-direction:row}
            .display-BvS8W3{display:flex}
            .vertical-align-cvXVf{vertical-align:middle}
            .align-items-msN8p3{align-items:stretch}

                </style>
              </head>
              <body>
            <swift-html-hstack class="column-gap-dnNPN1 size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-cvXVf align-items-msN8p3">
              <div>First item
              </div>
              <div>Second item
              </div>
            </swift-html-hstack>
              </body>
            </html>
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .column-gap-6PqSI{column-gap:20px}
            .size-C8uWv{size:100%}
            .flex-direction-jlten2{flex-direction:row}
            .display-BvS8W3{display:flex}
            .vertical-align-Xai2x{vertical-align:top}
            .align-items-msN8p3{align-items:stretch}

                </style>
              </head>
              <body>
            <swift-html-hstack class="column-gap-6PqSI size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-Xai2x align-items-msN8p3">
              <div>First item
              </div>
              <div>Second item
              </div>
            </swift-html-hstack>
              </body>
            </html>
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .row-gap-dnNPN1{row-gap:1rem}
            .max-width-C8uWv{max-width:100%}
            .flex-direction-7gclL{flex-direction:column}
            .display-BvS8W3{display:flex}
            .align-items-CdPBO2{align-items:center}

                </style>
              </head>
              <body>
            <swift-html-vstack class="row-gap-dnNPN1 max-width-C8uWv flex-direction-7gclL display-BvS8W3 align-items-CdPBO2">
              <div>First item
              </div>
              <div>Second item
              </div>
            </swift-html-vstack>
              </body>
            </html>
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .row-gap-8DJ5t4{row-gap:15px}
            .max-width-C8uWv{max-width:100%}
            .flex-direction-7gclL{flex-direction:column}
            .display-BvS8W3{display:flex}
            .align-items-cQlZY2{align-items:start}

                </style>
              </head>
              <body>
            <swift-html-vstack class="row-gap-8DJ5t4 max-width-C8uWv flex-direction-7gclL display-BvS8W3 align-items-cQlZY2">
              <div>First item
              </div>
              <div>Second item
              </div>
            </swift-html-vstack>
              </body>
            </html>
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .column-gap-dnNPN1{column-gap:1rem}
            .size-C8uWv{size:100%}
            .flex-direction-jlten2{flex-direction:row}
            .display-BvS8W3{display:flex}
            .vertical-align-cvXVf{vertical-align:middle}
            .align-items-msN8p3{align-items:stretch}
            .flex-grow-tzL8I2{flex-grow:1}

                </style>
              </head>
              <body>
            <swift-html-hstack class="column-gap-dnNPN1 size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-cvXVf align-items-msN8p3">
              <div>Left
              </div>
              <swift-html-spacer class="flex-grow-tzL8I2">
              </swift-html-spacer>
              <div>Right
              </div>
            </swift-html-hstack>
              </body>
            </html>
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .width-C8uWv{width:100%}
            .column-gap-dnNPN1{column-gap:1rem}
            .display-mqllb2{display:grid}
            .grid-template-columns-hE9y01{grid-template-columns:minmax(0, 1fr) minmax(0, 2fr)}
            .row-gap-dnNPN1{row-gap:1rem}

                </style>
              </head>
              <body>
            <swift-html-vgrid class="width-C8uWv column-gap-dnNPN1 display-mqllb2 grid-template-columns-hE9y01 row-gap-dnNPN1">
              <div>Item 1
              </div>
              <div>Item 2
              </div>
              <div>Item 3
              </div>
            </swift-html-vgrid>
              </body>
            </html>
            """
        }
    }
    
    @Test("LazyVGrid with media queries")
    func lazyVGridWithMediaQueries() {
        let columns: OrderedDictionary<MediaQuery?, [Int]> = [
            nil: [1],
            .desktop: [1, 1]
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
            <!doctype html>
            <html lang="en">
              <head>
                <style>
            .width-C8uWv{width:100%}
            .column-gap-Fqw6a1{column-gap:10px}
            .display-mqllb2{display:grid}
            .grid-template-columns-DrUWy{grid-template-columns:minmax(0, 1fr)}
            .row-gap-6PqSI{row-gap:20px}
            @media only screen and (min-width: 832px){
              .column-gap-exu3i3{column-gap:10px}
              .display-jdJkm4{display:grid}
              .grid-template-columns-AWWfa{grid-template-columns:minmax(0, 1fr) minmax(0, 1fr)}
              .row-gap-pdWkF1{row-gap:20px}
            }

                </style>
              </head>
              <body>
            <swift-html-vgrid class="width-C8uWv column-gap-Fqw6a1 display-mqllb2 grid-template-columns-DrUWy row-gap-6PqSI column-gap-exu3i3 display-jdJkm4 grid-template-columns-AWWfa row-gap-pdWkF1">
              <div>Item 1
              </div>
              <div>Item 2
              </div>
            </swift-html-vgrid>
              </body>
            </html>
            """
        }
    }
}
