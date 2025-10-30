//
//  Theme.Stylesheet.swift
//  swift-html
//
//  Generates CSS stylesheet from HTMLColor.Theme
//

import Foundation

extension HTMLColor.Theme {
  /// Generates a CSS stylesheet with all theme colors as CSS custom properties
  public var stylesheet: StyleSheet {
    HTMLColor.Theme.StyleSheet(theme: self)
  }
}

extension HTMLColor.Theme.StyleSheet {
  public func write(to directory: String, name: String = "theme") throws {

    try FileManager.default.createDirectory(
      atPath: directory, withIntermediateDirectories: true, attributes: nil)

    try self.description.write(toFile: directory + "\(name).css", atomically: true, encoding: .utf8)
  }
}

extension HTMLColor.Theme {
  public struct StyleSheet: CustomStringConvertible {
    let theme: HTMLColor.Theme

    public var description: String {
      """
      /* Generated Theme Stylesheet */
      :root {
          /* Base Colors */
          --color-gray: \(theme.gray.light.description);
          --color-blue: \(theme.blue.light.description);
          --color-green: \(theme.green.light.description);
          --color-purple: \(theme.purple.light.description);
          --color-red: \(theme.red.light.description);
          --color-yellow: \(theme.yellow.light.description);
          --color-orange: \(theme.orange.light.description);
          --color-teal: \(theme.teal.light.description);
          --color-cyan: \(theme.cyan.light.description);
          --color-pink: \(theme.pink.light.description);
          --color-brown: \(theme.brown.light.description);
          --color-black: \(theme.black.light.description);
          --color-off-black: \(theme.offBlack.light.description);
          --color-white: \(theme.white.light.description);
          --color-off-white: \(theme.offWhite.light.description);
          
          /* Text Colors */
          --text-primary: \(theme.text.primary.light.description);
          --text-secondary: \(theme.text.secondary.light.description);
          --text-tertiary: \(theme.text.tertiary.light.description);
          --text-link: \(theme.text.link.light.description);
          --text-button: \(theme.text.button.light.description);
          --text-error: \(theme.text.error.light.description);
          --text-success: \(theme.text.success.light.description);
          --text-warning: \(theme.text.warning.light.description);
          --text-disabled: \(theme.text.disabled.light.description);
          
          /* Background Colors */
          --background-primary: \(theme.background.primary.light.description);
          --background-secondary: \(theme.background.secondary.light.description);
          --background-tertiary: \(theme.background.tertiary.light.description);
          --background-elevated: \(theme.background.elevated.light.description);
          --background-grouped: \(theme.background.grouped.light.description);
          --background-selected: \(theme.background.selected.light.description);
          --background-highlighted: \(theme.background.highlighted.light.description);
          --background-button: \(theme.background.button.light.description);
          --background-error: \(theme.background.error.light.description);
          --background-success: \(theme.background.success.light.description);
          --background-warning: \(theme.background.warning.light.description);
          --background-info: \(theme.background.info.light.description);
          
          /* Border Colors */
          --border-primary: \(theme.border.primary.light.description);
          --border-secondary: \(theme.border.secondary.light.description);
          --border-tertiary: \(theme.border.tertiary.light.description);
          --border-selected: \(theme.border.selected.light.description);
          --border-highlighted: \(theme.border.highlighted.light.description);
          --border-button: \(theme.border.button.light.description);
          --border-error: \(theme.border.error.light.description);
          --border-success: \(theme.border.success.light.description);
          --border-warning: \(theme.border.warning.light.description);
          --border-info: \(theme.border.info.light.description);
          
          /* Branding Colors */
          --branding-primary: \(theme.branding.primary.light.description);
          --branding-secondary: \(theme.branding.secondary.light.description);
          --branding-accent: \(theme.branding.accent.light.description);
          --branding-primary-subtle: \(theme.branding.primarySubtle.light.description);
          --branding-secondary-subtle: \(theme.branding.secondarySubtle.light.description);
          
          /* Translucent variants for charts and overlays */
          --color-gray-translucent: \(theme.gray.light.description)33;
          --color-blue-translucent: \(theme.blue.light.description)33;
          --color-green-translucent: \(theme.green.light.description)33;
          --color-purple-translucent: \(theme.purple.light.description)33;
          --color-red-translucent: \(theme.red.light.description)33;
          --color-yellow-translucent: \(theme.yellow.light.description)33;
          --color-orange-translucent: \(theme.orange.light.description)33;
          --color-teal-translucent: \(theme.teal.light.description)33;
          --color-cyan-translucent: \(theme.cyan.light.description)33;
          --color-pink-translucent: \(theme.pink.light.description)33;
          --color-brown-translucent: \(theme.brown.light.description)33;
          --color-black-translucent: \(theme.black.light.description)33;
          --color-off-black-translucent: \(theme.offBlack.light.description)33;
          --color-white-translucent: \(theme.white.light.description)33;
          --color-off-white-translucent: \(theme.offWhite.light.description)33;
      }

      @media (prefers-color-scheme: dark) {
          :root {
              /* Base Colors */
              --color-gray: \(theme.gray.dark.description);
              --color-blue: \(theme.blue.dark.description);
              --color-green: \(theme.green.dark.description);
              --color-purple: \(theme.purple.dark.description);
              --color-red: \(theme.red.dark.description);
              --color-yellow: \(theme.yellow.dark.description);
              --color-orange: \(theme.orange.dark.description);
              --color-teal: \(theme.teal.dark.description);
              --color-cyan: \(theme.cyan.dark.description);
              --color-pink: \(theme.pink.dark.description);
              --color-brown: \(theme.brown.dark.description);
              --color-black: \(theme.black.dark.description);
              --color-off-black: \(theme.offBlack.dark.description);
              --color-white: \(theme.white.dark.description);
              --color-off-white: \(theme.offWhite.dark.description);
              
              /* Text Colors */
              --text-primary: \(theme.text.primary.dark.description);
              --text-secondary: \(theme.text.secondary.dark.description);
              --text-tertiary: \(theme.text.tertiary.dark.description);
              --text-link: \(theme.text.link.dark.description);
              --text-button: \(theme.text.button.dark.description);
              --text-error: \(theme.text.error.dark.description);
              --text-success: \(theme.text.success.dark.description);
              --text-warning: \(theme.text.warning.dark.description);
              --text-disabled: \(theme.text.disabled.dark.description);
              
              /* Background Colors */
              --background-primary: \(theme.background.primary.dark.description);
              --background-secondary: \(theme.background.secondary.dark.description);
              --background-tertiary: \(theme.background.tertiary.dark.description);
              --background-elevated: \(theme.background.elevated.dark.description);
              --background-grouped: \(theme.background.grouped.dark.description);
              --background-selected: \(theme.background.selected.dark.description);
              --background-highlighted: \(theme.background.highlighted.dark.description);
              --background-button: \(theme.background.button.dark.description);
              --background-error: \(theme.background.error.dark.description);
              --background-success: \(theme.background.success.dark.description);
              --background-warning: \(theme.background.warning.dark.description);
              --background-info: \(theme.background.info.dark.description);
              
              /* Border Colors */
              --border-primary: \(theme.border.primary.dark.description);
              --border-secondary: \(theme.border.secondary.dark.description);
              --border-tertiary: \(theme.border.tertiary.dark.description);
              --border-selected: \(theme.border.selected.dark.description);
              --border-highlighted: \(theme.border.highlighted.dark.description);
              --border-button: \(theme.border.button.dark.description);
              --border-error: \(theme.border.error.dark.description);
              --border-success: \(theme.border.success.dark.description);
              --border-warning: \(theme.border.warning.dark.description);
              --border-info: \(theme.border.info.dark.description);
              
              /* Branding Colors */
              --branding-primary: \(theme.branding.primary.dark.description);
              --branding-secondary: \(theme.branding.secondary.dark.description);
              --branding-accent: \(theme.branding.accent.dark.description);
              --branding-primary-subtle: \(theme.branding.primarySubtle.dark.description);
              --branding-secondary-subtle: \(theme.branding.secondarySubtle.dark.description);
              
              /* Translucent variants for charts and overlays */
              --color-gray-translucent: \(theme.gray.dark.description)33;
              --color-blue-translucent: \(theme.blue.dark.description)33;
              --color-green-translucent: \(theme.green.dark.description)33;
              --color-purple-translucent: \(theme.purple.dark.description)33;
              --color-red-translucent: \(theme.red.dark.description)33;
              --color-yellow-translucent: \(theme.yellow.dark.description)33;
              --color-orange-translucent: \(theme.orange.dark.description)33;
              --color-teal-translucent: \(theme.teal.dark.description)33;
              --color-cyan-translucent: \(theme.cyan.dark.description)33;
              --color-pink-translucent: \(theme.pink.dark.description)33;
              --color-brown-translucent: \(theme.brown.dark.description)33;
              --color-black-translucent: \(theme.black.dark.description)33;
              --color-off-black-translucent: \(theme.offBlack.dark.description)33;
              --color-white-translucent: \(theme.white.dark.description)33;
              --color-off-white-translucent: \(theme.offWhite.dark.description)33;
          }
      }

      /* Utility classes using CSS variables */
      .text-primary { color: var(--text-primary); }
      .text-secondary { color: var(--text-secondary); }
      .text-tertiary { color: var(--text-tertiary); }
      .text-link { color: var(--text-link); }
      .text-error { color: var(--text-error); }
      .text-success { color: var(--text-success); }
      .text-warning { color: var(--text-warning); }

      .bg-primary { background-color: var(--background-primary); }
      .bg-secondary { background-color: var(--background-secondary); }
      .bg-tertiary { background-color: var(--background-tertiary); }
      .bg-elevated { background-color: var(--background-elevated); }
      .bg-error { background-color: var(--background-error); }
      .bg-success { background-color: var(--background-success); }
      .bg-warning { background-color: var(--background-warning); }

      .border-primary { border-color: var(--border-primary); }
      .border-secondary { border-color: var(--border-secondary); }
      .border-tertiary { border-color: var(--border-tertiary); }
      .border-error { border-color: var(--border-error); }
      .border-success { border-color: var(--border-success); }
      .border-warning { border-color: var(--border-warning); }
      """

    }
  }
}
