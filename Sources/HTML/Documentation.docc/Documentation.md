# ``HTML``

Render any Swift type as HTML. 

## Getting Started

### Installation

Add `swift-html` to your Swift package dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-html.git", branch: "main")
]
```

### Basic Usage

Import the library and create your HTML:

```swift
import HTML

// Create a simple HTML element
let content = p {
    "Hello, "
       b { "World" }
    "!"
}
do {
    let htmlString: String = try String(content)
}

let htmlBytes: ContiguousArray<UInt8> = content.render()
```

### Creating Complete HTML Documents

For full HTML documents, conform to the `HTMLDocument` protocol:

```swift
struct HomePage: HTMLDocumentProtocol {
    var head: some HTML {
        title { "Home Page" }
        meta(charSet: .utf8)
    }
    
    var body: some HTML {
        div {
            h1 { "Welcome" }
            p { "This is my home page." }
        }
    }
}
let document = try String(HomePage())
```

or inline:

```swift
let document = HTMLDocument {
    div {
        h1 { "Welcome" }
        p { "This is my home page." }
    }
} head: {
    title { "Home Page" }
    meta(charSet: .utf8)
}
```

## Topics

### Core Components

- ``...``

### Articles

- <doc:...>
