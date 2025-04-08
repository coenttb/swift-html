//<fencedframe>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/fencedframe
//
// <fencedframe>: The Fenced Frame element
// Limited availability
// This feature is not Baseline because it does not work in some of the most widely-used browsers.
// Learn more
// See full compatibility
// Report feedback
// Experimental:
// This is an
// experimental technology
// Check the
// Browser compatibility table
// carefully before using this in production.
// The
// <fencedframe>
// HTML
// element represents a nested
// browsing context
// , embedding another HTML page into the current one.
// <fencedframe>
// s are very similar to
// <iframe>
// elements in form and function, except that:
// Communication is restricted between the
// <fencedframe>
// content and its embedding site.
// A
// <fencedframe>
// can access cross-site data, but only in a very specific set of controlled circumstances that preserve user privacy.
// A
// <fencedframe>
// cannot be manipulated or have its data accessed via regular scripting (for example reading or setting the source URL).
// <fencedframe>
// content can only be embedded via
// specific APIs
// .
// A
// <fencedframe>
// cannot access the embedding context's DOM, nor can the embedding context access the
// <fencedframe>
// 's DOM.
// The
// <fencedframe>
// element is a type of
// <iframe>
// with more native privacy features built in. It addresses shortcomings of
// <iframe>
// s such as reliance on third-party cookies and other privacy risks. See
// Fenced frame API
// for more details.
// Attributes
// This element includes the
// global attributes
// .
// allow
// Experimental
// Specifies a
// Permissions Policy
// for the
// <fencedframe>
// , which defines what features are available to the
// <fencedframe>
// based on the origin of the request. See
// Permissions policies available to fenced frames
// for more details of which features can be controlled via a policy set on a fenced frame.
// height
// Experimental
// A unitless integer representing the height of the fenced frame in CSS pixels. The default is
// 150
// .
// width
// Experimental
// A unitless integer representing the width of the fenced frame in CSS pixels. The default is
// 300
// .
// Permissions policies available to fenced frames
// Permissions delegated from the top-level context to a fenced frame for allowing and denying features could be used as a communication channel, so constitute a privacy threat. As a result, standard web features that can have their availability controlled via
// Permissions Policy
// (for example,
// camera
// or
// geolocation
// ) are
// not available
// within fenced frames.
// The only features that can be enabled by a policy inside fenced frames are the specific features designed to be used inside fenced frames:
// Protected Audience API
// attribution-reporting
// private-aggregation
// shared-storage
// shared-storage-select-url
// Shared Storage API
// attribution-reporting
// private-aggregation
// shared-storage
// shared-storage-select-url
// Currently these are always enabled inside fenced frames. In the future, which ones are enabled will be controllable using the
// <fencedframe>
// allow
// attribute. Blocking privacy sandbox features in this manner will also block the fenced frame from loading â there will be no communication channel at all.
// Focusing across fenced frame boundaries
// The ability of the document's active focus to be moved across fenced frame boundaries (i.e., from an element outside the fenced frame to one inside, or vice versa) is limited. User-initiated actions such as a click or a tab can do so, as there is no fingerprinting risk there.
// However, trying to traverse the boundary via an API call such as
// HTMLElement.focus()
// is prohibited â a malicious script could use a series of such calls to leak inferred information across the boundary.
// Positioning and scaling
// Being a
// replaced element
// , the
// <fencedframe>
// allows the position of the embedded document within its box to be adjusted using the
// object-position
// property.
// Note:
// The
// object-fit
// property has no effect on
// <fencedframe>
// elements.
// The size of the embedded content may be set by internal
// contentWidth
// and
// contentHeight
// properties of the
// <fencedframe>
// 's
// config
// object. In such cases, changing the
// width
// or
// height
// of the
// <fencedframe>
// will change the size of the embedded container on the page, but the document inside the container will be visually scaled to fit. The reported width and height of the embedded document (i.e.,
// Window.innerWidth
// and
// Window.innerHeight
// ) will be unchanged.
// Accessibility
// People navigating with assistive technology, such as a screen reader, can use the
// title
// attribute
// on a
// <fencedframe>
// to label its content. The title's value should concisely describe the embedded content:
// html
// <fencedframe
//  title="Advertisement for new Log. From Blammo!"
//  width="640"
//  height="320"></fencedframe>
// Without this title, they have to navigate into the
// <fencedframe>
// to determine what its embedded content is. This context shift can be confusing and time-consuming, especially for pages with multiple
// <fencedframe>
// s and/or if embeds contain interactive content like video or audio.
// Examples
// To set what content will be shown in a
// <fencedframe>
// , a utilizing API (such as
// Protected Audience
// or
// Shared Storage
// ) generates a
// FencedFrameConfig
// object, which is then set as the value of the
// <fencedframe>
// 's
// config
// property.
// The following example gets a
// FencedFrameConfig
// from a Protected Audience API's ad auction, which is then used to display the winning ad in a
// <fencedframe>
// :
// html
// <fencedframe width="640" height="320"></fencedframe>
// js
// const frameConfig = await navigator.runAdAuction({
//  // ...auction configuration
//  resolveToConfig: true,
// });
// const frame = document.querySelector("fencedframe");
// frame.config = frameConfig;
// Note:
// resolveToConfig: true
// must be passed in to the
// runAdAuction()
// call to obtain a
// FencedFrameConfig
// object. If it is not set, the resulting
// Promise
// will resolve to a URN that can only be used in an
// <iframe>
// .
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , embedded content, interactive content, palpable content.
// Permitted content
// None.
// Tag omission
// None, both the starting and ending tag are mandatory.
// Permitted parents
// Any element that accepts embedded content.
// Implicit ARIA role
// No corresponding role
// Permitted ARIA roles
// application
// ,
// document
// ,
// img
// ,
// none
// ,
// presentation
// DOM interface
// HTMLFencedFrameElement
// Specifications
// Specification
// Fenced Frame
// #
// the-fencedframe-element
// Browser compatibility
// See also
// Fenced Frame API
// Fenced frames
// on privacysandbox.google.com
// The Privacy Sandbox
// on privacysandbox.google.com

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
