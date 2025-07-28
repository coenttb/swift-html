# Understanding the swift-html Ecosystem

Explore how swift-html's modular architecture provides a complete type-safe web development experience.

## Overview

The swift-html ecosystem consists of four carefully designed packages that work together to provide type-safe HTML and CSS generation in Swift. This modular approach ensures each package has a focused responsibility while maintaining seamless integration.

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                      swift-html                         │
│                  (Developer Interface)                  │
│                                                         │
│  • Convenience APIs                                     │
│  • Platform integrations                                │
│  • Enhanced CSS modifiers                               │
│  • Documentation & examples                             │
└────────────────────────┬────────────────────────────────┘
                         │ imports & re-exports
┌────────────────────────┴────────────────────────────────┐
│              swift-html-css-pointfree                   │
│                (Integration Layer)                      │
│                                                         │
│  • Bridges HTML types to rendering engine               │
│  • Connects CSS types to HTML elements                  │
│  • Provides modifier syntax                             │
└────────┬──────────────────────────────┬─────────────────┘
         │                              │
┌────────┴────────────┐       ┌─────────┴────────────────┐
│  swift-html-types   │       │    swift-css-types       │
│  (HTML Model)       │       │    (CSS Model)           │
│                     │       │                          │
│ • Element types     │       │ • Property types         │
│ • Attribute types   │       │ • Value types            │
│ • Type constraints  │       │ • Unit types             │
└────────┬────────────┘       └──────────────────────────┘
         │
┌────────┴────────────────────────────────────────────────┐
│                   pointfree-html                        │
│                 (Rendering Engine)                      │
│                                                         │
│  • HTML protocol                                        │
│  • @HTMLBuilder                                         │
│  • String/byte rendering                                │
│  • Performance optimizations                            │
└─────────────────────────────────────────────────────────┘
```

## Package Responsibilities

### swift-html-types

The foundation for type-safe HTML elements and attributes.

**Purpose**: Provides a comprehensive, accurate domain model of HTML5 elements and their attributes with compile-time validation.

**Key Features**:
- Every HTML element as a distinct Swift type
- Context-aware attributes (e.g., different attributes for different input types)
- Foundation integration for URL safety
- Prevents invalid HTML at compile time

**Example**:
```swift
// Type-safe element creation
let link = Anchor(href: "https://example.com", target: .blank) {
    "Visit Example"
}

// Compile-time validation
let input = Input.email(
    name: "userEmail",
    placeholder: "Enter your email",
    required: true
)
// input.href = "..." // ❌ Compile error: 'href' is not valid for input
```

### swift-css-types

Type-safe CSS properties and values.

**Purpose**: Models CSS properties as Swift types, ensuring only valid values can be assigned to each property.

**Key Features**:
- Comprehensive CSS property coverage
- Type-safe units (px, rem, %, etc.)
- Color models (hex, rgb, hsl, named colors)
- Compile-time validation of property values

**Example**:
```swift
// Type-safe CSS values
let spacing: Length = .rem(1.5)
let primaryColor: CSS.Color = .hex("#007AFF")

// Units are type-checked
let fontSize = FontSize(.px(16))
// let invalid = FontSize(.deg(45)) // ❌ Compile error: wrong unit type
```

### pointfree-html

The high-performance rendering engine.

**Purpose**: Provides the core `HTML` protocol and rendering infrastructure that allows any Swift type to be rendered as HTML.

**Key Features**:
- Universal `HTML` protocol
- `@HTMLBuilder` for declarative syntax
- Efficient byte-level rendering
- Minimal overhead and dependencies

**Example**:
```swift
// Any type can be HTML
struct UserProfile: HTML {
    let user: User
    
    var body: some HTML {
        div {
            h2 { user.name }
            p { user.bio }
        }
    }
}

// Efficient rendering
let bytes = UserProfile(user: currentUser).render()
```

### swift-html-css-pointfree

The integration layer that brings everything together.

**Purpose**: Bridges the type models with the rendering engine, providing the modifier syntax and seamless integration.

**Key Features**:
- Connects HTML elements to the rendering engine
- Adds CSS modifier methods to HTML elements
- Provides the SwiftUI-like styling API
- Handles the complexity of integration

**Example**:
```swift
// This package enables the modifier syntax
div { "Hello" }
    .padding(.rem(2))        // From CSS types
    .backgroundColor(.blue)   // Integrated with HTML
    .borderRadius(.px(8))    // Type-safe and chainable
```

### swift-html

The developer-friendly entry point.

**Purpose**: Provides convenience APIs, platform integrations, and a polished developer experience.

**Key Features**:
- Re-exports all necessary types
- Platform-specific integrations (UIKit, AppKit)
- Additional convenience methods
- Comprehensive documentation
- Enhanced CSS helpers

**Example**:
```swift
import HTML // Just one import gives you everything

// Preview integration
#if canImport(SwiftUI)
#Preview {
    HTMLDocument {
        h1 { "Preview your HTML in your IDE." }
    }
}
#endif

// Convenience features
div { "Dark mode support" }
    .color(.blue) // has different colors for light- and dark mode.
```

## How They Work Together

### 1. Type Definition

HTML and CSS types are defined in their respective packages:

```swift
// In swift-html-types
public struct Div: HTMLElement {
    public let attributes: [AttributeKey: AttributeValue]
    public let content: HTMLContent
}

// In swift-css-types  
public struct Padding: CSSProperty {
    public let value: LengthPercentage
}
```

### 2. Protocol Conformance

The integration layer makes HTML types conform to the rendering protocol:

```swift
// In swift-html-css-pointfree
extension HTMLElementTypes.ContentDivision {
    public func callAsFunction(
        @HTMLBuilder _ content: () -> some PointFreeHTML.HTML
    ) -> some PointFreeHTML.HTML {
        HTMLElement(tag: Self.tag) { content() }
    }
}
```

This allows you to call an HTMLElement (here ContentDivision/div) with a closure to contain HTML, like this: `div { ... }`.

### 3. Modifier Addition

CSS modifiers are added to HTML elements:

```swift
// In swift-html-css-pointfree
extension HTML {
    public func padding(_ value: LengthPercentage) -> some HTML {
        // Apply padding
    }
}
```

### 4. Developer Usage

Finally, swift-html provides the clean API:

```swift
// In your code
import HTML

VStack { 
    h1 { "Content" }
    p { "Welcome to swift-html!" }
}
    .padding(.rem(2))
    .backgroundColor(.background.primary)
```

## Benefits of This Architecture

### Separation of Concerns

Each package has a single, well-defined responsibility:
- HTML types handle HTML semantics
- CSS types handle CSS properties
- Rendering engine handles output
- Integration layer handles connections
- swift-html handles developer experience

### Modularity

You can use packages independently if needed:
```swift
// Use just the HTML types
import HTMLTypes

// Use just the rendering engine  
import PointFreeHTML

// Or get everything
import HTML
```

### Type Safety Throughout

The entire stack maintains type safety:
- HTML elements only accept valid attributes
- CSS properties only accept valid values
- Invalid combinations fail at compile time

### Performance

The modular design enables optimizations:
- Type information guides efficient rendering
- No runtime validation needed
- Minimal abstraction overhead

### Extensibility

New features can be added at the appropriate layer:
- New HTML elements in swift-html-types
- New CSS properties in swift-css-types
- Rendering optimizations in pointfree-html
- Developer conveniences in swift-html

## Practical Example

Here's how a real-world component flows through the ecosystem:

```swift
// Your component uses swift-html's convenient API
struct ArticleCard: HTML {
    let article: Article
    
    var body: some HTML {
        article {                              // `Article` from swift-html-types, `article` typealias from swift-html
            header {
                h2 { article.title }
                    .fontSize(.rem(1.5))       // FontSize is defined in swift-css-types
                    .color(.primary)           // Enhanced by swift-html
                
                time(datetime: article.date) {
                    article.formattedDate
                }
            }
            
            p { article.summary }
                .lineHeight(1.6)               // The lineHeight modifier is from swift-html-css-pointfree
            
            a(href: article.url) { "Read more" }
                .color(.accent)
                .textDecoration(.none)
        }
        .padding(.rem(1))
        .border(.px(1), .solid, .gray200)
        .borderRadius(.px(8))
    }
}

// Rendering uses pointfree-html's engine
let html = ArticleCard(article: myArticle).render()
```

## Next Steps

Now that you understand the ecosystem:

- Learn about <doc:TypeSafetyBenefits> and how it improves your development experience
- Explore <doc:HTMLProtocol> to create your own components
- Discover <doc:StylingWithCSS> for advanced styling techniques
- Read <doc:CustomComponents> to build reusable UI pieces

The modular architecture of swift-html provides a solid foundation for building type-safe web content while maintaining flexibility and performance. Each package in the ecosystem plays a crucial role in delivering a seamless developer experience.
