# Type Safety Benefits

Discover how swift-html's type system prevents common HTML/CSS errors at compile time.

## Overview

Type safety is at the core of swift-html's design philosophy. By leveraging Swift's powerful type system, swift-html transforms runtime HTML/CSS errors into compile-time errors, making your web development more reliable, maintainable, and enjoyable.

## The Problem with String-Based HTML

Traditional HTML generation often relies on string concatenation:

```swift
// Traditional approach - error prone
func renderUser(_ user: User) -> String {
    return """
    <div clas="user-card">  <!-- Typo: 'clas' instead of 'class' -->
        <h2>\(user.name)</h2>
        <image src="\(user.avatar)">  <!-- Wrong tag: 'image' instead of 'img' -->
        <p style="color: #ff000;">  <!-- Invalid color: missing digit -->
            \(user.bio)
        </p>
    </div>
    """  // Missing closing tag validation
}
```

These errors only surface at runtime, often in production, leading to:
- Broken layouts
- Invalid HTML that browsers struggle to parse
- Accessibility issues
- SEO problems
- Debugging nightmares

## How swift-html Solves This

### 1. Element Type Safety

Every HTML element is a distinct Swift type:

```swift
// swift-html approach - compile-time safety
func renderUser(_ user: User) -> some HTML {
    div {
        h2 { user.name }
        img(src: user.avatar, alt: user.name)  // ✅ Correct element
        p { user.bio }
            .color(.red)  // ✅ Type-safe color
    }
    .class("user-card")  // ✅ IDE autocomplete helps
}

// These would cause compile errors:
// image(src: user.avatar)  // ❌ No such element type
// div.clas("user-card")    // ❌ No such method
```

### 2. Attribute Validation

Attributes are validated based on element type:

```swift
// Valid attributes for specific elements
let link = a(href: "/about", target: .blank) { "About" }
let input = input(type: .email, name: "email", required: true)

// Invalid attributes caught at compile time
// let div = div(href: "/")  // ❌ Compile error: div doesn't have href
// let p = p(type: .submit)   // ❌ Compile error: p doesn't have type
```

### 3. Context-Aware APIs

Different element variants have different available attributes:

```swift
// Email input has email-specific attributes
let emailInput = Input.email(
    name: "email",
    placeholder: "your@email.com",
    multiple: true  // ✅ Valid for email inputs
)

// Color input has different attributes
let colorInput = Input.color(
    name: "theme",
    value: "#007AFF"
    // multiple: true  // ❌ Not available for color inputs
)
```

### 4. CSS Type Safety

CSS properties only accept valid values:

```swift
// Type-safe CSS values
div { "Content" }
    .padding(.px(20))        // ✅ Length value
    .color(.rgb(255, 0, 0))  // ✅ Color value
    .display(.flex)          // ✅ Display value

// These cause compile errors:
// .padding(.rgb(255, 0, 0))  // ❌ Can't use color for padding
// .color(.px(20))            // ❌ Can't use length for color
// .display(.red)             // ❌ Invalid display value
```

### 5. Unit Safety

CSS units are type-checked:

```swift
// Different properties accept different units
element
    .width(.px(100))         // ✅ Pixels
    .width(.percent(50))     // ✅ Percentage
    .width(.vw(100))         // ✅ Viewport width

    .fontSize(.rem(1.5))     // ✅ Relative units
    .fontSize(.px(16))       // ✅ Absolute units
    // .fontSize(.deg(45))   // ❌ Rotation units not valid

    .rotate(.deg(45))        // ✅ Rotation needs degrees
    // .rotate(.px(45))      // ❌ Pixels not valid for rotation
```

## Real-World Benefits

### 1. Catch Errors Early

```swift
// This typo is caught at compile time
div {
    h1 { "Welcome" }
        // .colour(.blue)  // ❌ Compile error: did you mean 'color'?
        .color(.blue)     // ✅ Correct
}
```

### 2. Refactoring Safety

When you rename or change components, the compiler ensures all usages are updated:

```swift
// Before: Using a custom component
struct UserCard: HTML {
    let userName: String  // Property name
    
    var body: some HTML {
        div { userName }
    }
}

// After refactoring: Compiler ensures all usages update
struct UserCard: HTML {
    let displayName: String  // Renamed property
    
    var body: some HTML {
        div { displayName }
    }
}

// All usage sites must update or won't compile
// UserCard(userName: "Alice")  // ❌ Compile error
UserCard(displayName: "Alice")  // ✅ Must use new name
```

### 3. IDE Support

Type safety enables powerful IDE features:

```swift
div {
    p { "Text" }
        .pa  // IDE suggests: padding, paddingTop, paddingLeft...
        .padding(.r  // IDE suggests: rem, rem(1), rem(1.5)...
        .padding(.rem(2))
        .co  // IDE suggests: color, columns, columnGap...
        .color(.  // IDE shows all valid color options
}
```

### 4. Documentation in Code

Types serve as inline documentation:

```swift
// Function signature tells you exactly what's expected
func createButton(
    title: String,
    style: ButtonStyle,
    onClick: JavaScript
) -> some HTML {
    button(onclick: onClick) { title }
        .apply(style)
}

// Compare to string-based approach
func createButton(
    title: String,
    style: String,  // What format? CSS string? Class name?
    onClick: String  // JavaScript? Function name? 
) -> String {
    // ...
}
```

## Advanced Type Safety Features

### 1. Conditional Attributes

Attributes can be conditionally included with type safety:

```swift
func link(to url: URL, external: Bool = false) -> some HTML {
    a(
        href: url,
        target: external ? .blank : nil,  // ✅ Optional attribute
        rel: external ? .noopener : nil
    ) {
        "Visit site"
        if external {
            span { " ↗" }.class("external-icon")
        }
    }
}
```

### 2. Type-Safe HTML Entities

Special characters are handled safely:

```swift
// No manual escaping needed
p {
    "Price: $99.99"  // Rendered safely
    br()
    "20% < 30%"      // Automatically escaped
    br()
    "Q&A Section"    // & is escaped
}
```

### 3. Validated URLs

When combined with Foundation types:

```swift
// URL validation at compile time
if let url = URL(string: userInput) {
    a(href: url) { "Valid link" }
} else {
    span { "Invalid URL" }
        .color(.red)
}
```

### 4. Type-Safe JavaScript

Even inline JavaScript can be type-checked:

```swift
button(
    onclick: JavaScript("handleClick(event)")
) {
    "Click me"
}

// Or with more complex scripts
script {
    JavaScript("""
    function handleClick(event) {
        event.preventDefault();
        console.log('Clicked!');
    }
    """)
}
```

## Comparison with Other Approaches

### String Templates
```swift
// String template - no compile-time checks
let html = "<div class='\(className)'>\(content)</div>"
// Issues: XSS vulnerability, no validation, typos
```

### swift-html
```swift
// Type-safe - all errors caught at compile time
let html = div { content }.class(className)
// Benefits: XSS protection, validated, autocomplete
```

### HTML Builders (Basic)
```swift
// Basic builder - some structure, but strings for attributes
HTML.div(class: "card", style: "color: red") { content }
// Issues: Attribute typos, invalid CSS values
```

### swift-html
```swift
// Full type safety throughout
div { content }
    .class("card")
    .color(.red)
// Benefits: No string attributes, validated CSS
```

## Best Practices

### 1. Let Types Guide You

Trust the compiler to guide your development:

```swift
// Start typing and let autocomplete help
div {
    h1 { "Title" }
        .font  // See all font-related properties
        .fontSize(.  // See all valid size units
}
```

### 2. Create Type-Safe Components

Leverage types in your custom components:

```swift
struct Badge: HTML {
    enum Style {
        case primary, secondary, success, warning, danger

        var backgroundColor: BackgroundColor { ... }
    }
    
    let text: String
    let style: Style
    
    var body: some HTML {
        span { text }
            .class("badge", "badge-\(style)")
            .backgroundColor(style.backgroundColor)
    }
}

// Usage is self-documenting
Badge(text: "New", style: .success)
```

### 3. Use Enums for Options

Replace string options with enums:

```swift
enum Theme {
    case light, dark, auto
    
    var className: String {
        "theme-\(self)"
    }
}

func applyTheme(_ theme: Theme) -> some HTML {
    div { "Content" }
        .class(theme.className)
}
```

## Migration Benefits

When migrating from string-based HTML:

### Before (Error-Prone)
```swift
func render() -> String {
    return """
    <div styl="pading: 20px">
        <h1 color="blue">Title</h1>
        <p class="text">Content</text>
    </div>
    """
}
```

### After (Type-Safe)
```swift
func render() -> some HTML {
    div {
        h1 { "Title" }
            .color(.blue)
        p { "Content" }
            .class("text")
    }
    .padding(.px(20))
}
```

The compiler immediately catches:
- `styl` → `style` typo
- `pading` → `padding` typo  
- `color` not valid on `h1` (use CSS instead)
- Mismatched closing tag `</text>`

## Conclusion

Type safety in swift-html provides:

1. **Compile-time error detection** - Catch mistakes before they reach users
2. **Better IDE support** - Autocomplete, refactoring, and navigation
3. **Self-documenting code** - Types explain valid values
4. **Confident refactoring** - Change without fear of breaking
5. **Reduced debugging time** - Fewer runtime surprises

By embracing Swift's type system, swift-html transforms web development from error-prone string manipulation into a reliable, enjoyable experience where the compiler becomes your development partner.

## Next Steps

- Explore <doc:HTMLProtocol> to understand the foundation of type safety
- Learn about <doc:HTMLBuilder> for composing type-safe HTML
- Read <doc:CustomComponents> to build your own type-safe components
- Check out <doc:StylingWithCSS> for type-safe styling techniques
