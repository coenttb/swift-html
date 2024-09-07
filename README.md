# 🗺 swift-html

A Swift DSL for type-safe, extensible, and transformable HTML documents and CSS styles.

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

🚧 **This package is under active development** 🚧

This Swift package is currently in active development and is subject to frequent changes. Features and APIs may change without prior notice until a stable release is available.

## Table of Contents

  - [New Approach](#new-approach)
  - [Examples](#examples)
  - [Safety](#safety)
  - [FAQ](#faq)
  - [Installation](#installation)
  - [Acknowledgements More](#acknowledgements)
  - [License](#license)

## New Approach

This version of swift-html uses the new approach as implemented on [pointfree.co](https://www.pointfree.co). It offers a more ergonomic and type-safe way of constructing HTML documents, along with my type-safe CSS styling.

## Examples

HTML documents can be created using a declarative, SwiftUI-like syntax, with type safe CSS.

```swift
import HTML

let document = HTMLPreview.modern {
  h1 { "Type-safe HTML" }
    .color(.blue)
    .fontSize(24.px)
  p { "With type-safe CSS!" }
    .margin(top: 10.px, bottom: 10.px)
}
```

> Note: For a quick and convenient way to give your HTMLDocument a modern look, use HTMLPreview.modern. I encourage you to create a custom implementation by conforming your HTMLDocument struct or enum to the HTMLDocument protocol.

You can even preview the HTML using #Preview.

```
#if canImport(SwiftUI)
import SwiftUI
import HTML

#Preview {
  HTMLPreview.modern {
    h1 { "Welcome!" }
      .color(.blue)
      .fontSize(24.px)
    p { "You've found our site!" }
      .margin(top: 10.px, bottom: 10.px)
    }
  }
}
#endif
```

## Safety

Because I'm embedding the DSL in Swift, I can take advantage of some advanced Swift features to add an extra layer of safety when constructing HTML documents. For a simple example, I can strengthen many HTML APIs to force their true types rather than just relying on strings. 

My type-safe CSS approach ensures that you can only apply valid CSS properties to HTML elements, preventing common styling errors at compile-time.

## FAQ

### Can I use this with existing Swift web frameworks like Vapor?

Yes! Conform your HTMLDocument to AsyncResponseEncondable to serve it through Vapor.
 
## Installation

You can add swift-html to an Xcode project by adding it as a package dependency.

> https://github.com/coenttb/swift-html

If you want to use swift-html in a [SwiftPM](https://swift.org/package-manager/) project, it's as simple as adding it to a `dependencies` clause in your `Package.swift`:

``` swift
dependencies: [
  .package(url: "https://github.com/coenttb/swift-html", branch: "main")
]
```

## Acknowledgements

I want to express my gratitude to the Point-Free team, especially Brandon Williams and Stephen Celis. Their innovative work has been a longtime inspiration. The concepts and techniques they've developed and shared through their video series and open-source contributions have been invaluable in creating this library.

This project is essentially a fork and adaptation of their work, aiming to make these powerful ideas more accessible and adaptable for various use cases. I encourage everyone to check out [Point-Free](https://www.pointfree.co) and their [open-source projects](https://github.com/pointfreeco) to learn more about the original concepts and see them in action.

Thank you, Point-Free team, for your continued contributions to the Swift community!

## License

All modules are released under the MIT license. See [LICENSE](LICENSE) for details.
