# swift-html

[![CI](https://github.com/coenttb/swift-html/workflows/CI/badge.svg)](https://github.com/coenttb/swift-html/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Type-safe HTML and CSS generation in Swift for building websites, email templates, and server-side rendered pages.

## Overview

swift-html provides type-safe HTML elements and CSS properties with compile-time validation. It combines strongly-typed HTML elements, validated CSS properties, and an efficient rendering engine for web content generation in Swift.

## Features

- Compile-time HTML and CSS validation
- Type-safe element attributes and CSS properties
- First-class dark mode support with light/dark color schemes
- Optional internationalization support via Translating trait
- SwiftUI-like syntax for familiar API patterns
- Direct byte-level rendering for server applications
- Modular architecture with focused packages

## Installation

Add swift-html to your Swift package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html", from: "0.0.1")
]
```

## Quick Start

### Basic HTML Generation

```swift
import HTML

let page = div {
    h1 { "Welcome to swift-html" }
        .color(.red)
        .fontSize(.rem(2.5))

    p { "Build type-safe web pages with Swift" }
        .color(light: .gray800, dark: .gray200)
        .lineHeight(1.6)
}

let bytes: ContiguousArray<UInt8> = page.render()
let string: String = String(decoding: bytes, as: UTF8.self)
```

### Layout Components

```swift
import HTML

// Horizontal stack
let header = HStack {
    div { "Logo" }
    Spacer()
    div { "Menu" }
}

// Vertical stack
let content = VStack {
    div { "Section 1" }
    div { "Section 2" }
}

// Grid layout
let grid = LazyVGrid(columns: [1, 2, 1]) {
    div { "Item 1" }
    div { "Item 2" }
    div { "Item 3" }
}
```

### Dark Mode Support

```swift
import HTML

let adaptiveContent = p { "Adaptive text" }
    .color(light: .gray900, dark: .gray100)
    .backgroundColor(light: .white, dark: .gray900)
```

### Reusable Components

```swift
import HTML

struct CustomButton: HTML {
    let title: String
    let href: String

    var body: some HTML {
        a(href: .init(rawValue: href)) { title }
            .display(.inlineBlock)
            .padding(vertical: .rem(0.5), horizontal: .rem(1))
            .backgroundColor(.blue)
            .color(.white)
            .borderRadius(.px(6))
            .textDecoration(TextDecoration.none)
    }
}

// Usage
CustomButton(title: "Learn More", href: "/docs")
```

### Internationalization (Optional)

Enable the Translating trait for internationalization support:

```swift
// In Package.swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html", from: "0.11.0",
             traits: ["Translating"])
]
```

Then use TranslatedString in your HTML:

```swift
import HTML
import Translating

let greeting = TranslatedString(
    dutch: "Welkom",
    english: "Welcome"
)

let page = div {
    h1 { greeting }
    p {
        TranslatedString(
            dutch: "Dit is een voorbeeld",
            english: "This is an example"
        )
    }
}
```

## Usage

swift-html is composed of several focused packages:

- **HTML** - Core HTML elements and rendering
- **HTMLTheme** - Theming and color schemes
- **HTMLComponents** - Reusable UI components
- **HTMLMarkdown** - Markdown to HTML conversion
- **HTMLEmail** - Email template generation
- **HTMLWebsite** - Website-specific components
- **HTMLKit** - Convenience bundle (HTML + HTMLTheme + HTMLComponents)

Import only what you need:

```swift
// Individual modules
import HTML
import HTMLTheme
import HTMLComponents

// Or use the kit
import HTMLKit
```

## Related Packages

### Dependencies

- [pointfree-html](https://github.com/coenttb/pointfree-html): A fork of pointfreeco/swift-html with extended functionality.
- [pointfree-html-translating](https://github.com/coenttb/pointfree-html-translating): A Swift package integrating pointfree-html with swift-translating.
- [swift-builders](https://github.com/coenttb/swift-builders): A Swift package with result builders for Array, Dictionary, Set, String, and Markdown.
- [swift-html-css-pointfree](https://github.com/coenttb/swift-html-css-pointfree): A Swift package integrating swift-html-types and swift-css-types with pointfree-html.
- [swift-html-types](https://github.com/coenttb/swift-html-types): A Swift package with foundational types for HTML.
- [swift-svg](https://github.com/coenttb/swift-svg): A Swift package for type-safe SVG generation.
- [swift-translating](https://github.com/coenttb/swift-translating): A Swift package for inline translations.

### Used By

This package is used by many packages across the ecosystem, including:

- [coenttb-blog](https://github.com/coenttb/coenttb-blog): A Swift package for blog functionality with HTML generation.
- [coenttb-com-blog-drafts](https://github.com/coenttb/coenttb-com-blog-drafts): Repository containing draft blog posts for coenttb.com.
- [coenttb-com-server](https://github.com/coenttb/coenttb-com-server): Production server for coenttb.com built with Boiler.
- [coenttb-google-analytics](https://github.com/coenttb/coenttb-google-analytics): A Swift package for Google Analytics integration.
- [coenttb-hotjar](https://github.com/coenttb/coenttb-hotjar): A Swift package for Hotjar analytics integration.
- [coenttb-newsletter](https://github.com/coenttb/coenttb-newsletter): A Swift package for newsletter subscription and email management.
- [coenttb-syndication](https://github.com/coenttb/coenttb-syndication): A Swift package for RSS and Atom feed generation.
- [coenttb-web](https://github.com/coenttb/coenttb-web): A Swift package with tools for web development building on swift-web.
- [swift-document-templates](https://github.com/coenttb/swift-document-templates): A Swift package for data-driven business document creation.
- [swift-favicon](https://github.com/coenttb/swift-favicon): A Swift package for type-safe favicons.

*And 9 other packages in the ecosystem*

### Third-Party Dependencies

- [pointfreeco/swift-dependencies](https://github.com/pointfreeco/swift-dependencies): A dependency management library for controlling dependencies in Swift.
- [apple/swift-collections](https://github.com/apple/swift-collections): Commonly used data structures for Swift.

## Requirements

- Swift 5.9+
- macOS 14+ / iOS 17+ / tvOS 17+ / watchOS 10+
- Linux (via Swift 6.0+)

## License

This project is licensed under the Apache License 2.0. See [LICENSE](LICENSE) for details.

## Contributing

Contributions are welcome. Please open an issue to discuss proposed changes before submitting a pull request.

---

Made by [coenttb](https://coenttb.com)
