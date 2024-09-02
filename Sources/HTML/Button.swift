import CSS
import HTMLCore

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
        .inlineStyle("border", "\(style.border) \(foregroundColor.rawValue)")
        .inlineStyle(
            "border",
            foregroundColor.darkValue.map { "\(style.border) \($0)" },
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
        .backgroundColor(backgroundColor)
        .color(foregroundColor)
        .color(foregroundColor, pseudo: .link)
        .color(foregroundColor, pseudo: .visited)
        .fontScale(size.fontScale)
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

extension Button {
    public static func basic(
        _ label: ()->Label
    ) -> Button {
        Button(
            tag: a,
            backgroundColor: { style in
                    .purple
            },
            foregroundColor:  { style in
                    .white
            },
            size: .small,
            style: .normal,
            label: label
        )
    }
}

//public enum Color {
//    case black
//    case purple
//    case red
//    case white
//
//    fileprivate var rawValue: HTMLColor {
//        switch self {
//        case .black: .black.dark(.white)
//        case .purple: .purple
//        case .red: .red
//        case .white: .white.dark(.black)
//        }
//    }
//
//    fileprivate func backgroundColor(for style: Style) -> HTMLColor? {
//        switch (style, self) {
//        case (.normal, _): rawValue
//        default: nil
//        }
//    }
//
//    fileprivate func foregroundColor(for style: Style) -> HTMLColor {
//        switch (style, self) {
//        case (.normal, .black), (.normal, .purple), (.normal, .red): .white
//        case (.normal, .white): .black
//        case (.outline, _), (.underline, _): rawValue
//        }
//    }
//}
