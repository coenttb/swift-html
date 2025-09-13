//
//  Preview.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 12/09/2025.
//


#if canImport(SwiftUI)
import SwiftUI

extension HTMLColor.Theme {
    struct Preview: SwiftUI.View {
        let theme: HTMLColor.Theme
        @Environment(\.colorScheme) var colorScheme
        
        var body: some View {
            VStack(alignment: .leading, spacing: 24) {
                // Base Colors Section
                ColorSection(
                    title: "Base Colors",
                    colors: [
                        ("Gray", theme.gray),
                        ("Blue", theme.blue),
                        ("Green", theme.green),
                        ("Purple", theme.purple),
                        ("Red", theme.red),
                        ("Yellow", theme.yellow),
                        ("Orange", theme.orange),
                        ("Teal", theme.teal),
                        ("Cyan", theme.cyan),
                        ("Pink", theme.pink),
                        ("Brown", theme.brown)
                    ],
                    colorScheme: colorScheme
                )
                
                // Neutral Colors Section
                ColorSection(
                    title: "Neutral Colors",
                    colors: [
                        ("Black", theme.black),
                        ("Off Black", theme.offBlack),
                        ("White", theme.white),
                        ("Off White", theme.offWhite),
                        ("Neutral", theme.neutral),
                        ("Info", theme.info)
                    ],
                    colorScheme: colorScheme
                )
                
                // Text Colors Section
                ColorSection(
                    title: "Text Colors",
                    colors: [
                        ("Primary", theme.text.primary),
                        ("Secondary", theme.text.secondary),
                        ("Tertiary", theme.text.tertiary),
                        ("Link", theme.text.link),
                        ("Link Hover", theme.text.linkHover),
                        ("Button", theme.text.button),
                        ("Error", theme.text.error),
                        ("Success", theme.text.success),
                        ("Warning", theme.text.warning),
                        ("Info", theme.text.info),
                        ("Neutral", theme.text.neutral),
                        ("Inverted", theme.text.inverted),
                        ("Disabled", theme.text.disabled)
                    ],
                    colorScheme: colorScheme
                )
                
                // Background Colors Section
                ColorSection(
                    title: "Background Colors",
                    colors: [
                        ("Primary", theme.background.primary),
                        ("Secondary", theme.background.secondary),
                        ("Tertiary", theme.background.tertiary),
                        ("Elevated", theme.background.elevated),
                        ("Grouped", theme.background.grouped),
                        ("Selected", theme.background.selected),
                        ("Highlighted", theme.background.highlighted),
                        ("Button", theme.background.button),
                        ("Button Hover", theme.background.buttonHover),
                        ("Error", theme.background.error),
                        ("Error Muted", theme.background.errorMuted),
                        ("Success", theme.background.success),
                        ("Success Muted", theme.background.successMuted),
                        ("Warning", theme.background.warning),
                        ("Warning Muted", theme.background.warningMuted),
                        ("Info", theme.background.info),
                        ("Info Muted", theme.background.infoMuted),
                        ("Neutral", theme.background.neutral)
                    ],
                    colorScheme: colorScheme
                )
                
                // Border Colors Section
                ColorSection(
                    title: "Border Colors",
                    colors: [
                        ("Primary", theme.border.primary),
                        ("Secondary", theme.border.secondary),
                        ("Tertiary", theme.border.tertiary),
                        ("Selected", theme.border.selected),
                        ("Highlighted", theme.border.highlighted),
                        ("Hover", theme.border.hover),
                        ("Button", theme.border.button),
                        ("Error", theme.border.error),
                        ("Success", theme.border.success),
                        ("Warning", theme.border.warning),
                        ("Info", theme.border.info),
                        ("Info Muted", theme.border.infoMuted),
                        ("Neutral", theme.border.neutral)
                    ],
                    colorScheme: colorScheme
                )
                
                // Branding Colors Section
                ColorSection(
                    title: "Branding Colors",
                    colors: [
                        ("Primary", theme.branding.primary),
                        ("Secondary", theme.branding.secondary),
                        ("Accent", theme.branding.accent),
                        ("Primary Subtle", theme.branding.primarySubtle),
                        ("Secondary Subtle", theme.branding.secondarySubtle)
                    ],
                    colorScheme: colorScheme
                )
            }
            .padding()
            //            .background(SwiftUI.Color(.systemBackground))
        }
    }
}

extension HTMLColor {
    /// Converts HTMLColor to SwiftUI.Color
    func toSwiftUIColor(for colorScheme: SwiftUI.ColorScheme) -> SwiftUI.Color {
        let cssColor = colorScheme == .light ? self.light : self.dark
        
        // Parse the CSS color and convert to SwiftUI.Color
        switch cssColor {
        case .hex(let hexString):
            return SwiftUI.Color(hex: "\(hexString)")
        case .rgb(let red, let green, let blue):
            return SwiftUI.Color(
                red: Double(red) / 255.0,
                green: Double(green) / 255.0,
                blue: Double(blue) / 255.0
            )
        case .rgba(let red, let green, let blue, let alpha):
            return SwiftUI.Color(
                red: Double(red) / 255.0,
                green: Double(green) / 255.0,
                blue: Double(blue) / 255.0,
                opacity: alpha
            )
        case .transparent:
            return SwiftUI.Color.clear
        default:
            // Fallback for other color types
            return SwiftUI.Color.gray
        }
    }
}

extension SwiftUI.Color {
    /// Initialize from hex string
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

/// A section displaying a group of colors
struct ColorSection: View {
    let title: String
    let colors: [(name: String, color: HTMLColor)]
    let colorScheme: SwiftUI.ColorScheme
    
    private let columns = [
        GridItem(.adaptive(minimum: 120, maximum: 150), spacing: 12)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(colors, id: \.name) { item in
                    ColorSwatch(
                        name: item.name,
                        htmlColor: item.color,
                        colorScheme: colorScheme
                    )
                }
            }
        }
    }
}

/// Individual color swatch showing the color and its name
struct ColorSwatch: View {
    let name: String
    let htmlColor: HTMLColor
    let colorScheme: SwiftUI.ColorScheme
    @State private var isHovering = false
    
    var swiftUIColor: SwiftUI.Color {
        htmlColor.toSwiftUIColor(for: colorScheme)
    }
    
    var hexValue: String {
        let cssColor = colorScheme == .light ? htmlColor.light : htmlColor.dark
        switch cssColor {
        case .hex(let value):
            return "#\(value)"
        case .rgb(let r, let g, let b):
            return String(format: "#%02X%02X%02X", Int(r), Int(g), Int(b))
        case .rgba(let r, let g, let b, let a):
            return String(format: "#%02X%02X%02X%02X", Int(r), Int(g), Int(b), Int(a * 255))
        default:
            return cssColor.description
        }
    }
    
    var body: some View {
        VStack(spacing: 6) {
            RoundedRectangle(cornerRadius: 8)
                .fill(swiftUIColor)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.primary.opacity(0.2), lineWidth: 1)
                )
                .overlay(
                    Text(isHovering ? hexValue : "")
                        .font(.caption.monospaced())
                        .foregroundColor(
                            // Determine text color based on background brightness
                            isLightColor(swiftUIColor) ? .black : .white
                        )
                        .padding(4)
                        .background(
                            isHovering ?
                            Color.black.opacity(isLightColor(swiftUIColor) ? 0.1 : 0.3) :
                                    .clear
                        )
                        .cornerRadius(4)
                        .opacity(isHovering ? 1 : 0)
                        .animation(.easeInOut(duration: 0.2), value: isHovering)
                )
                .onHover { hovering in
                    isHovering = hovering
                }
            
            Text(name)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
        }
    }
    
    /// Determine if a color is light or dark for text contrast
    func isLightColor(_ color: SwiftUI.Color) -> Bool {
        // This is a simplified brightness calculation
        // In production, you'd want to extract RGB values properly
        return colorScheme == .light &&
        (htmlColor.light.description.contains("fff") ||
         htmlColor.light.description.contains("white"))
    }
}

#Preview("Default Theme") {
    ScrollView {
        HStack(spacing: nil) {
            HTMLColor.Theme.Preview(theme: .default)
            HTMLColor.Theme.Preview(theme: .apple)
            HTMLColor.Theme.Preview(theme: .swift)
            HTMLColor.Theme.Preview(theme: .github)
        }
    }
    .frame(height: 600)
}

#endif
