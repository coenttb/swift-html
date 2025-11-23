//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import HTMLCSSPointFreeHTML

public typealias Color = W3C_CSS_Color.Color.WithDarkMode.Color
public typealias HTMLColor = Color

extension W3C_CSS_Values.Color {
    public func withDarkColor(_ color: W3C_CSS_Values.Color) -> HTMLColor {
        .init(light: self, dark: color)
    }
}

extension HTMLColor {
    public func withDarkColor(_ color: W3C_CSS_Values.Color) -> HTMLColor {
        .init(light: self.light, dark: color)
    }
}

extension HTMLColor {
    public func opacity(_ alpha: Double) -> HTMLColor {
        self.map { $0.opacity(alpha) }
    }
}

extension W3C_CSS_Color.Color {
    public enum WithDarkMode: Sendable, Hashable, GlobalConvertible, ColorConvertible {

        case darkMode(W3C_CSS_Color.Color.WithDarkMode.Color)
        case global(CSS_Standard.Global)

        public struct Color: Sendable, Hashable {
            public let light: W3C_CSS_Values.Color
            public let dark: W3C_CSS_Values.Color

            public init(light: W3C_CSS_Values.Color, dark: W3C_CSS_Values.Color? = nil) {
                self.light = light
                if let dark = dark {
                    self.dark = dark
                } else {
                    self.dark = light.darker()
                }
            }
        }

        public static func color(_ color: W3C_CSS_Values.Color) -> W3C_CSS_Color.Color.WithDarkMode
        {
            return .init(color)
        }

        public static func color(_ color: W3C_CSS_Color.Color.WithDarkMode.Color) -> Self {
            return .darkMode(color)
        }
    }
}

extension W3C_CSS_Color.Color.WithDarkMode: W3C_CSS_Shared.Property {
    public static var property: String { W3C_CSS_Color.Color.property }
}

extension W3C_CSS_Color.Color.WithDarkMode {
    public init(_ color: W3C_CSS_Color.Color) {
        switch color {
        case .global(let global): self = .global(global)
        case .color(let color): self = .init(color)
        }
    }
}

extension W3C_CSS_Color.Color.WithDarkMode {
    public init(_ color: W3C_CSS_Values.Color) {
        self = .darkMode(.init(light: color))
    }
}

extension W3C_CSS_Color.Color.WithDarkMode.Color: CustomStringConvertible {
    public var description: String {
        let attribute = W3C_CSS_Color.Color.property
        return
            "@media (prefers-color-scheme: light) { \(attribute):\(light) } @media (prefers-color-scheme: dark) { \(attribute):\(dark) }"
    }
}

extension W3C_CSS_Color.Color.WithDarkMode: CustomStringConvertible {
    public var description: String {
        switch self {
        case .darkMode(let color): return color.description
        case .global(let global): return global.description
        }
    }
}

extension W3C_CSS_Color.Color.WithDarkMode.Color {
    public func map(_ transform: (W3C_CSS_Values.Color) -> W3C_CSS_Values.Color) -> Self {
        .init(
            light: transform(light),
            dark: transform(dark)
        )
    }

    public func flatMap(
        _ transform: (W3C_CSS_Values.Color) -> W3C_CSS_Color.Color.WithDarkMode.Color
    ) -> Self {
        let lightTransformed = transform(light)
        let darkTransformed = transform(dark)

        return .init(
            light: lightTransformed.light,
            dark: darkTransformed.dark
        )
    }
}

//extension W3C_CSS_Color.Color {
//    public func adjustBrightness(by percentage: Double) -> Self {
//        switch self {
//        case .color(let color): .color(color.adjustBrightness(by: percentage))
//        case .global(let global): .global(global)
//        }
//    }
//}

extension W3C_CSS_Color.Color.WithDarkMode.Color {
    public func adjustBrightness(by percentage: Double) -> Self {
        self.map { $0.adjustBrightness(by: percentage) }
    }

    public func darker(by percentage: Double = 0.2) -> Self {
        self.map { $0.darker(by: percentage) }
    }

    public func lighter(by percentage: Double = 0.2) -> Self {
        self.map { $0.lighter(by: percentage) }
    }
}

// MARK: HTML extensions

extension HTML {
    @discardableResult
    @_disfavoredOverload
    func lightAndDarkMode(
        _ property: String,
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self
            .inlineStyle(
                property,
                light.description,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
            .inlineStyle(
                property,
                dark?.description,
                media: .prefersColorScheme(.dark).and(media),
                selector: selector,
                pseudo: pseudo
            )
    }
}

// MARK: HTML extension - Color

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func color(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Color.Color.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func color(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.color(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func color(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.color(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - AccentColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func accentColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.AccentColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func accentColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.accentColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func accentColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.accentColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BackgroundColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func backgroundColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.BackgroundColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func backgroundColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.backgroundColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

// MARK: HTML extension - BorderBlockColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBlockColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderBlockColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBlockColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBlockColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBlockColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderBlockColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderBlockEndColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBlockEndColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderBlockEndColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBlockEndColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBlockEndColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBlockEndColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderBlockEndColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderBlockStartColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBlockStartColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderBlockStartColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBlockStartColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBlockStartColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBlockStartColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderBlockStartColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderBottomColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderBottomColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderBottomColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderBottomColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderBottomColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderBottomColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderBottomColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderInlineColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderInlineColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderInlineColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderInlineColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderInlineColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderInlineColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderInlineColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderInlineEndColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderInlineEndColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderInlineEndColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderInlineEndColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderInlineEndColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderInlineEndColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderInlineEndColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderInlineStartColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderInlineStartColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderInlineStartColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderInlineStartColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderInlineStartColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderInlineStartColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderInlineStartColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderLeftColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderLeftColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderLeftColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderLeftColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderLeftColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderLeftColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderLeftColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderRightColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderRightColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderRightColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderRightColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderRightColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderRightColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderRightColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - BorderTopColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func borderTopColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            W3C_CSS_Backgrounds.BorderTopColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func borderTopColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.borderTopColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func borderTopColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.borderTopColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - CaretColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func caretColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.CaretColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func caretColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.caretColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func caretColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.caretColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - ColumnRuleColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func columnRuleColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.ColumnRuleColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func columnRuleColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.columnRuleColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func columnRuleColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.columnRuleColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - FloodColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func floodColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.FloodColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func floodColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.floodColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func floodColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.floodColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}
// MARK: HTML extension - Fill

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func fill(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.Fill.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func fill(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.fill(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func fill(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.fill(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - LightingColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func lightingColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.LightingColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func lightingColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.lightingColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func lightingColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.lightingColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - OutlineColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func outlineColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.OutlineColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func outlineColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.outlineColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func outlineColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.outlineColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - StopColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func stopColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.StopColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func stopColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.stopColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func stopColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.stopColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - Stroke

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func stroke(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.Stroke.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func stroke(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.stroke(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func stroke(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.stroke(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - TextDecorationColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func textDecorationColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.TextDecorationColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func textDecorationColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.textDecorationColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func textDecorationColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.textDecorationColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}

// MARK: HTML extension - TextEmphasisColor

extension HTML {
    @discardableResult
    @_disfavoredOverload
    public func textEmphasisColor(
        light: W3C_CSS_Values.Color,
        dark: W3C_CSS_Values.Color?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        self.lightAndDarkMode(
            CSS_Standard.TextEmphasisColor.property,
            light: light,
            dark: dark,
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML {
    @discardableResult
    @HTMLBuilder
    public func textEmphasisColor(
        _ color: HTMLColor?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        if let color {
            self.textEmphasisColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            self
        }
    }
}

extension HTML {
    @discardableResult
    @_disfavoredOverload
    @HTMLBuilder
    func textEmphasisColor(
        _ color: W3C_CSS_Color.Color.WithDarkMode?,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: PointFreeHTML.Selector? = nil,
        pseudo: Pseudo? = nil
    ) -> some HTML {
        switch color {
        case .global:
            self.inlineStyle(color, media: media, selector: selector, pseudo: pseudo)
        case .darkMode(let color):
            self.textEmphasisColor(
                light: color.light,
                dark: color.dark,
                media: media,
                selector: selector,
                pseudo: pseudo
            )
        case .none:
            self
        }
    }
}
