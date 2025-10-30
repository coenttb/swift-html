//
//  Color.Theme.zinc.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
  public static var zinc: Self {
    .init(
      gray: .init(light: .hex("71717a"), dark: .hex("a1a1aa")),
      blue: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
      green: .init(light: .hex("10b981"), dark: .hex("34d399")),
      purple: .init(light: .hex("8b5cf6"), dark: .hex("a78bfa")),
      red: .init(light: .hex("ef4444"), dark: .hex("f87171")),
      yellow: .init(light: .hex("eab308"), dark: .hex("facc15")),
      orange: .init(light: .hex("f97316"), dark: .hex("fb923c")),
      teal: .init(light: .hex("14b8a6"), dark: .hex("2dd4bf")),
      cyan: .init(light: .hex("06b6d4"), dark: .hex("22d3ee")),
      pink: .init(light: .hex("ec4899"), dark: .hex("f472b6")),
      brown: .init(light: .hex("92400e"), dark: .hex("d97706")),
      black: .init(light: .hex("09090b"), dark: .hex("09090b")),
      offBlack: .init(light: .hex("18181b"), dark: .hex("18181b")),
      white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
      offWhite: .init(light: .hex("fafafa"), dark: .hex("fafafa")),
      neutral: .init(light: .hex("71717a"), dark: .hex("a1a1aa")),
      info: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
      text: .zinc,
      background: .zinc,
      border: .zinc,
      branding: .zinc
    )
  }
}

extension HTMLColor.Theme.Text {
  static var zinc: Self {
    .init(
      primary: .init(light: .hex("09090b"), dark: .hex("fafafa")),
      secondary: .init(light: .hex("52525b"), dark: .hex("d4d4d8")),
      tertiary: .init(light: .hex("a1a1aa"), dark: .hex("71717a")),
      link: .init(light: .hex("2563eb"), dark: .hex("60a5fa")),
      linkHover: .init(light: .hex("2563eb").opacity(0.8), dark: .hex("60a5fa").opacity(0.8)),
      button: .init(light: .hex("ffffff"), dark: .hex("09090b")),
      error: .init(light: .hex("dc2626"), dark: .hex("ef4444")),
      success: .init(light: .hex("16a34a"), dark: .hex("22c55e")),
      warning: .init(light: .hex("ca8a04"), dark: .hex("eab308")),
      info: .init(light: .hex("2563eb"), dark: .hex("60a5fa")),
      neutral: .init(light: .hex("52525b"), dark: .hex("d4d4d8")),
      inverted: .init(light: .hex("fafafa"), dark: .hex("09090b")),
      disabled: .init(light: .hex("d4d4d8"), dark: .hex("52525b"))
    )
  }
}

extension HTMLColor.Theme.Background {
  public static var zinc: Self {
    .init(
      primary: .init(light: .hex("ffffff"), dark: .hex("09090b")),
      secondary: .init(light: .hex("f4f4f5"), dark: .hex("18181b")),
      tertiary: .init(light: .hex("e4e4e7"), dark: .hex("27272a")),
      elevated: .init(light: .hex("ffffff"), dark: .hex("27272a")),
      grouped: .init(light: .hex("fafafa"), dark: .hex("18181b")),
      selected: .init(light: .hex("d4d4d8"), dark: .hex("3f3f46")),
      highlighted: .init(light: .hex("e4e4e7").opacity(0.8), dark: .hex("52525b").opacity(0.5)),
      button: .init(light: .hex("f4f4f5"), dark: .hex("27272a")),
      buttonHover: .init(light: .hex("e4e4e7"), dark: .hex("3f3f46")),
      error: .init(light: .hex("fee2e2"), dark: .hex("450a0a")),
      errorMuted: .init(light: .hex("fee2e2").opacity(0.5), dark: .hex("450a0a").opacity(0.5)),
      success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
      successMuted: .init(light: .hex("dcfce7").opacity(0.5), dark: .hex("14532d").opacity(0.5)),
      warning: .init(light: .hex("fef3c7"), dark: .hex("451a03")),
      warningMuted: .init(light: .hex("fef3c7").opacity(0.5), dark: .hex("451a03").opacity(0.5)),
      info: .init(light: .hex("dbeafe"), dark: .hex("1e3a8a")),
      infoMuted: .init(light: .hex("dbeafe").opacity(0.5), dark: .hex("1e3a8a").opacity(0.5)),
      neutral: .init(light: .hex("f4f4f5"), dark: .hex("18181b"))
    )
  }
}

extension HTMLColor.Theme.Border {
  public static var zinc: Self {
    .init(
      primary: .init(light: .hex("ffffff"), dark: .hex("09090b")),
      secondary: .init(light: .hex("f4f4f5"), dark: .hex("18181b")),
      tertiary: .init(light: .hex("e4e4e7"), dark: .hex("27272a")),
      selected: .init(light: .hex("d4d4d8"), dark: .hex("3f3f46")),
      highlighted: .init(light: .hex("e4e4e7").opacity(0.8), dark: .hex("52525b").opacity(0.5)),
      hover: .init(light: .hex("d4d4d8").opacity(0.8), dark: .hex("3f3f46").opacity(0.8)),
      button: .init(light: .hex("f4f4f5"), dark: .hex("27272a")),
      error: .init(light: .hex("fee2e2"), dark: .hex("450a0a")),
      success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
      warning: .init(light: .hex("fef3c7"), dark: .hex("451a03")),
      info: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
      infoMuted: .init(light: .hex("3b82f6").opacity(0.5), dark: .hex("60a5fa").opacity(0.5)),
      neutral: .init(light: .hex("f4f4f5"), dark: .hex("18181b"))
    )
  }
}

extension HTMLColor.Theme.Branding {
  public static var zinc: Self {
    .init(
      primary: .init(light: .hex("18181b"), dark: .hex("fafafa")),
      secondary: .init(light: .hex("3f3f46"), dark: .hex("d4d4d8")),
      accent: .init(light: .hex("ef4444"), dark: .hex("f87171")),
      primarySubtle: .init(light: .hex("18181b").opacity(0.1), dark: .hex("fafafa").opacity(0.1)),
      secondarySubtle: .init(light: .hex("3f3f46").opacity(0.1), dark: .hex("d4d4d8").opacity(0.1))
    )
  }
}
