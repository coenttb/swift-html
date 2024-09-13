//
//  HTMLColor.swift
//
//
//  Created by Point-Free, Inc
//

public struct HTMLColor: Sendable {
    public var rawValue: String
    public var darkValue: String?
    
    public init(rawValue: String, darkValue: String? = nil) {
        self.rawValue = rawValue
        self.darkValue = darkValue
    }
}

extension HTMLColor: CustomStringConvertible {
    public var description: String {
        if let darkValue = darkValue {
            return "@media (prefers-color-scheme: light) { \(rawValue) } @media (prefers-color-scheme: dark) { \(darkValue) }"
        } else {
            return rawValue
        }
    }
}

extension HTMLColor {
    public func dark(_ other: Self) -> Self { Self(rawValue: rawValue, darkValue: other.rawValue) }
    public func light(_ other: Self) -> Self { Self(rawValue: other.rawValue, darkValue: darkValue) }
}

extension HTMLColor {
    public static func gray(_ value: UInt8) -> Self {
        var hex = String(value, radix: 16)
        if hex.count == 1 { hex.insert("0", at: hex.startIndex) }
        var darkHex = String(255 - value, radix: 16)
        if darkHex.count == 1 { darkHex.insert("0", at: darkHex.startIndex) }
        return Self(rawValue: "#\(hex)\(hex)\(hex)")
            .dark(Self(rawValue: "#\(darkHex)\(darkHex)\(darkHex)"))
    }
    @_disfavoredOverload
    public static func gray(_ value: Double) -> Self {
        gray(UInt8(255 * value))
    }
}
