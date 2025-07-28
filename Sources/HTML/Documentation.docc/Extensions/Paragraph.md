# ``HTMLElementTypes/Paragraph``

The `p` element with swift-html's CSS modifier extensions.

## Overview

The `Paragraph` type (aliased as `p`) represents HTML paragraph elements. swift-html extends it with typography and styling modifiers for creating well-formatted text content.

## Topics

### Creating Paragraph Elements

- ``HTMLElementTypes/Paragraph/init(_:)``

### Typography Modifiers

- ``fontSize(_:)``
- ``fontWeight(_:)``
- ``fontFamily(_:)``
- ``lineHeight(_:)``
- ``letterSpacing(_:)``
- ``textAlign(_:)``
- ``textDecoration(_:)``
- ``textTransform(_:)``

### Color Modifiers

- ``color(_:)``
- ``color(light:dark:)``
- ``backgroundColor(_:)``
- ``backgroundColor(light:dark:)``

### Spacing Modifiers

- ``margin(_:)``
- ``marginTop(_:)``
- ``marginBottom(_:)``
- ``marginLeft(_:)``
- ``marginRight(_:)``
- ``padding(_:)``

### Display Modifiers

- ``display(_:)``
- ``opacity(_:)``
- ``overflow(_:)``

## Example

```swift
p {
    "This is a beautifully styled paragraph with proper typography."
}
.fontSize(.rem(1.125))
.lineHeight(1.6)
.color(light: .gray800, dark: .gray200)
.marginBottom(.rem(1.5))
.fontFamily(.system)
```

## See Also

- ``HTMLElementTypes/ContentDivision``
- ``HTMLElementTypes/ContentSpan``
- ``HTMLElementTypes/StrongImportance``