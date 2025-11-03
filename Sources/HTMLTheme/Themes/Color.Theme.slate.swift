//
//  Color.Theme.slate.swift
//  coenttb-html
//
//  Created by Coen ten Thije Boonkkamp on 09/08/2025.
//

import Foundation

extension HTMLColor.Theme {
  public static var slate: Self {
    .init(
      gray: .init(light: .hex("64748b"), dark: .hex("94a3b8")),
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
      black: .init(light: .hex("020617"), dark: .hex("020617")),
      offBlack: .init(light: .hex("0f172a"), dark: .hex("0f172a")),
      white: .init(light: .hex("ffffff"), dark: .hex("ffffff")),
      offWhite: .init(light: .hex("f8fafc"), dark: .hex("f8fafc")),
      neutral: .init(light: .hex("64748b"), dark: .hex("94a3b8")),
      info: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
      text: .slate,
      background: .slate,
      border: .slate,
      branding: .slate
    )
  }
}

extension HTMLColor.Theme.Text {
  static var slate: Self {
    .init(
      primary: .init(light: .hex("020617"), dark: .hex("f1f5f9")),
      secondary: .init(light: .hex("475569"), dark: .hex("cbd5e1")),
      tertiary: .init(light: .hex("94a3b8"), dark: .hex("64748b")),
      link: .init(light: .hex("2563eb"), dark: .hex("60a5fa")),
      linkHover: .init(light: .hex("2563eb").opacity(0.8), dark: .hex("60a5fa").opacity(0.8)),
      button: .init(light: .hex("ffffff"), dark: .hex("020617")),
      error: .init(light: .hex("dc2626"), dark: .hex("ef4444")),
      success: .init(light: .hex("16a34a"), dark: .hex("22c55e")),
      warning: .init(light: .hex("ca8a04"), dark: .hex("eab308")),
      info: .init(light: .hex("2563eb"), dark: .hex("60a5fa")),
      neutral: .init(light: .hex("475569"), dark: .hex("cbd5e1")),
      inverted: .init(light: .hex("f1f5f9"), dark: .hex("020617")),
      disabled: .init(light: .hex("cbd5e1"), dark: .hex("475569"))
    )
  }
}

extension HTMLColor.Theme.Background {
  public static var slate: Self {
    .init(
      primary: .init(light: .hex("ffffff"), dark: .hex("020617")),
      secondary: .init(light: .hex("f1f5f9"), dark: .hex("0f172a")),
      tertiary: .init(light: .hex("e2e8f0"), dark: .hex("1e293b")),
      elevated: .init(light: .hex("ffffff"), dark: .hex("1e293b")),
      grouped: .init(light: .hex("f8fafc"), dark: .hex("0f172a")),
      selected: .init(light: .hex("cbd5e1"), dark: .hex("334155")),
      highlighted: .init(light: .hex("e2e8f0").opacity(0.8), dark: .hex("475569").opacity(0.5)),
      button: .init(light: .hex("f1f5f9"), dark: .hex("1e293b")),
      buttonHover: .init(light: .hex("e2e8f0"), dark: .hex("334155")),
      error: .init(light: .hex("fee2e2"), dark: .hex("450a0a")),
      errorMuted: .init(light: .hex("fee2e2").opacity(0.5), dark: .hex("450a0a").opacity(0.5)),
      success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
      successMuted: .init(light: .hex("dcfce7").opacity(0.5), dark: .hex("14532d").opacity(0.5)),
      warning: .init(light: .hex("fef3c7"), dark: .hex("451a03")),
      warningMuted: .init(light: .hex("fef3c7").opacity(0.5), dark: .hex("451a03").opacity(0.5)),
      info: .init(light: .hex("dbeafe"), dark: .hex("1e3a8a")),
      infoMuted: .init(light: .hex("dbeafe").opacity(0.5), dark: .hex("1e3a8a").opacity(0.5)),
      neutral: .init(light: .hex("f1f5f9"), dark: .hex("0f172a"))
    )
  }
}

extension HTMLColor.Theme.Border {
  public static var slate: Self {
    .init(
      primary: .init(light: .hex("ffffff"), dark: .hex("020617")),
      secondary: .init(light: .hex("f1f5f9"), dark: .hex("0f172a")),
      tertiary: .init(light: .hex("e2e8f0"), dark: .hex("1e293b")),
      selected: .init(light: .hex("cbd5e1"), dark: .hex("334155")),
      highlighted: .init(light: .hex("e2e8f0").opacity(0.8), dark: .hex("475569").opacity(0.5)),
      hover: .init(light: .hex("cbd5e1").opacity(0.8), dark: .hex("334155").opacity(0.8)),
      button: .init(light: .hex("f1f5f9"), dark: .hex("1e293b")),
      error: .init(light: .hex("fee2e2"), dark: .hex("450a0a")),
      success: .init(light: .hex("dcfce7"), dark: .hex("14532d")),
      warning: .init(light: .hex("fef3c7"), dark: .hex("451a03")),
      info: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
      infoMuted: .init(light: .hex("3b82f6").opacity(0.5), dark: .hex("60a5fa").opacity(0.5)),
      neutral: .init(light: .hex("f1f5f9"), dark: .hex("0f172a"))
    )
  }
}

extension HTMLColor.Theme.Branding {
  public static var slate: Self {
    .init(
      primary: .init(light: .hex("3b82f6"), dark: .hex("60a5fa")),
      secondary: .init(light: .hex("8b5cf6"), dark: .hex("a78bfa")),
      accent: .init(light: .hex("f97316"), dark: .hex("fb923c")),
      primarySubtle: .init(light: .hex("3b82f6").opacity(0.1), dark: .hex("60a5fa").opacity(0.2)),
      secondarySubtle: .init(light: .hex("8b5cf6").opacity(0.1), dark: .hex("a78bfa").opacity(0.2))
    )
  }
}
