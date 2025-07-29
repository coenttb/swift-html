# swift-html

<p align="center">
  <img src="https://img.shields.io/badge/Swift-6.0-orange.svg" alt="Swift 6.0">
  <img src="https://img.shields.io/badge/Platforms-macOS%20|%20iOS%20|%20tvOS%20|%20watchOS%20|%20Linux-lightgray.svg" alt="Platforms">
  <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License">
  <img src="https://img.shields.io/badge/Release-0.0.1-green.svg" alt="Release">
</p>

<p align="center">
  <strong>Type-safe HTML and CSS generation in Swift</strong><br>
  Build websites, email templates, and server-side rendered pages with the full power of Swift's type system
</p>

## Overview

**swift-html** is your entry point into a comprehensive ecosystem for type-safe web development in Swift. It combines the power of strongly-typed HTML elements, compile-time validated CSS properties, and an efficient rendering engine to help you build web content with confidence.

```swift
import HTML

// Type-safe HTML with SwiftUI-like syntax
let page = HTMLDocument {
    div {
        h1 { "Welcome to swift-html" }
            .color(.red)
            .fontSize(.rem(2.5))
        
        p { "Build beautiful, type-safe web pages with Swift" }
            .color(light: .gray800, dark: .gray200)
            .lineHeight(1.6)
        
        a(href: "https://github.com/coenttb/swift-html") {
            "Get Started →"
        }
        .padding(.rem(1))
        .backgroundColor(.yellow)
        .color(.white)
        .borderRadius(.px(8))
        .textDecoration(TextDecoration.none)
    }
    .padding(.rem(2))
    .maxWidth(.px(800))
    .margin(.auto)
} head: {
    title { "swift-html - Type-safe HTML in Swift" }
    meta(charset: .utf8)()
    meta(name: .viewport, content: "width=device-width, initial-scale=1")()
}

// Render to string
let bytes: ContiguousArray<UInt8> = element.render() // highly optimized
let string: String = try String(page) // render HTML as String
```

## Why swift-html?

### 🛡️ Type Safety First
- **Compile-time validation**: Catch HTML and CSS errors before runtime
- **Impossible invalid states**: Can't put a `href` on a `div` or use `px` for `color`
- **IDE support**: Full autocomplete, inline documentation, and refactoring

### 🎨 Modern CSS Support
- **Type-safe properties**: Every CSS property is strongly typed
- **Dark mode built-in**: First-class support for light/dark color schemes
- **Responsive helpers**: Media queries and container queries with type safety

### ⚡ Performance
- **Zero runtime overhead**: All validation happens at compile time
- **Efficient rendering**: Direct byte-level rendering for server applications
- **Minimal dependencies**: Lightweight and focused

### 🧩 Composable Architecture
- **SwiftUI-like syntax**: Familiar patterns for Swift developers
- **Reusable components**: Build once, use everywhere
- **Modular design**: Use only what you need

## Quick Start

### Installation

Add swift-html to your Swift package:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html", from: "0.0.1")
]
```

For Xcode projects, add the package URL: `https://github.com/coenttb/swift-html`

### Your First Page

```swift
import HTML

struct WelcomePage: HTMLDocument {
    var head: some HTML {
        title { "Welcome" }
        meta(charset: .utf8)()
    }
    
    var body: some HTML {
        h1 { "Hello, World!" }
            .textAlign(.center)
            .color(.blue)
    }
}

// Render it
let page = WelcomePage().render()
let html = try String(page)
```

### SwiftUI Preview Support

Preview your HTML in Xcode while developing:

```swift
#if canImport(SwiftUI)
import SwiftUI

#Preview {
    HTMLDocument {
        div {
            h1 { "Live Preview" }
                .color(.blue)
            p { "Edit and see changes instantly!" }
        }
        .padding(.rem(2))
    }
}
#endif
```

## Core Concepts

### 🏗️ HTML Elements

Every HTML element is a strongly-typed Swift type:

```swift
// Type-safe elements
h1 { "Title" }
p { "Paragraph" }
a(href: "/about") { "About" }
img(src: "/logo.png", alt: "Logo")

// Impossible to write invalid HTML
// div(href: "/") { } // ❌ Compile error: 'href' is not valid for div
```

### 🎨 CSS Styling

Apply styles with type-safe modifiers:

```swift
div { "Styled content" }
    .padding(.rem(2))                    // Type-safe units
    .backgroundColor(.systemBackground)   // Semantic colors
    .borderRadius(.px(8))                // Multiple unit types
    .boxShadow(                          // Complex properties
        x: .px(0),
        y: .px(2),
        blur: .px(4),
        color: .rgba(0, 0, 0, 0.1)
    )
```

### 🌓 Dark Mode Support

First-class support for color schemes:

```swift
p { "Adaptive text" }
    .color(light: .gray900, dark: .gray100)
    .backgroundColor(light: .white, dark: .gray900)
```

or use the convenient `Color` from `swift-html`:
```swift
extension Color {
    static let lightBackground: Self = .init(light: .white, dark: .gray900)
}

p { "Adaptive text" }
    .backgroundColor(.lightBackground)
```

### ♻️ Reusable Components

Build components that compose:

```swift
struct Button: HTML {
    let title: String
    let action: String
    
    var body: some HTML {
        a(href: action) { title }
            .display(.inlineBlock)
            .padding(.vertical(.rem(0.5)), .horizontal(.rem(1)))
            .backgroundColor(.blue)
            .color(.white)
            .borderRadius(.px(6))
            .textDecoration(.none)
            .transition(.all, duration: .ms(150))
    }
}

// Use it anywhere
Button(title: "Learn More", action: "/docs")
```

## Real-World Examples

### 📱 Responsive Layout

```swift
div {
    header { "Mobile First" }
    nav { "Navigation" }
    main { "Content" }
}
.display(.grid)
.gridTemplateColumns(.fr(1))
.gap(.rem(1))
```

### 📧 Email Template

```swift
struct EmailTemplate: HTMLDocument {
    let userName: String
    
    var head: some HTML {
        title { "Welcome Email" }
        style {
            """
            body { font-family: system-ui; line-height: 1.6; }
            """
        }
    }
    
    var body: some HTML {
        div {
            h1 { "Welcome, \(userName)!" }
            p { "Thanks for joining us." }
            Button(title: "Get Started", action: "https://app.example.com")
        }
        .class("container")
    }
}
```

### 🚀 Server-Side Rendering

```swift
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws -> Response in
        return Response(
            status: .ok,
            headers: ["Content-Type": "text/html; charset=utf-8"],
            body: .init(data: Data(HomePage(user: req.user).render()))
        )
    }
}
```

## Architecture

swift-html integrates four specialized packages:

```
swift-html (You are here!)
    ├── swift-html-types      → HTML element types & attributes
    ├── swift-css-types       → CSS property types & values  
    ├── pointfree-html        → Rendering engine
    └── swift-html-css-pointfree → Integration layer
```

Each package has a focused responsibility while working seamlessly together.

## Testing

swift-html includes powerful testing utilities:

```swift
import Testing
import PointFreeHTMLTestSupport

@Suite("Button Tests")
struct ButtonTests {
    @Test("Button renders correctly")
    func buttonRendering() {
        let button = HTMLElementTypes.Button.submit { "Submit Form" }
        assertInlineSnapshot(
            of: button,
            as: .html
        ) {
            """
            <button type="reset">Submit Form</button>
            """
        }
    }
}
```

## Documentation

Comprehensive documentation is available:

- 📚 **[Getting Started Guide](Sources/HTML/Documentation.docc/Articles/GettingStarted.md)** - Installation and first steps
- 🏗️ **[HTML Elements Reference](Sources/HTML/Documentation.docc/Extensions)** - All available elements and modifiers
- 🎨 **[CSS Properties Guide](Sources/HTML/Documentation.docc/Articles/StylingWithCSS.md)** - Type-safe styling
- 🧩 **[Building Components](Sources/HTML/Documentation.docc/Articles/CustomComponents.md)** - Reusable patterns

## Ecosystem

### Core Stack

- **[swift-html-types](https://github.com/coenttb/swift-html-types)** - Type-safe HTML elements
- **[swift-css-types](https://github.com/coenttb/swift-css-types)** - Type-safe CSS properties
- **[pointfree-html](https://github.com/coenttb/pointfree-html)** - High-performance rendering
- **[swift-html-css-pointfree](https://github.com/coenttb/swift-html-css-pointfree)** - Integration layer

### Extensions

- **[coenttb-html](https://github.com/coenttb/coenttb-html)** - Additional components, markdown, PDF generation
- **[swift-web](https://github.com/coenttb/swift-web)** - Web server utilities
- **[coenttb-server](https://github.com/coenttb/coenttb-server)** - Server framework integration

### Examples

- **[coenttb.com](https://github.com/coenttb/coenttb-com-server)** - Full production website built 100% with swift-html
  - Complete server-side rendered website
  - Real-world implementation patterns
  - Production-ready architecture

## Requirements

- Swift 5.10+ (Full Swift 6 support)
- macOS 14+ / iOS 17+ / tvOS 17+ / watchOS 10+ / Linux

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## Support

- 🐛 **[Issue Tracker](https://github.com/coenttb/swift-html/issues)** - Report bugs or request features
- 💬 **[Discussions](https://github.com/coenttb/swift-html/discussions)** - Ask questions and share ideas
- 📧 **[Newsletter](http://coenttb.com/en/newsletter/subscribe)** - Stay updated
- 🐦 **[X (Twitter)](http://x.com/coenttb)** - Follow for updates
- 💼 **[LinkedIn](https://www.linkedin.com/in/tenthijeboonkkamp)** - Connect professionally

## Acknowledgements

This project builds upon foundational work by Point-Free (Brandon Williams and Stephen Celis). This package's HTML rendering engine (`pointfree-html`) is a fork of their `swift-html` library, but updated to their current approach on `pointfreeco`.

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

---

<p align="center">
  Made with ❤️ by <a href="https://coenttb.com">coenttb</a><br>
</p>

