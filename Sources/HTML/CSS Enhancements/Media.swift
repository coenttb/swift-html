//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation

extension CSSAtRuleTypes.Media {
  /// Targets devices in dark mode.
  public static let dark = Self(rawValue: "@media (prefers-color-scheme: dark)")
  /// Targets print media (when the page is being printed).
  public static let print = Self(rawValue: "@media print")
  public static let desktop = Self(rawValue: "@media only screen and (min-width: 832px)")
  public static let mobile = Self(rawValue: "@media only screen and (max-width: 831px)")
  public static let tablet = Self(
    rawValue: "@media only screen and (min-width: 768px) and (max-width: 1024px)"
  )
  public static let landscape = Self(rawValue: "@media (orientation: landscape)")
  public static let portrait = Self(rawValue: "@media (orientation: portrait)")
  public static let retina = Self(
    rawValue: "@media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi)"
  )
  public static let smallMobile = Self(rawValue: "@media only screen and (max-width: 320px)")
  public static let largeMobile = Self(
    rawValue: "@media only screen and (min-width: 321px) and (max-width: 767px)"
  )
  public static let largeDesktop = Self(rawValue: "@media only screen and (min-width: 1200px)")
  public static let hover = Self(rawValue: "@media (hover: hover)")
  public static let reducedMotion = Self(rawValue: "@media (prefers-reduced-motion: reduce)")
}
