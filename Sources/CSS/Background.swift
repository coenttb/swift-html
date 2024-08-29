//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 29/08/2024.
//

import Foundation
import HTML
@preconcurrency import Percent

public enum Background: Sendable {
    case color(HTMLColor)
    case image(Image)
    case position(Position)
    case size(Size)
    case `repeat`(Repeat)
    case attachment(Attachment)
    case origin(Origin)
    case clip(Clip)
    case composite(Composite)
    case full(color: HTMLColor?, image: Image?, position: Position?, size: Size?, repeat: Repeat?, attachment: Attachment?, origin: Origin?, clip: Clip?)
    case global(Global)

    public enum Image: Sendable {
        case url(String)
        case none
        case gradient(Gradient)
        
        public enum Gradient: Sendable {
            case linear(LinearGradient)
            case radial(RadialGradient)
            case conicGradient(ConicGradient)  // Adding conic gradient support
        }
        
        public struct LinearGradient: Sendable {
            public var angle: Angle
            public var stops: [GradientStop]
        }
        
        public struct RadialGradient: Sendable {
            public var shape: Shape
            public var size: Size
            public var position: Position
            public var stops: [GradientStop]
            
            public enum Shape: String, Sendable {
                case circle, ellipse
            }
            
            public enum Size: CustomStringConvertible, Sendable {
                case closestSide, farthestSide, closestCorner, farthestCorner
                case length(Length, Length)
                
                public var description: String {
                    switch self {
                    case .closestSide: return "closest-side"
                    case .farthestSide: return "farthest-side"
                    case .closestCorner: return "closest-corner"
                    case .farthestCorner: return "farthest-corner"
                    case .length(let w, let h): return "\(w) \(h)"
                    }
                }
            }
        }
        
        public struct ConicGradient: Sendable {  // New struct for conic gradients
            public var angle: Angle
            public var position: Position
            public var stops: [GradientStop]
        }
        
        public struct GradientStop: Sendable {
            public var color: HTMLColor
            public var position: Length?
        }
    }

    public enum Position: Sendable {
        case keywords(horizontal: HorizontalKeyword, vertical: VerticalKeyword)
        case lengths(x: Length, y: Length)
        case mixed(MixedPosition)
        case percentage(x: Percentage, y: Percentage)
        
        public enum HorizontalKeyword: String, Sendable {
            case left, center, right
        }
        
        public enum VerticalKeyword: String, Sendable {
            case top, center, bottom
        }
        
        public enum MixedPosition: Sendable {
            case horizontalKeywordVerticalLength(x: HorizontalKeyword, y: Length)
            case horizontalLengthVerticalKeyword(x: Length, y: VerticalKeyword)
        }
        
        public static func mixed(x: HorizontalKeyword, y: Length) -> Position {
            .mixed(.horizontalKeywordVerticalLength(x: x, y: y))
        }
        
        public static func mixed(x: Length, y: VerticalKeyword) -> Position {
            .mixed(.horizontalLengthVerticalKeyword(x: x, y: y))
        }
    }

    public enum Size: Sendable {
        case keywords(SizeKeyword)
        case lengths(width: Length, height: Length)
        
        public enum SizeKeyword: String, Sendable {
            case cover, contain
        }
    }

    public enum Repeat: String, Sendable {
        case repeatX = "repeat-x"
        case repeatY = "repeat-y"
        case `repeat`, space, round, noRepeat = "no-repeat"
    }

    public enum Attachment: String, Sendable {
        case scroll, fixed, local
    }

    public enum Origin: String, Sendable {
        case borderBox = "border-box"
        case paddingBox = "padding-box"
        case contentBox = "content-box"
    }

    public enum Clip: String, Sendable {
        case borderBox = "border-box"
        case paddingBox = "padding-box"
        case contentBox = "content-box"
        case text
    }
    
    public enum Composite: String, Sendable {
        case clear, copy, sourceOver = "source-over"
        case sourceIn = "source-in", sourceOut = "source-out"
        case sourceAtop = "source-atop", destinationOver = "destination-over"
        case destinationIn = "destination-in", destinationOut = "destination-out"
        case destinationAtop = "destination-atop", xor
    }

    public enum Global: String, Sendable {
        case inherit, initial, revert, revertLayer = "revert-layer", unset
    }
}

extension CSS.Background: CustomStringConvertible {
    public var description: String {
        switch self {
        case .color(let color):
            return "background-color: \(color)"
        case .image(let image):
            return "background-image: \(image)"
        case .position(let position):
            return "background-position: \(position)"
        case .size(let size):
            return "background-size: \(size)"
        case .repeat(let `repeat`):
            return "background-repeat: \(`repeat`.rawValue)"
        case .attachment(let attachment):
            return "background-attachment: \(attachment.rawValue)"
        case .origin(let origin):
            return "background-origin: \(origin.rawValue)"
        case .clip(let clip):
            return "background-clip: \(clip.rawValue)"
        case .composite(let composite):
            return "background-composite: \(composite.rawValue)"
        case .full(let color, let image, let position, let size, let `repeat`, let attachment, let origin, let clip):
            var parts: [String] = []
            if let color = color { parts.append(color.description) }
            if let image = image { parts.append(image.description) }
            if let position = position { parts.append(position.description) }
            if let size = size { parts.append("/ \(size.description)") }
            if let `repeat` = `repeat` { parts.append(`repeat`.rawValue) }
            if let attachment = attachment { parts.append(attachment.rawValue) }
            if let origin = origin { parts.append(origin.rawValue) }
            if let clip = clip { parts.append(clip.rawValue) }
            return parts.joined(separator: " ")
        case .global(let global):
            return global.rawValue
        }
    }
}

extension CSS.Background.Image: CustomStringConvertible {
    public var description: String {
        switch self {
        case .url(let url):
            return "url('\(url)')"
        case .none:
            return "none"
        case .gradient(let gradient):
            switch gradient {
            case .linear(let linearGradient):
                let stops = linearGradient.stops.map { "\($0.color)\($0.position.map { " \($0)" } ?? "")" }.joined(separator: ", ")
                return "linear-gradient(\(linearGradient.angle), \(stops))"
            case .radial(let radialGradient):
                let stops = radialGradient.stops.map { "\($0.color)\($0.position.map { " \($0)" } ?? "")" }.joined(separator: ", ")
                return "radial-gradient(\(radialGradient.shape.rawValue) \(radialGradient.size) at \(radialGradient.position), \(stops))"
            case .conicGradient(let conicGradient):
                let stops = conicGradient.stops.map { "\($0.color)\($0.position.map { " \($0)" } ?? "")" }.joined(separator: ", ")
                return "conic-gradient(from \(conicGradient.angle) at \(conicGradient.position), \(stops))"
            }
        }
    }
}


extension CSS.Background.Image {
    public static func linearGradient(angle: Angle, stops: [GradientStop]) -> Self {
        .gradient(.linear(LinearGradient(angle: angle, stops: stops)))
    }

    public static func radialGradient(shape: RadialGradient.Shape, size: RadialGradient.Size, position: Background.Position, stops: [GradientStop]) -> Self {
        .gradient(.radial(RadialGradient(shape: shape, size: size, position: position, stops: stops)))
    }

    public static func conicGradient(angle: Angle, position: Background.Position, stops: [GradientStop]) -> Self {
        .gradient(.conicGradient(ConicGradient(angle: angle, position: position, stops: stops)))
    }
}


extension CSS.Background.Position: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keywords(let h, let v):
            return "\(h.rawValue) \(v.rawValue)"
        case .lengths(let x, let y):
            return "\(x) \(y)"
        case .mixed(let mixedPosition):
            switch mixedPosition {
            case .horizontalKeywordVerticalLength(let keyword, let length):
                return "\(keyword.rawValue) \(length)"
            case .horizontalLengthVerticalKeyword(let length, let keyword):
                return "\(length) \(keyword.rawValue)"
            }
        case .percentage(let x, let y):
            return "\(x) \(y)"
        }
    }
}

extension CSS.Background.Size: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keywords(let keyword):
            return keyword.rawValue
        case .lengths(let width, let height):
            return "\(width) \(height)"
        }
    }
}

extension HTML {
    @discardableResult
    public func background(_ background: CSS.Background) -> some HTML {
        self.inlineStyle("background", background.description)
    }
    
    @discardableResult
    public func backgroundColor(_ color: HTMLColor) -> some HTML {
        self.inlineStyle("background-color", color.description)
    }
    
    @discardableResult
    public func backgroundImage(_ image: CSS.Background.Image) -> some HTML {
        self.inlineStyle("background-image", image.description)
    }
    
    @discardableResult
    public func backgroundPosition(_ position: CSS.Background.Position) -> some HTML {
        self.inlineStyle("background-position", position.description)
    }
    
    @discardableResult
    public func backgroundSize(_ size: CSS.Background.Size) -> some HTML {
        self.inlineStyle("background-size", size.description)
    }
    
    @discardableResult
    public func backgroundRepeat(_ repeat: CSS.Background.Repeat) -> some HTML {
        self.inlineStyle("background-repeat", `repeat`.rawValue)
    }
    
    @discardableResult
    public func backgroundAttachment(_ attachment: CSS.Background.Attachment) -> some HTML {
        self.inlineStyle("background-attachment", attachment.rawValue)
    }
    
    @discardableResult
    public func backgroundOrigin(_ origin: CSS.Background.Origin) -> some HTML {
        self.inlineStyle("background-origin", origin.rawValue)
    }
    
    @discardableResult
    public func backgroundClip(_ clip: CSS.Background.Clip) -> some HTML {
        self.inlineStyle("background-clip", clip.rawValue)
    }
}
