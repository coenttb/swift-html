import HTMLComponents

public struct CallToActionModule<Content: HTML.View>: HTML.View {

    let title: (content: String, color: HTMLColor)
    let blurb: (content: String, color: HTMLColor)?
    let content: Content

    public init(
        title: (content: String, color: HTMLColor),
        blurb: (content: String, color: HTMLColor)?,
        @HTML.Builder content: () -> Content = { HTML.Empty() }
    ) {
        self.title = title
        self.blurb = blurb
        self.content = content()
    }

    public var body: some HTML.View {
        div {
            div {
                HTML.Group {
                    div {
                        Header(2) { HTML.Raw(title.content) }
                            .color(title.color)
                    }

                    if let blurb {
                        div {
                            Paragraph(.big) { HTML.Raw(blurb.content) }
                                .font(.body(.regular))
                                .color(blurb.color)
                                .margin(
                                    vertical: .zero,
                                    horizontal: .auto,
                                    media: .desktop
                                )
                                .maxWidth(.rem(40))
                        }
                    }
                    content
                }
                .textAlign(.center, media: .desktop)
            }
            .margin(vertical: .zero, horizontal: .auto)
            .maxWidth(.px(1280))
            .padding(
                vertical: .large,
                horizontal: .medium
            )
            .padding(
                .extraLarge,
                media: .desktop
            )
            .flexContainer(
                direction: .column,
                wrap: .wrap,
                rowGap: .rem(0.5)
            )
            .alignItems(.center, media: .desktop)
        }
    }
}

#if DEBUG && canImport(SwiftUI)
    import SwiftUI
    #Preview {
        HTML.Document {
            CallToActionModule(
                title: (content: "HELLO THERE", color: .black),
                blurb: (content: "HELLO", color: .blue)
            )
            .border(.left, width: .px(3), style: .solid)

            CallToActionModule(
                title: (content: "HELLO THERE", color: .black),
                blurb: (content: "HELLO", color: .blue)
            )
            .border(.left, width: .px(3), style: .solid)
        }

        .frame(width: 600, height: 400)

    }
#endif
