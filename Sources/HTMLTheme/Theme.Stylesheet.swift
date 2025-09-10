//
//  Theme.Stylesheet.swift
//  swift-html
//
//  Generates CSS stylesheet from HTMLColor.Theme
//

import Foundation

extension HTMLColor.Theme {
    /// Generates a CSS stylesheet with all theme colors as CSS custom properties
    public var stylesheet: String {
        """
        /* Generated Theme Stylesheet */
        :root {
            /* Base Colors */
            --color-gray: \(gray.light.description);
            --color-blue: \(blue.light.description);
            --color-green: \(green.light.description);
            --color-purple: \(purple.light.description);
            --color-red: \(red.light.description);
            --color-yellow: \(yellow.light.description);
            --color-orange: \(orange.light.description);
            --color-teal: \(teal.light.description);
            --color-cyan: \(cyan.light.description);
            --color-pink: \(pink.light.description);
            --color-brown: \(brown.light.description);
            --color-black: \(black.light.description);
            --color-off-black: \(offBlack.light.description);
            --color-white: \(white.light.description);
            --color-off-white: \(offWhite.light.description);
            
            /* Text Colors */
            --text-primary: \(text.primary.light.description);
            --text-secondary: \(text.secondary.light.description);
            --text-tertiary: \(text.tertiary.light.description);
            --text-link: \(text.link.light.description);
            --text-button: \(text.button.light.description);
            --text-error: \(text.error.light.description);
            --text-success: \(text.success.light.description);
            --text-warning: \(text.warning.light.description);
            --text-disabled: \(text.disabled.light.description);
            
            /* Background Colors */
            --background-primary: \(background.primary.light.description);
            --background-secondary: \(background.secondary.light.description);
            --background-tertiary: \(background.tertiary.light.description);
            --background-elevated: \(background.elevated.light.description);
            --background-grouped: \(background.grouped.light.description);
            --background-selected: \(background.selected.light.description);
            --background-highlighted: \(background.highlighted.light.description);
            --background-button: \(background.button.light.description);
            --background-error: \(background.error.light.description);
            --background-success: \(background.success.light.description);
            --background-warning: \(background.warning.light.description);
            --background-info: \(background.info.light.description);
            
            /* Border Colors */
            --border-primary: \(border.primary.light.description);
            --border-secondary: \(border.secondary.light.description);
            --border-tertiary: \(border.tertiary.light.description);
            --border-selected: \(border.selected.light.description);
            --border-highlighted: \(border.highlighted.light.description);
            --border-button: \(border.button.light.description);
            --border-error: \(border.error.light.description);
            --border-success: \(border.success.light.description);
            --border-warning: \(border.warning.light.description);
            --border-info: \(border.info.light.description);
            
            /* Branding Colors */
            --branding-primary: \(branding.primary.light.description);
            --branding-secondary: \(branding.secondary.light.description);
            --branding-accent: \(branding.accent.light.description);
            --branding-primary-subtle: \(branding.primarySubtle.light.description);
            --branding-secondary-subtle: \(branding.secondarySubtle.light.description);
            
            /* Translucent variants for charts and overlays */
            --color-gray-translucent: \(gray.light.description)33;
            --color-blue-translucent: \(blue.light.description)33;
            --color-green-translucent: \(green.light.description)33;
            --color-purple-translucent: \(purple.light.description)33;
            --color-red-translucent: \(red.light.description)33;
            --color-yellow-translucent: \(yellow.light.description)33;
            --color-orange-translucent: \(orange.light.description)33;
            --color-teal-translucent: \(teal.light.description)33;
            --color-cyan-translucent: \(cyan.light.description)33;
            --color-pink-translucent: \(pink.light.description)33;
            --color-brown-translucent: \(brown.light.description)33;
            --color-black-translucent: \(black.light.description)33;
            --color-off-black-translucent: \(offBlack.light.description)33;
            --color-white-translucent: \(white.light.description)33;
            --color-off-white-translucent: \(offWhite.light.description)33;
        }
        
        @media (prefers-color-scheme: dark) {
            :root {
                /* Base Colors */
                --color-gray: \(gray.dark.description);
                --color-blue: \(blue.dark.description);
                --color-green: \(green.dark.description);
                --color-purple: \(purple.dark.description);
                --color-red: \(red.dark.description);
                --color-yellow: \(yellow.dark.description);
                --color-orange: \(orange.dark.description);
                --color-teal: \(teal.dark.description);
                --color-cyan: \(cyan.dark.description);
                --color-pink: \(pink.dark.description);
                --color-brown: \(brown.dark.description);
                --color-black: \(black.dark.description);
                --color-off-black: \(offBlack.dark.description);
                --color-white: \(white.dark.description);
                --color-off-white: \(offWhite.dark.description);
                
                /* Text Colors */
                --text-primary: \(text.primary.dark.description);
                --text-secondary: \(text.secondary.dark.description);
                --text-tertiary: \(text.tertiary.dark.description);
                --text-link: \(text.link.dark.description);
                --text-button: \(text.button.dark.description);
                --text-error: \(text.error.dark.description);
                --text-success: \(text.success.dark.description);
                --text-warning: \(text.warning.dark.description);
                --text-disabled: \(text.disabled.dark.description);
                
                /* Background Colors */
                --background-primary: \(background.primary.dark.description);
                --background-secondary: \(background.secondary.dark.description);
                --background-tertiary: \(background.tertiary.dark.description);
                --background-elevated: \(background.elevated.dark.description);
                --background-grouped: \(background.grouped.dark.description);
                --background-selected: \(background.selected.dark.description);
                --background-highlighted: \(background.highlighted.dark.description);
                --background-button: \(background.button.dark.description);
                --background-error: \(background.error.dark.description);
                --background-success: \(background.success.dark.description);
                --background-warning: \(background.warning.dark.description);
                --background-info: \(background.info.dark.description);
                
                /* Border Colors */
                --border-primary: \(border.primary.dark.description);
                --border-secondary: \(border.secondary.dark.description);
                --border-tertiary: \(border.tertiary.dark.description);
                --border-selected: \(border.selected.dark.description);
                --border-highlighted: \(border.highlighted.dark.description);
                --border-button: \(border.button.dark.description);
                --border-error: \(border.error.dark.description);
                --border-success: \(border.success.dark.description);
                --border-warning: \(border.warning.dark.description);
                --border-info: \(border.info.dark.description);
                
                /* Branding Colors */
                --branding-primary: \(branding.primary.dark.description);
                --branding-secondary: \(branding.secondary.dark.description);
                --branding-accent: \(branding.accent.dark.description);
                --branding-primary-subtle: \(branding.primarySubtle.dark.description);
                --branding-secondary-subtle: \(branding.secondarySubtle.dark.description);
                
                /* Translucent variants for charts and overlays */
                --color-gray-translucent: \(gray.dark.description)33;
                --color-blue-translucent: \(blue.dark.description)33;
                --color-green-translucent: \(green.dark.description)33;
                --color-purple-translucent: \(purple.dark.description)33;
                --color-red-translucent: \(red.dark.description)33;
                --color-yellow-translucent: \(yellow.dark.description)33;
                --color-orange-translucent: \(orange.dark.description)33;
                --color-teal-translucent: \(teal.dark.description)33;
                --color-cyan-translucent: \(cyan.dark.description)33;
                --color-pink-translucent: \(pink.dark.description)33;
                --color-brown-translucent: \(brown.dark.description)33;
                --color-black-translucent: \(black.dark.description)33;
                --color-off-black-translucent: \(offBlack.dark.description)33;
                --color-white-translucent: \(white.dark.description)33;
                --color-off-white-translucent: \(offWhite.dark.description)33;
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