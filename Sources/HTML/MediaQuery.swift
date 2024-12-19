//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 17/09/2024.
//

import Foundation
import PointFreeHTML

extension MediaQuery {
    public static let desktop = Self(rawValue: "only screen and (min-width: 832px)")
    public static let mobile = Self(rawValue: "only screen and (max-width: 831px)")
    public static let tablet = Self(rawValue: "only screen and (min-width: 768px) and (max-width: 1024px)")
    public static let landscape = Self(rawValue: "(orientation: landscape)")
    public static let portrait = Self(rawValue: "(orientation: portrait)")
    public static let retina = Self(rawValue: "(-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi)")
    static let smallMobile = Self(rawValue: "only screen and (max-width: 320px)")
    public static let largeMobile = Self(rawValue: "only screen and (min-width: 321px) and (max-width: 767px)")
    public static let largeDesktop = Self(rawValue: "only screen and (min-width: 1200px)")
    public static let hover = Self(rawValue: "(hover: hover)")
    public static let reducedMotion = Self(rawValue: "(prefers-reduced-motion: reduce)")
}
