import Foundation

public enum Flex {
    // Flex Container Properties
    public enum Direction: String {
        case row
        case rowReverse = "row-reverse"
        case column
        case columnReverse = "column-reverse"
    }
    
    public enum Wrap: String {
        case nowrap
        case wrap
        case wrapReverse = "wrap-reverse"
    }
    
    // Flex Item Properties
    public enum Grow: ExpressibleByIntegerLiteral {
        case number(Int)
        
        public init(integerLiteral value: Int) {
            self = .number(value)
        }
    }
    
    public enum Shrink: ExpressibleByIntegerLiteral {
        case number(Int)
        
        public init(integerLiteral value: Int) {
            self = .number(value)
        }
    }
    
    public enum Basis {
        case length(CSS.Length)
        case percentage(Double)
        case auto
        case content
        case fitContent
        case maxContent
        case minContent
    }
}

extension Flex.Grow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let value):
            return "\(value)"
        }
    }
}

extension Flex.Shrink: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let value):
            return "\(value)"
        }
    }
}

extension Flex.Basis: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let value):
            return "\(value)%"
        case .auto:
            return "auto"
        case .content:
            return "content"
        case .fitContent:
            return "fit-content"
        case .maxContent:
            return "max-content"
        case .minContent:
            return "min-content"
        }
    }
}


extension CSS.Flex {
    public static let row: Direction = .row
    public static let rowReverse: Direction = .rowReverse
    public static let column: Direction = .column
    public static let columnReverse: Direction = .columnReverse
    
    public static let nowrap: Wrap = .nowrap
    public static let wrap: Wrap = .wrap
    public static let wrapReverse: Wrap = .wrapReverse
    
    public static let grow0: Grow = 0
    public static let grow1: Grow = 1
    
    public static let shrink0: Shrink = 0
    public static let shrink1: Shrink = 1
    
    public static let basisAuto: Basis = .auto
    public static let basisContent: Basis = .content
    public static let basisFitContent: Basis = .fitContent
    public static let basisMaxContent: Basis = .maxContent
    public static let basisMinContent: Basis = .minContent
}
