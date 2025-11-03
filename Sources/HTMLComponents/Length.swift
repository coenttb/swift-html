//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Foundation
import HTML

extension Length {
  public static let zero: Self = 0.rem
  public static let extraSmall: Self = 0.5.rem
  public static let small: Self = 1.rem
  public static let medium: Self = 2.rem
  public static let large: Self = 4.rem
  public static let extraLarge: Self = 8.rem
}

extension Length {
  public static let root: Self = 1.rem
  public static let primary: Self = root
  public static let secondary: Self = 0.875.rem

  public static let largeTitle = 3.0.rem
  public static let title = 2.5.rem
  public static let title2 = 2.2.rem
  public static let title3 = 2.0.rem
  public static let headline = 1.2.rem
  public static let body = 1.rem
  public static let callout = 0.95.rem
  public static let subheadline = 0.9.rem
  public static let footnote = 0.875.rem
  public static let caption = 0.75.rem
  public static let caption2 = 0.7.rem
}

extension LengthPercentage {
  public static let extraSmall: Self = .rem(0.5)
  public static let small: Self = .rem(0.75)
  public static let medium: Self = .rem(1.5)
  public static let large: Self = .rem(3)
  public static let extraLarge: Self = .rem(6)

  public static let root: Self = .rem(1)
  public static let primary: Self = root
  public static let secondary: Self = .rem(0.875)
}

extension LengthPercentageConvertible {
  public static var extraSmall: Self {
    .lengthPercentage(.extraSmall)
  }
  public static var small: Self {
    .lengthPercentage(.small)
  }
  public static var medium: Self {
    .lengthPercentage(.medium)
  }
  public static var large: Self {
    .lengthPercentage(.large)
  }
  public static var extraLarge: Self {
    .lengthPercentage(.extraLarge)
  }

  public static var root: Self {
    .lengthPercentage(.root)
  }
  public static var primary: Self {
    .lengthPercentage(.primary)
  }
  public static var secondary: Self {
    .lengthPercentage(.secondary)
  }
}
