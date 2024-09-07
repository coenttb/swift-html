import Foundation
import PointFreeHtml

// MARK: - Flex Container Properties

public enum FlexDirection: String, CaseIterable {
    case row, rowReverse = "row-reverse"
    case column, columnReverse = "column-reverse"
}

public enum FlexWrap: String, CaseIterable {
    case nowrap, wrap, wrapReverse = "wrap-reverse"
}



public enum AlignContent: String, CaseIterable {
    case flexStart = "flex-start", flexEnd = "flex-end", center
    case spaceBetween = "space-between", spaceAround = "space-around", stretch
}

// MARK: - Flex Item Properties

public enum FlexBasis: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    case length(Length)
    case percentage(Double)
    case auto
    
    public init(integerLiteral value: Int) {
        self = .length(Length(integerLiteral: value))
    }
    
    public init(floatLiteral value: Double) {
        self = .length(Length(floatLiteral: value))
    }
}

public enum FlexGrow: ExpressibleByIntegerLiteral {
    case number(Int)
    
    public init(integerLiteral value: Int) {
        self = .number(value)
    }
}

public enum FlexShrink: ExpressibleByIntegerLiteral {
    case number(Int)
    
    public init(integerLiteral value: Int) {
        self = .number(value)
    }
}

public enum AlignSelf: String, CaseIterable {
    case auto, flexStart = "flex-start", flexEnd = "flex-end", center, baseline, stretch
}

// MARK: - Flex Container

public struct FlexContainer {
    var direction: FlexDirection?
    var wrap: FlexWrap?
    var justifyContent: JustifyContent?
    var alignItems: AlignItems?
    var alignContent: AlignContent?
    
    public init(
        direction: FlexDirection? = nil,
        wrap: FlexWrap? = nil,
        justifyContent: JustifyContent? = nil,
        alignItems: AlignItems? = nil,
        alignContent: AlignContent? = nil
    ) {
        self.direction = direction
        self.wrap = wrap
        self.justifyContent = justifyContent
        self.alignItems = alignItems
        self.alignContent = alignContent
    }
}

// MARK: - Flex Item

public struct FlexItem {
    var grow: FlexGrow?
    var shrink: FlexShrink?
    var basis: FlexBasis?
    var alignSelf: AlignSelf?
    
    public init(
        grow: FlexGrow? = nil,
        shrink: FlexShrink? = nil,
        basis: FlexBasis? = nil,
        alignSelf: AlignSelf? = nil
    ) {
        self.grow = grow
        self.shrink = shrink
        self.basis = basis
        self.alignSelf = alignSelf
    }
}

// MARK: - CustomStringConvertible Conformances

extension FlexBasis: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let value):
            return "\(value)%"
        case .auto:
            return "auto"
        }
    }
}

extension FlexGrow: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let value):
            return "\(value)"
        }
    }
}

extension FlexShrink: CustomStringConvertible {
    public var description: String {
        switch self {
        case .number(let value):
            return "\(value)"
        }
    }
}

// MARK: - HTML Extensions


// MARK: - Convenience Properties and Methods

extension FlexContainer {
    public static let row = FlexContainer(direction: .row)
    public static let column = FlexContainer(direction: .column)
    public static let spaceBetween = FlexContainer(justifyContent: .spaceBetween)
    public static let center = FlexContainer(justifyContent: .center, alignItems: .center)
}

extension FlexItem {
    public static let grow = FlexItem(grow: 1)
    public static let shrink = FlexItem(shrink: 1)
    public static let noGrow = FlexItem(grow: 0)
    public static let noShrink = FlexItem(shrink: 0)
}


