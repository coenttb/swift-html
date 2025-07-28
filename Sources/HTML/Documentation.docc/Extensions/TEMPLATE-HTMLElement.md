# ``HTMLElementTypes/[ElementType]``

The `[element]` element with swift-html's CSS modifier extensions.

## Overview

The `[ElementType]` type (aliased as `[element]`) represents HTML [description] elements. swift-html extends it with [key features].

## Topics

### Creating [Element] Elements

- ``HTMLElementTypes/[ElementType]/init(_:)``

### [Category] Modifiers

- ``modifier1(_:)``
- ``modifier2(_:)``
- ``modifier3(_:)``

### Common Style Modifiers

- ``class(_:)``
- ``id(_:)``
- ``style(_:)``

### Layout Modifiers

- ``display(_:)``
- ``padding(_:)``
- ``margin(_:)``

### Visual Modifiers

- ``backgroundColor(_:)``
- ``color(_:)``
- ``border(_:_:_:)``

## Example

```swift
[element] {
    // Content
}
.modifier1(value)
.modifier2(value)
```

## See Also

- ``HTMLElementTypes/RelatedElement1``
- ``HTMLElementTypes/RelatedElement2``