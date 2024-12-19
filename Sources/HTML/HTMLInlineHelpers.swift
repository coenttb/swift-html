import Foundation
import CSS
import PointFreeHTML

extension HTML {
    
    @discardableResult
    public func color(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let lightStyle = inlineStyle("color", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        
        if let darkColor = color?.dark {
            return lightStyle.inlineStyle("color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
        } else {
            return lightStyle
        }
    }
    
    @discardableResult
    public func backgroundColor(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let lightStyle = inlineStyle("background-color", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        
        if let darkColor = color?.dark {
            return lightStyle.inlineStyle("background-color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
        } else {
            return lightStyle
        }
    }
    
    @discardableResult
    public func background(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let lightStyle = inlineStyle("background", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        
        if let darkColor = color?.dark {
            return lightStyle.inlineStyle("background", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
        } else {
            return lightStyle
        }
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
    public func fontSize(_ size: Font.Size?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-size", size?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontSize(_ length: Length?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-size", length?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontWeight(_ weight: Font.Weight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-weight", weight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontStyle(_ style: Font.Style?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-style", style?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontVariant(_ variant: Font.Variant?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("font-variant", variant?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func lineHeight(_ lineHeight: LineHeight?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("line-height", lineHeight?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fontStretch(_ stretch: Font.Stretch?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
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




extension HTML {
    @discardableResult
    public func textAlign(_ value: TextAlign, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-align", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textDecoration(_ value: TextDecoration, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-decoration", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textDecorationLine(_ value: TextDecorationLine, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-decoration-line", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textDecorationColor(_ color: HTMLColor?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let lightStyle = inlineStyle("text-decoration-color", color?.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
        
        if let darkColor = color?.dark {
            return lightStyle.inlineStyle("text-decoration-color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
        } else {
            return lightStyle
        }
    }
    
    @discardableResult
    public func textDecorationStyle(_ value: TextDecorationStyle, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-decoration-style", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textDecorationThickness(_ value: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-decoration-thickness", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textTransform(_ value: TextTransform, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-transform", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func letterSpacing(_ value: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("letter-spacing", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func wordSpacing(_ value: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("word-spacing", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func lineHeight(_ value: LineHeight, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("line-height", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    
    
    
    
    @discardableResult
    public func textOrientation(_ value: TextOrientation, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-orientation", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textOverflow(_ value: TextOverflow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-overflow", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func textIndent(_ value: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("text-indent", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func verticalAlign(_ value: VerticalAlign, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let alignValue: String
        switch value {
        case .keyword(let keyword):
            alignValue = keyword.rawValue
        case .length(let length):
            alignValue = length.description
        case .percentage(let percentage):
            alignValue = "\(percentage)%"
        }
        return inlineStyle("vertical-align", alignValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func direction(_ value: Direction, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("direction", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func unicodeBidi(_ value: UnicodeBidi, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("unicode-bidi", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func writingMode(_ value: WritingMode, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("writing-mode", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


extension HTML {
    @discardableResult
    public func listStyle(_ style: ListStyle, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        switch style {
        case .none:
            return inlineStyle("list-style-type", "none")
                .inlineStyle("padding-left", "0")
        case .type(let type):
            return inlineStyle("list-style-type", type.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .image(let url):
            return inlineStyle("list-style-image", "url('\(url)')", media: mediaQuery, pre: pre, pseudo: pseudo)
        case .position(let position):
            return inlineStyle("list-style-position", position.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        case .shorthand(let type, let position, let image):
            var parts: [String] = []
            if let type = type {
                parts.append(type.rawValue)
            }
            if let position = position {
                parts.append(position.rawValue)
            }
            if let image = image {
                parts.append("url('\(image)')")
            }
            return inlineStyle("list-style", parts.joined(separator: " "), media: mediaQuery, pre: pre, pseudo: pseudo)
        }
    }
    
    @discardableResult
    public func listStyleType(_ type: ListStyleType, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("list-style-type", type.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func listStyleImage(_ url: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("list-style-image", "url('\(url)')", media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func listStylePosition(_ position: ListStylePosition, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("list-style-position", position.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}




// HTML methods
extension HTML {
    @discardableResult
    public func whiteSpace(_ value: WhiteSpace, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("white-space", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// Convenience static properties
extension WhiteSpace {
    public static let collapse = normal
    public static let preserve = pre
}

// Convenience static functions
extension WhiteSpace {
    public static func custom(_ value: String) -> WhiteSpace? {
        return WhiteSpace(rawValue: value)
    }
}

// Additional convenience methods for HTML
extension HTML {
    @discardableResult
    public func preserveWhiteSpace(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        whiteSpace(.pre, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func collapseWhiteSpace(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        whiteSpace(.normal, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func preventLineBreaks(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        whiteSpace(.nowrap, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


// HTML methods
extension HTML {
    @discardableResult
    public func wordBreak(_ value: WordBreak, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("word-break", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func overflowWrap(_ value: OverflowWrap, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("overflow-wrap", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// Convenience static properties
extension WordBreak {
    public static let `default` = normal
    public static let breakAnywhere = breakAll
}

extension OverflowWrap {
    public static let `default` = normal
    public static let wrapAnywhere = anywhere
}

// Convenience static functions
extension WordBreak {
    public static func custom(_ value: String) -> WordBreak? {
        return WordBreak(rawValue: value)
    }
}

extension OverflowWrap {
    public static func custom(_ value: String) -> OverflowWrap? {
        return OverflowWrap(rawValue: value)
    }
}

// Additional convenience methods for HTML
extension HTML {
    @discardableResult
    public func allowWordBreak(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        wordBreak(.breakAll, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func preventWordBreak(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        wordBreak(.keepAll, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func wrapLongWords(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        overflowWrap(.breakWord, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func wrapAnywhere(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        overflowWrap(.anywhere, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


// Additional convenience methods for HTML
extension HTML {
    @discardableResult
    public func autoTableLayout(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        tableLayout(.auto, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func fixedTableLayout(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        tableLayout(.fixed, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func collapsedBorders(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        borderCollapse(.collapse, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func separateBorders(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        borderCollapse(.separate, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func topCaption(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        captionSide(.top, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func bottomCaption(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        captionSide(.bottom, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func showEmptyCells(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        emptyCells(.show, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func hideEmptyCells(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        emptyCells(.hide, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}






extension HTML {
    @discardableResult
    public func flexDirection(_ value: FlexDirection?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-direction", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexWrap(_ value: FlexWrap?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-wrap", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    
    
    @discardableResult
    public func alignContent(_ value: AlignContent?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("align-content", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    
    
    @discardableResult
    public func flexGrow(_ value: FlexGrow?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-grow", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexShrink(_ value: FlexShrink?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-shrink", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexBasis(_ value: FlexBasis?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("flex-basis", value?.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func alignSelf(_ value: AlignSelf?, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("align-self", value?.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}




extension HTML {
    func flexItem(
        grow: String? = nil,
        shrink: String? = nil,
        basis: String? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self
            .inlineStyle("flex-grow", grow, media: media)
            .inlineStyle("flex-shrink", shrink, media: media)
            .inlineStyle("flex-basis", basis, media: media)
    }
}





extension HTML {
    
    // Flex Container Properties
    @discardableResult
    public func flexContainer(
        _ container: FlexContainer,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .display(.flex, media: mediaQuery, pre: pre, pseudo: pseudo)
            .flexDirection(container.direction, media: mediaQuery, pre: pre, pseudo: pseudo)
            .flexWrap(container.wrap, media: mediaQuery, pre: pre, pseudo: pseudo)
            .justifyContent(container.justifyContent, media: mediaQuery, pre: pre, pseudo: pseudo)
            .alignItems(container.alignItems, media: mediaQuery, pre: pre, pseudo: pseudo)
            .alignContent(container.alignContent, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    
    public func flexContainer(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justification: JustifyContent? = nil,
        itemAlignment: AlignItems? = nil,
        rowGap: RowGap? = nil,
        columnGap: CSS.Length? = nil,
        media: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .display(.flex, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("flex-direction", direction?.rawValue, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("flex-wrap", wrap?.rawValue, media: media, pre: pre, pseudo: pseudo)
            .justifyContent(justification, media: media, pre: pre, pseudo: pseudo)
            .alignItems(itemAlignment, media: media, pre: pre, pseudo: pseudo)
            .rowGap(rowGap, media: media, pre: pre, pseudo: pseudo)
            .inlineStyle("column-gap", columnGap?.description, media: media, pre: pre, pseudo: pseudo)
    }
    //
    public func flexItem(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil,
        media: MediaQuery? = nil
    ) -> some HTML {
        self
            .inlineStyle("flex-grow", grow.map(String.init), media: media)
            .inlineStyle("flex-shrink", shrink.map(String.init), media: media)
            .inlineStyle("flex-basis", basis?.description, media: media)
    }
    
    // Flex Item Properties
    @discardableResult
    public func flexItem(_ item: FlexItem, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        self
            .flexGrow(item.grow, media: mediaQuery, pre: pre, pseudo: pseudo)
            .flexShrink(item.shrink, media: mediaQuery, pre: pre, pseudo: pseudo)
            .flexBasis(item.basis, media: mediaQuery, pre: pre, pseudo: pseudo)
            .alignSelf(item.alignSelf, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
}




extension HTML {
    @discardableResult
    public func flexRow(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        flexContainer(.row, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexColumn(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        flexContainer(.column, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexGrow(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        flexItem(.grow, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func flexShrink(media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
        flexItem(.shrink, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


//// HTML Methods
//extension HTML {
//    @discardableResult
//    public func flexDirection(_ value: CSS.Flex.Direction, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("flex-direction", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//
//    @discardableResult
//    public func flexWrap(_ value: CSS.Flex.Wrap, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("flex-wrap", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//
//    @discardableResult
//    public func flexGrow(_ value: CSS.Flex.Grow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("flex-grow", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//
//    @discardableResult
//    public func flexShrink(_ value: CSS.Flex.Shrink, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("flex-shrink", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//
//    @discardableResult
//    public func flexBasis(_ value: CSS.Flex.Basis, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("flex-basis", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//
//    @discardableResult
//    public func flex(grow: CSS.Flex.Grow, shrink: CSS.Flex.Shrink, basis: CSS.Flex.Basis, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        inlineStyle("flex", "\(grow.description) \(shrink.description) \(basis.description)", media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//}

// HTML methods
extension HTML {
    @discardableResult
    public func tableLayout(_ value: TableLayout, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("table-layout", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func borderCollapse(_ value: BorderCollapse, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("border-collapse", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    
    
    @discardableResult
    public func captionSide(_ value: CaptionSide, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("caption-side", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func emptyCells(_ value: EmptyCells, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("empty-cells", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

extension HTML {
    @discardableResult
    public func clipPath(_ clipPath: ClipPath) -> HTMLInlineStyle<Self> {
        self.inlineStyle("clip-path", clipPath.description)
    }
}





extension HTML {
    @discardableResult
    public func border(_ border: Border, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        switch border {
        case .all(let width, let style, let color):
            let lightStyle = inlineStyle("border", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
            if let darkColor = color?.dark {
                return lightStyle.inlineStyle("border", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
            }
            return lightStyle

        case .top(let width, let style, let color):
            let lightStyle = inlineStyle("border-top", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
            if let darkColor = color?.dark {
                return lightStyle.inlineStyle("border-top", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
            }
            return lightStyle

        case .right(let width, let style, let color):
            let lightStyle = inlineStyle("border-right", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
            if let darkColor = color?.dark {
                return lightStyle.inlineStyle("border-right", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
            }
            return lightStyle

        case .bottom(let width, let style, let color):
            let lightStyle = inlineStyle("border-bottom", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
            if let darkColor = color?.dark {
                return lightStyle.inlineStyle("border-bottom", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
            }
            return lightStyle

        case .left(let width, let style, let color):
            let lightStyle = inlineStyle("border-left", "\(width) \(style.rawValue) \(color?.light.description ?? "")", pre: pre, pseudo: pseudo)
            if let darkColor = color?.dark {
                return lightStyle.inlineStyle("border-left", "\(width) \(style.rawValue) \(darkColor.description)", media: .dark, pre: pre, pseudo: pseudo)
            }
            return lightStyle

        case .width(let width):
            return inlineStyle("border-width", width.description, media: mediaQuery, pre: pre, pseudo: pseudo)

        case .style(let style):
            return inlineStyle("border-style", style.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)

        case .color(let color):
            let lightStyle = inlineStyle("border-color", color.light.description, media: mediaQuery, pre: pre, pseudo: pseudo)
            if let darkColor = color.dark {
                return lightStyle.inlineStyle("border-color", darkColor.description, media: .dark, pre: pre, pseudo: pseudo)
            }
            return lightStyle

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
    @HTMLBuilder
    public func border(
        width: CSS.Length?,
        style: Border.Style = .solid,
        color: HTMLColor?,
        media mediaQuery: MediaQuery? = nil,
        pre: String? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {

        if let width, let color {
            let lightStyle = inlineStyle(
                "border",
                "\(width.description) \(style.rawValue) \(color.light.description)",
                media: mediaQuery,
                pre: pre,
                pseudo: pseudo
            )

            if let darkColor = color.dark {
                 lightStyle.inlineStyle(
                    "border",
                    "\(width.description) \(style.rawValue) \(darkColor.description)",
                    media: .dark,
                    pre: pre,
                    pseudo: pseudo
                )
            } else {
                 lightStyle
            }
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    public func textShadow(_ value: TextShadow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let lightShadowValue = "\(value.offsetX) \(value.offsetY) \(value.blurRadius) \(value.color.light.description)"
        let lightStyle = inlineStyle("text-shadow", lightShadowValue, media: mediaQuery, pre: pre, pseudo: pseudo)
        
        if let darkColor = value.color.dark {
            let darkShadowValue = "\(value.offsetX) \(value.offsetY) \(value.blurRadius) \(darkColor.description)"
            return lightStyle.inlineStyle("text-shadow", darkShadowValue, media: .dark, pre: pre, pseudo: pseudo)
        } else {
            return lightStyle
        }
    }
}

extension HTML {
    @discardableResult
    public func borderSpacing(_ value: BorderSpacing, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let spacingValue = value.vertical != nil ? "\(value.horizontal) \(value.vertical!)" : value.horizontal.description
        return inlineStyle("border-spacing", spacingValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// Assuming these structs need to be updated as well:

public struct TextShadow {
    let offsetX: CSS.Length
    let offsetY: CSS.Length
    let blurRadius: CSS.Length
    let color: HTMLColor
    
    public init(offsetX: CSS.Length, offsetY: CSS.Length, blurRadius: CSS.Length, color: HTMLColor) {
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.color = color
    }
}

public struct BorderSpacing {
    let horizontal: CSS.Length
    let vertical: CSS.Length?
    
    public init(horizontal: CSS.Length, vertical: CSS.Length? = nil) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
}

extension HTML {
    public func transition(_ transition: Transition) -> HTMLInlineStyle<Self> {
        inlineStyle("transition", transition.description)
    }
    
    public func transition(_ transitions: Transition...) -> HTMLInlineStyle<Self> {
        inlineStyle("transition", transitions.map { $0.description }.joined(separator: ", "))
    }
    
    public func transition(property: Transition.Property, duration: Transition.Time, timingFunction: Transition.TimingFunction = .ease, delay: Transition.Time? = nil) -> HTMLInlineStyle<Self> {
        let transition = Transition(property: property, duration: duration, timingFunction: timingFunction, delay: delay)
        return self.transition(transition)
    }
    
    public func transitionProperty(_ property: Transition.Property) -> HTMLInlineStyle<Self> {
        inlineStyle("transition-property", property.description)
    }
    
    public func transitionDuration(_ duration: Transition.Time) -> HTMLInlineStyle<Self> {
        inlineStyle("transition-duration", duration.description)
    }
    
    public func transitionTimingFunction(_ timingFunction: Transition.TimingFunction) -> HTMLInlineStyle<Self> {
        inlineStyle("transition-timing-function", timingFunction.description)
    }
    
    public func transitionDelay(_ delay: Transition.Time) -> HTMLInlineStyle<Self> {
        inlineStyle("transition-delay", delay.description)
    }
}

// Convenience extensions for common transitions
extension HTML {
    public func fadeTransition(duration: Transition.Time = 0.3, timingFunction: Transition.TimingFunction = .ease) -> HTMLInlineStyle<Self> {
        transition(property: .custom("opacity"), duration: duration, timingFunction: timingFunction)
    }
    
    public func slideTransition(duration: Transition.Time = 0.3, timingFunction: Transition.TimingFunction = .ease) -> HTMLInlineStyle<Self> {
        transition(property: .custom("transform"), duration: duration, timingFunction: timingFunction)
    }
    
    public func colorTransition(duration: Transition.Time = 0.3, timingFunction: Transition.TimingFunction = .ease) -> HTMLInlineStyle<Self> {
        transition(property: .custom("color"), duration: duration, timingFunction: timingFunction)
    }
    
    public func backgroundColorTransition(duration: Transition.Time = 0.3, timingFunction: Transition.TimingFunction = .ease) -> HTMLInlineStyle<Self> {
        transition(property: .custom("background-color"), duration: duration, timingFunction: timingFunction)
    }
}

extension HTML {
    public func transform(_ transform: Transform) -> HTMLInlineStyle<Self> {
        inlineStyle("transform", transform.description)
    }
    
    public func transform(_ transforms: Transform...) -> HTMLInlineStyle<Self> {
        let combinedTransform = transforms.reduce(Transform.none) { $0 + $1 }
        return transform(combinedTransform)
    }
    
    // Convenience methods for common transforms
    public func translate(_ x: Length, _ y: Length? = nil) -> HTMLInlineStyle<Self> {
        transform(.translate(x, y))
    }
    
    public func translate3d(_ x: Length, _ y: Length, _ z: Length) -> HTMLInlineStyle<Self> {
        transform(.translate3d(x: x, y: y, z: z))
    }
    
    public func scale(_ x: Double, _ y: Double? = nil) -> HTMLInlineStyle<Self> {
        transform(.scale(x: x, y: y))
    }
    
    public func scale3d(_ x: Double, _ y: Double, _ z: Double) -> HTMLInlineStyle<Self> {
        transform(.scale3d(x: x, y: y, z: z))
    }
    
    public func rotate(_ angle: Angle) -> HTMLInlineStyle<Self> {
        transform(.rotate(angle))
    }
    
    public func rotate3d(_ x: Double, _ y: Double, _ z: Double, angle: Angle) -> HTMLInlineStyle<Self> {
        transform(.rotate3d(x: x, y: y, z: z, angle: angle))
    }
    
    public func skew(_ x: Angle, _ y: Angle? = nil) -> HTMLInlineStyle<Self> {
        transform(.skew(x: x, y: y))
    }
    
    public func perspective(_ length: Length) -> HTMLInlineStyle<Self> {
        transform(.perspective(length))
    }
    
    // Transform origin
    public func transformOrigin(_ x: Length, _ y: Length, _ z: Length? = nil) -> HTMLInlineStyle<Self> {
        if let z = z {
            return inlineStyle("transform-origin", "\(x) \(y) \(z)")
        } else {
            return inlineStyle("transform-origin", "\(x) \(y)")
        }
    }
    
    // Transform style (3D)
    public func transformStyle(_ style: TransformStyle) -> HTMLInlineStyle<Self> {
        inlineStyle("transform-style", style.rawValue)
    }
    
    // Backface visibility
    public func backfaceVisibility(_ visibility: BackfaceVisibility) -> HTMLInlineStyle<Self> {
        inlineStyle("backface-visibility", visibility.rawValue)
    }
}

// Additional enums for transform-related properties
public enum TransformStyle: String {
    case flat, preserve3d = "preserve-3d"
}

public enum BackfaceVisibility: String {
    case visible, hidden
}

// Convenience extensions for common transform combinations
extension HTML {
    public func fadeAndScale(scale: Double = 0.9) -> HTMLInlineStyle<Self> {
        transform(
            .scale(x: scale, y: scale),
            .translateZ(0.px)
        )
    }
    
    public func flipHorizontally() -> HTMLInlineStyle<Self> {
        transform(.scaleX(-1))
    }
    
    public func flipVertically() -> HTMLInlineStyle<Self> {
        transform(.scaleY(-1))
    }
    
    //    public func rotateAround(angle: Angle, x: Length, y: Length) -> HTMLInlineStyle<Self> {
    //        transform(
    //            .translate(x, y),
    //            .rotate(angle),
    //            .translate(-x, -y)
    //        )
    //    }
}

extension HTML {
    // Grid Container Properties

    @discardableResult
    public func gridTemplateColumns(_ value: GridTemplateColumns, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-template-columns", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridTemplateRows(_ value: GridTemplateRows, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-template-rows", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridTemplateAreas(_ value: GridTemplateAreas, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-template-areas", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridTemplate(columns: GridTemplateColumns, rows: GridTemplateRows, areas: GridTemplateAreas? = nil, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        let value = [columns.description, rows.description, areas?.description].compactMap { $0 }.joined(separator: " / ")
        return inlineStyle("grid-template", value, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridAutoColumns(_ value: GridAutoColumns, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-auto-columns", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridAutoRows(_ value: GridAutoRows, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-auto-rows", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridAutoFlow(_ value: GridAutoFlow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-auto-flow", value.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridGap(_ value: GridGap, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-gap", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridGap(row: Length, column: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-gap", "\(row) \(column)", media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    // Grid Item Properties

    @discardableResult
    public func gridColumnStart(_ value: GridColumnStart, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-column-start", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridColumnEnd(_ value: GridColumnEnd, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-column-end", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridRowStart(_ value: GridRowStart, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-row-start", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridRowEnd(_ value: GridRowEnd, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-row-end", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridColumn(_ value: GridColumn, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-column", "\(value.start.description) / \(value.end.description)", media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridRow(_ value: GridRow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-row", "\(value.start.description) / \(value.end.description)", media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func gridArea(_ value: GridArea, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("grid-area", value.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
//
//    // Convenience method for setting up a grid container
//    @discardableResult
//    public func gridContainer(_ container: GridContainer, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        self.display(.grid, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridTemplateColumns(container.templateColumns ?? .none, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridTemplateRows(container.templateRows ?? .none, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridTemplateAreas(container.templateAreas ?? .none, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridAutoColumns(container.autoColumns ?? .auto, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridAutoRows(container.autoRows ?? .auto, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridAutoFlow(container.autoFlow ?? .row, media: mediaQuery, pre: pre, pseudo: pseudo)
//            .gridGap(container.gap ?? GridGap(row: .px(0), column: .px(0)), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//
//    // Convenience method for setting up a grid item
//    @discardableResult
//    public func gridItem(_ item: GridItem, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        var style = self
//        if let columnStart = item.columnStart {
//            style = style.gridColumnStart(columnStart, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        if let columnEnd = item.columnEnd {
//            style = style.gridColumnEnd(columnEnd, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        if let rowStart = item.rowStart {
//            style = style.gridRowStart(rowStart, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        if let rowEnd = item.rowEnd {
//            style = style.gridRowEnd(rowEnd, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        if let area = item.area {
//            style = style.gridArea(area, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        return style
//    }
}


// MARK: - HTML Helpers

extension HTML {
    @discardableResult
    public func animation(_ animation: Animation, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation", animation.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationName(_ name: String, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-name", name, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationDuration(_ duration: Time, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-duration", duration.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationTimingFunction(_ timingFunction: Animation.TimingFunction, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-timing-function", timingFunction.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationDelay(_ delay: Time, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-delay", delay.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationIterationCount(_ count: Animation.IterationCount, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-iteration-count", count.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationDirection(_ direction: Animation.Direction, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-direction", direction.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationFillMode(_ fillMode: Animation.FillMode, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-fill-mode", fillMode.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }

    @discardableResult
    public func animationPlayState(_ playState: Animation.PlayState, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("animation-play-state", playState.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}

// Keyframes helper (This would typically be used at a higher level, not directly on an HTML element)
public func defineKeyframes(_ keyframes: Keyframes) -> String {
    keyframes.description
}


//
//// HTML helper methods
//extension HTML {
//    @discardableResult
//    public func boxShadow(_ shadow: BoxShadow, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        let lightStyle = inlineStyle("box-shadow", shadow.description, media: mediaQuery, pre: pre, pseudo: pseudo)
//        
//        // Generate dark mode style if any shadow has a dark mode color
//        if shadow.shadows.contains(where: { $0.color != nil }) {
//            let darkShadow = BoxShadow(shadow.shadows.map { shadow in
//                var darkShadow = shadow
//                darkShadow.color = shadow.color
//                return darkShadow
//            })
//            return lightStyle.inlineStyle("box-shadow", darkShadow.description, media: .dark, pre: pre, pseudo: pseudo)
//        }
//        
//        return lightStyle
//    }
//    
//    @discardableResult
//    public func boxShadow(_ shadows: BoxShadow.Shadow..., media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        boxShadow(BoxShadow(shadows), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
//}



// HTML helper methods
extension HTML {
    @discardableResult
    public func filter(_ filter: Filter, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("filter", filter.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func filter(_ filters: Filter.FilterFunction..., media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        filter(Filter.init([filters].flatMap { $0 }), media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}



// HTML helper methods
extension HTML {
    @discardableResult
    public func outline(_ outline: Outline, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("outline", outline.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func outlineStyle(_ style: Outline.Style, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("outline-style", style.rawValue, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func outlineWidth(_ width: Outline.Width, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("outline-width", width.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func outlineColor(_ color: CSS.Color, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("outline-color", color.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func outlineOffset(_ offset: Length, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("outline-offset", offset.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}


// MARK: - HTML Extensions

extension HTML {
    @discardableResult
    public func columnCount(_ count: ColumnCount, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("column-count", count.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
    @discardableResult
    public func columnGap(_ gap: ColumnGap, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("column-gap", gap.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
//    @discardableResult
//    public func columns(_ columns: Columns, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> some HTML {
//        var style: some HTML = self
//        if let count = columns.count {
//            style = style.columnCount(count, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        if let gap = columns.gap {
//            style = style.columnGap(gap, media: mediaQuery, pre: pre, pseudo: pseudo)
//        }
//        return style
//    }
}



// MARK: - HTML Extensions

extension HTML {
    @discardableResult
    public func scrollBehavior(_ behavior: ScrollBehavior, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("scroll-behavior", behavior.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
}



extension HTML {
    @discardableResult
    public func willChange(_ willChange: WillChange, media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
        inlineStyle("will-change", willChange.description, media: mediaQuery, pre: pre, pseudo: pseudo)
    }
    
//    @discardableResult
//    public func willChange(_ properties: WillChange.Property..., media mediaQuery: MediaQuery? = nil, pre: String? = nil, pseudo: Pseudo? = nil) -> HTMLInlineStyle<Self> {
//        willChange(WillChange(properties), media: mediaQuery, pre: pre, pseudo: pseudo)
//    }
}


extension HTML {
    public func pageBreak(_ pageBreak: PageBreak) -> some HTML {
        self.inlineStyle(pageBreak.description.0, pageBreak.description.1)
    }
}
