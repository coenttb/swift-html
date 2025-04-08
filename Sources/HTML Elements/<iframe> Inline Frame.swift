//<iframe>: MDN Documentation
//
// Source: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/iframe
//
// <iframe>: The Inline Frame element
// Baseline
// Widely available
// *
// This feature is well established and works across many devices and browser versions. Itâs been available across browsers since
// July 2015
// .
// * Some parts of this feature may have varying levels of support.
// Learn more
// See full compatibility
// Report feedback
// The
// <iframe>
// HTML
// element represents a nested
// browsing context
// , embedding another HTML page into the current one.
// Try it
// <iframe
//  id="inlineFrameExample"
//  title="Inline Frame Example"
//  width="300"
//  height="200"
//  src="https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&amp;layer=mapnik">
// </iframe>
// iframe {
//  border: 1px solid black;
//  width: 100%; /* takes precedence over the width set with the HTML width attribute */
// }
// Each embedded browsing context has its own
// document
// and allows URL navigations. The navigations of each embedded browsing context are linearized into the
// session history
// of the
// topmost
// browsing context. The browsing context that embeds the others is called the
// parent browsing context
// . The
// topmost
// browsing context â the one with no parent â is usually the browser window, represented by the
// Window
// object.
// Warning:
// Because each browsing context is a complete document environment, every
// <iframe>
// in a page requires increased memory and other computing resources. While theoretically you can use as many
// <iframe>
// s as you like, check for performance problems.
// Attributes
// This element includes the
// global attributes
// .
// allow
// Specifies a
// Permissions Policy
// for the
// <iframe>
// . The policy defines what features are available to the
// <iframe>
// (for example, access to the microphone, camera, battery, web-share, etc.) based on the origin of the request.
// See
// iframes
// in the
// Permissions-Policy
// topic for examples.
// Note:
// A Permissions Policy specified by the
// allow
// attribute implements a further restriction on top of the policy specified in the
// Permissions-Policy
// header. It doesn't replace it.
// allowfullscreen
// Set to
// true
// if the
// <iframe>
// can activate fullscreen mode by calling the
// requestFullscreen()
// method.
// Note:
// This attribute is considered a legacy attribute and redefined as
// allow="fullscreen"
// .
// allowpaymentrequest
// Deprecated
// Non-standard
// Set to
// true
// if a cross-origin
// <iframe>
// should be allowed to invoke the
// Payment Request API
// .
// Note:
// This attribute is considered a legacy attribute and redefined as
// allow="payment"
// .
// browsingtopics
// Experimental
// Non-standard
// A boolean attribute that, if present, specifies that the selected topics for the current user should be sent with the request for the
// <iframe>
// 's source. See
// Using the Topics API
// for more details.
// credentialless
// Experimental
// Set to
// true
// to make the
// <iframe>
// credentialless, meaning that its content will be loaded in a new, ephemeral context. It doesn't have access to the network, cookies, and storage data associated with its origin. It uses a new context local to the top-level document lifetime. In return, the
// Cross-Origin-Embedder-Policy
// (COEP) embedding rules can be lifted, so documents with COEP set can embed third-party documents that do not. See
// IFrame credentialless
// for more details.
// csp
// Experimental
// A
// Content Security Policy
// enforced for the embedded resource. See
// HTMLIFrameElement.csp
// for details.
// height
// The height of the frame in CSS pixels. Default is
// 150
// .
// loading
// Indicates when the browser should load the iframe:
// eager
// Load the iframe immediately on page load (this is the default value).
// lazy
// Defer loading of the iframe until it reaches a calculated distance from the
// visual viewport
// , as defined by the browser.
// The intent is to avoid using the network and storage bandwidth required to fetch the frame until the browser is reasonably certain that it will be needed.
// This improves the performance and cost in most typical use cases, in particular by reducing initial page load times.
// Note:
// Loading is only deferred when JavaScript is enabled.
// This is an anti-tracking measure.
// name
// A targetable name for the embedded browsing context. This can be used in the
// target
// attribute of the
// <a>
// ,
// <form>
// , or
// <base>
// elements; the
// formtarget
// attribute of the
// <input>
// or
// <button>
// elements; or the
// windowName
// parameter in the
// window.open()
// method.
// referrerpolicy
// Indicates which
// referrer
// to send when fetching the frame's resource:
// no-referrer
// The
// Referer
// header will not be sent.
// no-referrer-when-downgrade
// The
// Referer
// header will not be sent to
// origin
// s without
// TLS
// (
// HTTPS
// ).
// origin
// The sent referrer will be limited to the origin of the referring page: its
// scheme
// ,
// host
// , and
// port
// .
// origin-when-cross-origin
// The referrer sent to other origins will be limited to the scheme, the host, and the port. Navigations on the same origin will still include the path.
// same-origin
// A referrer will be sent for
// same origin
// , but cross-origin requests will contain no referrer information.
// strict-origin
// Only send the origin of the document as the referrer when the protocol security level stays the same (HTTPSâHTTPS), but don't send it to a less secure destination (HTTPSâHTTP).
// strict-origin-when-cross-origin
// (default)
// Send a full URL when performing a same-origin request, only send the origin when the protocol security level stays the same (HTTPSâHTTPS), and send no header to a less secure destination (HTTPSâHTTP).
// unsafe-url
// The referrer will include the origin
// and
// the path (but not the
// fragment
// ,
// password
// , or
// username
// ).
// This value is unsafe
// , because it leaks origins and paths from TLS-protected resources to insecure origins.
// sandbox
// Controls the restrictions applied to the content embedded in the
// <iframe>
// . The value of the attribute can either be empty to apply all restrictions, or space-separated tokens to lift particular restrictions:
// allow-downloads
// Allows downloading files through an
// <a>
// or
// <area>
// element with the
// download
// attribute, as well as through the navigation that leads to a download of a file. This works regardless of whether the user clicked on the link, or JS code initiated it without user interaction.
// allow-forms
// Allows the page to submit forms. If this keyword is not used, a form will be displayed as normal, but submitting it will not trigger input validation, send data to a web server, or close a dialog.
// allow-modals
// Allows the page to open modal windows by
// Window.alert()
// ,
// Window.confirm()
// ,
// Window.print()
// and
// Window.prompt()
// , while opening a
// <dialog>
// is allowed regardless of this keyword. It also allows the page to receive
// BeforeUnloadEvent
// event.
// allow-orientation-lock
// Lets the resource
// lock the screen orientation
// .
// allow-pointer-lock
// Allows the page to use the
// Pointer Lock API
// .
// allow-popups
// Allows popups (like from
// Window.open()
// ,
// target="_blank"
// ,
// Window.showModalDialog()
// ). If this keyword is not used, that functionality will silently fail.
// allow-popups-to-escape-sandbox
// Allows a sandboxed document to open a new browsing context without forcing the sandboxing flags upon it. This will allow, for example, a third-party advertisement to be safely sandboxed without forcing the same restrictions upon the page the ad links to. If this flag is not included, a redirected page, popup window, or new tab will be subject to the same sandbox restrictions as the originating
// <iframe>
// .
// allow-presentation
// Allows embedders to have control over whether an iframe can start a
// presentation session
// .
// allow-same-origin
// If this token is not used, the resource is treated as being from a special origin that always fails the
// same-origin policy
// (potentially preventing access to
// data storage/cookies
// and some JavaScript APIs).
// allow-scripts
// Allows the page to run scripts (but not create pop-up windows). If this keyword is not used, this operation is not allowed.
// allow-storage-access-by-user-activation
// Experimental
// Allows a document loaded in the
// <iframe>
// to use the
// Storage Access API
// to request access to unpartitioned cookies.
// allow-top-navigation
// Lets the resource navigate the top-level browsing context (the one named
// _top
// ).
// allow-top-navigation-by-user-activation
// Lets the resource navigate the top-level browsing context, but only if initiated by a user gesture.
// allow-top-navigation-to-custom-protocols
// Allows navigations to non-
// http
// protocols built into browser or
// registered by a website
// . This feature is also activated by
// allow-popups
// or
// allow-top-navigation
// keyword.
// Note:
// When the embedded document has the same origin as the embedding page, it is
// strongly discouraged
// to use both
// allow-scripts
// and
// allow-same-origin
// , as that lets the embedded document remove the
// sandbox
// attribute â making it no more secure than not using the
// sandbox
// attribute at all.
// Sandboxing is useless if the attacker can display content outside a sandboxed
// iframe
// â such as if the viewer opens the frame in a new tab. Such content should be also served from a
// separate origin
// to limit potential damage.
// Note:
// When redirecting the user, opening a popup window, or opening a new tab from an embedded page within an
// <iframe>
// with the
// sandbox
// attribute, the new browsing context is subject to the same
// sandbox
// restrictions. This can create issues â for example, if a page embedded within an
// <iframe>
// without a
// sandbox="allow-forms"
// or
// sandbox="allow-popups-to-escape-sandbox"
// attribute set on it opens a new site in a separate tab, form submission in that new browsing context will silently fail.
// src
// The URL of the page to embed. Use a value of
// about:blank
// to embed an empty page that conforms to the
// same-origin policy
// . Also note that programmatically removing an
// <iframe>
// 's src attribute (e.g., via
// Element.removeAttribute()
// ) causes
// about:blank
// to be loaded in the frame in Firefox (from version 65), Chromium-based browsers, and Safari/iOS.
// Note:
// The
// about:blank
// page uses the embedding document's URL as its base URL when resolving any relative URLs, such as anchor links.
// srcdoc
// Inline HTML to embed, overriding the
// src
// attribute. Its content should follow the syntax of a full HTML document, which includes the doctype directive,
// <html>
// ,
// <body>
// tags, etc., although most of them can be omitted, leaving only the body content. This doc will have
// about:srcdoc
// as its location. If a browser does not support the
// srcdoc
// attribute, it will fall back to the URL in the
// src
// attribute.
// Note:
// The
// about:srcdoc
// page uses the embedding document's URL as its base URL when resolving any relative URLs, such as anchor links.
// width
// The width of the frame in CSS pixels. Default is
// 300
// .
// Deprecated attributes
// These attributes are deprecated and may no longer be supported by all user agents. You should not use them in new content, and try to remove them from existing content.
// align
// Deprecated
// The alignment of this element with respect to the surrounding context.
// frameborder
// Deprecated
// The value
// 1
// (the default) draws a border around this frame. The value
// 0
// removes the border around this frame, but you should instead use the CSS property
// border
// to control
// <iframe>
// borders.
// longdesc
// Deprecated
// A URL of a long description of the frame's content. Due to widespread misuse, this is not helpful for non-visual browsers.
// marginheight
// Deprecated
// The amount of space in pixels between the frame's content and its top and bottom borders.
// marginwidth
// Deprecated
// The amount of space in pixels between the frame's content and its left and right borders.
// scrolling
// Deprecated
// Indicates when the browser should provide a scrollbar for the frame:
// auto
// Only when the frame's content is larger than its dimensions.
// yes
// Always show a scrollbar.
// no
// Never show a scrollbar.
// Scripting
// Inline frames, like
// <frame>
// elements, are included in the
// window.frames
// pseudo-array.
// With the DOM
// HTMLIFrameElement
// object, scripts can access the
// window
// object of the framed resource via the
// contentWindow
// property. The
// contentDocument
// property refers to the
// document
// inside the
// <iframe>
// , same as
// contentWindow.document
// .
// From the inside of a frame, a script can get a reference to its parent window with
// window.parent
// .
// Script access to a frame's content is subject to the
// same-origin policy
// . Scripts cannot access most properties in other
// window
// objects if the script was loaded from a different origin, including scripts inside a frame accessing the frame's parent. Cross-origin communication can be achieved using
// Window.postMessage()
// .
// Positioning and scaling
// Being a
// replaced element
// , the
// <iframe>
// allows the position of the embedded document within its box to be adjusted using the
// object-position
// property.
// Note:
// The
// object-fit
// property has no effect on
// <iframe>
// elements.
// error
// and
// load
// event behavior
// The
// error
// and
// load
// events fired on
// <iframe>
// s could be used to probe the URL space of the local network's HTTP servers. Therefore, as a security precaution user agents do not fire the
// error
// event on
// <iframe>
// s, and the
// load
// event is always triggered even if the
// <iframe>
// content fails to load.
// Accessibility
// People navigating with assistive technology such as a screen reader can use the
// title
// attribute
// on an
// <iframe>
// to label its content. The title's value should concisely describe the embedded content:
// html
// <iframe
//  title="Wikipedia page for Avocados"
//  src="https://en.wikipedia.org/wiki/Avocado"></iframe>
// Without this title, they have to navigate into the
// <iframe>
// to determine what its embedded content is. This context shift can be confusing and time-consuming, especially for pages with multiple
// <iframe>
// s and/or if embeds contain interactive content like video or audio.
// Examples
// A basic <iframe>
// This example embeds the page at
// https://example.org
// in an iframe. This is a common use case of iframes: to embed content from another site. For example, the live sample itself, and the
// try it
// example at the top, are both
// <iframe>
// embeds of content from another MDN site.
// HTML
// html
// <iframe
//  src="https://example.org"
//  title="iframe Example 1"
//  width="400"
//  height="300">
// </iframe>
// Result
// Embedding source code in an <iframe>
// This example directly renders source code in an iframe. This can be used as a technique to prevent script injection when displaying user-generated content, when combined with the
// sandbox
// attribute.
// Note that when using
// srcdoc
// , any relative URLs in the embedded content will be resolved relative to the URL of the embedding page. If you want to use anchor links that point to places in the embedded content, you need to explicitly specify
// about:srcdoc
// as the base URL.
// HTML
// html
// <article>
//  <footer>Nine minutes ago, <i>jc</i> wrote:</footer>
//  <iframe
//  sandbox
//  srcdoc="<p>There are two ways to use the <code>iframe</code> element:</p>
// <ol>
// <li><a href=&quot;about:srcdoc#embed_another&quot;>To embed content from another page</a></li>
// <li><a href=&quot;about:srcdoc#embed_user&quot;>To embed user-generated content</a></li>
// </ol>
// <h2 id=&quot;embed_another&quot;>Embedding content from another page</h2>
// <p>Use the <code>src</code> attribute to specify the URL of the page to embed:</p>
// <pre><code>&amp;lt;iframe src=&quot;https://example.org&quot;&amp;gt;&amp;lt;/iframe&amp;gt;</code></pre>
// <h2 id=&quot;embed_user&quot;>Embedding user-generated content</h2>
// <p>Use the <code>srcdoc</code> attribute to specify the content to embed. This post is already an example!</p>
// "
//  width="500"
//  height="250"
// ></iframe>
// </article>
// Here's how to write escape sequences when using
// srcdoc
// :
// First, write the HTML out, escaping anything you would escape in a normal HTML document (such as
// <
// ,
// >
// ,
// &
// , etc.).
// &lt;
// and
// <
// represent the exact same character in the
// srcdoc
// attribute. Therefore, to make it an actual escape sequence in the HTML document, replace any ampersands (
// &
// ) with
// &amp;
// . For example,
// &lt;
// becomes
// &amp;lt;
// , and
// &amp;
// becomes
// &amp;amp;
// .
// Replace any double quotes (
// "
// ) with
// &quot;
// to prevent the
// srcdoc
// attribute from being prematurely terminated (if you use
// '
// instead, then you should replace
// '
// with
// &apos;
// instead). This step happens after the previous one, so
// &quot;
// generated in this step doesn't become
// &amp;quot;
// .
// Result
// Technical summary
// Content categories
// Flow content
// ,
// phrasing content
// , embedded content, interactive content, palpable content.
// Permitted content
// None.
// Tag omission
// None, both the starting and ending tags are mandatory.
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
// HTMLIFrameElement
// Specifications
// Specification
// HTML
// #
// the-iframe-element
// Browser compatibility
// See also
// CSP: frame-ancestors
// Privacy, permissions, and information security

//
//  File.swift
//  swift-html-pointfree
//
//  Created by Coen ten Thije Boonkkamp on 05/04/2025.
//

import Foundation
