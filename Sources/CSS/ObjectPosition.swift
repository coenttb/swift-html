import Foundation

public enum ObjectPosition: Sendable {
    case keyword(Keyword)
    case oneValue(Value)
    case twoValues(Value, Value)
    case global(Global)

    public enum Keyword: String, Sendable {
        case left, center, right, top, bottom
    }

    public enum Value: Sendable {
        case length(Length)
        case percentage(Double)
        case keyword(Keyword)
    }

    public enum Global: String, Sendable {
        case inherit, initial, revert
        case revertLayer = "revert-layer"
        case unset
    }
}

extension ObjectPosition: CustomStringConvertible {
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.rawValue
        case .oneValue(let value):
            return value.description
        case .twoValues(let value1, let value2):
            return "\(value1) \(value2)"
        case .global(let global):
            return global.rawValue
        }
    }
}

extension ObjectPosition.Value: CustomStringConvertible {
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let percentage):
            return "\(percentage)%"
        case .keyword(let keyword):
            return keyword.rawValue
        }
    }
}

extension ObjectPosition {

    public static func objectPosition(_ position: ObjectPosition) -> Self {
        position
    }

    public static func objectPosition(_ keyword: ObjectPosition.Keyword) -> Self {
        .keyword(keyword)
    }

    public static func objectPosition(_ value: ObjectPosition.Value) -> Self {
        .oneValue(value)
    }

    public static func objectPosition(_ value1: ObjectPosition.Value, _ value2: ObjectPosition.Value) -> Self {
        .twoValues(value1, value2)
    }

    public static func objectPosition(_ global: ObjectPosition.Global) -> Self {
        .global(global)
    }
}

// Convenience initializers
extension ObjectPosition {
    public static func length(_ length: Length) -> Self {
        .oneValue(.length(length))
    }

    public static func percentage(_ percentage: Double) -> Self {
        .oneValue(.percentage(percentage))
    }

    public static func lengths(_ length1: Length, _ length2: Length) -> Self {
        .twoValues(.length(length1), .length(length2))
    }

    public static func percentages(_ percentage1: Double, _ percentage2: Double) -> Self {
        .twoValues(.percentage(percentage1), .percentage(percentage2))
    }
}
