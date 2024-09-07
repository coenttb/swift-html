import Foundation
import Dependencies

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


extension CSS.ObjectPosition {
    
    
    public static let left: Self = .keyword(.left)
    public static let center: Self = .keyword(.center)
    public static let right: Self = .keyword(.right)
    public static let top: Self = .keyword(.top)
    public static let bottom: Self = .keyword(.bottom)
    
    // Common combinations
    public static let topLeft: Self = .twoValues(.keyword(.left), .keyword(.top))
    public static let topCenter: Self = .twoValues(.keyword(.center), .keyword(.top))
    public static let topRight: Self = .twoValues(.keyword(.right), .keyword(.top))
    public static let centerLeft: Self = .twoValues(.keyword(.left), .keyword(.center))
    public static let centerRight: Self = .twoValues(.keyword(.right), .keyword(.center))
    public static let bottomLeft: Self = .twoValues(.keyword(.left), .keyword(.bottom))
    public static let bottomCenter: Self = .twoValues(.keyword(.center), .keyword(.bottom))
    public static let bottomRight: Self = .twoValues(.keyword(.right), .keyword(.bottom))
}


extension CSS.ObjectPosition {

    public static func x(_ value: Length) -> CSS.ObjectPosition {
        return .twoValues(.length(value), .keyword(.center))
    }

    public static func y(_ value: Length) -> CSS.ObjectPosition {
        return .twoValues(.keyword(.center), .length(value))
    }
}


extension CSS.ObjectPosition {
    public static let inherit: CSS.ObjectPosition = .global(.inherit)

    public static let initial: CSS.ObjectPosition = .global(.initial)

    public static let unset: CSS.ObjectPosition = .global(.unset)
}

extension CSS.ObjectPosition {
    public static func symmetric(_ value: Length) -> CSS.ObjectPosition {
        return .twoValues(.length(value), .length(value))
    }
}

public struct ObjectStyle: Sendable {
    public var position: ObjectPosition
    
    public init(position: ObjectPosition) {
        self.position = position
    }
}

private enum ObjectStyleKey: DependencyKey {
    static let liveValue = ObjectStyle.init(position: .inherit)
    static let testValue = ObjectStyle.init(position: .inherit)
}

extension DependencyValues {
    public var objectStyle: ObjectStyle {
        get { self[ObjectStyleKey.self] }
        set { self[ObjectStyleKey.self] = newValue }
    }
}

