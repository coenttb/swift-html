//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="reset">` elements are rendered as buttons, with a default click event
/// handler that resets all inputs in the form to their initial values.
///
/// Note: You should usually avoid including reset buttons in your forms. They're rarely
/// useful, and are instead more likely to frustrate users who click them by mistake
/// (often while trying to click the submit button).
extension Input {
    public struct Reset: Sendable, Equatable {
        /// The value attribute contains a string that is used as the button's label providing
        /// the button with an accessible description. If you don't specify a value, you get
        /// a button with the default label (typically "Reset," but this will vary depending
        /// on the user agent).
        public var value: String?
        
        /// Creates a new reset input configuration
        public init(
            value: String? = nil
        ) {
            self.value = value
        }
    }
}


//input type="reset">
//
//
//Baseline Widely available

extension Input {
    /// Creates a new reset input element
    public static func reset(
        name: String,
        value: String? = nil,
        disabled: Disabled? = nil,
        form: Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .reset(
                .init(
                    value: value
                )
            )
        )
    }
}
//
//
//
//<input> elements of type reset are rendered as buttons, with a default click event handler that resets all inputs in the form to their initial values.
//
//Try it
//HTML Demo: <input type="reset">
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
//<form>
//  <div class="controls">
//    <label for="id">User ID:</label>
//    <input type="text" id="id" name="id" />
//
//    <input type="reset" value="Reset" />
//    <input type="submit" value="Submit" />
//  </div>
//</form>
//
//OUTPUT
//Note: You should usually avoid including reset buttons in your forms. They're rarely useful, and are instead more likely to frustrate users who click them by mistake (often while trying to click the submit button).
//Value
//An <input type="reset"> element's value attribute contains a string that is used as the button's label providing the button with an accessible description. Buttons such as reset don't have a value otherwise.
//
//Setting the value attribute
//HTML
//Copy to Clipboard
//Play
//<input type="reset" value="Reset the form" />
//Play
//
//Omitting the value attribute
//If you don't specify a value, you get a button with the default label (typically "Reset," but this will vary depending on the user agent):
//
//HTML
//Copy to Clipboard
//Play
//<input type="reset" />
//Play
//
//Using reset buttons
//<input type="reset"> buttons are used to reset forms. If you want to create a custom button and then customize the behavior using JavaScript, you need to use <input type="button">, or better still, a <button> element.
//
//A basic reset button
//We'll begin by creating a basic reset button:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <div>
//    <label for="example">Type in some sample text</label>
//    <input id="example" type="text" />
//  </div>
//  <div>
//    <input type="reset" value="Reset the form" />
//  </div>
//</form>
//This renders like so:
//
//Play
//
//Try entering some text into the text field, and then pressing the reset button.
//
//Adding a reset keyboard shortcut
//To add a keyboard shortcut to a reset button — just as you would with any <input> for which it makes sense — you use the accesskey global attribute.
//
//In this example, r is specified as the access key (you'll need to press r plus the particular modifier keys for your browser/OS combination; see accesskey for a useful list of those).
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <div>
//    <label for="example">Type in some sample text</label>
//    <input id="example" type="text" />
//  </div>
//  <div>
//    <input type="reset" value="Reset the form" accesskey="r" />
//  </div>
//</form>
//Play
//
//The problem with the above example is that there's no way for the user to know what the access key is! This is especially true since the modifiers are typically non-standard to avoid conflicts. When building a site, be sure to provide this information in a way that doesn't interfere with the site design (for example by providing an easily accessible link that points to information on what the site access keys are). Adding a tooltip to the button (using the title attribute) can also help, although it's not a complete solution for accessibility purposes.
//
//Disabling and enabling a reset button
//To disable a reset button, specify the disabled attribute on it, like so:
//
//HTML
//Copy to Clipboard
//<input type="reset" value="Disabled" disabled />
//You can enable and disable buttons at run time by setting disabled to true or false; in JavaScript this looks like btn.disabled = true or btn.disabled = false.
//
//Note: See the <input type="button"> page for more ideas about enabling and disabling buttons.
//Validation
//Buttons don't participate in constraint validation; they have no real value to be constrained.
//
//Examples
//We've included basic examples above. There isn't really anything more to say about reset buttons.
//
//Technical summary
//Value    A string used as the button's label
//Events    click
//Supported common attributes    type and value
//IDL attributes    value
//DOM interface    HTMLInputElement
//Methods    None
//Implicit ARIA Role    button
