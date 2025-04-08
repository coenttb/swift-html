//<marquee>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/marquee
//
// <marquee>: The Marquee element
// Deprecated:
// This feature is no longer recommended. Though some browsers might still support it, it may have already been removed from the relevant web standards, may be in the process of being dropped, or may only be kept for compatibility purposes. Avoid using it, and update existing code if possible; see the
// compatibility table
// at the bottom of this page to guide your decision. Be aware that this feature may cease to work at any time.
// The
// <marquee>
// HTML
// element is used to insert a scrolling area of text. You can control what happens when the text reaches the edges of its content area using its attributes.
// The HTML
// <marquee>
// element is deprecated and its use is strongly discouraged. If you must create the effect of scrolling text or continuous elements, consider using
// CSS animations
// with
// CSS transforms
// instead of
// <marquee>
// elements to smoothly animate content. Additionally, include the
// prefers-reduced-motion
// CSS
// @media
// query to stop the animation based on user preference, thereby improving user experience and accessibility.
// Attributes
// behavior
// Deprecated
// Sets how the text is scrolled within the marquee. Possible values are
// scroll
// ,
// slide
// and
// alternate
// . If no value is specified, the default value is
// scroll
// .
// bgcolor
// Deprecated
// Sets the background color through color name or hexadecimal value.
// direction
// Deprecated
// Sets the direction of the scrolling within the marquee. Possible values are
// left
// ,
// right
// ,
// up
// and
// down
// . If no value is specified, the default value is
// left
// .
// height
// Deprecated
// Sets the height in pixels or percentage value.
// hspace
// Deprecated
// Sets the horizontal margin
// loop
// Deprecated
// Sets the number of times the marquee will scroll. If no value is specified, the default value is â1, which means the marquee will scroll continuously.
// scrollamount
// Deprecated
// Sets the amount of scrolling at each interval in pixels. The default value is 6.
// scrolldelay
// Deprecated
// Sets the interval between each scroll movement in milliseconds. The default value is 85. Note that any value smaller than 60 is ignored and the value 60 is used instead unless
// truespeed
// is specified.
// truespeed
// Deprecated
// By default,
// scrolldelay
// values lower than 60 are ignored. If
// truespeed
// is present, those values are not ignored.
// vspace
// Deprecated
// Sets the vertical margin in pixels or percentage value.
// width
// Deprecated
// Sets the width in pixels or percentage value.
// Examples
// html
// <marquee>This text will scroll from right to left</marquee>
// <marquee direction="up">This text will scroll from bottom to top</marquee>
// <marquee
//  direction="down"
//  width="250"
//  height="200"
//  behavior="alternate"
//  style="border:solid">
//  <marquee behavior="alternate">This text will bounce</marquee>
// </marquee>
// Result
// Technical summary
// DOM interface
// HTMLMarqueeElement
// Specifications
// Specification
// HTML
// #
// the-marquee-element-2
// Browser compatibility
// See also
// CSS
// transform
// property
// CSS
// translate
// property
// CSS transforms
// module
// CSS animations
// module
// HTMLMarqueeElement

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation

