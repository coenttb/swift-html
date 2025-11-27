# Rendering HTML

Learn how swift-html efficiently converts your type-safe HTML components into strings and bytes.

## Overview

Rendering is the process of transforming your HTML components into their final output format. swift-html provides two primary rendering methods: string rendering for convenience and byte rendering for performance. This article explores both approaches, their trade-offs, and best practices for different use cases.

## Rendering Methods

### String Rendering

The simplest way to render HTML is to convert it to a String:

```swift
let greeting = h1 { "Hello, World!" }
let htmlString = try String(greeting)
// Result: <h1>Hello, World!</h1>

// For complete documents
let page = HomePage()
let fullHTML = try String(page)
```

String rendering is ideal for:
- Development and debugging
- Small-scale applications
- Client-side rendering
- Testing

### Byte Rendering

For performance-critical applications, render directly to bytes:

```swift
let greeting = h1 { "Hello, World!" }
let bytes: ContiguousArray<UInt8> = greeting.render()

// Use with web frameworks
response.body = Data(bytes)
response.headers["Content-Type"] = "text/html; charset=utf-8"
```

Byte rendering is ideal for:
- Server-side applications
- High-traffic websites
- Streaming responses
- Memory-constrained environments

## How Rendering Works

### The Rendering Pipeline

```
HTML Component
     ↓
HTML Protocol conformance
     ↓
Traverse component tree
     ↓
Generate output tokens
     ↓
String or Bytes
```

### Under the Hood

When you render HTML, swift-html:

1. **Traverses the component tree** - Starting from the root component
2. **Evaluates each component's body** - Recursively rendering children
3. **Generates HTML tokens** - Opening tags, content, closing tags
4. **Accumulates output** - Either as string or byte buffer

```swift
// This component tree
div {
    h1 { "Title" }
    p { "Content" }
}

// Becomes this token stream
// <div>
//   <h1>Title</h1>
//   <p>Content</p>
// </div>
```

## Performance Optimization

### 1. Byte Rendering Performance

Byte rendering is significantly faster than string rendering:

```swift
// Benchmark example
let component = LargeHTMLComponent()

// String rendering - allocates intermediate strings
measure {
    _ = try? String(component)  // ~100ms for large components
}

// Byte rendering - writes directly to buffer
measure {
    _ = component.render()  // ~10ms for same component
}
```

### 2. Streaming Rendering

For very large documents, consider streaming:

```swift
struct StreamingResponse {
    let html: any HTML
    
    func write(to output: inout Data) {
        // Render in chunks to avoid memory spikes
        let bytes = html.render()
        output.append(contentsOf: bytes)
    }
}
```

### 3. Caching Rendered Content

Cache static content to avoid re-rendering:

```swift
struct CachedFooter: HTML.View {
    private static let cachedBytes: ContiguousArray<UInt8> = {
        Footer().render()
    }()
    
    var body: some HTML.View {
        HTMLRaw(Self.cachedBytes)
    }
}
```

## Rendering Special Content

### 1. Raw HTML

Sometimes you need to include pre-rendered HTML:

```swift
struct LegacyContent: HTML.View {
    let rawHTML: String
    
    var body: some HTML.View {
        HTMLRaw(rawHTML)  // Renders exactly as provided
    }
}

// Use with caution - no safety checks!
let legacy = LegacyContent(
    rawHTML: "<div class='legacy'>Old content</div>"
)
```

### 2. Escaped Content

Text content is automatically escaped:

```swift
p {
    "This & that"        // Rendered as: This &amp; that
    "5 < 10"            // Rendered as: 5 &lt; 10
    "Say \"Hello\""     // Rendered as: Say &quot;Hello&quot;
}

// To include literal HTML entities
p {
    HTMLText("Copyright ")
    HTMLEntity.copy  // © symbol
    HTMLText(" 2024")
}
```

### 3. JavaScript and CSS

Script and style content requires special handling:

```swift
script {
    JavaScript("""
    function handleClick() {
        console.log("Clicked!");
    }
    """)
}

style {
    CSS("""
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    """)
}
```

## Rendering Contexts

### 1. Server-Side Rendering (SSR)

For web servers, optimize for byte rendering:

```swift
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        let page = HomePage(user: req.user)
        let bytes = page.render()
        
        return Response(
            status: .ok,
            headers: ["Content-Type": "text/html; charset=utf-8"],
            body: .init(data: bytes)
        )
    }
}
```

### 2. Static Site Generation

Pre-render pages at build time:

```swift
let pages = [
    ("index.html", HomePage()),
    ("about.html", AboutPage()),
    ("contact.html", ContactPage())
]

for (filename, page) in pages {
    let html = try String(page)
    try html.write(to: outputDirectory.appendingPathComponent(filename))
}
```

### 3. Email Templates

Render HTML for emails with inline styles:

```swift
struct EmailTemplate: HTML.View {
    let recipient: String
    let subject: String
    
    var body: some HTML.View {
        html {
            head {
                style {
                    """
                    body { font-family: system-ui; }
                    .button { 
                        background: #007AFF; 
                        color: white;
                        padding: 10px 20px;
                        text-decoration: none;
                        border-radius: 5px;
                    }
                    """
                }
            }
            body {
                h1 { "Hello, \(recipient)!" }
                p { subject }
                a(href: "https://example.com") { "Visit Site" }
                    .class("button")
            }
        }
    }
}
```

## Error Handling

### Rendering Errors

String rendering can throw errors:

```swift
do {
    let html = try String(component)
    // Use html
} catch {
    // Handle encoding errors
    print("Rendering failed: \(error)")
}
```

### Safe Rendering

Create a safe rendering wrapper:

```swift
extension HTML {
    func renderSafely() -> String {
        do {
            return try String(self)
        } catch {
            return "<p>Error rendering content</p>"
        }
    }
}
```

## Testing Rendered Output

swift-html provides comprehensive testing support through HTMLTestSupport, making it easy to test rendered output with inline snapshots:

### 1. Inline Snapshot Testing

HTMLTestSupport provides powerful inline snapshot testing capabilities:

```swift
import Testing
import HTML_Renderable_TestSupport
@testable import MyApp

@Suite("Rendering Tests")
struct RenderingTests {
    @Test("Component renders expected HTML")
    func componentRendering() throws {
        let component = UserCard(name: "Alice", role: "Developer")
        
        assertInlineSnapshot(of: component, as: .html) {
            """
            <div class="user-card">
              <h2>Alice</h2>
              <p>Developer</p>
            </div>
            """
        }
    }
    
    @Test("Pretty printed output for readability")
    func prettyPrintedRendering() throws {
        let page = HomePage(
            title: "Welcome",
            sections: [
                Section(title: "Features", items: ["Type-safe", "Fast", "Composable"]),
                Section(title: "Benefits", items: ["No runtime errors", "Great DX"])
            ]
        )
        
        assertInlineSnapshot(of: page, as: .html) {
            """
            <div class="home-page">
              <h1>Welcome</h1>
              <section>
                <h2>Features</h2>
                <ul>
                  <li>Type-safe</li>
                  <li>Fast</li>
                  <li>Composable</li>
                </ul>
              </section>
              <section>
                <h2>Benefits</h2>
                <ul>
                  <li>No runtime errors</li>
                  <li>Great DX</li>
                </ul>
              </section>
            </div>
            """
        }
    }
}
```

### 2. Testing Different Rendering Modes

Test both string and byte rendering:

```swift
@Suite("Rendering Mode Tests")
struct RenderingModeTests {
    @Test("String and byte rendering produce same content")
    func renderingModes() throws {
        let component = Article(
            title: "Testing Rendering",
            content: "Ensuring consistency across rendering modes"
        )
        
        // String rendering
        let stringOutput = try String(component)
        
        // Byte rendering
        let byteOutput = component.render()
        let byteString = String(decoding: byteOutput, as: UTF8.self)
        
        #expect(stringOutput == byteString)
        
        // Also verify with snapshot
        assertInlineSnapshot(of: component, as: .html) {
            """
            <article>
              <h1>Testing Rendering</h1>
              <p>Ensuring consistency across rendering modes</p>
            </article>
            """
        }
    }
    
    @Test("Special characters are properly escaped")
    func escaping() throws {
        let content = div {
            p { "Price: $99 & save 20% < 30%" }
            p { "Quote: \"Hello, World!\"" }
            script { "console.log('Not escaped in script');" }
        }
        
        assertInlineSnapshot(of: content, as: .html) {
            """
            <div>
              <p>Price: $99 &amp; save 20% &lt; 30%</p>
              <p>Quote: &quot;Hello, World!&quot;</p>
              <script>console.log('Not escaped in script');</script>
            </div>
            """
        }
    }
}
```

### 3. Performance and Output Size Testing

Test rendering performance and output characteristics:

```swift
@Suite("Rendering Performance Tests")
struct RenderingPerformanceTests {
    @Test("Large table renders efficiently")
    func largeTableRendering() throws {
        let rows = (1...100).map { i in
            TableRow(id: "\(i)", name: "Item \(i)", value: Double(i) * 1.5)
        }
        
        let table = DataTable(rows: rows)
        
        // Measure rendering time
        let start = Date()
        let rendered = table.render()
        let duration = Date().timeIntervalSince(start)
        
        #expect(duration < 0.05) // Should render in under 50ms
        
        // Verify output structure with snapshot (showing just first few rows)
        let preview = DataTable(rows: Array(rows.prefix(3)))
        assertInlineSnapshot(of: preview, as: .html) {
            """
            <table class="data-table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Value</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>Item 1</td>
                  <td>1.5</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>Item 2</td>
                  <td>3.0</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>Item 3</td>
                  <td>4.5</td>
                </tr>
              </tbody>
            </table>
            """
        }
    }
    
    @Test("Minified vs pretty printed size comparison")
    func outputSize() throws {
        let component = ComplexForm(
            fields: [
                FormField(name: "username", type: .text, label: "Username"),
                FormField(name: "email", type: .email, label: "Email"),
                FormField(name: "password", type: .password, label: "Password")
            ]
        )
        
        // Minified output
        let minified = try String(component)
        
        // Pretty printed output (for comparison)
        assertInlineSnapshot(of: component, as: .html) {
            """
            <form class="complex-form">
              <div class="form-field">
                <label for="username">Username</label>
                <input type="text" name="username" id="username">
              </div>
              <div class="form-field">
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
              </div>
              <div class="form-field">
                <label for="password">Password</label>
                <input type="password" name="password" id="password">
              </div>
            </form>
            """
        }
        
        // Verify minified is smaller
        #expect(minified.count < 400) // Rough size check
    }
}
```

## Advanced Rendering Techniques

### 1. Custom Renderers

Create specialized renderers for different formats:

```swift
protocol HTMLRenderer {
    func render(_ html: any HTML.View) -> Data
}

struct MinifiedHTMLRenderer: HTMLRenderer {
    func render(_ html: any HTML.View) -> Data {
        let bytes = html.render()
        // Remove unnecessary whitespace
        return minify(bytes)
    }
}

struct PrettyHTMLRenderer: HTMLRenderer {
    func render(_ html: any HTML.View) -> Data {
        let bytes = html.render()
        // Add indentation for readability
        return prettify(bytes)
    }
}
```

### 2. Partial Rendering

Render only parts of a page:

```swift
struct PartialRenderer {
    static func renderFragment(_ html: any HTML.View) -> String {
        // Render without doctype or html wrapper
        return try! String(html)
    }
    
    static func renderForHTMX(_ html: any HTML.View) -> String {
        // Special handling for HTMX responses
        return renderFragment(html)
    }
}
```

### 3. Streaming Large Documents

For very large documents, stream the output:

```swift
struct StreamingRenderer {
    let output: FileHandle
    
    func render(_ component: any HTML.View) throws {
        let bytes = component.render()
        
        // Write in chunks to avoid memory issues
        let chunkSize = 1024 * 1024  // 1MB chunks
        for chunk in bytes.chunked(into: chunkSize) {
            try output.write(contentsOf: chunk)
        }
    }
}
```

## Rendering Best Practices

### 1. Choose the Right Method

- **Development**: Use string rendering for debugging
- **Production**: Use byte rendering for performance
- **Static Sites**: Pre-render at build time
- **Dynamic Content**: Render on-demand with caching

### 2. Optimize Component Structure

```swift
// Inefficient: Many small renders
var body: some HTML.View {
    for item in items {
        ItemComponent(item: item)  // Each renders separately
    }
}

// Efficient: Batch rendering
var body: some HTML.View {
    HTMLForEach(items) { item in
        // Rendered as a batch
        li { item.title }
    }
}
```

### 3. Handle Character Encoding

Ensure proper UTF-8 handling:

```swift
let html = try String(component)
let data = html.data(using: .utf8)!

// Always specify charset
response.headers["Content-Type"] = "text/html; charset=utf-8"
```

### 4. Memory Management

For large-scale rendering:

```swift
// Release memory after rendering
autoreleasepool {
    let bytes = component.render()
    writeToResponse(bytes)
}
```

## Platform-Specific Rendering

### iOS/macOS WebView

Render for native web views:

```swift
import WebKit

extension WKWebView {
    func load(_ html: any HTML.View) {
        let htmlString = try! String(html)
        loadHTMLString(htmlString, baseURL: nil)
    }
}
```

### Linux Server Deployment

Optimize for server environments:

```swift
// Use byte rendering for efficiency
app.get("page") { req -> Response in
    let page = PageComponent(request: req)
    let bytes = page.render()
    
    return Response(
        body: .init(buffer: ByteBuffer(bytes: bytes))
    )
}
```

## Troubleshooting

### Common Rendering Issues

1. **Encoding Problems**
   ```swift
   // Ensure UTF-8 encoding
   let html = try String(component)
   let data = html.data(using: .utf8)!
   ```

2. **Memory Usage**
   ```swift
   // For large renders, use streaming
   let bytes = component.render()
   // Process in chunks
   ```

3. **Performance**
   ```swift
   // Profile rendering
   let start = Date()
   let _ = component.render()
   print("Rendered in \(Date().timeIntervalSince(start))s")
   ```

## Conclusion

swift-html's rendering system provides:

- **Flexibility**: String or byte output
- **Performance**: Optimized byte rendering
- **Safety**: Automatic escaping
- **Simplicity**: Intuitive API

Understanding rendering helps you:
- Choose the right method for your use case
- Optimize performance
- Handle edge cases properly
- Build efficient web applications

## Next Steps

- Learn about <doc:HTMLDocuments> for complete page rendering
- Explore <doc:CustomComponents> for reusable renders
- Read <doc:PerformanceGuide> for optimization tips
- Check out <doc:PlatformIntegration> for framework-specific rendering
