//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 13/08/2024.
//

import Foundation

public struct Length: Sendable {
    let number: Double
    let unit: Unit
    
    public init(number: Double, unit: Unit) {
        self.number = number
        self.unit = unit
    }
    
    public init(_ number: Double, _ unit: Unit) {
        self = .init(number: number, unit: unit)
    }
    
    public enum Unit: Sendable {
        case relative(Relative)
        
        public enum Relative: Sendable {
            case parent(Parent)
            case root(Root)
            case viewport(Viewport)
            
            public enum Parent: String, Sendable {
                case cap
                case ch
                case em
                case ex
                case ic
                case lh
            }
            
            public enum Root: String, Sendable {
                case cap = "rcap"
                case ch = "rch"
                case em = "rem"
                case ex = "rex"
                case ic = "ric"
                case lh = "rlh"
            }
            
            public struct Viewport: Sendable {
                let unit: Viewport.Unit
                let variant: Variant
                
                public init(unit: Viewport.Unit, variant: Variant = .default) {
                    self.unit = unit
                    self.variant = variant
                }
                
                public enum Variant: String, Sendable {
                    case small
                    case large
                    case dynamic
                    case `default`
                }
                
                public enum Unit: Sendable {
                    /// Represents a percentage of the height of the viewport's initial containing block. 1vh is 1% of the viewport height. For example, if the viewport height is 300px, then a value of 70vh on a property will be 210px.
                    ///
                    /// The respective viewport-percentage units for small, large, and dynamic viewport sizes are svh, lvh, and dvh. vh represents the viewport-percentage length unit based on the browser's default viewport size.
                    case vh
                    
                    /// Represents a percentage of the width of the viewport's initial containing block. 1vw is 1% of the viewport width. For example, if the viewport width is 800px, then a value of 50vw on a property will be 400px.
                    ///
                    /// For small, large, and dynamic viewport sizes, the respective viewport-percentage units are svw, lvw, and dvw. vw represents the viewport-percentage length unit based on the browser's default viewport size.
                    case vw
                    
                    /// Represents in percentage the largest of vw and vh.
                    ///
                    /// For small, large, and dynamic viewport sizes, the respective viewport-percentage units are svmax, lvmax, and dvmax. vmax represents the viewport-percentage length unit based on the browser's default viewport size.
                    case vmax
                    
                    /// Represents in percentage the smallest of vw and vh.
                    ///
                    /// For small, large, and dynamic viewport sizes, the respective viewport-percentage units are svmin, lvmin, and dvmin. vmin represents the viewport-percentage length unit based on the browser's default viewport size.
                    case vmin
                    
                    /// Represents the percentage of the size of the initial containing block, in the direction of the root element's block axis.
                    ///
                    /// For small, large, and dynamic viewport sizes, the respective viewport-percentage units are svb, lvb, and dvb, respectively. vb represents the viewport-percentage length unit based on the browser's default viewport size.
                    case vb
                    
                    /// Represents a percentage of the size of the initial containing block, in the direction of the root element's inline axis.
                    ///
                    /// For small, large, and dynamic viewport sizes, the respective viewport-percentage units are svi, lvi, and dvi. vi represents the viewport-percentage length unit based on the browser's default viewport size.
                    case vi
                }
            }
        }
    }
}

extension Length: CustomStringConvertible {
    public var description: String {
        "\(self.number)\(self.unit)"
    }
}

extension Length.Unit.Relative.Viewport: CustomStringConvertible {
    public var description: String {
        
        let prefix: String = switch self.variant {
        case .small: "s"
        case .large: "l"
        case .dynamic: "d"
        case .default: ""
        }
        
        return "\(prefix)\(unit)"
        
    }
}

extension Length.Unit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .relative(let relative): "\(relative)"
        }
    }
}

extension Length.Unit.Relative: CustomStringConvertible {
    public var description: String {
        switch self {
        case .parent(let parent): parent.rawValue
        case .root(let root): root.rawValue
        case .viewport(let viewport): viewport.description
        }
    }
}

extension Length.Unit.Relative {
    public static func viewport(_ unit: Length.Unit.Relative.Viewport.Unit)->Self {
        .viewport(.init(unit: unit, variant: .default))
    }
}

extension Length.Unit {
    public static let cap: Self = .relative(.parent(.cap))
    public static let ch: Self = .relative(.parent(.ch))
    public static let em: Self = .relative(.parent(.em))
    public static let ex: Self = .relative(.parent(.ex))
    public static let ic: Self = .relative(.parent(.ic))
    public static let lh: Self = .relative(.parent(.lh))
    public static let rcap: Self = .relative(.root(.cap))
    public static let rch: Self = .relative(.root(.ch))
    public static let rem: Self = .relative(.root(.em))
    public static let rex: Self = .relative(.root(.ex))
    public static let ric: Self = .relative(.root(.ic))
    public static let rlh: Self = .relative(.root(.lh))
    
    public static let vh: Self = .relative(.viewport(.init(unit: .vh, variant: .default)))
    public static let vw: Self = .relative(.viewport(.init(unit: .vw, variant: .default)))
    public static let vmax: Self = .relative(.viewport(.init(unit: .vmax, variant: .default)))
    public static let vmin: Self = .relative(.viewport(.init(unit: .vmin, variant: .default)))
    public static let vb: Self = .relative(.viewport(.init(unit: .vb, variant: .default)))
    public static let vi: Self = .relative(.viewport(.init(unit: .vi, variant: .default)))
    
    public static let svh: Self = .relative(.viewport(.init(unit: .vh, variant: .small)))
    public static let svw: Self = .relative(.viewport(.init(unit: .vw, variant: .small)))
    public static let svmax: Self = .relative(.viewport(.init(unit: .vmax, variant: .small)))
    public static let svmin: Self = .relative(.viewport(.init(unit: .vmin, variant: .small)))
    public static let svb: Self = .relative(.viewport(.init(unit: .vb, variant: .small)))
    public static let svi: Self = .relative(.viewport(.init(unit: .vi, variant: .small)))
    
    public static let lvh: Self = .relative(.viewport(.init(unit: .vh, variant: .large)))
    public static let lvw: Self = .relative(.viewport(.init(unit: .vw, variant: .large)))
    public static let lvmax: Self = .relative(.viewport(.init(unit: .vmax, variant: .large)))
    public static let lvmin: Self = .relative(.viewport(.init(unit: .vmin, variant: .large)))
    public static let lvb: Self = .relative(.viewport(.init(unit: .vb, variant: .large)))
    public static let lvi: Self = .relative(.viewport(.init(unit: .vi, variant: .large)))
    
    public static let dvh: Self = .relative(.viewport(.init(unit: .vh, variant: .dynamic)))
    public static let dvw: Self = .relative(.viewport(.init(unit: .vw, variant: .dynamic)))
    public static let dvmax: Self = .relative(.viewport(.init(unit: .vmax, variant: .dynamic)))
    public static let dvmin: Self = .relative(.viewport(.init(unit: .vmin, variant: .dynamic)))
    public static let dvb: Self = .relative(.viewport(.init(unit: .vb, variant: .dynamic)))
    public static let dvi: Self = .relative(.viewport(.init(unit: .vi, variant: .dynamic)))
    
    public static func vh(_ variant: Length.Unit.Relative.Viewport.Variant) -> Self {
        .relative(.viewport(.init(unit: .vh, variant: variant)))
    }
    public static func vw(_ variant: Length.Unit.Relative.Viewport.Variant) -> Self {
        .relative(.viewport(.init(unit: .vw, variant: variant)))
    }
    public static func vmax(_ variant: Length.Unit.Relative.Viewport.Variant) -> Self {
        .relative(.viewport(.init(unit: .vmax, variant: variant)))
    }
    public static func vmin(_ variant: Length.Unit.Relative.Viewport.Variant) -> Self {
        .relative(.viewport(.init(unit: .vmin, variant: variant)))
    }
    public static func vb(_ variant: Length.Unit.Relative.Viewport.Variant) -> Self {
        .relative(.viewport(.init(unit: .vb, variant: variant)))
    }
    public static func vi(_ variant: Length.Unit.Relative.Viewport.Variant) -> Self {
        .relative(.viewport(.init(unit: .vi, variant: variant)))
    }
}

