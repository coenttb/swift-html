import Foundation
import HTMLCore

extension HTML {
    @discardableResult
    public func backgroundColor(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background-color", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func transition(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("transition", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func opacity(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("opacity", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func color(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("color", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func zIndex(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("z-index", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func zIndex(_ value: Int?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("z-index", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    
    @discardableResult
    public func transform(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("transform", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func backgroundSize(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background-size", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func background(_ value: String?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func opacity(_ value: CSS.Opacity?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("opacity", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func textAlign(_ value: CSS.TextAlign? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-align", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func position(_ value: CSS.Position?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("position", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func position(_ value: CSS.Position?, top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("position", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            .inlineStyle("top", top?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            .inlineStyle("left", left?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            .inlineStyle("right", right?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            .inlineStyle("bottom", bottom?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    public func color(
        _ color: HTMLColor?,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> HTMLInlineStyle<Self> {
        inlineStyle("color", color?.rawValue, media: nil, pre: pre, pseudo: pseudo)
            .inlineStyle("color", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
}
extension HTML {
    @discardableResult
    public func overflow(_ value: CSS.Overflow?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func overflowX(_ value: CSS.Overflow.Value?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow-x", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func overflowY(_ value: CSS.Overflow.Value?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow-y", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func boxSizing(_ value: CSS.BoxSizing?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("box-sizing", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func cursor(_ value: CSS.Cursor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("cursor", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func visibility(_ value: CSS.Visibility?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("visibility", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func width(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func height(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func minWidth(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("min-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func minHeight(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("min-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func maxWidth(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("max-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func maxHeight(_ value: CSS.Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("max-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @_disfavoredOverload
    @discardableResult
    public func display(_ display: CSS.Display?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("display", display?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func display(_ display: CSS.Display, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("display", display.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func margin(_ margin: CSS.Margin? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        if let margin = margin {
            return switch margin {
            case .trbl(let top, let right, let bottom, let left):
                self.inlineStyle("margin-top", top?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("margin-right", right?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("margin-bottom", bottom?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("margin-left", left?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            default:
                self.inlineStyle("margin", margin.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            }
        }
        // If no margin is provided, we still need to return an HTMLInlineStyle<Self>
        return inlineStyle("margin", nil, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func margin(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func margin(top: Length? = nil, horizontal: Length? = nil, bottom: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: top, right: horizontal, bottom: bottom, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func margin(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func margin(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        margin(.trbl(top: length, right: length, bottom: length, left: length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func padding(_ padding: CSS.Padding? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        if let padding = padding {
            return switch padding {
            case .trbl(let top, let right, let bottom, let left):
                self.inlineStyle("padding-top", top?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("padding-right", right?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("padding-bottom", bottom?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
                    .inlineStyle("padding-left", left?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            default:
                self.inlineStyle("padding", padding.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            }
        }
        // If no padding is provided, we still need to return an HTMLInlineStyle<Self>
        return inlineStyle("padding", nil, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func padding(top: Length? = nil, right: Length? = nil, bottom: Length? = nil, left: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: top, right: right, bottom: bottom, left: left), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func padding(top: Length? = nil, horizontal: Length? = nil, bottom: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: top, right: horizontal, bottom: bottom, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func padding(vertical: Length? = nil, horizontal: Length? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: vertical, right: horizontal, bottom: vertical, left: horizontal), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func padding(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        padding(.trbl(top: length, right: length, bottom: length, left: length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func top(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("top", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func left(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("left", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func right(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("right", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func bottom(_ value: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("bottom", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func border(_ border: CSS.Border, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        switch border {
        case .all(let width, let style, let color):
            return inlineStyle("border", "\(width) \(style.rawValue) \(color?.rawValue ?? "")", pre: pre, pseudo: pseudo)
                .inlineStyle("border", "\(width) \(style.rawValue) \(color?.darkValue ?? "")", media: .dark, pre: pre, pseudo: pseudo)
        case .top(let width, let style, let color):
            return inlineStyle("border-top", "\(width) \(style.rawValue) \(color?.rawValue ?? "")", pre: pre, pseudo: pseudo)
                .inlineStyle("border-top", "\(width) \(style.rawValue) \(color?.darkValue ?? "")", media: .dark, pre: pre, pseudo: pseudo)
        case .right(let width, let style, let color):
            return inlineStyle("border-right", "\(width) \(style.rawValue) \(color?.rawValue ?? "")", pre: pre, pseudo: pseudo)
                .inlineStyle("border-right", "\(width) \(style.rawValue) \(color?.darkValue ?? "")", media: .dark, pre: pre, pseudo: pseudo)
        case .bottom(let width, let style, let color):
            return inlineStyle("border-bottom", "\(width) \(style.rawValue) \(color?.rawValue ?? "")", pre: pre, pseudo: pseudo)
                .inlineStyle("border-bottom", "\(width) \(style.rawValue) \(color?.darkValue ?? "")", media: .dark, pre: pre, pseudo: pseudo)
        case .left(let width, let style, let color):
            return inlineStyle("border-left", "\(width) \(style.rawValue) \(color?.rawValue ?? "")", pre: pre, pseudo: pseudo)
                .inlineStyle("border-left", "\(width) \(style.rawValue) \(color?.darkValue ?? "")", media: .dark, pre: pre, pseudo: pseudo)
        case .width(let width):
            return inlineStyle("border-width", width.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .style(let style):
            return inlineStyle("border-style", style.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .color(let color):
            return inlineStyle("border-color", color.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .radius(let radius):
            return inlineStyle("border-radius", radius.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .global(let global):
            return inlineStyle("border", global.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .none:
            return inlineStyle("border", "none", media: mediaQuery, pre: pre, pseudo: pseudo)
        }
    }
}

extension HTML {
    @discardableResult
    public func background(_ background: CSS.Background, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background", background.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func mixBlendMode(_ mixBlendMode: CSS.MixBlendMode?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("mix-blend-mode", mixBlendMode?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func size(width: Length? = nil, height: Length? = nil, media: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("width", width?.description, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("height", height?.description, media: media, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func size(_ size: Length?, media: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("width", size?.description, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("height", size?.description, media: media, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @HTMLBuilder
    public func hidden(_ hidden: Bool = true) -> some HTML {
        if hidden {
            size(width: .px(1), height: .px(1))
                .inlineStyle("clip", "rect(1px,1px,1px,1px)")
                .overflow(.hidden)
                .position(.absolute)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func border(
        width: CSS.Length?,
        style: CSS.Border.Style = .solid,
        color: HTMLColor,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let width {
            self.border(.all(width: .length(width), style: style, color: color), media: mediaQuery, pre: pre, pseudo: pseudo)
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    public func clipPath(_ clipPath: ClipPath) -> HTMLInlineStyle<Self> {
        self.inlineStyle("clip-path", clipPath.cssValue)
    }
}

extension HTML {
    @HTMLBuilder
    public func listStyle(_ listStyle: ListStyle) -> some HTML {
        switch listStyle {
        case .reset:
            inlineStyle("list-style-type", "none")
                .padding(left: 0.rem)
        }
    }
}

public enum ListStyle {
    case reset
}

extension HTML {
    public func grow(_ factor: Int? = 1, _ media: MediaQuery? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-grow", factor.map { "\($0)" }, media: media)
    }

    public func shrink(_ factor: Int? = 1, _ media: MediaQuery? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-shrink", factor.map { "\($0)" }, media: media)
    }
}


extension HTML {
//    @discardableResult
//    public func font(_ font: Font, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> Self {
//        self
//            .fontFamily(font.family, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .fontSize(font.size, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .fontWeight(font.weight, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .fontStyle(font.style, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .fontVariant(font.variant, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .fontStretch(font.stretch, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .lineHeight(font.lineHeight, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }

    @discardableResult
    public func fontFamily(_ families: [String]?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let familyString = families?.map { $0.contains(" ") ? "\"\($0)\"" : $0 }.joined(separator: ", ")
        return inlineStyle("font-family", familyString, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontSize(_ size: Font.FontSize?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-size", size?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontSize(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-size", length?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontWeight(_ weight: Font.FontWeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-weight", weight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontStyle(_ style: Font.FontStyle?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-style", style?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontVariant(_ variant: Font.FontVariant?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-variant", variant?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func lineHeight(_ lineHeight: Font.LineHeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("line-height", lineHeight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func fontStretch(_ stretch: Font.FontStretch?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-stretch", stretch?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func font(_ property: Font.Property?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        switch property {
        case .family(let families):
            return fontFamily(families, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .size(let size):
            return fontSize(size, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .weight(let weight):
            return fontWeight(weight, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .style(let style):
            return fontStyle(style, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .variant(let variant):
            return fontVariant(variant, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .lineHeight(let lineHeight):
            return self.lineHeight(lineHeight, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .stretch(let stretch):
            return fontStretch(stretch, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .none:
            return self
                .inlineStyle("", "")
        }
    }
}

extension HTML {
    @HTMLBuilder
    public func fontScale(_ fontScale: FontScale) -> HTMLInlineStyle<Self> {
            font(.size(.rem(fontScale.rawValue)))
    }
    
    @HTMLBuilder
    public func fontStyle(_ fontStyle: FontStyle) -> some HTML {
        switch fontStyle {
        case .body(.small):
            fontScale(.h6)
                .font(.weight(.normal))
                .lineHeight(.number(1.5))
            
        case .body(.regular):
            fontScale(.h5)
                .font(.weight(.normal))
                .lineHeight(.number(1.5))
        }
    }
}


public enum FontScale: Double {
    case h1 = 4
    case h2 = 3
    case h3 = 2
    case h4 = 1.5
    case h5 = 1
    case h6 = 0.875
}

public enum FontStyle {
    case body(Body)
    
    public enum Body {
        case regular
        case small
    }
}


extension HTML {
    @discardableResult
    public func backgroundColor(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background-color", color?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
            .inlineStyle("background-color", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func background(_ color: HTMLColor?, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("background", color?.rawValue, pre: pre, pseudo: pseudo)
            .inlineStyle("background", color?.darkValue, media: .dark, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func objectPosition(_ value: CSS.ObjectPosition?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("object-position", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func objectPosition(_ keyword: CSS.ObjectPosition.Keyword, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectPosition(.keyword(keyword), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func objectPosition(_ value: CSS.ObjectPosition.Value, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectPosition(.oneValue(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func objectPosition(_ value1: CSS.ObjectPosition.Value, _ value2: CSS.ObjectPosition.Value, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectPosition(.twoValues(value1, value2), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func objectPosition(_ global: CSS.ObjectPosition.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectPosition(.global(global), media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func objectPosition(x: Length = 50.percent, y: Length = 50.percent, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectPosition(.length(x), .length(y), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func objectFit(_ value: CSS.ObjectFit?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("object-fit", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func objectFit(_ keyword: CSS.ObjectFit.Keyword, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectFit(.keyword(keyword), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func objectFit(_ global: CSS.ObjectFit.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        objectFit(.global(global), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


// Now, let's add the HTML methods
extension HTML {
    @discardableResult
    public func alignItems(_ value: CSS.AlignItems?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("align-items", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    // Convenience methods for each category
    @discardableResult
    public func alignItems(basic value: CSS.AlignItems.Basic, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        alignItems(.basic(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func alignItems(positional value: CSS.AlignItems.Positional, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        alignItems(.positional(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func alignItems(baseline value: CSS.AlignItems.Baseline, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        alignItems(.baseline(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func alignItems(overflow value: CSS.AlignItems.Overflow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        alignItems(.overflow(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func alignItems(global value: CSS.AlignItems.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        alignItems(.global(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func justifyContent(_ value: CSS.JustifyContent?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("justify-content", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    // Convenience methods for each category
    @discardableResult
    public func justifyContent(positional value: CSS.JustifyContent.Positional, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        justifyContent(.positional(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func justifyContentNormal(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        justifyContent(.normal, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func justifyContent(distributed value: CSS.JustifyContent.Distributed, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        justifyContent(.distributed(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func justifyContent(overflow value: CSS.JustifyContent.Overflow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        justifyContent(.overflow(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func justifyContent(global value: CSS.JustifyContent.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        justifyContent(.global(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    // Convenience method for safe/unsafe center
    @discardableResult
    public func justifyContentCenter(safe: Bool, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        justifyContent(.center(safe: safe), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// HTML extension for applying row-gap
extension HTML {
    @discardableResult
    public func rowGap(_ value: CSS.RowGap?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("row-gap", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func rowGap(_ length: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        rowGap(.length(length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func rowGap(percentage value: Double, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        rowGap(.percentage(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func rowGapNormal(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        rowGap(.normal, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func rowGap(global value: CSS.RowGap.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        rowGap(.global(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// HTML extension for applying max-width
extension HTML {
    @discardableResult
    public func maxWidth(_ value: CSS.MaxWidth?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("max-width", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxWidth(_ length: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxWidth(.length(length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxWidth(percentage value: Double, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxWidth(.percentage(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxWidth(keyword value: CSS.MaxWidth.Keyword, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxWidth(.keyword(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxWidth(global value: CSS.MaxWidth.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxWidth(.global(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// HTML extension for applying max-height
extension HTML {
    @discardableResult
    public func maxHeight(_ value: CSS.MaxHeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("max-height", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxHeight(_ length: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxHeight(.length(length), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxHeight(percentage value: Double, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxHeight(.percentage(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxHeight(keyword value: CSS.MaxHeight.Keyword, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxHeight(.keyword(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func maxHeight(global value: CSS.MaxHeight.Global, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        maxHeight(.global(value), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


// HTML Methods
extension HTML {
    @discardableResult
    public func flexDirection(_ value: CSS.Flex.Direction, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-direction", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexWrap(_ value: CSS.Flex.Wrap, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-wrap", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexGrow(_ value: CSS.Flex.Grow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-grow", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexShrink(_ value: CSS.Flex.Shrink, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-shrink", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexBasis(_ value: CSS.Flex.Basis, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-basis", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flex(grow: CSS.Flex.Grow, shrink: CSS.Flex.Shrink, basis: CSS.Flex.Basis, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex", "\(grow.description) \(shrink.description) \(basis.description)", media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}
