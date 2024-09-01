//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Foundation

public enum ClipPath {
    case circle(radius: CSS.Length, center: (x: CSS.Length, y: CSS.Length)? = nil)
    case ellipse(radiusX: CSS.Length, radiusY: CSS.Length, center: (x: CSS.Length, y: CSS.Length)? = nil)
    case inset(top: CSS.Length, right: CSS.Length, bottom: CSS.Length, left: CSS.Length, borderRadius: CSS.Length? = nil)
    case polygon(points: [(x: CSS.Length, y: CSS.Length)])
    case custom(String)

    var cssValue: String {
        switch self {
        case .circle(let radius, let center):
            let centerPart = center.map { "at \($0.x.description) \($0.y.description)" } ?? ""
            return "circle(\(radius.description) \(centerPart))"
        case .ellipse(let radiusX, let radiusY, let center):
            let centerPart = center.map { "at \($0.x.description) \($0.y.description)" } ?? ""
            return "ellipse(\(radiusX.description) \(radiusY.description) \(centerPart))"
        case .inset(let top, let right, let bottom, let left, let borderRadius):
            let insetPart = "inset(\(top.description) \(right.description) \(bottom.description) \(left.description))"
            let roundPart = borderRadius.map { " round \($0.description)" } ?? ""
            return insetPart + roundPart
        case .polygon(let points):
            let pointsString = points.map { "\($0.x.description) \($0.y.description)" }.joined(separator: ", ")
            return "polygon(\(pointsString))"
        case .custom(let value):
            return value
        }
    }
}


extension ClipPath {
    public static func circle(_ radius: Length) -> Self {
        .circle(radius: radius)
    }
}
