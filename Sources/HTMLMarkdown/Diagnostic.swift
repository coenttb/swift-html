import HTML

public struct DiagnosticLevel: Sendable {
    var icon: LegacySVG
    var iconColor: HTMLColor
    var highlightColor: HTMLColor
    var underlineColor: HTMLColor?
    var backgroundColor: HTMLColor
    var detailBackgroundColor: HTMLColor
    var buttonBackgroundColor: HTMLColor

    public static let error = Self(
        icon: .error,
        iconColor: .init(light: .hex("CA0900"), dark: .hex("ED2239")),
        highlightColor: .init(light: .hex("EFE9F2"), dark: .hex("3A2C30")),
        underlineColor: .init(light: .hex("E31315"), dark: .hex("E21415")),
        backgroundColor: .init(light: .hex("FFC0C0"), dark: .hex("863432")),
        detailBackgroundColor: .init(light: .hex("EFDCDC"), dark: .hex("402E2B")),
        buttonBackgroundColor: .init(light: .hex("B7AAA9"), dark: .hex("302221"))
    )

    public static let issue = Self(
        icon: .failure,
        iconColor: .init(light: .hex("CA0900"), dark: .hex("ED2239")),
        highlightColor: .init(light: .hex("EFE9F2"), dark: .hex("3A2C30")),
        backgroundColor: .init(light: .hex("FFC0C0"), dark: .hex("863432")),
        detailBackgroundColor: .init(light: .hex("EFDCDC"), dark: .hex("402E2B")),
        buttonBackgroundColor: .init(light: .hex("B7AAA9"), dark: .hex("302221"))
    )

    public static let knownIssue = Self(
        icon: .failure,
        iconColor: .init(light: .hex("8E8E93"), dark: .hex("98989D")),
        highlightColor: .init(light: .hex("F4F4F4"), dark: .hex("333439")),
        backgroundColor: .init(light: .hex("CECED1"), dark: .hex("5F5F61")),
        detailBackgroundColor: .init(light: .hex("E0E0E0"), dark: .hex("373635")),
        buttonBackgroundColor: .init(light: .hex("A8A8A8"), dark: .hex("292828"))
    )

    public static let runtimeWarning = Self(
        icon: .warning,
        iconColor: .init(light: .hex("A156D5"), dark: .hex("A849E8")),
        highlightColor: .init(light: .hex("E9EAFD"), dark: .hex("3A3447")),
        backgroundColor: .init(light: .hex("D9B8F3"), dark: .hex("714088")),
        detailBackgroundColor: .init(light: .hex("EBE1F2"), dark: .hex("3A303C")),
        buttonBackgroundColor: .init(light: .hex("ACA3AF"), dark: .hex("2B252E"))
    )

    public static let warning = Self(
        icon: .warning,
        iconColor: .init(light: .hex("FFBA00"), dark: .hex("FFC502")),
        highlightColor: .init(light: .hex("FFFAEA"), dark: .hex("3F3A30")),
        underlineColor: .init(light: .hex("FEC300")),
        backgroundColor: .init(light: .hex("FFEAAD"), dark: .hex("8F7723")),
        detailBackgroundColor: .init(light: .hex("EFE9D6"), dark: .hex("413B29")),
        buttonBackgroundColor: .init(light: .hex("B4AEA0"), dark: .hex("312C1E"))
    )
}

public struct Diagnostic<Message: HTML.View>: HTML.View {
    let level: DiagnosticLevel
    let message: Message

    public init(level: DiagnosticLevel, @HTML.Builder message: () -> Message) {
        self.level = level
        self.message = message()
    }

    public var body: some HTML.View {
        div {
            HStack(spacing: 0) {
                div {
                    div {
                        level.icon
                    }
                    .inlineStyle(
                        Filter.property,
                        """
                        drop-shadow(1px 0 0 white) \
                        drop-shadow(-1px 0 0 white) \
                        drop-shadow(0 1px 0 white) \
                        drop-shadow(0 -1px 0 white)
                        """
                    )
                    .width(.px(14))
                }
                .color(level.iconColor)
                .backgroundColor(level.backgroundColor)
                .padding(top: .px(8), horizontal: .px(8), bottom: .px(7))

                div {
                    VStack(spacing: 0.5.rem) {
                        message
                    }
                    .class("diagnostic")
                }
                .backgroundColor(level.detailBackgroundColor)
                //                .color(.black.withDarkColor(.white))
                .flexGrow()
                .padding(.px(8))
            }
            .borderRadius(.uniform(.px(8)))
            .border(
                width: .px(0.5),
                style: .solid,
                color: .init(light: .hex("\(level.backgroundColor.light)44"))
            )
            .border(
                width: .px(0.5),
                style: .solid,
                color: .init(light: .hex("\(level.backgroundColor.dark)44")),
                media: .dark
            )
            .overflow(.hidden)
        }
        .inlineStyle(
            "filter",
            """
            drop-shadow(0 0 2px rgba(0,0,0,0.2)) \
            drop-shadow(0 1px 0 rgba(0,0,0,0.2))
            """
        )
    }
}

public struct InlineDiagnostic: HTML.View {
    let level: DiagnosticLevel
    let message: String

    public var body: some HTML.View {
        VStack(alignment: .normal) {
            HStack(spacing: 0.05.rem) {
                div {
                    div {
                        level.icon
                    }
                    .inlineStyle(
                        "filter",
                        """
                        drop-shadow(1px 0 0 white) \
                        drop-shadow(-1px 0 0 white) \
                        drop-shadow(0 1px 0 white) \
                        drop-shadow(0 -1px 0 white)
                        """
                    )
                    .width(.px(14))
                }
                .color(level.iconColor)
                .backgroundColor(level.backgroundColor)
                .padding(
                    top: .px(4),
                    bottom: .px(3),
                    left: .px(10),
                    right: .px(10)
                )

                div {
                    HTML.Text(message)
                }
                .backgroundColor(level.backgroundColor)
                //                .color(.black.withDarkColor(.white))
                .attribute("title", message)
                .inlineStyle("min-width", "0")
                .inlineStyle("max-width", "500px")
                .flexItem(
                    grow: 1,
                    shrink: 1,
                    basis: .auto
                )
                .padding(
                    top: .px(3),
                    bottom: .px(3),
                    left: .px(8),
                    right: .px(30)
                )
                .inlineStyle("text-overflow", "ellipsis")
                .overflow(.hidden)
                .inlineStyle("white-space", "nowrap")
            }
            .inlineStyle("border-radius", "3px 0 0 3px")
            .overflow(.hidden)
        }
    }
}

#if canImport(SwiftUI)
    import SwiftUI

    #Preview {
        ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
            HTML.Document {
                div {
                    style {
                        """
                        html {
                          font-family:-apple-system,Helvetica Neue,Helvetica,Arial,sans-serif;
                        }
                        @media(prefers-color-scheme: dark) {
                          body{background-color:#292A31;}
                        }
                        """
                    }
                    VStack {
                        InlineDiagnostic(
                            level: .warning,
                            message: """
                                Constant 'blob' inferred to have type '()', which may be unexpected
                                """
                        )

                        InlineDiagnostic(
                            level: .error,
                            message: """
                                Expected '(' in argument list of function declaration
                                """
                        )

                        InlineDiagnostic(
                            level: .issue,
                            message: """
                                XCTAssertEqual failed: ("1") is not equal to ("2")
                                """
                        )

                        InlineDiagnostic(
                            level: .knownIssue,
                            message: """
                                Expected failure: failed
                                """
                        )

                        InlineDiagnostic(
                            level: .runtimeWarning,
                            message: """
                                Publishing changes from background threads is not allowed; \
                                make sure to publish values from the main thread \
                                (via operators like receive(on:)) \
                                on model updates.
                                """
                        )

                        Diagnostic(level: .warning) {
                            "Constant 'blob' inferred to have type '()', which may be unexpected"
                            br()
                            br()
                            "Add an explicit type annotation to silence this warning"
                        }

                        Diagnostic(level: .error) {
                            """
                            Expected '(' in argument list of function declaration
                            """
                        }

                        Diagnostic(level: .issue) {
                            """
                            XCTAssertEqual failed: ("1") is not equal to ("2")
                            """
                        }

                        Diagnostic(level: .knownIssue) {
                            """
                            Expected failure: failed
                            """
                        }

                        Diagnostic(level: .runtimeWarning) {
                            """
                            Publishing changes from background threads is not allowed; \
                            make sure to publish values from the main thread \
                            (via operators like receive(on:)) \
                            on model updates.
                            """
                        }
                    }
                }
                .padding(.px(10))
            }
            .environment(\.colorScheme, colorScheme)
        }
    }
#endif
