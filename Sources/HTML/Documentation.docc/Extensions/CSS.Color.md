# ``CSS/Color``

CSS Color type with swift-html's enhancements for dark mode support.

## Overview

The `CSS.Color` type represents CSS color values. swift-html extends it with dark mode support and convenience initializers for common color patterns.

## Topics

### Creating Colors

- ``hex(_:)``
- ``rgb(_:_:_:)``
- ``rgba(_:_:_:_:)``
- ``hsl(_:_:_:)``
- ``hsla(_:_:_:_:)``

### Named Colors

- ``red``
- ``blue``
- ``green``
- ``black``
- ``white``
- ``gray``
- ``transparent``

### Semantic Colors

- ``primary``
- ``secondary``
- ``success``
- ``warning``
- ``danger``
- ``info``

### System Colors

- ``systemBlue``
- ``systemGreen``
- ``systemRed``
- ``systemGray``
- ``systemBackground``
- ``systemText``

### Dark Mode Support

swift-html adds the ability to specify different colors for light and dark modes:

```swift
.color(light: .black, dark: .white)
.backgroundColor(light: .white, dark: .gray900)
```

## Example

```swift
// Using hex colors
.color(.hex("#007AFF"))

// Using RGB
.backgroundColor(.rgb(255, 255, 255))

// Using RGBA with transparency
.borderColor(.rgba(0, 0, 0, 0.1))

// Using semantic colors
.color(.primary)
.backgroundColor(.success)

// Dark mode support
.color(light: .gray900, dark: .gray100)
```

## See Also

- ``Length``
- ``BackgroundColor``
- ``BorderColor``