# Getting Started with swift-html

Learn how to install swift-html and create your first type-safe HTML page.

## Overview

This guide walks you through setting up swift-html in your Swift project and building your first HTML content. By the end, you'll understand the basics of creating type-safe HTML elements, applying CSS styles, and rendering complete web pages.

## Installation

### Swift Package Manager

Add swift-html to your `Package.swift` file:

```swift
// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "MyWebProject",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-html.git", from: "0.0.1")
    ],
    targets: [
        .executableTarget(
            name: "MyWebProject",
            dependencies: [
                .product(name: "HTML", package: "swift-html")
            ]
        )
    ]
)
```

### Xcode Project

1. Select your project in the navigator
2. Click on your project in the targets list
3. Click the "Package Dependencies" tab
4. Click the "+" button
5. Enter: `https://github.com/coenttb/swift-html.git`
6. Click "Add Package"

## Your First HTML Element

Start by importing the HTML module and creating a simple element:

```swift
import HTML

// Create a paragraph element
let paragraph = p { "Hello, swift-html!" }

// Render to string
let html = try String(paragraph)
print(html)
// Output: <p>Hello, swift-html!</p>
```

## Building Complex Structures

swift-html uses a SwiftUI-like syntax for composing HTML elements:

```swift
let article = article {
    header {
        h1 { "Introduction to swift-html" }
        p { 
            "Published on "
            time(datetime: "2024-01-15") { "January 15, 2024" }
        }
    }
    
    section {
        h2 { "What is swift-html?" }
        p {
            "swift-html is a "
            strong { "type-safe" }
            " way to generate HTML in Swift."
        }
        
        ul {
            li { "Compile-time validation" }
            li { "Familiar SwiftUI-like syntax" }
            li { "Full HTML5 support" }
        }
    }
}
```

## Adding Styles

Apply CSS styles using type-safe modifiers:

```swift
let styledContent = div {
    h1 { "Welcome" }
        .fontSize(.px(48))
        .color(.blue)
        .margin(.bottom(.rem(2)))
    
    p { "Build beautiful web pages with Swift" }
        .lineHeight(1.6)
        .color(light: .gray700, dark: .gray300)
}
.padding(.rem(2))
.maxWidth(.px(1200))
.margin(.auto)
```

## Creating a Complete Web Page

For full HTML documents, use the `HTMLDocumentProtocol` protocol:

```swift
struct WelcomePage: HTMLDocumentProtocol {
    let userName: String
    
    var head: some HTML.View {
        title { "Welcome \(userName)" }
        meta(charset: .utf8)
        meta(name: .viewport, content: "width=device-width, initial-scale=1")
        
        style {
            """
            * { box-sizing: border-box; }
            body {
                font-family: -apple-system, system-ui, sans-serif;
                margin: 0;
                padding: 0;
            }
            """
        }
    }
    
    var body: some HTML.View {
        div {
            nav {
                a(href: "/") { "Home" }
                a(href: "/about") { "About" }
                a(href: "/contact") { "Contact" }
            }
            .display(.flex)
            .gap(.rem(2))
            .padding(.rem(1))
            .backgroundColor(.gray100)
            
            main {
                h1 { "Welcome, \(userName)!" }
                p { "We're glad you're here." }
            }
            .padding(.rem(2))
        }
    }
}

// Render the page
let page = WelcomePage(userName: "Alice")
let fullHTML = try String(page)
```

## Rendering Options

swift-html provides two rendering methods:

### String Rendering

Best for debugging and small-scale use:

```swift
let element = div { "Hello" }
let string = try String(element)
```

### Byte Rendering

More efficient for server applications:

```swift
let element = div { "Hello" }
let bytes: ContiguousArray<UInt8> = element.render()

// Use with a web framework
response.body = bytes
```

## Next Steps

Now that you've learned the basics:

- Explore <doc:UnderstandingTheEcosystem> to learn how swift-html's packages work together
- Read <doc:TypeSafetyBenefits> to understand the advantages of type-safe HTML
- Learn about <doc:HTMLProtocol> to create custom components
- Discover <doc:StylingWithCSS> for advanced styling techniques

## Common Patterns

### Conditional Rendering

```swift
div {
    if isLoggedIn {
        p { "Welcome back!" }
    } else {
        a(href: "/login") { "Please log in" }
    }
}
```

### Loops and Collections

```swift
ul {
    for item in menuItems {
        li {
            a(href: item.url) { item.title }
        }
    }
}

// Or use HTMLForEach
ul {
    HTMLForEach(products) { product in
        li { product.name }
            .class("product-item")
    }
}
```

### Custom Components

Create reusable components by conforming to the `HTML` protocol:

```swift
struct ProductCard: HTML.View {
    let product: Product
    
    var body: some HTML.View {
        div {
            img(src: product.imageURL, alt: product.name)
            h3 { product.name }
            p { "$\(product.price)" }
                .fontWeight(.bold)
        }
        .class("product-card")
        .padding(.rem(1))
        .border(.px(1), .solid, .gray300)
        .borderRadius(.px(8))
    }
}

// Use it like any other element
div {
    HTMLForEach(products) { product in
        ProductCard(product: product)
    }
}
.display(.grid)
.gridTemplateColumns(.repeat(.autoFit, .minmax(.px(250), .fr(1))))
.gap(.rem(2))
```

## Tips and Best Practices

1. **Use semantic HTML**: Choose elements based on their meaning, not appearance
2. **Leverage type safety**: Let the compiler catch errors early
3. **Create components**: Build reusable pieces for consistency
4. **Style systematically**: Use CSS custom properties and consistent spacing
5. **Test rendering**: Verify your HTML renders correctly across different contexts

Ready to dive deeper? Continue with <doc:UnderstandingTheEcosystem> to learn about swift-html's architecture.
