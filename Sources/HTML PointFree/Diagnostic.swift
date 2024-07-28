import HTML

public struct DiagnosticLevel {
    var icon: SVG
    var iconColor: HTMLColor
    var highlightColor: HTMLColor
    var underlineColor: HTMLColor?
    var backgroundColor: HTMLColor
    var detailBackgroundColor: HTMLColor
    var buttonBackgroundColor: HTMLColor
    
    public static let error = Self(
        icon: .error,
        iconColor: .init(rawValue: "#CA0900", darkValue: "#ED2239"),
        highlightColor: .init(rawValue: "#EFE9F2", darkValue: "#3A2C30"),
        underlineColor: .init(rawValue: "#E31315", darkValue: "#E21415"),
        backgroundColor: .init(rawValue: "#FFC0C0", darkValue: "#863432"),
        detailBackgroundColor: .init(rawValue: "#EFDCDC", darkValue: "#402E2B"),
        buttonBackgroundColor: .init(rawValue: "#B7AAA9", darkValue: "#302221")
    )
    
    public static let issue = Self(
        icon: .failure,
        iconColor: .init(rawValue: "#CA0900", darkValue: "#ED2239"),
        highlightColor: .init(rawValue: "#EFE9F2", darkValue: "#3A2C30"),
        backgroundColor: .init(rawValue: "#FFC0C0", darkValue: "#863432"),
        detailBackgroundColor: .init(rawValue: "#EFDCDC", darkValue: "#402E2B"),
        buttonBackgroundColor: .init(rawValue: "#B7AAA9", darkValue: "#302221")
    )
    
    public static let knownIssue = Self(
        icon: .failure,
        iconColor: .init(rawValue: "#8E8E93", darkValue: "#98989D"),
        highlightColor: .init(rawValue: "#F4F4F4", darkValue: "#333439"),
        backgroundColor: .init(rawValue: "#CECED1", darkValue: "#5F5F61"),
        detailBackgroundColor: .init(rawValue: "#E0E0E0", darkValue: "#373635"),
        buttonBackgroundColor: .init(rawValue: "#A8A8A8", darkValue: "#292828")
    )
    
    public static let runtimeWarning = Self(
        icon: .warning,
        iconColor: .init(rawValue: "#A156D5", darkValue: "#A849E8"),
        highlightColor: .init(rawValue: "#E9EAFD", darkValue: "#3A3447"),
        backgroundColor: .init(rawValue: "#D9B8F3", darkValue: "#714088"),
        detailBackgroundColor: .init(rawValue: "#EBE1F2", darkValue: "#3A303C"),
        buttonBackgroundColor: .init(rawValue: "#ACA3AF", darkValue: "#2B252E")
    )
    
    public static let warning = Self(
        icon: .warning,
        iconColor: .init(rawValue: "#FFBA00", darkValue: "#FFC502"),
        highlightColor: .init(rawValue: "#FFFAEA", darkValue: "#3F3A30"),
        underlineColor: .init(rawValue: "#FEC300"),
        backgroundColor: .init(rawValue: "#FFEAAD", darkValue: "#8F7723"),
        detailBackgroundColor: .init(rawValue: "#EFE9D6", darkValue: "#413B29"),
        buttonBackgroundColor: .init(rawValue: "#B4AEA0", darkValue: "#312C1E")
    )
}

public struct Diagnostic<Message: HTML>: HTML {
    let level: DiagnosticLevel
    let message: Message
    
    public init(level: DiagnosticLevel, @HTMLBuilder message: () -> Message) {
        self.level = level
        self.message = message()
    }
    
    public var body: some HTML {
        div {
            HStack(spacing: 0) {
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
                    .inlineStyle("width", "14px")
                }
                .color(level.iconColor)
                .backgroundColor(level.backgroundColor)
                .inlineStyle("padding", "8px 8px 7px")
                
                div {
                    VStack(spacing: 0.5) {
                        message
                    }
                    .attribute("class", "diagnostic")
                }
                .backgroundColor(level.detailBackgroundColor)
                .color(.black.dark(.white))
                .grow()
                .inlineStyle("padding", "8px")
            }
            .inlineStyle("border-radius", "8px")
            .inlineStyle("border", "0.5px solid \(level.backgroundColor.darkValue!)44")
            .inlineStyle("border", "0.5px solid \(level.backgroundColor.rawValue)44", media: .dark)
            .inlineStyle("overflow", "hidden")
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

public struct InlineDiagnostic: HTML {
    let level: DiagnosticLevel
    let message: String
    
    public var body: some HTML {
        VStack(alignment: .trailing) {
            HStack(spacing: 0.05) {
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
                    .inlineStyle("width", "14px")
                }
                .color(level.iconColor)
                .backgroundColor(level.backgroundColor)
                .inlineStyle("padding", "4px 10px 3px 10px")
                
                div {
                    HTMLText(message)
                }
                .backgroundColor(level.backgroundColor)
                .color(.black.dark(.white))
                .attribute("title", message)
                .inlineStyle("min-width", "0")
                .inlineStyle("max-width", "500px")
                .inlineStyle("flex", "1 1")
                .inlineStyle("padding", "3px 30px 3px 8px")
                .inlineStyle("text-overflow", "ellipsis")
                .inlineStyle("overflow", "hidden")
                .inlineStyle("white-space", "nowrap")
            }
            .inlineStyle("border-radius", "3px 0 0 3px")
            .inlineStyle("overflow", "hidden")
        }
    }
}

#if canImport(SwiftUI)
import SwiftUI

#Preview {
    ForEach(ColorScheme.allCases, id: \.hashValue) { colorScheme in
        HTMLPreview {
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
            .inlineStyle("padding", "10px")
        }
        .environment(\.colorScheme, colorScheme)
    }
}
#endif
