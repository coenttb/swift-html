//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
import HTML_Attributes

public struct DateTime<HTML>: Element {
    /// The HTML tag name
    public static var tag: String { "time" }
    
    public var datetime: HTML_Attributes.DateTime?
    public let content: () -> HTML
    
    public init(
        datetime: HTML_Attributes.DateTime? = nil,
        content: @escaping () -> HTML
    ) {
        self.datetime = datetime
        self.content = content
    }
}

public typealias time = DateTime


/* MDN Documentation
 * Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/time
 */
// <time>: The (Date) Time element
// Baseline
// Widely available
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// October 2017
// .
// Learn more
// See full compatibility
// Report feedback
// The
// <time>
// HTML
// element represents a specific period in time. It may include the
// datetime
// attribute to translate dates into machine-readable format, allowing for better search engine results or custom features such as reminders.
// It may represent one of the following:
// A time on a 24-hour clock.
// A precise date in the
// Gregorian calendar
// (with optional time and timezone information).
// A valid time duration
// .
// Try it
// <p>
//  The Cure will be celebrating their 40th anniversary on
//  <time datetime="2018-07-07">July 7</time> in London's Hyde Park.
// </p>
// <p>
//  The concert starts at <time datetime="20:00">20:00</time> and you'll be able
//  to enjoy the band for at least <time datetime="PT2H30M">2h 30m</time>.
// </p>
// time {
//  font-weight: bold;
// }
// Attributes
// Like all other HTML elements, this element supports the
// global attributes
// .
// datetime
// This attribute indicates the time and/or date of the element and must be in one of the formats described below.
// Usage notes
// This element is for presenting dates and times in a machine-readable format. For example, this can help a user agent offer to add an event to a user's calendar.
// This element should not be used for dates prior to the introduction of the Gregorian calendar (due to complications in calculating those dates).
// The
// datetime value
// (the machine-readable value of the datetime) is the value of the element's
// datetime
// attribute, which must be in the proper format (see below). If the element does not have a
// datetime
// attribute,
// it must not have any element descendants
// , and the
// datetime value
// is the element's child text content.
// Valid datetime values
// Description
// Microsyntax
// Examples
// Valid month string
// YYYY
// -
// MM
// 2011-11
// ,
// 2013-05
// Valid date string
// YYYY
// -
// MM
// -
// DD
// 1887-12-01
// Valid yearless date string
// MM
// -
// DD
// 11-12
// Valid time string
// HH
// :
// MM
// HH
// :
// MM
// :
// SS
// HH
// :
// MM
// :
// SS
// .
// mmm
// 23:59
// 12:15:47
// 12:15:52.998
// Valid local date and time string
// YYYY
// -
// MM
// -
// DD
// HH
// :
// MM
// YYYY
// -
// MM
// -
// DD
// HH
// :
// MM
// :
// SS
// YYYY
// -
// MM
// -
// DD
// HH
// :
// MM
// :
// SS
// .
// mmm
// YYYY
// -
// MM
// -
// DD
// T
// HH
// :
// MM
// YYYY
// -
// MM
// -
// DD
// T
// HH
// :
// MM
// :
// SS
// YYYY
// -
// MM
// -
// DD
// T
// HH
// :
// MM
// :
// SS
// .
// mmm
// 2013-12-25 11:12
// 1972-07-25 13:43:07
// 1941-03-15 07:06:23.678
// 2013-12-25T11:12
// 1972-07-25T13:43:07
// 1941-03-15T07:06:23.678
// Valid time-zone offset string
// Z
// +
// HHMM
// +
// HH
// :
// MM
// -
// HHMM
// -
// HH
// :
// MM
// Z
// +0200
// +04:30
// -0300
// -08:00
// Valid global date and time string
// Any combination of a valid local date and time string followed by a
//  valid time-zone offset string
// 2013-12-25 11:12+0200
// 1972-07-25 13:43:07+04:30
// 1941-03-15 07:06:23.678Z
// 2013-12-25T11:12-08:00
// Valid week string
// YYYY
// -W
// WW
// 2013-W46
// Four or more ASCII digits
// YYYY
// 2013
// ,
// 0001
// Valid duration string
// P
// d
// DT
// h
// H
// m
// M
// s
// S
// P
// d
// DT
// h
// H
// m
// M
// s
// .
// X
// S
// P
// d
// DT
// h
// H
// m
// M
// s
// .
// XX
// S
// P
// d
// DT
// h
// H
// m
// M
// s
// .
// XXX
// S
// PT
// h
// H
// m
// M
// s
// S
// PT
// h
// H
// m
// M
// s
// .
// X
// S
// PT
// h
// H
// m
// M
// s
// .
// XX
// S
// PT
// h
// H
// m
// M
// s
// .
// XXX
// S
// w
// w
// d
// d
// h
// h
// m
// m
// s
// s
// P12DT7H12M13S
// P12DT7H12M13.3S
// P12DT7H12M13.45S
// P12DT7H12M13.455S
// PT7H12M13S
// PT7H12M13.2S
// PT7H12M13.56S
// PT7H12M13.999S
// 7d 5h 24m 13s
// Examples
// Basic example
// HTML
// html
// <p>The concert starts at <time datetime="2018-07-07T20:00:00">20:00</time>.</p>
// Result
// datetime
// example
// HTML
// html
// <p>
//  The concert took place on <time datetime="2001-05-15T19:00">May 15</time>.
// </p>
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , palpable content.
// Permitted content
// Phrasing content
// .
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts
// phrasing content
// .
// Implicit ARIA role
// time
// Permitted ARIA roles
// Any
// DOM interface
// HTMLTimeElement
// Specifications
// Specification
// HTML
// #
// the-time-element
// Browser compatibility
// See also
// The
// <data>
// element, allowing to signal other kind of values.