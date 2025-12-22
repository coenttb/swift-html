//
//  CSS Tests.swift
//  swift-html
//
//  Tests for CSS fluent chaining pattern and CSS properties
//

import HTML
import HTML_Rendering_TestSupport
import StandardsTestSupport
import Testing

@testable import HTML

// CSS is a namespace, so we create a dedicated test enum
enum CSSNamespace {
    #TestSuites
}

extension CSSNamespace.Test {
    typealias Snapshot = Test.Snapshot
}

// MARK: - Snapshot Tests - Fluent Chaining

extension CSSNamespace.Test.Snapshot {
    @Test("Fluent chaining without repeated .css calls")
    func fluentChaining() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    "Styled content"
                }
                .css
                .display(.flex)
                .padding(.px(16))
                .margin(.px(8))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-0{margin:8px}
                  .padding-1{padding:16px}
                  .display-2{display:flex}
                </style>
              </head>
              <body>
                <div class="margin-0 padding-1 display-2">Styled content
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("CSS conforms to HTML.View - usable in result builder")
    func htmlViewConformance() {
        struct TestView: HTML.View {
            var body: some HTML.View {
                div {
                    "Test"
                }
                .css
                .color(.init(light: .red, dark: .blue))
                .fontSize(.px(14))
            }
        }

        assertInlineSnapshot(
            of: HTML.Document {
                TestView()
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .font-size-0{font-size:14px}
                  .color-2{color:#cc3333}
                  @media (prefers-color-scheme: dark){
                    .color-1{color:#3399ff}
                  }
                </style>
              </head>
              <body>
                <div class="font-size-0 color-1 color-2">Test
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Multiple CSS properties chained fluently")
    func multiplePropertiesChained() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    "Card"
                }
                .css
                .display(.flex)
                .flexDirection(.column)
                .alignItems(.center)
                .justifyContent(.center)
                .padding(.px(24))
                .borderRadius(.px(8))
                .css.backgroundColor(HTMLColor(light: .white, dark: .hex("1a1a1a")))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .background-color-1{background-color:#FFFFFF}
                  .border-radius-2{border-radius:8px}
                  .padding-3{padding:24px}
                  .justify-content-4{justify-content:center}
                  .align-items-5{align-items:center}
                  .flex-direction-6{flex-direction:column}
                  .display-7{display:flex}
                  @media (prefers-color-scheme: dark){
                    .background-color-0{background-color:#1a1a1a}
                  }
                </style>
              </head>
              <body>
                <div class="background-color-0 background-color-1 border-radius-2 padding-3 justify-content-4 align-items-5 flex-direction-6 display-7">Card
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("CSS namespace with media queries")
    func cssWithMediaQueries() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    "Responsive"
                }
                .css
                .display(.block)
                .padding(.px(8))
                .media(.minWidth(.px(768))) {
                    $0.display(.flex)
                        .padding(.px(16))
                }
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .padding-2{padding:8px}
                  .display-3{display:block}
                  @media (min-width: 768px){
                    .padding-0{padding:16px}
                    .display-1{display:flex}
                  }
                </style>
              </head>
              <body>
                <div class="padding-0 display-1 padding-2 display-3">Responsive
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Mixing .css namespace with direct method calls")
    func mixingCssNamespaceWithDirectCalls() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    "Mixed"
                }
                .attribute("data-testid", "mixed-element")
                .css
                .display(.flex)
                .padding(.px(16))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .padding-0{padding:16px}
                  .display-1{display:flex}
                </style>
              </head>
              <body>
                <div class="padding-0 display-1" data-testid="mixed-element">Mixed
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Position properties via CSS namespace")
    func positionProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    "Positioned"
                }
                .css
                .position(.absolute)
                .top(.px(0))
                .right(.px(0))
                .bottom(.auto)
                .left(.auto)
                .zIndex(.init(10))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .z-index-0{z-index:10}
                  .left-1{left:auto}
                  .bottom-2{bottom:auto}
                  .right-3{right:0px}
                  .top-4{top:0px}
                  .position-5{position:absolute}
                </style>
              </head>
              <body>
                <div class="z-index-0 left-1 bottom-2 right-3 top-4 position-5">Positioned
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Typography properties via CSS namespace")
    func typographyProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p {
                    "Styled text"
                }
                .css
                .fontSize(.px(16))
                .fontWeight(.bold)
                .lineHeight(1.5)
                .textAlign(.center)
                .textDecoration(.underline)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-decoration-0{text-decoration:underline}
                  .text-align-1{text-align:center}
                  .line-height-2{line-height:1.5}
                  .font-weight-3{font-weight:bold}
                  .font-size-4{font-size:16px}
                </style>
              </head>
              <body>
                <p class="text-decoration-0 text-align-1 line-height-2 font-weight-3 font-size-4">Styled text
                </p>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Snapshot Tests - Text Properties

extension CSSNamespace.Test.Snapshot {
    @Test("text with align only")
    func textAlignOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Centered text" }
                    .css.text(align: .center)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-align-0{text-align:center}
                </style>
              </head>
              <body>
                <p class="text-align-0">Centered text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with decoration only")
    func textDecorationOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Underlined text" }
                    .css.text(decoration: .underline)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-decoration-0{text-decoration:underline}
                </style>
              </head>
              <body>
                <p class="text-decoration-0">Underlined text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with transform only")
    func textTransformOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Uppercase text" }
                    .css.text(transform: .uppercase)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-transform-0{text-transform:uppercase}
                </style>
              </head>
              <body>
                <p class="text-transform-0">Uppercase text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with overflow only")
    func textOverflowOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Ellipsis text" }
                    .css.text(overflow: .ellipsis)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-overflow-0{text-overflow:ellipsis}
                </style>
              </head>
              <body>
                <p class="text-overflow-0">Ellipsis text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with multiple properties")
    func textMultipleProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Styled text" }
                    .css.text(
                        align: .center,
                        decoration: .underline,
                        transform: .uppercase
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-transform-0{text-transform:uppercase}
                  .text-decoration-1{text-decoration:underline}
                  .text-align-2{text-align:center}
                </style>
              </head>
              <body>
                <p class="text-transform-0 text-decoration-1 text-align-2">Styled text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with all properties")
    func textAllProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Fully styled text" }
                    .css.text(
                        align: .center,
                        decoration: .underline,
                        transform: .uppercase,
                        overflow: .ellipsis
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .text-overflow-0{text-overflow:ellipsis}
                  .text-transform-1{text-transform:uppercase}
                  .text-decoration-2{text-decoration:underline}
                  .text-align-3{text-align:center}
                </style>
              </head>
              <body>
                <p class="text-overflow-0 text-transform-1 text-decoration-2 text-align-3">Fully styled text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text with no properties returns base unchanged")
    func textNoProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Plain text" }
                    .css.text()
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
              </head>
              <body>
                <p>Plain text
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("text chains with other CSS properties")
    func textChainsWithOtherProperties() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Chained text" }
                    .css
                    .text(
                        align: .center,
                        transform: .uppercase
                    )
                    .color(.red)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-1{color:#cc3333}
                  .text-transform-2{text-transform:uppercase}
                  .text-align-3{text-align:center}
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#ff1a1a}
                  }
                </style>
              </head>
              <body>
                <p class="color-0 color-1 text-transform-2 text-align-3">Chained text
                </p>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Snapshot Tests - Border Properties

extension CSSNamespace.Test.Snapshot {
    @Test("Border with light- and darkmode color for all sides")
    func borderAllSides() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    HTML.Empty()
                }
                .css.border(
                    Border.Side.all,
                    width: .px(1),
                    style: .solid,
                    color: .init(light: .red, dark: .blue)
                )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-1{border:1px solid #cc3333}
                  @media (prefers-color-scheme: dark){
                    .border-0{border:1px solid #3399ff}
                  }
                </style>
              </head>
              <body>
                <div class="border-0 border-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Border with light- and darkmode color for some sides")
    func borderSomeSides() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    HTML.Empty()
                }
                .css.border(
                    [.right, .left, .bottom],
                    width: .px(1),
                    style: .solid,
                    color: .init(
                        light: .red,
                        dark: .blue
                    )
                )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-left-1{border-left:1px solid #cc3333}
                  .border-bottom-3{border-bottom:1px solid #cc3333}
                  .border-right-5{border-right:1px solid #cc3333}
                  @media (prefers-color-scheme: dark){
                    .border-left-0{border-left:1px solid #3399ff}
                    .border-bottom-2{border-bottom:1px solid #3399ff}
                    .border-right-4{border-right:1px solid #3399ff}
                  }
                </style>
              </head>
              <body>
                <div class="border-left-0 border-left-1 border-bottom-2 border-bottom-3 border-right-4 border-right-5">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Border with light- and darkmode color for some sides using variadic")
    func borderSomeSidesVariadic() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {
                    HTML.Empty()
                }
                .css.border(
                    .right,
                    .left,
                    .bottom,
                    width: .px(1),
                    style: .solid,
                    color: .init(
                        light: .red,
                        dark: .blue
                    )
                )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-left-1{border-left:1px solid #cc3333}
                  .border-bottom-3{border-bottom:1px solid #cc3333}
                  .border-right-5{border-right:1px solid #cc3333}
                  @media (prefers-color-scheme: dark){
                    .border-left-0{border-left:1px solid #3399ff}
                    .border-bottom-2{border-bottom:1px solid #3399ff}
                    .border-right-4{border-right:1px solid #3399ff}
                  }
                </style>
              </head>
              <body>
                <div class="border-left-0 border-left-1 border-bottom-2 border-bottom-3 border-right-4 border-right-5">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Border shorthand")
    func borderShorthand() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .border(
                        .init(
                            width: .length(1.px),
                            style: .solid,
                            color: .red
                        )
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-1{border:1px solid #cc3333}
                  @media (prefers-color-scheme: dark){
                    .border-0{border:1px solid #ff1a1a}
                  }
                </style>
              </head>
              <body>
                <div class="border-0 border-1">
                </div>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Snapshot Tests - Margin Properties

extension CSSNamespace.Test.Snapshot {
    @Test("Margin Vertical Horizontal")
    func marginVerticalHorizontal() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(vertical: .px(10), horizontal: .px(20))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-0{margin:10px 20px}
                </style>
              </head>
              <body>
                <div class="margin-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin Vertical Only")
    func marginVerticalOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(vertical: .px(15))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-bottom-0{margin-bottom:15px}
                  .margin-top-1{margin-top:15px}
                </style>
              </head>
              <body>
                <div class="margin-bottom-0 margin-top-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin Horizontal Only")
    func marginHorizontalOnly() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(horizontal: .px(25))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-left-0{margin-left:25px}
                  .margin-right-1{margin-right:25px}
                </style>
              </head>
              <body>
                <div class="margin-left-0 margin-right-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin Set Variant")
    func marginVariants() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(
                        top: .px(10),
                        right: .px(20),
                        bottom: .px(15),
                        left: .px(25)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-0{margin:10px 20px 15px 25px}
                </style>
              </head>
              <body>
                <div class="margin-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin with Media Query")
    func marginWithMediaQuery() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .media(.screen && .minWidth(.px(768))) {
                        $0.margin(
                            top: .px(10),
                            bottom: .px(15)
                        )
                    }
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  @media screen and (min-width: 768px){
                    .margin-bottom-0{margin-bottom:15px}
                    .margin-top-1{margin-top:10px}
                  }
                </style>
              </head>
              <body>
                <div class="margin-bottom-0 margin-top-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin with optional inputs")
    func marginWithOptionalInputs() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(
                        top: .px(10),
                        right: nil,
                        bottom: .px(10),
                        left: .px(10)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-left-0{margin-left:10px}
                  .margin-bottom-1{margin-bottom:10px}
                  .margin-top-2{margin-top:10px}
                </style>
              </head>
              <body>
                <div class="margin-left-0 margin-bottom-1 margin-top-2">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin all sides equal optimization")
    func marginAllSidesEqual() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(
                        top: .px(15),
                        right: .px(15),
                        bottom: .px(15),
                        left: .px(15)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-0{margin:15px}
                </style>
              </head>
              <body>
                <div class="margin-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin vertical horizontal optimization")
    func marginVerticalHorizontalOptimization() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(
                        top: .px(10),
                        right: .px(20),
                        bottom: .px(10),
                        left: .px(20)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-0{margin:10px 20px}
                </style>
              </head>
              <body>
                <div class="margin-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin horizontal equal optimization")
    func marginHorizontalEqual() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(
                        right: .px(12),
                        left: .px(12)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-0{margin:0px 12px}
                </style>
              </head>
              <body>
                <div class="margin-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin single side")
    func marginSingleSide() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(top: .px(8))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .margin-top-0{margin-top:8px}
                </style>
              </head>
              <body>
                <div class="margin-top-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Margin no values provided")
    func marginNoValues() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .margin(vertical: nil, horizontal: nil)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
              </head>
              <body>
                <div>
                </div>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Snapshot Tests - Padding Properties

extension CSSNamespace.Test.Snapshot {
    @Test("Padding Vertical Horizontal")
    func paddingVerticalHorizontal() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .padding(
                        vertical: .px(10),
                        horizontal: .px(20)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .padding-0{padding:10px 20px}
                </style>
              </head>
              <body>
                <div class="padding-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Padding with optional inputs")
    func paddingWithOptionalInputs() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .padding(
                        top: .px(10),
                        right: nil,
                        bottom: .px(10),
                        left: .px(10)
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .padding-left-0{padding-left:10px}
                  .padding-bottom-1{padding-bottom:10px}
                  .padding-top-2{padding-top:10px}
                </style>
              </head>
              <body>
                <div class="padding-left-0 padding-bottom-1 padding-top-2">
                </div>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Snapshot Tests - Background Properties

extension CSSNamespace.Test.Snapshot {
    @Test("Background with border shorthand")
    func background() {
        assertInlineSnapshot(
            of: HTML.Document {
                div { HTML.Empty() }
                    .css
                    .border(
                        .init(
                            width: .length(1.px),
                            style: .solid,
                            color: .red
                        )
                    )
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .border-1{border:1px solid #cc3333}
                  @media (prefers-color-scheme: dark){
                    .border-0{border:1px solid #ff1a1a}
                  }
                </style>
              </head>
              <body>
                <div class="border-0 border-1">
                </div>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Unit Tests - CSS Color

extension CSSNamespace.Test.Unit {
    @Test("Color opacity method works correctly")
    func testOpacityMethod() {
        let red = CSS_Standard.Color.rgb(255, 0, 0)
        let transparentRed = red.opacity(0.5)
        #expect(transparentRed.description == "rgba(255, 0, 0, 0.5)")

        let green = CSS_Standard.Color.named(.green)
        let transparentGreen = green.opacity(0.25)
        #expect(transparentGreen.description == "rgba(0, 128, 0, 0.25)")

        let blueHex = CSS_Standard.Color.hex(HexColor("#0000ff"))
        let transparentBlueHex = blueHex.opacity(0.75)
        #expect(transparentBlueHex.description == "rgba(0, 0, 255, 0.75)")

        let clampedOpacity = red.opacity(1.5)
        #expect(clampedOpacity.description == "rgba(255, 0, 0, 1)")
    }

    @Test("Color brightness adjustment methods work correctly")
    func testBrightnessAdjustment() {
        let red = CSS_Standard.Color.rgb(255, 0, 0)
        let darkerRed = red.darker(by: 0.5)
        #expect(darkerRed.description == "rgb(127, 0, 0)")

        let lighterRed = red.lighter(by: 0.2)
        #expect(lighterRed.description == "rgb(255, 51, 51)")

        let transparentBlue = CSS_Standard.Color.rgba(0, 0, 255, 0.5)
        let darkerTransparentBlue = transparentBlue.darker(by: 0.2)
        #expect(darkerTransparentBlue.description == "rgba(0, 0, 204, 0.5)")

        let green = CSS_Standard.Color.hsl(.deg(120), 100, 50)
        let darkerGreen = green.darker(by: 0.4)
        #expect(darkerGreen.description == "hsl(120deg, 100%, 30%)")

        let lighterGreen = green.lighter(by: 0.6)
        #expect(lighterGreen.description == "hsl(120deg, 100%, 80%)")

        let yellow = CSS_Standard.Color.named(.yellow)
        let darkerYellow = yellow.darker(by: 0.3)
        #expect(darkerYellow.description == "rgb(178, 178, 0)")

        let hex = CSS_Standard.Color.hex(HexColor("#00FF00"))
        let darkerHex = hex.darker(by: 0.25)
        #expect(darkerHex.description == "rgb(0, 191, 0)")

        let purple = CSS_Standard.Color.rgb(128, 0, 128)
        let adjustedPurple = purple.adjustBrightness(by: -0.5)
        #expect(adjustedPurple.description == "rgb(64, 0, 64)")

        let white = CSS_Standard.Color.rgb(255, 255, 255)
        let stillWhite = white.lighter(by: 0.5)
        #expect(stillWhite.description == "rgb(255, 255, 255)")

        let black = CSS_Standard.Color.rgb(0, 0, 0)
        let stillBlack = black.darker(by: 0.8)
        #expect(stillBlack.description == "rgb(0, 0, 0)")
    }

    @Test("Color adjustBrightness method works for color case")
    func colorAdjustBrightnessForColorCase() {
        let color = CSS_Standard.Color.color(.hex("FF0000"))
        let brightened = color.adjustBrightness(by: 0.2)
        #expect(brightened.description != color.description)
    }

    @Test("Color adjustBrightness method preserves global case")
    func colorAdjustBrightnessPreservesGlobalCase() {
        let global = CSS_Standard.Color.inherit
        let adjusted = global.adjustBrightness(by: 0.2)
        #expect(adjusted.description == global.description)
        #expect(adjusted.description == "inherit")
    }
}

// MARK: - Snapshot Tests - Color with HTML

extension CSSNamespace.Test.Snapshot {
    @Test("General color styling")
    func general1() {
        assertInlineSnapshot(
            of: HTML.Document {
                ContentDivision {
                    H1 { "Type-safe HTML" }
                        .css.color(light: .named(.blue), dark: .named(.red))
                        .fontSize(.px(24))
                    Paragraph { "With type-safe CSS!" }
                        .css.marginTop(.px(10))

                    Video(src: "/public/video/example.mp4", autoplay: true) {}
                }
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .font-size-0{font-size:24px}
                  .color-2{color:blue}
                  .margin-top-3{margin-top:10px}
                  @media (prefers-color-scheme: dark){
                    .color-1{color:red}
                  }
                </style>
              </head>
              <body>
                <div>
                  <h1 class="font-size-0 color-1 color-2">Type-safe HTML
                  </h1>
                  <p class="margin-top-3">With type-safe CSS!
                  </p><video autoplay src="/public/video/example.mp4"></video>
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("Simple color styling")
    func general2() {
        assertInlineSnapshot(
            of: HTML.Document {
                p { "Hello World" }
                    .css
                    .color(.red)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-1{color:#cc3333}
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#ff1a1a}
                  }
                </style>
              </head>
              <body>
                <p class="color-0 color-1">Hello World
                </p>
              </body>
            </html>
            """
        }
    }

    @Test("HTML color method with pseudo-class parameter")
    func htmlColorMethodWithPseudoClassParameter() {
        let test = HTML.Document {
            div {}
                .css.hover { $0.color(.hex("FF0000")) }
        }

        let html = String(decoding: test.render(), as: UTF8.self)
        #expect(html.contains(":hover"))
        #expect(html.contains("color:#FF0000"))
    }

    @Test("HTML element renders with named color properly")
    func htmlElementWithNamedColorRendersCorrectly() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {}.css.color(.red)
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-1{color:#cc3333}
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#ff1a1a}
                  }
                </style>
              </head>
              <body>
                <div class="color-0 color-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("HTML color with Color renders properly")
    func htmlColorMethodWithColorWorks() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {}
                    .css.color(CSS_Standard.Color.color(.hex("FF0000")))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-0{color:#FF0000}
                </style>
              </head>
              <body>
                <div class="color-0">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("HTML element with light/dark colors renders properly")
    func htmlElementWithLightDarkColorsAppliesBoth() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {}
                    .css.color(light: .hex("FF0000"), dark: .hex("00FF00"))
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  .color-1{color:#FF0000}
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#00FF00}
                  }
                </style>
              </head>
              <body>
                <div class="color-0 color-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("HTML color with media query renders properly")
    func htmlColorMethodWithMediaQueryParameter() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {}
                    .css.print { $0.color(.blue) }
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  @media (prefers-color-scheme: dark){
                    .color-0{color:#004477}
                  }
                  @media print{
                    .color-1{color:#3399ff}
                  }
                </style>
              </head>
              <body>
                <div class="color-0 color-1">
                </div>
              </body>
            </html>
            """
        }
    }

    @Test("HTML element rendering with multiple properties in media query")
    func htmlElementRenderingWithMultiplePropertiesInMediaQuery() {
        assertInlineSnapshot(
            of: HTML.Document {
                div {}
                    .css
                    .media(Media.screen && .maxWidth(.px(768))) {
                        $0.backgroundColor(.blue)
                            .color(.test_yellow)
                            .padding(.px(20))
                    }
            },
            as: .html
        ) {
            """
            <!doctype html>
            <html>
              <head>
                <style>
                  @media screen and (max-width: 768px){
                    .padding-0{padding:20px}
                    .color-2{color:#cccc33}
                    .background-color-4{background-color:#3399ff}
                  }
                  @media (prefers-color-scheme: dark){
                    .color-1{color:rgb(163, 163, 40)}
                    .background-color-3{background-color:#004477}
                  }
                </style>
              </head>
              <body>
                <div class="padding-0 color-1 color-2 background-color-3 background-color-4">
                </div>
              </body>
            </html>
            """
        }
    }
}

// MARK: - Test Helpers

extension HTMLColor {
    static let test_yellow = HTMLColor(light: .yellow, dark: .yellow.darker(by: 0.2))
}
