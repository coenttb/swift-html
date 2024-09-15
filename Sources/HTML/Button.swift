import Foundation
import PointFreeHtml
import CSS

public struct Button<Label: HTML>: HTML {
    let tagName: String
    let backgroundColor: HTMLColor?
    let foregroundColor: HTMLColor
    let size: Size
    let style: Style
    let label: Label
    
    public init(
        tag: HTMLTag = a,
        backgroundColor: HTMLColor?,
        foregroundColor: HTMLColor,
        size: Size = .regular,
        style: Style = .normal,
        @HTMLBuilder label: () -> Label
    ) {
        self.tagName = tag.rawValue
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.size = size
        self.style = style
        self.label = label()
    }
    
    public init(
        tag: HTMLTag = a,
        backgroundColor: (Style) -> HTMLColor?,
        foregroundColor: (Style) -> HTMLColor,
        size: Size = .regular,
        style: Style = .normal,
        @HTMLBuilder label: () -> Label
    ) {
        self.tagName = tag.rawValue
        self.backgroundColor = backgroundColor(style)
        self.foregroundColor = foregroundColor(style)
        self.size = size
        self.style = style
        self.label = label()
    }
    
    public init(
        tag: HTMLVoidTag,
        backgroundColor: HTMLColor?,
        foregroundColor: HTMLColor,
        size: Size = .regular,
        style: Style = .normal
    ) where Label == HTMLEmpty {
        self.tagName = tag.rawValue
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.size = size
        self.style = style
        self.label = HTMLEmpty()
    }
    
    public init(
        tag: HTMLVoidTag,
        backgroundColor: (Style) -> HTMLColor?,
        foregroundColor: (Style) -> HTMLColor,
        size: Size = .regular,
        style: Style = .normal
    ) where Label == HTMLEmpty {
        self.tagName = tag.rawValue
        self.backgroundColor = backgroundColor(style)
        self.foregroundColor = foregroundColor(style)
        self.size = size
        self.style = style
        self.label = HTMLEmpty()
    }

    public var body: some HTML {
        tag(tagName) {
            label
        }
        .inlineStyle(
            "border",
            (borderColorComputed?.light).map { "\(style.border) \($0)" }
        )
        .inlineStyle(
            "border",
            (borderColorComputed?.dark).map { "\(style.border) \($0)" },
            media: .dark
        )
        .border(.radius(0.5.rem))
        .inlineStyle("box-shadow", "inset 0 0 0 20rem rgba(0,0,0,0.1)", pseudo: .hover)
        .cursor(.pointer)
        .fontWeight(500)
        .inlineStyle("text-decoration", style.textDecoration)
        .inlineStyle("text-decoration", style.textDecoration, media: nil, pseudo: .link)
        .inlineStyle("white-space", "nowrap")
        .padding(vertical: size.topBottomPadding, horizontal: size.leftRightPadding)
        .transition("0.3s")
        .backgroundColor(self.backgroundColorComputed)
        .color(foregroundColor)
        .color(foregroundColor, pseudo: .link)
        .color(foregroundColor, pseudo: .visited)
        .fontScale(size.fontScale)
    }
    
    fileprivate var borderColorComputed: HTMLColor? {
        self.backgroundColor
    }
    
    fileprivate var backgroundColorComputed: HTMLColor? {
        switch self.style {
        case .normal: self.backgroundColor
        default: nil
        }
    }
    
    public enum Size {
        case small
        case regular
        case large
        
        fileprivate var leftRightPadding: CSS.Length {
            switch self {
            case .small: 1.rem
            case .regular: 1.25.rem
            case .large: 1.5.rem
            }
        }
        fileprivate var topBottomPadding: CSS.Length {
            switch self {
            case .small: 0.75.rem
            case .regular: 1.rem
            case .large: 1.25.rem
            }
        }
        
        fileprivate var fontScale: FontScale {
            switch self {
            case .small: .h6
            case .regular: .h5
            case .large: .h4
            }
        }
    }
    
    public enum Style {
        case normal
        case outline
        case underline
        
        fileprivate var border: String {
            switch self {
            case .normal, .underline: "none"
            case .outline: "1px solid"
            }
        }
        
        fileprivate var textDecoration: String {
            switch self {
            case .normal, .outline: "none"
            case .underline: "underline"
            }
        }
    }
}




fileprivate typealias HTMLLabel = Label

public struct StripeButton<Label: HTML, Icon: HTML>: HTML {
    let tagName: String
    let icon: Icon?
    let label: Label
    let color: StripeButton.Color
    let style: StripeButton.Style

    public init(
        tag: HTMLTag = button,
        color: StripeButton.Color = .default,
        style: StripeButton.Style = .default,
        @HTMLBuilder icon: () -> Icon,
        @HTMLBuilder label: () -> Label
    ) {
        self.tagName = tag.rawValue
        self.icon = icon()
        self.label = label()
        self.color = color
        self.style = style
    }
    
    public init(
        tag: HTMLTag = button,
        color: StripeButton.Color = .default,
        style: StripeButton.Style = .default,
        @HTMLBuilder label: () -> Label
    ) where Icon == HTMLEmpty {
        self.tagName = tag.rawValue
        self.icon = HTMLEmpty()
        self.label = label()
        self.color = color
        self.style = style
    }

    public var body: some HTML {
        tag(tagName) {
            if let icon = icon {
                HTMLLabel {
                    icon
                } title: {
                    label
                }

            } else {
                label
            }
            
        }
        .padding(
            vertical: style.verticalPadding,
            horizontal: style.horizontalPadding
        )
        .border(.radius(.all(style.cornerRadius)))
        .display(.flex)
        .alignItems(.center)
        .textDecoration(.none)
        .transition("background-color 0.3s")
        .backgroundColor(color.backgroundHover, pseudo: .hover)
        .backgroundColor(color.background)
    }

    public struct Color {
        public let background: HTMLColor
        public let backgroundHover: HTMLColor

        public init(
            background: HTMLColor,
            backgroundHover: HTMLColor? = nil
        ) {
            self.background = background
            self.backgroundHover = backgroundHover ?? background
        }
    }

    public struct Style {
        public let cornerRadius: CSS.Length
        public let verticalPadding: CSS.Length
        public let horizontalPadding: CSS.Length

        public init(
            cornerRadius: CSS.Length = 0.5.rem,
            verticalPadding: CSS.Length = 0.75.rem,
            horizontalPadding: CSS.Length = 1.rem
        ) {
            self.cornerRadius = cornerRadius
            self.verticalPadding = verticalPadding
            self.horizontalPadding = horizontalPadding
        }
        
        public static var `default`: Self { primary }

        public static var primary:Self {
            Style(
                cornerRadius: 0.5.rem,
                verticalPadding: 0.75.rem,
                horizontalPadding: 1.rem
            )
        }
        
        public static var secondary:Self {
            Style(
                cornerRadius: 0.25.rem,
                verticalPadding: 0.6.rem,
                horizontalPadding: 0.9.rem
            )
        }
        
        public static var tertiary:Self {
            Style(
                cornerRadius: 0.25.rem,
                verticalPadding: 0.3.rem,
                horizontalPadding: 0.4.rem
            )
        }
    }
}

extension StripeButton.Color {
    public static var `default`: StripeButton.Color {
        StripeButton.Color(
            background: .gray(0.95),
            backgroundHover: .gray(0.9)
        )
    }
}
