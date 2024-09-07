//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 07/09/2024.
//

import Foundation
import PointFreeHtml

public enum TextProperties {
    // Text Alignment
    case textAlign(TextAlign)
    
    // Text Decoration
    case textDecoration(TextDecoration)
    case textDecorationLine(TextDecorationLine)
    case textDecorationColor(HTMLColor)
    case textDecorationStyle(TextDecorationStyle)
    case textDecorationThickness(Length)
    
    // Text Transform
    case textTransform(TextTransform)
    
    // Text Spacing
    case letterSpacing(Length)
    case wordSpacing(Length)
    case lineHeight(LineHeight)
    
    // Text Wrapping
    case whiteSpace(WhiteSpace)
    case wordBreak(WordBreak)
    case overflowWrap(OverflowWrap)
    
    // Text Shadow
    case textShadow(TextShadow)
    
    // Text Orientation
    case textOrientation(TextOrientation)
    
    // Text Overflow
    case textOverflow(TextOverflow)
    
    // Text Indent
    case textIndent(Length)
    
    // Vertical Alignment
    case verticalAlign(VerticalAlign)
    
    // Direction
    case direction(Direction)
    
    // Unicode Bidi
    case unicodeBidi(UnicodeBidi)
    
    // Writing Mode
    case writingMode(WritingMode)
}



public enum TextDecoration: String {
    case none, underline, overline, lineThrough = "line-through"
}

public enum TextDecorationLine: String {
    case none, underline, overline, lineThrough = "line-through"
    case blink
}

public enum TextDecorationStyle: String {
    case solid, double, dotted, dashed, wavy
}

public enum TextTransform: String {
    case none, capitalize, uppercase, lowercase
    case fullWidth = "full-width"
    case fullSizeKana = "full-size-kana"
}




public struct TextShadow {
    let offsetX: Length
    let offsetY: Length
    let blurRadius: Length
    let color: HTMLColor
}

public enum TextOrientation: String {
    case mixed, upright, sideways
}

public enum TextOverflow: String {
    case clip, ellipsis
}

public enum VerticalAlign: Sendable {
    case keyword(Keyword)
    case length(Length)
    case percentage(Double)
    
    public enum Keyword: String, Sendable {
        case baseline, sub, `super`, top, textTop = "text-top"
        case middle, bottom, textBottom = "text-bottom"
    }
}

public enum Direction: String {
    case ltr, rtl
}

public enum UnicodeBidi: String {
    case normal, embed, bidiOverride = "bidi-override"
    case isolate, isolateOverride = "isolate-override", plaintext
}

public enum WritingMode: String {
    case horizontalTb = "horizontal-tb"
    case verticalRl = "vertical-rl"
    case verticalLr = "vertical-lr"
}

extension TextProperties: CustomStringConvertible {
    public var description: String {
        switch self {
        case .textAlign(let value):
            return "text-align: \(value.rawValue)"
        case .textDecoration(let value):
            return "text-decoration: \(value.rawValue)"
        case .textDecorationLine(let value):
            return "text-decoration-line: \(value.rawValue)"
        case .textDecorationColor(let value):
            return "text-decoration-color: \(value.description)"
        case .textDecorationStyle(let value):
            return "text-decoration-style: \(value.rawValue)"
        case .textDecorationThickness(let value):
            return "text-decoration-thickness: \(value.description)"
        case .textTransform(let value):
            return "text-transform: \(value.rawValue)"
        case .letterSpacing(let value):
            return "letter-spacing: \(value.description)"
        case .wordSpacing(let value):
            return "word-spacing: \(value.description)"
        case .lineHeight(let value):
            return "line-height: \(value.description)"
        case .whiteSpace(let value):
            return "white-space: \(value.rawValue)"
        case .wordBreak(let value):
            return "word-break: \(value.rawValue)"
        case .overflowWrap(let value):
            return "overflow-wrap: \(value.rawValue)"
        case .textShadow(let value):
            return "text-shadow: \(value.offsetX) \(value.offsetY) \(value.blurRadius) \(value.color.description)"
        case .textOrientation(let value):
            return "text-orientation: \(value.rawValue)"
        case .textOverflow(let value):
            return "text-overflow: \(value.rawValue)"
        case .textIndent(let value):
            return "text-indent: \(value.description)"
        case .verticalAlign(let value):
            switch value {
            case .keyword(let keyword):
                return "vertical-align: \(keyword.rawValue)"
            case .length(let length):
                return "vertical-align: \(length.description)"
            case .percentage(let percentage):
                return "vertical-align: \(percentage)%"
            }
        case .direction(let value):
            return "direction: \(value.rawValue)"
        case .unicodeBidi(let value):
            return "unicode-bidi: \(value.rawValue)"
        case .writingMode(let value):
            return "writing-mode: \(value.rawValue)"
        }
    }
}
