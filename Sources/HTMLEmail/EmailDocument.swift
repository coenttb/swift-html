import Dependencies
import HTML
import HTMLAttributesPointFreeHTML

public protocol EmailDocument: HTML {}

public struct TableEmailDocument<Content: HTML>: EmailDocument {
    let content: Content
    let preheader: String

    public init(
        preheader: String = "",
        @HTMLBuilder content: () -> Content
    ) {
        self.content = content()
        self.preheader = preheader
    }

    public var body: some HTML {

        Style {
            """
            body, table, td, div, p, a {
                -webkit-text-size-adjust: 100%;
                -ms-text-size-adjust: 100%;
                margin: 0;
                padding: 0;
            }

            @media (prefers-color-scheme: dark) {
                body, table, td, div {
                    background-color: #121212 !important;
                    color: #ffffff !important;
                }
            }
            """
        }

        span {
            HTMLText(preheader)
        }
        //        .color(.transparent)
        .display(Display.none)
        .opacity(0)
        .width(.zero)
        .height(.zero)
        .maxWidth(0)
        .maxHeight(0)
        .overflow(.hidden)

        table {
            content
        }
        .attribute("role", "presentation")
        .attribute("height", "100%")
        .attribute("width", "100%")
        .attribute("border-collapse", "collapse")
        .attribute("border-spacing", "0 0.5rem")
        .attribute("align", "center")
        .display(.block)
        .width(.percent(100))
        .maxWidth(.percent(100))
        .margin(vertical: 0, horizontal: .auto)
        .inlineStyle("clear", "both")
    }
}

extension EmailDocument {
    public static func _render(_ html: Self, into printer: inout HTMLPrinter) {
        @Dependency(\.emailPrinter) var emailPrinter
        var bodyPrinter = emailPrinter
        Content._render(html.body, into: &bodyPrinter)
        Email
            ._render(
                Email(
                    bodyBytes: bodyPrinter.bytes,
                    stylesheet: bodyPrinter.stylesheet
                ),
                into: &printer
            )
    }
}

private struct Email: HTML {
    let bodyBytes: ContiguousArray<UInt8>
    let stylesheet: String

    var body: some HTML {
        html {
            tag("head") {
                BaseStyles()
                Style {
                    stylesheet
                }
                meta(charset: .utf8)()
                meta(
                    name: "viewport",
                    content: "width=device-width, initial-scale=1.0, viewport-fit=cover"
                )()
            }
            tag("body") {
                HTMLRaw(bodyBytes)
            }
            .dir(.auto)
            .overflowWrap(.breakWord)
            .style("-webkit-nbsp-mode: space; line-break: after-white-space;")
        }
        .attribute("xmlns", "http://www.w3.org/1999/xhtml")
    }
}

extension DependencyValues {
    public var emailPrinter: HTMLPrinter {
        get { self[EmailPrinterKey.self] }
        set { self[EmailPrinterKey.self] = newValue }
    }
}

private enum EmailPrinterKey: DependencyKey {
    static var liveValue: HTMLPrinter { HTMLPrinter(.email) }
    static var previewValue: HTMLPrinter { HTMLPrinter(.pretty) }
    static var testValue: HTMLPrinter { HTMLPrinter(.pretty) }
}
