//<blockquote>: The Block Quotation element
//
//
//Baseline Widely available
//
//
//
//The <blockquote> HTML element indicates that the enclosed text is an extended quotation. Usually, this is rendered visually by indentation (see Notes for how to change it). A URL for the source of the quotation may be given using the cite attribute, while a text representation of the source can be given using the <cite> element.
//
//Try it
//HTML Demo: <blockquote>
//RESET
//HTML
//CSS
//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//<div>
//  <blockquote cite="https://www.huxley.net/bnw/four.html">
//    <p>
//      Words can be like X-rays, if you use them properly—they’ll go through
//      anything. You read and you’re pierced.
//    </p>
//  </blockquote>
//  <p>—Aldous Huxley, <cite>Brave New World</cite></p>
//</div>
//
//OUTPUT
//Attributes
//This element's attributes include the global attributes.
//
//cite
//A URL that designates a source document or message for the information quoted. This attribute is intended to point to information explaining the context or the reference for the quote.
//
//Usage notes
//According to the specification, attribution for the quotation, if any, must be placed outside the <blockquote> element.
//
//To change the indentation applied to the quoted text, use the CSS margin-left and/or margin-right properties, or the margin shorthand property.
//
//To include shorter quotes inline rather than in a separate block, use the <q> (Quotation) element.
//
//Examples
//This example demonstrates the use of the <blockquote> element to quote a passage from RFC 1149, A Standard for the Transmission of IP Datagrams on Avian Carriers.
//
//HTML
//Copy to Clipboard
//Play
//<blockquote cite="https://datatracker.ietf.org/doc/html/rfc1149">
//  <p>
//    Avian carriers can provide high delay, low throughput, and low altitude
//    service. The connection topology is limited to a single point-to-point path
//    for each carrier, used with standard carriers, but many carriers can be used
//    without significant interference with each other, outside early spring. This
//    is because of the 3D ether space available to the carriers, in contrast to
//    the 1D ether used by IEEE802.3. The carriers have an intrinsic collision
//    avoidance system, which increases availability.
//  </p>
//</blockquote>
//Result
//Play
//
//Technical summary
//Content categories    Flow content, sectioning root, palpable content.
//Permitted content    Flow content.
//Tag omission    None, both the starting and ending tag are mandatory.
//Permitted parents    Any element that accepts flow content.
//Implicit ARIA role    blockquote
//Permitted ARIA roles    Any
//DOM interface    HTMLQuoteElement
