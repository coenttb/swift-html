# Styling with CSS

Master type-safe CSS styling in swift-html using modifiers, classes, and inline styles.

## Overview

swift-html provides multiple approaches to styling your HTML, from type-safe CSS modifiers to traditional classes and inline styles. This comprehensive guide explores all styling methods, helping you choose the right approach for your needs while maintaining type safety and clean code.

## Type-Safe CSS Modifiers

### Basic Modifiers

Apply CSS properties directly to elements using type-safe modifiers:

```swift
div { "Hello, World!" }
    .padding(.rem(2))
    .backgroundColor(.blue)
    .color(.white)
    .fontSize(.px(24))
    .borderRadius(.px(8))
    .boxShadow(.px(0), .px(4), .px(6), .rgba(0, 0, 0, 0.1))
```

### Chaining Modifiers

Modifiers can be chained for complex styling:

```swift
button { "Click Me" }
    // Typography
    .fontSize(.rem(1))
    .fontWeight(.bold)
    .textTransform(.uppercase)
    .letterSpacing(.px(1))
    
    // Colors
    .color(.white)
    .backgroundColor(.blue600)
    
    // Spacing
    .padding(.vertical(.rem(0.75)), .horizontal(.rem(1.5)))
    .margin(.auto)
    
    // Borders
    .border(.px(2), .solid, .blue700)
    .borderRadius(.px(6))
    
    // Effects
    .cursor(.pointer)
    .transition(.all, .ms(200), .easeInOut)
    .hover {
        $0.backgroundColor(.blue700)
          .transform(.scale(1.05))
    }
```

## CSS Units and Values

### Length Units

swift-html supports all CSS length units with type safety:

```swift
// Absolute units
.width(.px(200))        // Pixels
.width(.pt(12))         // Points
.width(.pc(1))          // Picas
.width(.cm(5))          // Centimeters
.width(.mm(50))         // Millimeters
.width(.in(2))          // Inches

// Relative units
.fontSize(.em(1.5))     // Relative to parent font size
.padding(.rem(2))       // Relative to root font size
.width(.percent(50))    // Percentage
.height(.vh(100))       // Viewport height
.width(.vw(80))         // Viewport width
.fontSize(.vmin(5))     // Minimum of vw and vh
.fontSize(.vmax(5))     // Maximum of vw and vh

// Flexible units
.flex(.fr(1))           // Fraction unit for grid
```

### Color Values

Work with colors in multiple formats:

```swift
// Named colors
.color(.red)
.backgroundColor(.blue)
.borderColor(.transparent)

// Hex colors
.color(.hex("#FF5733"))
.backgroundColor(.hex("#1a202c"))

// RGB/RGBA
.color(.rgb(255, 87, 51))
.backgroundColor(.rgba(26, 32, 44, 0.8))

// HSL/HSLA
.color(.hsl(360, 100, 50))
.backgroundColor(.hsla(210, 25, 15, 0.9))

// System colors
.color(.systemBlue)
.backgroundColor(.systemBackground)

// Custom semantic colors
extension CSS.Color {
    static let primary = CSS.Color.hex("#007AFF")
    static let success = CSS.Color.hex("#34C759")
    static let warning = CSS.Color.hex("#FF9500")
    static let danger = CSS.Color.hex("#FF3B30")
}
```

## Layout and Positioning

### Flexbox

Create flexible layouts with type-safe flexbox properties:

```swift
div {
    header { "Header" }
    main { "Content" }
    aside { "Sidebar" }
}
.display(.flex)
.flexDirection(.row)
.justifyContent(.spaceBetween)
.alignItems(.center)
.gap(.rem(2))

// Flex children
main { "Main Content" }
    .flex(2)  // Grow factor
    .alignSelf(.stretch)

aside { "Sidebar" }
    .flex(1)
    .minWidth(.px(200))
```

### Grid

Build complex grid layouts:

```swift
div {
    HTMLForEach(1...12) { item in
        div { "Item \(item)" }
            .backgroundColor(.gray100)
            .padding(.rem(1))
    }
}
.display(.grid)
.gridTemplateColumns(.repeat(.autoFit, .minmax(.px(250), .fr(1))))
.gridGap(.rem(1.5))
.gridAutoRows(.px(100))

// Advanced grid
section {
    header { "Header" }
        .gridArea("header")
    
    nav { "Navigation" }
        .gridArea("nav")
    
    main { "Content" }
        .gridArea("content")
    
    footer { "Footer" }
        .gridArea("footer")
}
.display(.grid)
.gridTemplateAreas("""
    "header header header"
    "nav content content"
    "footer footer footer"
    """)
.gridTemplateColumns(.px(200), .fr(1), .fr(1))
.gridTemplateRows(.auto, .fr(1), .auto)
```

### Positioning

Control element positioning:

```swift
// Relative positioning
div { "Relative" }
    .position(.relative)
    .top(.px(10))
    .left(.px(20))

// Absolute positioning
div { "Absolute" }
    .position(.absolute)
    .top(.px(0))
    .right(.px(0))
    .bottom(.px(0))
    .left(.px(0))

// Fixed positioning
nav { "Fixed Navigation" }
    .position(.fixed)
    .top(.px(0))
    .left(.px(0))
    .right(.px(0))
    .zIndex(1000)

// Sticky positioning
header { "Sticky Header" }
    .position(.sticky)
    .top(.px(0))
    .backgroundColor(.white)
    .boxShadow(.px(0), .px(2), .px(4), .rgba(0, 0, 0, 0.1))
```

## Responsive Design

### Media Queries

Apply responsive styles:

```swift
div { "Responsive Content" }
    .padding(.rem(1))

// Orientation-based
img(src: "photo.jpg", alt: "Photo")
    .width(.percent(100))
```

### Container Queries

Use container queries for component-based responsive design:

```swift
div {
    Card { "Responsive Card" }
}

struct Card: HTML {
    var body: some HTML {
        div { "Card Content" }
            .padding(.rem(1))
    }
}
```

## Advanced Styling Techniques

### Custom Properties (CSS Variables)

Define and use CSS custom properties:

```swift
struct ThemedComponent: HTML {
    var body: some HTML {
        div {
            h1 { "Themed Title" }
            p { "This uses CSS variables" }
        }
        .style("""
            --primary-color: #007AFF;
            --secondary-color: #5856D6;
            --spacing-unit: 1rem;
            """)
        .backgroundColor(.var("--primary-color"))
        .padding(.var("--spacing-unit"))
    }
}

// Global theme
style {
    """
    :root {
        --font-primary: -apple-system, system-ui, sans-serif;
        --color-text: #1a202c;
        --color-background: #ffffff;
        --radius-default: 0.375rem;
    }
    
    @media (prefers-color-scheme: dark) {
        :root {
            --color-text: #f7fafc;
            --color-background: #1a202c;
        }
    }
    """
}
```

### Pseudo-Classes and Pseudo-Elements

Style element states and create virtual elements:

```swift
a(href: "/") { "Link" }
    .color(.blue)
    .textDecoration(.none)
    .hover {
        $0.textDecoration(.underline)
          .color(.darkBlue)
    }
    .focus {
        $0.outline(.px(2), .solid, .blue)
          .outlineOffset(.px(2))
    }
    .active {
        $0.color(.navy)
    }

// Pseudo-elements
p { "Quote" }
    .before {
        $0.content("\"")
          .color(.gray)
          .fontSize(.rem(1.5))
    }
    .after {
        $0.content("\"")
          .color(.gray)
          .fontSize(.rem(1.5))
    }
```

### Animations

Create smooth animations:

```swift
// Keyframe animations
@keyframes("fadeIn") {
    from {
        opacity(0)
        transform(.translateY(.px(20)))
    }
    to {
        opacity(1)
        transform(.translateY(.px(0)))
    }
}

div { "Animated Content" }
    .animation("fadeIn", .ms(500), .easeOut)
    .animationFillMode(.both)

// Transitions
button { "Hover Me" }
    .backgroundColor(.blue)
    .color(.white)
    .padding(.rem(1))
    .transition(.all, .ms(200), .easeInOut)
    .hover {
        $0.backgroundColor(.darkBlue)
          .transform(.scale(1.05))
          .boxShadow(.px(0), .px(10), .px(20), .rgba(0, 0, 0, 0.2))
    }
```

## Styling Patterns

### Component-Based Styling

Create reusable styled components:

```swift
struct Button: HTML {
    enum Style {
        case primary, secondary, danger
        
        var backgroundColor: CSS.Color {
            switch self {
            case .primary: return .blue
            case .secondary: return .gray
            case .danger: return .red
            }
        }
        
        var hoverColor: CSS.Color {
            switch self {
            case .primary: return .darkBlue
            case .secondary: return .darkGray
            case .danger: return .darkRed
            }
        }
    }
    
    let title: String
    let style: Style
    let action: JavaScript?
    
    var body: some HTML {
        button(onclick: action) { title }
            .fontSize(.rem(1))
            .fontWeight(.medium)
            .padding(.vertical(.rem(0.5)), .horizontal(.rem(1)))
            .backgroundColor(style.backgroundColor)
            .color(.white)
            .border(.none)
            .borderRadius(.px(6))
            .cursor(.pointer)
            .transition(.backgroundColor, .ms(150))
            .hover {
                $0.backgroundColor(style.hoverColor)
            }
            .active {
                $0.transform(.scale(0.98))
            }
    }
}
```

### Utility Classes

Combine modifiers with utility classes:

```swift
extension HTML {
    func card() -> some HTML {
        self
            .backgroundColor(.white)
            .borderRadius(.px(8))
            .boxShadow(.px(0), .px(2), .px(4), .rgba(0, 0, 0, 0.1))
            .padding(.rem(1.5))
    }
    
    func container() -> some HTML {
        self
            .maxWidth(.px(1200))
            .margin(.auto)
            .padding(.horizontal(.rem(1)))
    }
    
    func stack(spacing: Length = .rem(1)) -> some HTML {
        self
            .display(.flex)
            .flexDirection(.column)
            .gap(spacing)
    }
}

// Usage
div {
    h2 { "Card Title" }
    p { "Card content" }
}
.card()
```

### CSS-in-Swift

Define complete stylesheets in Swift:

```swift
struct Stylesheet: HTML {
    var body: some HTML {
        style {
            CSS("""
            /* Reset */
            *, *::before, *::after {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            
            /* Typography */
            body {
                font-family: \(Font.system.value);
                font-size: \(Length.rem(1).value);
                line-height: 1.6;
                color: \(Color.text.value);
            }
            
            /* Components */
            .btn {
                \(buttonStyles)
            }
            """)
        }
    }
    
    private var buttonStyles: String {
        """
        display: inline-block;
        padding: 0.5rem 1rem;
        background-color: var(--color-primary);
        color: white;
        text-decoration: none;
        border-radius: 0.375rem;
        transition: background-color 150ms;
        """
    }
}
```

## CSS Modules and Scoping

### Scoped Styles

Create component-scoped styles:

```swift
struct ScopedComponent: HTML {
    let id = "component-\(UUID().uuidString.prefix(8))"
    
    var body: some HTML {
        div {
            style {
                """
                #\(id) {
                    background: linear-gradient(to right, #667eea, #764ba2);
                    padding: 2rem;
                }
                
                #\(id) h2 {
                    color: white;
                    margin-bottom: 1rem;
                }
                """
            }
            
            h2 { "Scoped Styles" }
            p { "These styles only apply to this component" }
        }
        .id(id)
    }
}
```

### CSS Modules Pattern

Implement a CSS modules-like pattern:

```swift
struct ComponentStyles {
    let container = "container-\(UUID().uuidString.prefix(8))"
    let title = "title-\(UUID().uuidString.prefix(8))"
    let content = "content-\(UUID().uuidString.prefix(8))"
    
    var css: String {
        """
        .\(container) {
            background: white;
            border-radius: 8px;
            padding: 1.5rem;
        }
        
        .\(title) {
            font-size: 1.5rem;
            color: #1a202c;
            margin-bottom: 0.5rem;
        }
        
        .\(content) {
            color: #4a5568;
            line-height: 1.6;
        }
        """
    }
}

struct StyledComponent: HTML {
    let styles = ComponentStyles()
    
    var body: some HTML {
        div {
            style { styles.css }
            
            h2 { "Title" }
                .class(styles.title)
            
            p { "Content" }
                .class(styles.content)
        }
        .class(styles.container)
    }
}
```

## Performance Optimization

### Critical CSS

Inline critical CSS for faster rendering:

```swift
struct OptimizedPage: HTMLDocumentProtocol {
    var head: some HTML {
        // Critical CSS inlined
        style {
            """
            /* Above-the-fold styles */
            body { margin: 0; font-family: system-ui; }
            .header { background: #1a202c; color: white; padding: 1rem; }
            .hero { min-height: 50vh; display: flex; align-items: center; }
            """
        }
        
        // Non-critical CSS loaded async
        link(
            rel: .preload,
            href: "/css/full.css",
            as: .style,
            onload: "this.onload=null;this.rel='stylesheet'"
        )
    }
    
    var body: some HTML {
        // Page content
    }
}
```

### CSS Containment

Use CSS containment for performance:

```swift
div {
    // Large list of items
    HTMLForEach(items) { item in
        ItemCard(item: item)
            .contain(.layout, .style, .paint)
    }
}
.display(.grid)
.gridTemplateColumns(.repeat(.autoFill, .minmax(.px(300), .fr(1))))
```

## Testing Styles

Test your styled components using HTMLTestSupport's inline snapshot testing:

### Basic Style Testing

```swift
import Testing
@testable import MyApp

@Suite("Style Tests")
struct StyleTests {
    @Test("Button has correct styles applied")
    func buttonStyles() throws {
        let button = Button(title: "Test", style: .primary, action: nil)
        let html = try String(button)
        
        // Check for expected styles
        #expect(html.contains("background-color"))
        #expect(html.contains("border-radius"))
        #expect(html.contains("cursor: pointer"))
    }
    
    @Test("Responsive component includes media queries")
    func responsiveStyles() throws {
        let component = ResponsiveComponent()
        let html = try String(component)
        
        // Verify media queries
        #expect(html.contains("@media"))
        #expect(html.contains("min-width: 768px"))
    }
}
```

### Inline Snapshot Testing for Styled Components

HTMLTestSupport makes it easy to test that your styles are rendered correctly:

```swift
import Testing
import PointFreeHTMLTestSupport
@testable import MyApp

@Suite("Style Snapshot Tests")
struct StyleSnapshotTests {
    @Test("Label and input with light- and darkmode color")
    func labelAndInputWithLightAndDarkmodeColor() {
        assertInlineSnapshot(
            of: label { input.text }
                .color(light: .red, dark: .blue),
            as: .html
        ) {
            """
            <label class="color-ILzRW1 color-Hx6Lg1"><input type="text"></label>
            """
        }
    }
}
```

## Best Practices

### 1. Consistent Spacing

Use a consistent spacing scale:

```swift
extension Length {
    static let spacing1 = Length.rem(0.25)
    static let spacing2 = Length.rem(0.5)
    static let spacing3 = Length.rem(0.75)
    static let spacing4 = Length.rem(1)
    static let spacing5 = Length.rem(1.25)
    static let spacing6 = Length.rem(1.5)
    static let spacing8 = Length.rem(2)
}
```

### 2. Semantic Colors

Define semantic color names:

```swift
extension CSS.Color {
    // Brand colors
    static let brand = hex("#007AFF")
    static let brandDark = hex("#0051D5")
    
    // Semantic colors
    static let textPrimary = hex("#1a202c")
    static let textSecondary = hex("#4a5568")
    static let backgroundPrimary = hex("#ffffff")
    static let backgroundSecondary = hex("#f7fafc")
    
    // State colors
    static let success = hex("#48bb78")
    static let warning = hex("#ed8936")
    static let error = hex("#f56565")
    static let info = hex("#4299e1")
}
```

### 3. Composable Styles

Build complex styles from simple pieces:

```swift
extension HTML {
    func baseButton() -> some HTML {
        self
            .padding(.vertical(.spacing3), .horizontal(.spacing4))
            .borderRadius(.px(6))
            .fontWeight(.medium)
            .transition(.all, .ms(150))
            .cursor(.pointer)
    }
    
    func primaryButton() -> some HTML {
        self
            .baseButton()
            .backgroundColor(.brand)
            .color(.white)
    }
}
```

## Conclusion

swift-html's CSS support provides:

- **Type Safety**: Catch CSS errors at compile time
- **Flexibility**: Multiple styling approaches
- **Performance**: Optimized CSS delivery options
- **Maintainability**: Reusable, composable styles
- **Modern Features**: Support for latest CSS features

Whether you prefer inline styles, CSS classes, or a hybrid approach, swift-html has you covered with type-safe APIs that make styling a pleasure.

## Next Steps

- Explore <doc:DarkModeSupport> for theme switching
- Learn about <doc:CustomComponents> for styled components
- Read <doc:PerformanceGuide> for CSS optimization
- Check out <doc:PlatformIntegration> for platform-specific styling
