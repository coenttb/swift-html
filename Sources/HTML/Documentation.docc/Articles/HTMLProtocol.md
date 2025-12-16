# Understanding the HTML Protocol

Learn how the HTML protocol enables any Swift type to become renderable HTML.

## Overview

The `HTML` protocol is the foundation of swift-html's type-safe rendering system. By conforming to this simple yet powerful protocol, any Swift type can be transformed into HTML. This article explores how the protocol works, how to use it effectively, and how it enables swift-html's composable architecture.

## The HTML Protocol

At its core, the HTML protocol is elegantly simple:

```swift
public protocol HTML {
    associatedtype Body: HTML
    @HTML.Builder var body: Body { get }
}
```

This design mirrors SwiftUI's View protocol, providing a familiar and intuitive API for Swift developers.

## How It Works

### Basic Conformance

Any type can conform to HTML by implementing the `body` property:

```swift
struct Greeting: HTML.View {
    let name: String
    
    var body: some HTML.View {
        p {
            "Hello, "
            strong { name }
            "!"
        }
    }
}

// Usage
let greeting = Greeting(name: "World")
let html = try String(greeting)
// Output: <p>Hello, <strong>World</strong>!</p>
```

### The Power of Composition

HTML conforming types can be composed together:

```swift
struct UserCard: HTML.View {
    let user: User
    
    var body: some HTML.View {
        div {
            Avatar(imageURL: user.avatarURL)  // Another HTML type
            UserInfo(user: user)              // Another HTML type
        }
        .class("user-card")
    }
}

struct Avatar: HTML.View {
    let imageURL: URL
    
    var body: some HTML.View {
        img(src: imageURL, alt: "User avatar")
            .class("avatar")
            .width(.px(48))
            .height(.px(48))
    }
}

struct UserInfo: HTML.View {
    let user: User
    
    var body: some HTML.View {
        div {
            h3 { user.name }
            p { user.title }
                .color(.gray600)
        }
    }
}
```

### Built-in HTML Conformances

All HTML elements from swift-html-standard automatically conform to the HTML protocol:

```swift
// These all conform to HTML
div { "Content" }
p { "Paragraph" }
a(href: "/") { "Link" }
img(src: "/photo.jpg", alt: "Photo")
```

## Advanced Protocol Usage

### Conditional HTML

Use Swift's control flow within your HTML:

```swift
struct NavigationBar: HTML.View {
    let isLoggedIn: Bool
    let userName: String?
    
    var body: some HTML.View {
        nav {
            a(href: "/") { "Home" }
            a(href: "/about") { "About" }
            
            if isLoggedIn {
                if let name = userName {
                    span { "Welcome, \(name)" }
                }
                a(href: "/logout") { "Logout" }
            } else {
                a(href: "/login") { "Login" }
                a(href: "/signup") { "Sign Up" }
            }
        }
        .class("navbar")
    }
}
```

### Collections and Loops

Render collections efficiently:

```swift
struct ProductList: HTML.View {
    let products: [Product]
    
    var body: some HTML.View {
        div {
            h2 { "Our Products" }
            
            if products.isEmpty {
                p { "No products available" }
                    .class("empty-state")
            } else {
                div {
                    HTMLForEach(products) { product in
                        ProductCard(product: product)
                    }
                }
                .class("product-grid")
            }
        }
    }
}
```

### Generic HTML Components

Create reusable, generic components:

```swift
struct List<Item: Identifiable>: HTML.View where Item.ID: LosslessStringConvertible {
    let items: [Item]
    let content: (Item) -> any HTML.View
    
    var body: some HTML.View {
        ul {
            HTMLForEach(items) { item in
                li {
                    content(item)
                }
                .id(String(item.id))
            }
        }
    }
}

// Usage
List(items: users) { user in
    a(href: "/users/\(user.id)") { user.name }
}
```

## Protocol Extensions

Extend HTML to add functionality to all conforming types:

```swift
extension HTML {
    /// Wraps any HTML in a container div with a class
    func container() -> some HTML.View {
        div { self }
            .class("container")
            .maxWidth(.px(1200))
            .margin(.auto)
            .padding(.x(.rem(2)))
    }
    
    /// Conditionally applies a modifier
    func `if`<Modified: HTML.View>(
        _ condition: Bool,
        transform: (Self) -> Modified
    ) -> some HTML.View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

// Usage
Greeting(name: "World")
```

## Empty HTML

Sometimes you need to render nothing:

```swift
struct ConditionalBanner: HTML.View {
    let showBanner: Bool
    let message: String
    
    var body: some HTML.View {
        if showBanner {
            div {
                p { message }
            }
            .class("banner")
        } else {
            HTML.Empty()  // Renders nothing
        }
    }
}
```

## Performance Considerations

### Avoiding Excessive Nesting

While composition is powerful, deeply nested components can impact performance:

```swift
// Less efficient - many layers
struct DeepNesting: HTML.View {
    var body: some HTML.View {
        Wrapper1 {
            Wrapper2 {
                Wrapper3 {
                    ActualContent()
                }
            }
        }
    }
}

// More efficient - flatter structure
struct FlatStructure: HTML.View {
    var body: some HTML.View {
        div {
            ActualContent()
        }
        .class("wrapper-1", "wrapper-2", "wrapper-3")
    }
}
```

### Static vs Dynamic Content

For static content, consider computing once:

```swift
struct Footer: HTML.View {
    // Computed once per instance
    private let currentYear = Calendar.current.component(.year, from: Date())
    
    var body: some HTML.View {
        footer {
            p { "© \(currentYear) My Company" }
            nav {
                a(href: "/privacy") { "Privacy" }
                a(href: "/terms") { "Terms" }
            }
        }
    }
}
```

## Testing HTML Components

The HTML protocol makes testing straightforward. swift-html provides powerful testing utilities through HTMLTestSupport:

### Basic Testing

```swift
import Testing
@testable import MyApp

@Suite("HTML Component Tests")
struct HTMLComponentTests {
    @Test("Greeting component renders correctly")
    func greeting() throws {
        let greeting = Greeting(name: "Test")
        let html = try String(greeting)
        
        #expect(html.contains("<strong>Test</strong>"))
        #expect(html.contains("Hello,"))
    }
    
    @Test("Navigation bar renders based on login state")
    func conditionalRendering() throws {
        let loggedIn = NavigationBar(isLoggedIn: true, userName: "Alice")
        let loggedInHTML = try String(loggedIn)
        #expect(loggedInHTML.contains("Welcome, Alice"))
        #expect(loggedInHTML.contains("Logout"))
        
        let loggedOut = NavigationBar(isLoggedIn: false, userName: nil)
        let loggedOutHTML = try String(loggedOut)
        #expect(loggedOutHTML.contains("Login"))
        #expect(!loggedOutHTML.contains("Logout"))
    }
}
```

### Inline Snapshot Testing with HTMLTestSupport

For more comprehensive testing, use HTMLTestSupport's inline snapshot testing:

```swift
import Testing
import HTML_Rendering_TestSupport
@testable import MyApp

@Suite("HTML Snapshot Tests")
struct HTMLSnapshotTests {
    @Test("User card renders with proper structure")
    func userCard() throws {
        let card = UserCard(
            user: User(
                name: "Alice Johnson",
                role: "Senior Developer",
                avatarURL: URL(string: "/images/alice.jpg")!
            )
        )
        
        assertInlineSnapshot(of: card, as: .html) {
            """
            <div class="user-card">
              <img src="/images/alice.jpg" alt="User avatar" class="avatar" style="width: 48px; height: 48px">
              <div>
                <h3>Alice Johnson</h3>
                <p style="color: #4a5568">Senior Developer</p>
              </div>
            </div>
            """
        }
    }
    
    @Test("Product list renders correctly")
    func productList() throws {
        let products = [
            Product(id: "1", name: "Widget", price: 9.99),
            Product(id: "2", name: "Gadget", price: 19.99)
        ]
        
        let list = ProductList(products: products)
        
        assertInlineSnapshot(of: list, as: .html) {
            """
            <div>
              <h2>Our Products</h2>
              <div class="product-grid">
                <div class="product-card" style="padding: 1rem; border: 1px solid #e2e8f0; border-radius: 8px">
                  <h3>Widget</h3>
                  <p style="font-weight: bold">$9.99</p>
                </div>
                <div class="product-card" style="padding: 1rem; border: 1px solid #e2e8f0; border-radius: 8px">
                  <h3>Gadget</h3>
                  <p style="font-weight: bold">$19.99</p>
                </div>
              </div>
            </div>
            """
        }
    }
    
    @Test("Empty state renders when no items")
    func emptyState() throws {
        let list = ProductList(products: [])
        
        assertInlineSnapshot(of: list, as: .html) {
            """
            <div>
              <h2>Our Products</h2>
              <p class="empty-state">No products available</p>
            </div>
            """
        }
    }
}
```

### Testing with Pretty Printing

HTMLTestSupport also provides pretty-printed output for better readability:

```swift
@Test("Test HTML")
func testHTML() throws {
    assertInlineSnapshot(
        of: HTML.Document {
            a(href: "/home") {
                "Click here!"
            }
            .color(.red)
        },
        as: .html
    ) {
        """
        <!doctype html>
        <html>
          <head>
            <style>
        .color-dMYaj4{color:red}

            </style>
          </head>
          <body><a class="color-dMYaj4" href="/home">Click here!</a>
          </body>
        </html>
        """
    }
}
```

## Common Patterns

### Wrapper Components

Create components that wrap other HTML:

```swift
struct Card: HTML.View {
    let title: String
    let content: any HTML

    public init(
        title: String,
        @HTML.Builder content: () -> Content
    ) {
        self.title = title
        self.content = content()
    }
    
    var body: some HTML.View {
        div {
            if !title.isEmpty {
                h3 { title }
                    .class("card-title")
            }
            div {
                content
            }
            .class("card-content")
        }
        .class("card")
    }
}

// Usage
Card(title: "Features") {
    ul {
        li { "Type-safe" }
        li { "Fast" }
        li { "Composable" }
    }
}
```

### Layout Components

Build reusable layout structures:

```swift
struct TwoColumnLayout: HTML.View {
    let left: any HTML
    let right: any HTML
    let ratio: (left: Int, right: Int) = (1, 1)
    
    var body: some HTML.View {
        div {
            div { left }
                .class("left-column")
                .flex(ratio.left)
            
            div { right }
                .class("right-column")
                .flex(ratio.right)
        }
        .display(.flex)
        .gap(.rem(2))
    }
}
```

### Data-Driven Components

Create components that render based on data:

```swift
struct DataTable<Row: Identifiable>: HTML.View {
    let columns: [Column<Row>]
    let rows: [Row]
    
    struct Column<Row> {
        let title: String
        let value: (Row) -> String
    }
    
    var body: some HTML.View {
        table {
            thead {
                tr {
                    HTMLForEach(columns) { column in
                        th { column.title }
                    }
                }
            }
            tbody {
                HTMLForEach(rows) { row in
                    tr {
                        HTMLForEach(columns) { column in
                            td { column.value(row) }
                        }
                    }
                }
            }
        }
    }
}
```

## Best Practices

### 1. Keep Components Focused

Each HTML component should have a single, clear responsibility:

```swift
// Good: Focused component
struct PriceDisplay: HTML.View {
    let price: Decimal
    let currency: Stripe.Currency
    
    var body: some HTML.View {
        span {
            span { currency }.class("currency")
            span { price.formatted() }.class("amount")
        }
        .class("price")
    }
}

// Avoid: Doing too much
struct ProductAndPriceAndReviews: HTML.View {
    // Too many responsibilities
}
```

### 2. Use Semantic Names

Choose descriptive names that reflect the component's purpose:

```swift
// Good naming
struct ArticleHeader: HTML.View { }
struct NavigationMenu: HTML.View { }
struct UserProfile: HTML.View { }

// Poor naming
struct Div1: HTML.View { }
struct Component: HTML.View { }
struct Thing: HTML.View { }
```

### 3. Leverage Type Parameters

Use generics to make components more flexible:

```swift
struct Badge<Content: HTML.View>: HTML.View {
    let content: Content
    let style: BadgeStyle
    
    var body: some HTML.View {
        span {
            content
        }
        .class("badge", style.className)
    }
}
```

## Integration with SwiftUI

For iOS/macOS apps, HTML components can be displayed in SwiftUI:

```swift
import SwiftUI

struct WebContentView: View {
    var body: some View {
        HTMLView {
            HomePage()
        }
    }
}

// Where HTMLView is a wrapper around WKWebView
```

## Conclusion

The HTML protocol is the foundation that makes swift-html powerful yet simple. By conforming to this protocol, you can:

- Create reusable, composable components
- Leverage Swift's type system for safety
- Build complex UIs from simple pieces
- Test your HTML generation easily
- Maintain clean, understandable code

## Next Steps

- Learn about <doc:HTMLBuilder> to understand the `@HTML.Builder` attribute
- Explore <doc:CustomComponents> for component design patterns
- Read <doc:RenderingHTML> to understand how HTML becomes strings/bytes
- Check out <doc:StylingWithCSS> to style your HTML components
