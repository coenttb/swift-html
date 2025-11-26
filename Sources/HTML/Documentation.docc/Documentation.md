# ``HTML``

A type-safe, SwiftUI-inspired approach to generating HTML and CSS in Swift.

## Overview

`swift-html` is the developer-friendly entry point to a comprehensive ecosystem for building type-safe HTML and CSS in Swift. It combines the power of strongly-typed HTML elements, compile-time validated CSS properties, and an efficient rendering engine to help you build web content with confidence.

### Why swift-html?

- **Type Safety**: Catch HTML and CSS errors at compile time, not runtime
- **SwiftUI-like Syntax**: Familiar declarative syntax for Swift developers
- **Comprehensive**: Full HTML5 element and CSS property coverage
- **Performance**: Efficient byte-level rendering for server-side applications
- **Modular**: Built on a foundation of focused, composable packages

## The Ecosystem

`swift-html` integrates four specialized packages to provide a complete web development experience:

```
swift-html (You are here!)
    ├── swift-html-standard      (Type-safe HTML elements & attributes)
    ├── swift-css-types       (Type-safe CSS properties & values)
    └── pointfree-html        (High-performance rendering engine)
         └── swift-html-css-pointfree (Integration layer)
```

## Getting Started

### Installation

Add `swift-html` to your Swift package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html.git", from: "0.1.0")
]
```

### Quick Example

```swift
import HTML

// Build type-safe HTML with SwiftUI-like syntax
let greeting = div {
    h1 { "Welcome to swift-html" }
        .color(.blue)
        .fontSize(.px(32))
    
    p { "Build web content with confidence using Swift's type system." }
        .margin(.rem(2))
}

// Render to string or bytes
let html = try String(greeting)
let bytes = greeting.render()
```

### Creating Full Documents

Build complete HTML documents using the `HTMLDocument` protocol:

```swift
struct LandingPage: HTMLDocumentProtocol {
    var head: some HTML {
        title { "My Swift Website" }
        meta(charset: .utf8)
        meta(name: .viewport, content: "width=device-width, initial-scale=1")
        
        // Type-safe CSS
        style {
            """
            body { 
                font-family: system-ui; 
                line-height: 1.6;
            }
            """
        }
    }
    
    var body: some HTML {
        div {
            h1 { "Hello, Swift!" }
                .color(light: .black, dark: .white)
            
            p { "Building the web, one type at a time." }
        }
        .padding(.rem(2))
        .maxWidth(.px(800))
        .margin(.auto)
    }
}

// Render the document
let webpage = try String(LandingPage())
```

Or use the `HTMLDocument` type for a simpler inline approach:

```swift
let quickPage = HTMLDocument {
    // Body content
    div {
        h1 { "Quick Start" }
        p { "Building HTML has never been easier!" }
        a(href: "https://github.com/coenttb/swift-html") { 
            "Learn more →" 
        }
    }
    .padding(.rem(2))
} head: {
    // Head content
    title { "Quick Start - swift-html" }
    meta(charset: .utf8)
    meta(name: .viewport, content: "width=device-width, initial-scale=1")
}

// Render to HTML string
let html = try String(quickPage)
```

## Topics

### Essentials

- <doc:GettingStarted>
- <doc:UnderstandingTheEcosystem>
- <doc:TypeSafetyBenefits>

### Core Concepts

- <doc:HTMLProtocol>
- <doc:HTMLBuilder>
- <doc:RenderingHTML>
- <doc:HTMLDocuments>

### Styling with CSS

- <doc:StylingWithCSS>
- <doc:DarkModeSupport>
- ``Background``
- ``Border``
- ``Color``
- ``Font``
- ``Margin``
- ``Padding``

### HTML Enhancements

- ``HTMLForEach``
- ``HTMLElement``
- <doc:ConditionalRendering>
- ``SVG``

### Advanced Topics

- <doc:CustomComponents>
- <doc:PlatformIntegration>
- <doc:PerformanceGuide>

### Platform Integration

- ``HTMLDocument/UIViewRepresentable``
- ``HTMLDocument/NSViewRepresentable``
