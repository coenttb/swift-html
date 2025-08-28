# ``HTMLElementTypes/Anchor``

The `a` element with swift-html's CSS modifier extensions.

## Overview

The `Anchor` type (aliased as `a`) represents HTML anchor/link elements. swift-html extends it with styling modifiers for creating interactive links with hover states and transitions.

## Topics

### Creating Anchor Elements

- ``HTMLElementTypes/Anchor/init(href:target:rel:)``

### Link-Specific Modifiers

- ``textDecoration(_:)``
- ``cursor(_:)``
- ``hover(_:)``
- ``active(_:)``
- ``focus(_:)``
- ``visited(_:)``

### Color Modifiers

- ``color(_:)``
- ``color(light:dark:)``
- ``backgroundColor(_:)``
- ``backgroundColor(light:dark:)``

### Typography Modifiers

- ``fontSize(_:)``
- ``fontWeight(_:)``
- ``fontFamily(_:)``

### Layout Modifiers

- ``display(_:)``
- ``padding(_:)``
- ``margin(_:)``

### Transition Modifiers

- ``transition(_:_:_:)``
- ``transitionDuration(_:)``
- ``transitionTimingFunction(_:)``

## Example

```swift
a(href: "/products", target: .self) {
    "View Products"
}
.color(.blue600)
.textDecoration(TextDecoration.none)
.fontWeight(.medium)
.padding(.vertical(.rem(0.5)), .horizontal(.rem(1)))
.borderRadius(.px(4))
.transition(.all, .ms(150), .easeInOut)
.hover {
    $0.backgroundColor(.blue50)
      .color(.blue700)
}
```

## See Also

- ``HTMLElementTypes/Button``
- ``HTMLElementTypes/NavigationSection``
