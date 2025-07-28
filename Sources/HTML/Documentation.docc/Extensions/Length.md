# ``Length``

CSS Length type for specifying sizes and distances in swift-html.

## Overview

The `Length` type represents CSS length values with various units. swift-html provides convenient methods for creating length values with proper type safety.

## Topics

### Absolute Units

- ``px(_:)`` - Pixels
- ``pt(_:)`` - Points
- ``pc(_:)`` - Picas
- ``cm(_:)`` - Centimeters
- ``mm(_:)`` - Millimeters
- ``in(_:)`` - Inches

### Relative Units

- ``em(_:)`` - Relative to parent font size
- ``rem(_:)`` - Relative to root font size
- ``percent(_:)`` - Percentage
- ``vh(_:)`` - Viewport height
- ``vw(_:)`` - Viewport width
- ``vmin(_:)`` - Minimum of vw and vh
- ``vmax(_:)`` - Maximum of vw and vh

### Flexible Units

- ``fr(_:)`` - Fraction unit for CSS Grid

### Special Values

- ``auto`` - Automatic sizing
- ``zero`` - Zero length

## Example

```swift
// Common spacing pattern
.padding(.rem(1.5))
.margin(.px(20))

// Responsive sizing
.width(.percent(100))
.maxWidth(.px(1200))

// Grid layout
.gridTemplateColumns(.repeat(.autoFit, .minmax(.px(250), .fr(1))))

// Viewport units
.height(.vh(100))
.minHeight(.px(600))

// Calculation
.width(.calc("100% - 2rem"))
```

## See Also

- ``CSS/Color``
- ``Padding``
- ``Margin``
- ``Width``
- ``Height``