# ``HTMLElementTypes/ContentDivision``

The `div` element with swift-html's CSS modifier extensions.

## Overview

The `ContentDivision` type (aliased as `div`) is one of the most commonly used HTML elements. swift-html extends it with a comprehensive set of CSS modifiers for styling and layout.

## Topics

### Creating Div Elements

- ``HTMLElementTypes/ContentDivision/init(_:)``

### Layout Modifiers

- ``display(_:)``
- ``position(_:)``
- ``flex(_:)``
- ``flexDirection(_:)``
- ``justifyContent(_:)``
- ``alignItems(_:)``
- ``grid(_:)``
- ``gridTemplateColumns(_:)``
- ``gridTemplateRows(_:)``

### Spacing Modifiers

- ``padding(_:)``
- ``margin(_:)``
- ``gap(_:)``

### Sizing Modifiers

- ``width(_:)``
- ``height(_:)``
- ``maxWidth(_:)``
- ``maxHeight(_:)``
- ``minWidth(_:)``
- ``minHeight(_:)``

### Visual Modifiers

- ``backgroundColor(_:)``
- ``color(_:)``
- ``border(_:_:_:)``
- ``borderRadius(_:)``
- ``boxShadow(_:_:_:_:)``
- ``opacity(_:)``

### Dark Mode Support

- ``backgroundColor(light:dark:)``
- ``color(light:dark:)``

## Example

```swift
div {
    h1 { "Welcome" }
    p { "This is a styled div element" }
}
.padding(.rem(2))
.backgroundColor(light: .white, dark: .gray900)
.borderRadius(.px(8))
.boxShadow(.px(0), .px(2), .px(4), .rgba(0, 0, 0, 0.1))
```

## See Also

- ``HTMLElementTypes/Paragraph``
- ``HTMLElementTypes/ContentSpan``
- ``HTMLElementTypes/Section``