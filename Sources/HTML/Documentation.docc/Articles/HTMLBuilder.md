# Understanding @HTML.Builder

Explore how the @HTML.Builder attribute enables SwiftUI-like declarative syntax for HTML composition.

## Overview

The `@HTML.Builder` attribute is a result builder that transforms Swift's declarative syntax into HTML structures. It's what allows you to write HTML in a natural, SwiftUI-like way without explicit array construction or concatenation. This article explains how HTMLBuilder works, its capabilities, and how to use it effectively.

## What is a Result Builder?

Result builders (formerly known as function builders) are a Swift feature that allows you to build values using a declarative syntax. You might be familiar with them from SwiftUI's `@ViewBuilder`.

```swift
// Without result builder - verbose
let content = [
    h1 { "Title" },
    p { "Paragraph" },
    div { "Content" }
]

// With @HTML.Builder - clean and declarative
let content = HTMLBuilder.buildBlock(
    h1 { "Title" },
    p { "Paragraph" },
    div { "Content" }
)

// Even cleaner with implicit builder in HTML context
div {
    h1 { "Title" }
    p { "Paragraph" }
    div { "Content" }
}
```

## How @HTML.Builder Works

### Basic Building Blocks

The HTMLBuilder transforms a series of statements into HTML:

```swift
@HTML.Builder
func createContent() -> some HTML.View {
    h1 { "Welcome" }
    p { "This is a paragraph" }
    a(href: "/more") { "Read more" }
}

// Equivalent to manually building:
func createContentManual() -> some HTML.View {
    HTMLBuilder.buildBlock(
        h1 { "Welcome" },
        p { "This is a paragraph" },
        a(href: "/more") { "Read more" }
    )
}
```

### Implicit Builder Contexts

Many swift-html APIs automatically apply @HTML.Builder:

```swift
// The div's content closure has an implicit @HTML.Builder
div {
    h1 { "Title" }      // ✅ Multiple elements work
    p { "Paragraph" }   // ✅ Because of @HTML.Builder
}

// The HTML protocol's body property uses @HTML.Builder
struct MyComponent: HTML.View {
    var body: some HTML.View {
        h1 { "Title" }      // ✅ Multiple elements work here too
        p { "Content" }
    }
}
```

## Supported Constructs

### 1. Sequential Statements

List multiple HTML elements sequentially:

```swift
div {
    h1 { "First" }
    h2 { "Second" }
    h3 { "Third" }
    p { "Paragraph" }
}
```

### 2. String Literals

Plain strings become text nodes:

```swift
p {
    "This is "          // Text node
    strong { "bold" }   // Element
    " text"             // Text node
}
```

### 3. Variables and Expressions

Use Swift variables and expressions:

```swift
struct UserGreeting: HTML.View {
    let name: String
    let visitCount: Int
    
    var body: some HTML.View {
        h1 { "Hello, \(name)!" }
        p { "You've visited \(visitCount) times" }
        
        // Expressions work too
        p { "Next visit will be #\(visitCount + 1)" }
    }
}
```

### 4. Conditional Statements (if/else)

Use Swift's control flow:

```swift
struct StatusMessage: HTML.View {
    let isOnline: Bool
    
    var body: some HTML.View {
        div {
            if isOnline {
                span { "●" }
                    .color(.green)
                "Online"
            } else {
                span { "●" }
                    .color(.red)
                "Offline"
            }
        }
    }
}

// With optional binding
struct UserDisplay: HTML.View {
    let user: User?
    
    var body: some HTML.View {
        if let user = user {
            div {
                h2 { user.name }
                p { user.bio }
            }
        } else {
            p { "No user selected" }
                .color(.gray)
        }
    }
}
```

### 5. Switch Statements

Pattern match to build different HTML:

```swift
struct AlertBox: HTML.View {
    enum Level {
        case info, warning, error, success
    }
    
    let level: Level
    let message: String
    
    var body: some HTML.View {
        div {
            switch level {
            case .info:
                span { "ℹ️" }
                span { message }
            case .warning:
                span { "⚠️" }
                strong { message }
            case .error:
                span { "❌" }
                strong { message }
                    .color(.red)
            case .success:
                span { "✅" }
                span { message }
                    .color(.green)
            }
        }
        .class("alert", "alert-\(level)")
    }
}
```

### 6. Loops (for-in)

Iterate over collections:

```swift
struct TodoList: HTML.View {
    let todos: [Todo]
    
    var body: some HTML.View {
        ul {
            for todo in todos {
                li {
                    input(type: .checkbox, checked: todo.isComplete)
                    span { todo.title }
                    if todo.isComplete {
                        span { " ✓" }
                            .color(.green)
                    }
                }
            }
        }
    }
}

// With enumerated
struct NumberedList: HTML.View {
    let items: [String]
    
    var body: some HTML.View {
        ol {
            for (index, item) in items.enumerated() {
                li {
                    strong { "#\(index + 1): " }
                    item
                }
            }
        }
    }
}
```

### 7. Local Constants and Functions

Compute values within the builder:

```swift
struct PricingCard: HTML.View {
    let price: Decimal
    let period: String
    
    var body: some HTML.View {
        div {
            let formattedPrice = price.formatted(.currency(code: "USD"))
            let monthly = price / 12
            
            h2 { formattedPrice }
            p { "per \(period)" }
            
            small {
                "That's \(monthly.formatted(.currency(code: "USD")))/month"
            }
        }
    }
}

// With local functions
struct Navigation: HTML.View {
    let links: [(title: String, url: String)]
    
    var body: some HTML.View {
        func renderLink(_ link: (title: String, url: String)) -> some HTML.View {
            a(href: link.url) { link.title }
                .class("nav-link")
        }
        
        nav {
            for link in links {
                renderLink(link)
            }
        }
    }
}
```

## Advanced HTMLBuilder Patterns

### 1. Building Arrays

When you need to build HTML arrays explicitly:

```swift
let items = ["Apple", "Banana", "Orange"]

// Using HTMLForEach
ul {
    HTMLForEach(items) { item in
        li { item }
    }
}

// Using map with explicit builder
ul {
    items.map { item in
        li { item }
    }
}
```

### 2. Conditional Arrays

Build different content based on conditions:

```swift
struct Gallery: HTML.View {
    let images: [ImageData]
    let showCaptions: Bool
    
    var body: some HTML.View {
        div {
            if images.isEmpty {
                p { "No images to display" }
                    .class("empty-state")
            } else {
                for image in images {
                    figure {
                        img(src: image.url, alt: image.alt)
                        if showCaptions {
                            figcaption { image.caption }
                        }
                    }
                }
            }
        }
        .class("gallery")
    }
}
```

### 3. Nested Builders

Builders can be nested naturally:

```swift
struct Dashboard: HTML.View {
    let stats: [Stat]
    
    var body: some HTML.View {
        div {
            h1 { "Dashboard" }
            
            div {
                for stat in stats {
                    div {
                        h3 { stat.title }
                        p {
                            span { stat.value }
                                .class("stat-value")
                            if let change = stat.change {
                                span {
                                    change > 0 ? "↑" : "↓"
                                    "\(abs(change))%"
                                }
                                .color(change > 0 ? .green : .red)
                            }
                        }
                    }
                    .class("stat-card")
                }
            }
            .class("stats-grid")
        }
    }
}
```

### 4. Custom Builder Methods

Create your own builder helpers:

```swift
extension HTML {
    static func when<Content: HTML.View>(
        _ condition: Bool,
        @HTML.Builder content: () -> Content
    ) -> some HTML.View {
        if condition {
            content()
        } else {
            HTML.Empty()
        }
    }
    
    static func forEach<T, Content: HTML.View>(
        _ items: [T],
        @HTML.Builder content: (T) -> Content
    ) -> some HTML.View {
        HTMLForEach(items, content: content)
    }
}

// Usage
div {
    HTML.when(showHeader) {
        header {
            h1 { "Welcome" }
        }
    }
    
    HTML.forEach(products) { product in
        ProductCard(product: product)
    }
}
```

## Limitations and Workarounds

### 1. Limited Number of Statements

Result builders have a limit on the number of direct statements (typically 10):

```swift
// This might hit the limit
div {
    p { "1" }
    p { "2" }
    p { "3" }
    // ... up to 10 direct statements
}

// Workaround: Group related elements
div {
    Group {
        p { "1" }
        p { "2" }
        p { "3" }
    }
    Group {
        p { "4" }
        p { "5" }
        p { "6" }
    }
}
```

### 2. Complex Logic

For complex logic, extract to methods:

```swift
struct ComplexComponent: HTML.View {
    let data: ComplexData
    
    var body: some HTML.View {
        div {
            renderHeader()
            renderContent()
            renderFooter()
        }
    }
    
    @HTML.Builder
    private func renderHeader() -> some HTML.View {
        // Complex header logic
    }
    
    @HTML.Builder
    private func renderContent() -> some HTML.View {
        // Complex content logic
    }
    
    @HTML.Builder
    private func renderFooter() -> some HTML.View {
        // Complex footer logic
    }
}
```

### 3. Type Inference

Sometimes you need to help the type system:

```swift
// May need type annotation
let content: some HTML = if condition {
    div { "Yes" }
} else {
    span { "No" }
}

// Or use explicit return
var body: some HTML.View {
    if condition {
        return div { "Yes" }
    } else {
        return span { "No" }
    }
}
```

## Performance Considerations

### 1. Build-Time vs Runtime

HTMLBuilder works at compile time, so there's no runtime overhead:

```swift
// This is transformed at compile time
div {
    h1 { "Title" }
    p { "Content" }
}

// Into something like this
div {
    HTMLBuilder.buildBlock(
        h1 { "Title" },
        p { "Content" }
    )
}
```

### 2. Avoiding Unnecessary Rebuilds

For static content, compute once:

```swift
struct Footer: HTML.View {
    // Computed once
    private static let copyrightNotice = p {
        "© 2024 My Company. All rights reserved."
    }
    
    var body: some HTML.View {
        footer {
            Self.copyrightNotice  // Reuse static content
            // Dynamic content
            p { "Last updated: \(Date())" }
        }
    }
}
```

## Testing with HTMLBuilder

Test components that use HTMLBuilder with both basic assertions and HTMLTestSupport's inline snapshots:

### Basic Testing

```swift
import Testing
@testable import MyApp

@Suite("HTMLBuilder Tests")
struct HTMLBuilderTests {
    @Test("Conditional rendering in HTMLBuilder")
    func conditionalRendering() throws {
        let loggedIn = TestComponent(isLoggedIn: true)
        let html = try String(loggedIn)
        
        #expect(html.contains("Welcome back"))
        #expect(!html.contains("Please log in"))
    }
    
    @Test("Loop rendering generates correct HTML") 
    func loopRendering() throws {
        let items = ["A", "B", "C"]
        let list = ItemList(items: items)
        let html = try String(list)
        
        for item in items {
            #expect(html.contains("<li>\(item)</li>"))
        }
    }
}

struct TestComponent: HTML.View {
    let isLoggedIn: Bool
    
    var body: some HTML.View {
        if isLoggedIn {
            p { "Welcome back" }
        } else {
            p { "Please log in" }
        }
    }
}
```

### Inline Snapshot Testing with HTMLBuilder

HTMLTestSupport makes it easy to test complex HTMLBuilder compositions:

```swift
import Testing
import HTML_Rendering_TestSupport
@testable import MyApp

@Suite("HTMLBuilder Snapshot Tests")
struct HTMLBuilderSnapshotTests {
    @Test("Complex builder with conditionals and loops")
    func complexBuilder() throws {
        struct Dashboard: HTML.View {
            let user: User?
            let notifications: [Notification]
            
            var body: some HTML.View {
                div {
                    if let user = user {
                        header {
                            h1 { "Welcome, \(user.name)" }
                            p { "Last login: \(user.lastLogin.formatted())" }
                        }
                    } else {
                        div {
                            p { "Please log in to continue" }
                            a(href: "/login") { "Login" }
                                .class("button")
                        }
                    }
                    
                    if !notifications.isEmpty {
                        section {
                            h2 { "Notifications" }
                            ul {
                                for notification in notifications {
                                    li {
                                        strong { notification.title }
                                        span { " - " }
                                        span { notification.message }
                                    }
                                }
                            }
                        }
                        .class("notifications")
                    }
                }
                .class("dashboard")
            }
        }
        
        let dashboard = Dashboard(
            user: User(name: "Alice", lastLogin: Date(timeIntervalSince1970: 1704067200)),
            notifications: [
                Notification(title: "New message", message: "You have 3 unread messages"),
                Notification(title: "Update available", message: "Version 2.0 is now available")
            ]
        )
        
        assertInlineSnapshot(of: dashboard, as: .html) {
            """
            <div class="dashboard">
              <header>
                <h1>Welcome, Alice</h1>
                <p>Last login: January 1, 2024</p>
              </header>
              <section class="notifications">
                <h2>Notifications</h2>
                <ul>
                  <li>
                    <strong>New message</strong>
                    <span> - </span>
                    <span>You have 3 unread messages</span>
                  </li>
                  <li>
                    <strong>Update available</strong>
                    <span> - </span>
                    <span>Version 2.0 is now available</span>
                  </li>
                </ul>
              </section>
            </div>
            """
        }
    }
    
    @Test("HTMLBuilder with switch statements")
    func switchStatementBuilder() throws {
        struct StatusBadge: HTML.View {
            enum Status {
                case active, pending, inactive, error
            }
            
            let status: Status
            
            var body: some HTML.View {
                span {
                    switch status {
                    case .active:
                        span { "●" }
                            .style("color: green")
                        " Active"
                    case .pending:
                        span { "○" }
                            .style("color: orange")  
                        " Pending"
                    case .inactive:
                        span { "○" }
                            .style("color: gray")
                        " Inactive"
                    case .error:
                        span { "✕" }
                            .style("color: red")
                        " Error"
                    }
                }
                .class("status-badge", "status-\(status)")
            }
        }
        
        let activeBadge = StatusBadge(status: .active)
        assertInlineSnapshot(of: activeBadge, as: .html) {
            """
            <span class="status-badge status-active"><span style="color: green">●</span> Active</span>
            """
        }
        
        let errorBadge = StatusBadge(status: .error)
        assertInlineSnapshot(of: errorBadge, as: .html) {
            """
            <span class="status-badge status-error"><span style="color: red">✕</span> Error</span>
            """
        }
    }
}
```

## Best Practices

### 1. Keep Builder Blocks Focused

Break complex builders into smaller pieces:

```swift
// Good: Focused builders
var body: some HTML.View {
    renderHeader()
    renderMainContent()
    renderSidebar()
    renderFooter()
}

// Avoid: Everything in one builder
var body: some HTML.View {
    // 100 lines of mixed content...
}
```

### 2. Use Semantic Grouping

Group related elements logically:

```swift
form {
    // Group related fields
    fieldset {
        legend { "Personal Information" }
        labeledInput("First Name", name: "firstName")
        labeledInput("Last Name", name: "lastName")
    }
    
    fieldset {
        legend { "Contact Details" }
        labeledInput("Email", name: "email", type: .email)
        labeledInput("Phone", name: "phone", type: .tel)
    }
}
```

### 3. Extract Repeated Patterns

Create builder functions for repeated patterns:

```swift
@HTML.Builder
func labeledInput(
    _ label: String,
    name: String,
    type: InputType = .text
) -> some HTML.View {
    label {
        span { label }
        input(type: type, name: name)
    }
    .class("form-field")
}
```

## Conclusion

The @HTML.Builder attribute is what makes swift-html feel natural and SwiftUI-like. It enables:

- Clean, declarative syntax
- Seamless integration of Swift control flow
- Type-safe HTML composition
- Zero runtime overhead
- Familiar patterns for Swift developers

Understanding HTMLBuilder helps you write more expressive and maintainable HTML generation code.

## Next Steps

- Explore <doc:CustomComponents> to build reusable components with HTMLBuilder
- Learn about <doc:RenderingHTML> to understand how builder results become HTML
- Check out <doc:HTMLDocuments> for document-level builders
- Read <doc:StylingWithCSS> to style your builder-created HTML
