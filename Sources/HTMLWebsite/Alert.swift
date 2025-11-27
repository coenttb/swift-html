import HTML
import HTMLComponents

// MARK: - Alert Component
public struct Alert<Content: HTML.View, Actions: HTML.View>: HTML.View {
    public enum Severity {
        case info
        case success
        case warning
        case error

        var backgroundColor: HTMLColor {
            switch self {
            case .info: return .blue.opacity(0.1)
            case .success: return .green.opacity(0.1)
            case .warning: return .orange.opacity(0.1)
            case .error: return .red.opacity(0.1)
            }
        }

        var borderColor: HTMLColor {
            switch self {
            case .info: return .blue.opacity(0.3)
            case .success: return .green.opacity(0.3)
            case .warning: return .orange.opacity(0.3)
            case .error: return .red.opacity(0.3)
            }
        }

        var textColor: HTMLColor {
            switch self {
            case .info: return .blue
            case .success: return .green
            case .warning: return .orange
            case .error: return .red
            }
        }

        var defaultIcon: String {
            switch self {
            case .info: return "ℹ️"
            case .success: return "✅"
            case .warning: return "⚠️"
            case .error: return "❌"
            }
        }
    }

    let severity: Severity
    let title: String?
    let icon: String?
    let dismissible: Bool
    let content: Content
    let actions: Actions

    public init(
        severity: Severity = .info,
        title: String? = nil,
        icon: String? = nil,
        dismissible: Bool = false,
        @HTML.Builder content: () -> Content,
        @HTML.Builder actions: () -> Actions = { HTML.Empty() }
    ) {
        self.severity = severity
        self.title = title
        self.icon = icon
        self.dismissible = dismissible
        self.content = content()
        self.actions = actions()
    }

    public var body: some HTML.View {
        div {
            div {
                // Icon
                if let icon = icon {
                    span { icon }
                        .fontSize(.rem(1.25))
                        .marginRight(.rem(0.75))
                } else {
                    span { severity.defaultIcon }
                        .fontSize(.rem(1.25))
                        .marginRight(.rem(0.75))
                }

                // Content
                div {
                    if let title = title {
                        div { HTML.Text(title) }
                            .fontWeight(.semiBold)
                            .marginBottom(.rem(0.25))
                    }

                    content
                }
                .flexGrow()

                // Actions
                if !(actions is HTML.Empty) {
                    div {
                        actions
                    }
                    .display(.flex)
                    .gap(.rem(0.5))
                    .marginLeft(.rem(1))
                }

                // Dismiss button
                if dismissible {
                    button {
                        "×"
                    }
                    .fontSize(.rem(1.5))
                    .lineHeight(1)
                    .padding(.rem(0.25))
                    .marginLeft(.rem(1))
                    .backgroundColor(.transparent)
                    .border(.hidden)
                    .cursor(.pointer)
                    .color(severity.textColor)
                    .attribute("onclick", "this.closest('.alert').remove()")
                }
            }
            .display(.flex)
            .alignItems(.flexStart)
        }
        .class("alert")
        .padding(.rem(1))
        .backgroundColor(severity.backgroundColor)
        .border(width: .px(1), style: .solid, color: severity.borderColor)
        .borderRadius(.px(8))
        .color(severity.textColor)
    }
}

// MARK: - Banner Component
public struct Banner<Content: HTML.View, Actions: HTML.View>: HTML.View {
    public enum Style {
        case standard
        case slim
        case prominent

        var padding: LengthPercentage {
            switch self {
            case .standard: return .rem(1.5)
            case .slim: return .rem(0.75)
            case .prominent: return .rem(2)
            }
        }
    }

    let style: Style
    let backgroundColor: HTMLColor
    let textColor: HTMLColor
    let sticky: Bool
    let content: Content
    let actions: Actions

    public init(
        style: Style = .standard,
        backgroundColor: HTMLColor = .blue,
        textColor: HTMLColor = .white,
        sticky: Bool = false,
        @HTML.Builder content: () -> Content,
        @HTML.Builder actions: () -> Actions = { HTML.Empty() }
    ) {
        self.style = style
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.sticky = sticky
        self.content = content()
        self.actions = actions()
    }

    public var body: some HTML.View {
        div {
            div {
                content

                if !(actions is HTML.Empty) {
                    div {
                        actions
                    }
                    .display(.flex)
                    .gap(.rem(1))
                    .marginLeft(.auto)
                }
            }
            .display(.flex)
            .alignItems(.center)
            .justifyContent(.spaceBetween)
            .maxWidth(.px(1200))
            .margin(.auto)
            .padding(horizontal: style.padding)
        }
        .padding(vertical: style.padding)
        .backgroundColor(backgroundColor)
        .color(textColor)
        .if(sticky) { banner in
            banner
                .position(.sticky)
                .top(.px(0))
                .zIndex(100)
        }
    }
}

// MARK: - Convenience Initializers
extension Alert where Actions == HTML.Empty {
    public init(
        severity: Severity = .info,
        title: String? = nil,
        icon: String? = nil,
        dismissible: Bool = false,
        @HTML.Builder content: () -> Content
    ) {
        self.init(
            severity: severity,
            title: title,
            icon: icon,
            dismissible: dismissible,
            content: content,
            actions: { HTML.Empty() }
        )
    }
}

extension Banner where Actions == HTML.Empty {
    public init(
        style: Style = .standard,
        backgroundColor: HTMLColor = .blue,
        textColor: HTMLColor = .white,
        sticky: Bool = false,
        @HTML.Builder content: () -> Content
    ) {
        self.init(
            style: style,
            backgroundColor: backgroundColor,
            textColor: textColor,
            sticky: sticky,
            content: content,
            actions: { HTML.Empty() }
        )
    }
}
