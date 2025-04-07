//<bdo>: The Bidirectional Text Override element
//
//
//Baseline Widely available
//
//
//
//The <bdo> HTML element overrides the current directionality of text, so that the text within is rendered in a different direction.
//
//Try it
//HTML Demo: <bdo>
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
//11
//12
//13
//14
//<h1>Famous seaside songs</h1>
//
//<p>The English song "Oh I do like to be beside the seaside"</p>
//
//<p>
//  Looks like this in Hebrew:
//  <span dir="rtl">אה, אני אוהב להיות ליד חוף הים</span>
//</p>
//
//<p>
//  In the computer's memory, this is stored as
//  <bdo dir="ltr">אה, אני אוהב להיות ליד חוף הים</bdo>
//</p>
//
//OUTPUT
//The text's characters are drawn from the starting point in the given direction; the individual characters' orientation is not affected (so characters don't get drawn backward, for example).
//
//Attributes
//This element's attributes include the global attributes.
//
//dir
//The direction in which text should be rendered in this element's contents. Possible values are:
//
//ltr: Indicates that the text should go in a left-to-right direction.
//rtl: Indicates that the text should go in a right-to-left direction.
//Examples
//HTML
//Copy to Clipboard
//Play
//<!-- Switch text direction -->
//<p>This text will go left to right.</p>
//<p><bdo dir="rtl">This text will go right to left.</bdo></p>
//Result
//Play
//
//Notes
//The HTML 4 specification did not specify events for this element; they were added in XHTML. This is most likely an oversight.
//
//Technical summary
//Content categories    Flow content, phrasing content, palpable content.
//Permitted content    Phrasing content.
//Tag omission    None, both the starting and ending tag are mandatory.
//Permitted parents    Any element that accepts phrasing content.
//Implicit ARIA role    generic
//Permitted ARIA roles    Any
//DOM interface    HTMLElement Up to Gecko 1.9.2 (Firefox 4) inclusive, Firefox implements the HTMLSpanElement interface for this element.
