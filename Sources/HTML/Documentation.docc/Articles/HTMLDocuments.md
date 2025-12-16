# HTML Documents

Learn how to create complete, well-structured HTML documents with proper metadata, styling, and semantic structure.

## Overview

While individual HTML components are useful, most web applications need complete HTML documents with proper structure, metadata, and resource management. swift-html provides the `HTMLDocument` and `HTMLDocumentProtocol` types to help you create full HTML pages with all the necessary elements for modern web development.

## The HTMLDocument Protocol

The `HTMLDocumentProtocol` provides a structured way to define complete HTML documents:

```swift
public protocol HTMLDocumentProtocol: HTML.View {
    associatedtype Head: HTML
    associatedtype Body: HTML
    
    @HTML.Builder var head: Head { get }
    @HTML.Builder var body: Body { get }
}
```

### Basic Document Structure

```swift
struct HomePage: HTMLDocumentProtocol {
    var head: some HTML.View {
        title { "Welcome to My Site" }
        meta(charset: .utf8)
        meta(name: .viewport, content: "width=device-width, initial-scale=1")
    }
    
    var body: some HTML.View {
        h1 { "Welcome!" }
        p { "This is my website built with swift-html." }
    }
}

// Renders complete HTML document with <!DOCTYPE html>
let html = try String(HomePage())
```

## Creating Documents

### 1. Protocol Conformance

The most common approach is creating types that conform to `HTMLDocumentProtocol`:

```swift
struct BlogPost: HTMLDocumentProtocol {
    let post: Post
    
    var head: some HTML.View {
        title { post.title }
        meta(charset: .utf8)
        meta(name: .description, content: post.summary)
        meta(name: .author, content: post.author.name)
        
        // Open Graph tags for social sharing
        meta(property: "og:title", content: post.title)
        meta(property: "og:description", content: post.summary)
        meta(property: "og:image", content: post.featuredImage)
        meta(property: "og:type", content: "article")
        
        // Styling
        link(rel: .stylesheet, href: "/css/blog.css")
    }
    
    var body: some HTML.View {
        article {
            header {
                h1 { post.title }
                p {
                    "By "
                    span { post.author.name }
                    " on "
                    time(datetime: post.publishedAt) {
                        post.formattedDate
                    }
                }
                .class("meta")
            }
            
            div {
                HTMLRaw(post.htmlContent)
            }
            .class("content")
            
            footer {
                TagList(tags: post.tags)
                ShareButtons(url: post.url)
            }
        }
        .class("blog-post")
    }
}
```

### 2. Inline Documents

For simpler cases, use the `HTMLDocument` initializer:

```swift
let document = HTML.Document {
    // Body content
    div {
        h1 { "Quick Page" }
        p { "This is a simple page." }
    }
} head: {
    // Head content
    title { "Quick Page" }
    meta(charset: .utf8)
}

let html = try String(document)
```

## Document Components

### Essential Meta Tags

Every HTML document should include essential metadata:

```swift
struct BaseDocument: HTMLDocumentProtocol {
    let pageTitle: String
    let description: String
    
    var head: some HTML.View {
        // Essential meta tags
        meta(charset: .utf8)
        meta(name: .viewport, content: "width=device-width, initial-scale=1")
        meta(httpEquiv: .xUACompatible, content: "IE=edge")
        
        // SEO
        title { pageTitle }
        meta(name: .description, content: description)
        
        // Security
        meta(httpEquiv: .contentSecurityPolicy, 
             content: "default-src 'self'")
    }
    
    var body: some HTML.View {
        // Override in subclasses
        HTML.Empty()
    }
}
```

### Resource Management

Organize CSS, JavaScript, and other resources:

```swift
struct ResourcefulDocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        title { "My App" }
        
        // CSS Resources
        link(rel: .stylesheet, href: "/css/reset.css")
        link(rel: .stylesheet, href: "/css/variables.css")
        link(rel: .stylesheet, href: "/css/components.css")
        link(rel: .stylesheet, href: "/css/layout.css")
        
        // Preload critical resources
        link(rel: .preload, href: "/fonts/main.woff2", as: .font, type: "font/woff2", crossorigin: .anonymous)
        
        // Favicon
        link(rel: .icon, type: "image/x-icon", href: "/favicon.ico")
        link(rel: .icon, type: "image/png", sizes: "32x32", href: "/favicon-32x32.png")
        
        // JavaScript (deferred)
        script(src: "/js/app.js", defer: true)
    }
    
    var body: some HTML.View {
        div {
            Header()
            MainContent()
            Footer()
        }
        .id("app")
    }
}
```

### Responsive Design

Build mobile-friendly documents:

```swift
struct ResponsiveDocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        title { "Responsive Site" }
        meta(charset: .utf8)
        meta(name: .viewport, content: "width=device-width, initial-scale=1, maximum-scale=5")
        
        // Mobile-specific meta tags
        meta(name: .mobileWebAppCapable, content: "yes")
        meta(name: .appleStatusBarStyle, content: "black-translucent")
        
        // Responsive CSS
        style {
            """
            :root {
                --content-width: min(100% - 2rem, 1200px);
            }
            
            @media (max-width: 768px) {
                .hide-mobile { display: none; }
            }
            
            @media (min-width: 769px) {
                .hide-desktop { display: none; }
            }
            """
        }
    }
    
    var body: some HTML.View {
        // Content adapts to screen size
        div {
            nav {
                // Mobile menu
                button { "☰" }
                    .class("menu-toggle", "hide-desktop")
                
                // Desktop menu
                ul {
                    li { a(href: "/") { "Home" } }
                    li { a(href: "/about") { "About" } }
                    li { a(href: "/contact") { "Contact" } }
                }
                .class("hide-mobile")
            }
        }
    }
}
```

## Advanced Document Features

### 1. Dynamic Head Content

Conditionally include resources based on content:

```swift
struct SmartDocument: HTMLDocumentProtocol {
    let includeCharts: Bool
    let includeComments: Bool
    let colorScheme: ColorScheme
    
    var head: some HTML.View {
        title { "Smart Page" }
        meta(charset: .utf8)
        
        // Conditional resources
        if includeCharts {
            script(src: "https://cdn.jsdelivr.net/npm/chart.js")
        }
        
        if includeComments {
            script(src: "/js/comments.js", defer: true)
            link(rel: .stylesheet, href: "/css/comments.css")
        }
        
        // Theme-specific styles
        switch colorScheme {
        case .light:
            link(rel: .stylesheet, href: "/css/light-theme.css")
        case .dark:
            link(rel: .stylesheet, href: "/css/dark-theme.css")
        case .auto:
            style {
                """
                @media (prefers-color-scheme: dark) {
                    @import url('/css/dark-theme.css');
                }
                @media (prefers-color-scheme: light) {
                    @import url('/css/light-theme.css');
                }
                """
            }
        }
    }
    
    var body: some HTML.View {
        // Body adjusts based on features
        MainContent()
        
        if includeCharts {
            ChartSection()
        }
        
        if includeComments {
            CommentSection()
        }
    }
}
```

### 2. SEO Optimization

Create SEO-friendly documents:

```swift
struct SEOOptimizedDocument: HTMLDocumentProtocol {
    let page: SEOPage
    
    var head: some HTML.View {
        // Basic SEO
        title { page.title }
        meta(name: .description, content: page.description)
        meta(name: .keywords, content: page.keywords.joined(separator: ", "))
        
        // Canonical URL
        link(rel: .canonical, href: page.canonicalURL)
        
        // Open Graph
        meta(property: "og:title", content: page.title)
        meta(property: "og:description", content: page.description)
        meta(property: "og:image", content: page.socialImage)
        meta(property: "og:url", content: page.canonicalURL)
        meta(property: "og:type", content: page.type.rawValue)
        
        // Twitter Card
        meta(name: .twitterCard, content: "summary_large_image")
        meta(name: .twitterTitle, content: page.title)
        meta(name: .twitterDescription, content: page.description)
        meta(name: .twitterImage, content: page.socialImage)
        
        // Structured Data
        script(type: "application/ld+json") {
            JavaScript(page.structuredData)
        }
    }
    
    var body: some HTML.View {
        // Semantic HTML for better SEO
        header {
            nav {
                // Breadcrumbs for navigation
                ol {
                    HTMLForEach(page.breadcrumbs) { crumb in
                        li {
                            a(href: crumb.url) { crumb.title }
                        }
                    }
                }
                .itemscope(true)
                .itemtype("https://schema.org/BreadcrumbList")
            }
        }
        
        main {
            article {
                h1 { page.title }
                page.content
            }
            .itemscope(true)
            .itemtype("https://schema.org/Article")
        }
        
        Footer()
    }
}
```

### 3. Progressive Web App

Create PWA-ready documents:

```swift
struct PWADocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        title { "My PWA" }
        meta(charset: .utf8)
        meta(name: .viewport, content: "width=device-width, initial-scale=1")
        
        // PWA meta tags
        meta(name: .themeColor, content: "#007AFF")
        meta(name: .mobileWebAppCapable, content: "yes")
        meta(name: .appleStatusBarStyle, content: "default")
        
        // Manifest
        link(rel: .manifest, href: "/manifest.json")
        
        // iOS icons
        link(rel: .appleTouchIcon, href: "/icons/icon-192x192.png")
        
        // Service worker registration
        script {
            JavaScript("""
            if ('serviceWorker' in navigator) {
                navigator.serviceWorker.register('/sw.js');
            }
            """)
        }
    }
    
    var body: some HTML.View {
        div {
            AppShell()
        }
        .id("app")
        
        // Offline message
        noscript {
            p { "This app requires JavaScript to run." }
        }
    }
}
```

## Document Composition

### Base Document Pattern

Create a base document that other pages extend:

```swift
protocol SiteDocument: HTMLDocumentProtocol {
    var pageTitle: String { get }
    var pageContent: any HTML { get }
}

extension SiteDocument {
    var head: some HTML.View {
        BaseHead(title: pageTitle)
    }
    
    var body: some HTML.View {
        div {
            SiteHeader()
            main {
                pageContent
            }
            SiteFooter()
        }
        .class("site-wrapper")
    }
}

// Concrete pages
struct AboutPage: SiteDocument {
    let pageTitle = "About Us"
    
    var pageContent: some HTML.View {
        div {
            h1 { "About Our Company" }
            p { "We are..." }
        }
    }
}
```

### Layout Templates

Create reusable layout templates:

```swift
struct LayoutTemplate: HTMLDocumentProtocol {
    let title: String
    let layout: Layout
    let content: any HTML
    
    enum Layout {
        case single
        case twoColumn
        case threeColumn
    }
    
    var head: some HTML.View {
        title { self.title }
        meta(charset: .utf8)
        link(rel: .stylesheet, href: "/css/layouts.css")
    }
    
    var body: some HTML.View {
        switch layout {
        case .single:
            SingleColumnLayout { content }
        case .twoColumn:
            TwoColumnLayout(
                main: content,
                sidebar: Sidebar()
            )
        case .threeColumn:
            ThreeColumnLayout(
                left: Navigation(),
                center: content,
                right: Sidebar()
            )
        }
    }
}
```

## Performance Optimization

### 1. Critical CSS

Inline critical CSS for faster rendering:

```swift
struct OptimizedDocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        title { "Fast Page" }
        
        // Inline critical CSS
        style {
            CSS(CriticalCSS.content)
        }
        
        // Load non-critical CSS asynchronously
        link(
            rel: .preload,
            href: "/css/main.css",
            as: .style,
            onload: "this.onload=null;this.rel='stylesheet'"
        )
        
        // Fallback for no-JS
        noscript {
            link(rel: .stylesheet, href: "/css/main.css")
        }
    }
    
    var body: some HTML.View {
        // Content renders immediately with critical CSS
        MainContent()
    }
}
```

### 2. Resource Hints

Use resource hints for better performance:

```swift
struct PerformantDocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        // DNS prefetch for external domains
        link(rel: .dnsPrefetch, href: "//cdn.example.com")
        link(rel: .dnsPrefetch, href: "//api.example.com")
        
        // Preconnect for critical origins
        link(rel: .preconnect, href: "https://fonts.googleapis.com")
        link(rel: .preconnect, href: "https://fonts.gstatic.com", crossorigin: .anonymous)
        
        // Prefetch likely next pages
        link(rel: .prefetch, href: "/about")
        link(rel: .prefetch, href: "/products")
        
        // Preload critical resources
        link(rel: .preload, href: "/js/app.js", as: .script)
        link(rel: .preload, href: "/css/critical.css", as: .style)
    }
    
    var body: some HTML.View {
        // Page content
    }
}
```

## Testing Documents

Test your documents thoroughly using HTMLTestSupport's inline snapshot testing:

### Basic Document Testing

```swift
import Testing
import HTML_Rendering_TestSupport
@testable import MyApp

@Suite("Document Tests")
struct DocumentTests {
    @Test("Document has correct HTML structure")
    func documentStructure() throws {
        let doc = HomePage()
        let html = try String(doc)
        
        // Check for required elements
        #expect(html.contains("<!DOCTYPE html>"))
        #expect(html.contains("<html"))
        #expect(html.contains("<head>"))
        #expect(html.contains("<body>"))
        #expect(html.contains("</html>"))
    }
    
    @Test("SEO document includes all meta tags")
    func metaTags() throws {
        let doc = SEOOptimizedDocument(page: testPage)
        let html = try String(doc)
        
        // Verify meta tags
        #expect(html.contains("charset=\"utf-8\""))
        #expect(html.contains("name=\"viewport\""))
        #expect(html.contains("property=\"og:title\""))
    }
}
```

### Inline Snapshot Testing for Documents

HTMLTestSupport makes it easy to test complete documents with inline snapshots:

```swift
@Suite("Document Snapshot Tests")
struct DocumentSnapshotTests {
    @Test("Simple document renders correctly")
    func simpleDocument() throws {
        let doc = HTML.Document {
            div {
                h1 { "Hello, World!" }
                p { "Welcome to swift-html" }
            }
        } head: {
            title { "Test Page" }
            meta(charset: .utf8)
        }
        
        assertInlineSnapshot(of: doc, as: .html) {
            """
            <!DOCTYPE html>
            <html>
              <head>
                <title>Test Page</title>
                <meta charset="utf-8">
              </head>
              <body>
                <div>
                  <h1>Hello, World!</h1>
                  <p>Welcome to swift-html</p>
                </div>
              </body>
            </html>
            """
        }
    }
    
    @Test("Blog post with metadata")
    func blogPostDocument() throws {
        let post = BlogPost(
            post: Post(
                title: "Introduction to swift-html",
                summary: "Learn the basics of type-safe HTML generation",
                author: Author(name: "Jane Developer"),
                publishedAt: Date(timeIntervalSince1970: 1704067200),
                featuredImage: "/images/swift-html-intro.jpg",
                htmlContent: "<p>This is the post content...</p>",
                tags: ["swift", "html", "web"]
            )
        )
        
        assertInlineSnapshot(of: post, as: .html) {
            """
            <!DOCTYPE html>
            <html>
              <head>
                <title>Introduction to swift-html</title>
                <meta charset="utf-8">
                <meta name="description" content="Learn the basics of type-safe HTML generation">
                <meta name="author" content="Jane Developer">
                <meta property="og:title" content="Introduction to swift-html">
                <meta property="og:description" content="Learn the basics of type-safe HTML generation">
                <meta property="og:image" content="/images/swift-html-intro.jpg">
                <meta property="og:type" content="article">
                <link rel="stylesheet" href="/css/blog.css">
              </head>
              <body>
                <article class="blog-post">
                  <header>
                    <h1>Introduction to swift-html</h1>
                    <p class="meta">
                      By <span>Jane Developer</span> on <time datetime="2024-01-01T00:00:00Z">January 1, 2024</time>
                    </p>
                  </header>
                  <div class="content">
                    <p>This is the post content...</p>
                  </div>
                  <footer>
                    <div class="tags">
                      <span class="tag">swift</span>
                      <span class="tag">html</span>
                      <span class="tag">web</span>
                    </div>
                    <div class="share-buttons">
                      <a href="/share/twitter">Share on Twitter</a>
                      <a href="/share/facebook">Share on Facebook</a>
                    </div>
                  </footer>
                </article>
              </body>
            </html>
            """
        }
    }
    
    @Test("Document with conditional resources")
    func conditionalResourcesDocument() throws {
        let doc = SmartDocument(
            includeCharts: true,
            includeComments: false,
            colorScheme: .dark
        )
        
        // Test just the head section for conditional resources
        assertInlineSnapshot(of: doc.head, as: .html) {
            """
            <title>Smart Page</title>
            <meta charset="utf-8">
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <link rel="stylesheet" href="/css/dark-theme.css">
            """
        }
    }
}
```

## Best Practices

### 1. Document Organization

Structure your documents logically:

```swift
// ✅ Good: Clear separation of concerns
struct WellOrganizedDocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        MetaTags()
        Resources()
        Analytics()
    }
    
    var body: some HTML.View {
        SkipToContent()
        Header()
        MainContent()
        Footer()
        Scripts()
    }
}

// ❌ Avoid: Everything mixed together
struct PoorlyOrganizedDocument: HTMLDocumentProtocol {
    var head: some HTML.View {
        // 100 lines of mixed content...
    }
}
```

### 2. Semantic HTML

Use semantic elements for better accessibility:

```swift
var body: some HTML.View {
    header {
        nav { /* navigation */ }
    }
    
    main {
        article {
            header { /* article header */ }
            section { /* content */ }
            footer { /* article footer */ }
        }
        
        aside { /* sidebar */ }
    }
    
    footer {
        /* site footer */
    }
}
```

### 3. Progressive Enhancement

Build documents that work without JavaScript:

```swift
var body: some HTML.View {
    // Core content works without JS
    form(action: "/search", method: .get) {
        input(type: .search, name: "q", placeholder: "Search...")
        button(type: .submit) { "Search" }
    }
    
    // Enhanced with JS
    script {
        JavaScript("""
        // Add autocomplete and instant search
        enhanceSearch();
        """)
    }
}
```

## Conclusion

HTMLDocument provides a powerful way to create complete, well-structured HTML pages. Key benefits include:

- **Structure**: Clear separation of head and body content
- **Type Safety**: Compile-time validation of document structure  
- **Reusability**: Easy to create document templates and layouts
- **SEO-Friendly**: Built-in support for meta tags and structured data
- **Performance**: Optimizations like critical CSS and resource hints

## Next Steps

- Explore <doc:StylingWithCSS> for document styling
- Learn about <doc:PlatformIntegration> for rendering documents
- Read <doc:PerformanceGuide> for optimization techniques
- Check out <doc:CustomComponents> for reusable document parts
