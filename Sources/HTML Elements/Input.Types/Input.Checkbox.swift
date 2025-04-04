//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import HTML_Attributes

/// `<input type="checkbox">` elements are rendered by default as boxes that are checked (ticked) when activated.
/// A checkbox allows you to select single values for submission in a form (or not).
///
/// Note: Radio buttons are similar to checkboxes, but with an important distinction — same-named radio buttons are
/// grouped into a set in which only one radio button can be selected at a time, whereas checkboxes allow you to
/// turn single values on and off. Where multiple same-named controls exist, radio buttons allow one to be selected
/// out of them all, whereas checkboxes allow multiple values to be selected.
extension Input {
    public struct Checkbox: Sendable, Equatable {
        /// A string representing the value of the checkbox. This is not displayed on the client-side, but on the server
        /// this is the value given to the data submitted with the checkbox's name. If the value attribute is omitted,
        /// the default value for the checkbox is "on".
        ///
        /// Note: If a checkbox is unchecked when its form is submitted, neither the name nor the value is
        /// submitted to the server.
        public var value: String?
        
        /// A boolean attribute indicating whether this checkbox is checked by default (when the page loads).
        public var checked: Checked?
        
        /// A boolean attribute indicating whether this checkbox is checked by default (when the page loads).
        public var required: Required?
        
        /// Creates a new checkbox input configuration
        public init(
            value: String? = nil,
            checked: Checked? = nil,
            required: Required? = nil
        ) {
            self.value = value
            self.checked = checked
            self.required = required
        }
    }
}

extension Input {
    /// Creates a new checkbox input element
    public static func checkbox(
        name: String,
        value: String? = nil,
        checked: Checked? = nil,
        required: Required? = nil,
        disabled: Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .checkbox(
                .init(
                    value: value,
                    checked: checked,
                    required: required
                )
            )
        )
    }
}


//<input type="checkbox">
//
//
//Baseline Widely available
//
//
//
//<input> elements of type checkbox are rendered by default as boxes that are checked (ticked) when activated, like you might see in an official government paper form. The exact appearance depends upon the operating system configuration under which the browser is running. Generally this is a square but it may have rounded corners. A checkbox allows you to select single values for submission in a form (or not).
//
//Try it
//HTML Demo: <input type="checkbox">
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
//<fieldset>
//  <legend>Choose your monster's features:</legend>
//
//  <div>
//    <input type="checkbox" id="scales" name="scales" checked />
//    <label for="scales">Scales</label>
//  </div>
//
//  <div>
//    <input type="checkbox" id="horns" name="horns" />
//    <label for="horns">Horns</label>
//  </div>
//</fieldset>
//
//OUTPUT
//Note: Radio buttons are similar to checkboxes, but with an important distinction — same-named radio buttons are grouped into a set in which only one radio button can be selected at a time, whereas checkboxes allow you to turn single values on and off. Where multiple same-named controls exist, radio buttons allow one to be selected out of them all, whereas checkboxes allow multiple values to be selected.
//Value
//A string representing the value of the checkbox. This is not displayed on the client-side, but on the server this is the value given to the data submitted with the checkbox's name. Take the following example:
//
//HTML
//Copy to Clipboard
//<form>
//  <div>
//    <input
//      type="checkbox"
//      id="subscribeNews"
//      name="subscribe"
//      value="newsletter" />
//    <label for="subscribeNews">Subscribe to newsletter?</label>
//  </div>
//  <div>
//    <button type="submit">Subscribe</button>
//  </div>
//</form>
//In this example, we've got a name of subscribe, and a value of newsletter. When the form is submitted, the data name/value pair will be subscribe=newsletter.
//
//If the value attribute was omitted, the default value for the checkbox is on, so the submitted data in that case would be subscribe=on.
//
//Note: If a checkbox is unchecked when its form is submitted, neither the name nor the value is submitted to the server. There is no HTML-only method of representing a checkbox's unchecked state (e.g. value=unchecked). If you wanted to submit a default value for the checkbox when it is unchecked, you could include JavaScript to create a <input type="hidden"> within the form with a value indicating an unchecked state.
//Additional attributes
//In addition to the common attributes shared by all <input> elements, checkbox inputs support the following attributes.
//
//checked
//A boolean attribute indicating whether this checkbox is checked by default (when the page loads). It does not indicate whether this checkbox is currently checked: if the checkbox's state is changed, this content attribute does not reflect the change. (Only the HTMLInputElement's checked IDL attribute is updated.)
//
//Note: Unlike other input controls, a checkbox's value is only included in the submitted data if the checkbox is currently checked. If it is, then the value of the checkbox's value attribute is reported as the input's value, or on if no value is set. Unlike other browsers, Firefox by default persists the dynamic checked state of an <input> across page loads. Use the autocomplete attribute to control this feature.
//value
//The value attribute is one which all <input>s share; however, it serves a special purpose for inputs of type checkbox: when a form is submitted, only checkboxes which are currently checked are submitted to the server, and the reported value is the value of the value attribute. If the value is not otherwise specified, it is the string on by default. This is demonstrated in the section Value above.
//
//Using checkbox inputs
//We already covered the most basic use of checkboxes above. Let's now look at the other common checkbox-related features and techniques you'll need.
//
//Handling multiple checkboxes
//The example we saw above only contained one checkbox; in real-world situations you'll be likely to encounter multiple checkboxes. If they are completely unrelated, then you can just deal with them all separately, as shown above. However, if they're all related, things are not quite so simple.
//
//For example, in the following demo we include multiple checkboxes to allow the user to select their interests (see the full version in the Examples section).
//
//HTML
//Copy to Clipboard
//Play
//<fieldset>
//  <legend>Choose your interests</legend>
//  <div>
//    <input type="checkbox" id="coding" name="interest" value="coding" />
//    <label for="coding">Coding</label>
//  </div>
//  <div>
//    <input type="checkbox" id="music" name="interest" value="music" />
//    <label for="music">Music</label>
//  </div>
//</fieldset>
//Play
//
//In this example you will see that we've given each checkbox the same name. If both checkboxes are checked and then the form is submitted, you'll get a string of name/value pairs submitted like this: interest=coding&interest=music. When this string reaches the server, you need to parse it other than as an associative array, so all values, not only the last value, of interest are captured. For one technique used with Python, see Handle Multiple Checkboxes with a Single Serverside Variable, for example.
//
//Checking boxes by default
//To make a checkbox checked by default, you give it the checked attribute. See the below example:
//
//HTML
//Copy to Clipboard
//Play
//<fieldset>
//  <legend>Choose your interests</legend>
//  <div>
//    <input type="checkbox" id="coding" name="interest" value="coding" checked />
//    <label for="coding">Coding</label>
//  </div>
//  <div>
//    <input type="checkbox" id="music" name="interest" value="music" />
//    <label for="music">Music</label>
//  </div>
//</fieldset>
//Play
//
//Providing a bigger hit area for your checkboxes
//In the above examples, you may have noticed that you can toggle a checkbox by clicking on its associated <label> element as well as on the checkbox itself. This is a really useful feature of HTML form labels that makes it easier to click the option you want, especially on small-screen devices like smartphones.
//
//Beyond accessibility, this is another good reason to properly set up <label> elements on your forms.
//
//Indeterminate state checkboxes
//A checkbox can be in an indeterminate state. This is set using the HTMLInputElement object's indeterminate property via JavaScript (it cannot be set using an HTML attribute):
//
//JS
//Copy to Clipboard
//inputInstance.indeterminate = true;
//When indeterminate is true, the checkbox has a horizontal line in the box (it looks somewhat like a hyphen or minus sign) instead of a check/tick in most browsers.
//
//Note: This is purely a visual change. It has no impact on whether the checkbox's value is used in a form submission. That is decided by the checked state, regardless of the indeterminate state.
//There are not many use cases for this property. The most common is when a checkbox is available that "owns" a number of sub-options (which are also checkboxes). If all of the sub-options are checked, the owning checkbox is also checked, and if they're all unchecked, the owning checkbox is unchecked. If any one or more of the sub-options have a different state than the others, the owning checkbox is in the indeterminate state.
//
//This can be seen in the below example (thanks to CSS Tricks for the inspiration). In this example we keep track of the ingredients we are collecting for a recipe. When you check or uncheck an ingredient's checkbox, a JavaScript function checks the total number of checked ingredients:
//
//If none are checked, the recipe name's checkbox is set to unchecked.
//If one or two are checked, the recipe name's checkbox is set to indeterminate.
//If all three are checked, the recipe name's checkbox is set to checked.
//So in this case the indeterminate state is used to state that collecting the ingredients has started, but the recipe is not yet complete.
//
//JS
//Copy to Clipboard
//const overall = document.querySelector("#enchantment");
//const ingredients = document.querySelectorAll("ul input");
//
//overall.addEventListener("click", (e) => {
//  e.preventDefault();
//});
//
//for (const ingredient of ingredients) {
//  ingredient.addEventListener("click", updateDisplay);
//}
//
//function updateDisplay() {
//  let checkedCount = 0;
//  for (const ingredient of ingredients) {
//    if (ingredient.checked) {
//      checkedCount++;
//    }
//  }
//
//  if (checkedCount === 0) {
//    overall.checked = false;
//    overall.indeterminate = false;
//  } else if (checkedCount === ingredients.length) {
//    overall.checked = true;
//    overall.indeterminate = false;
//  } else {
//    overall.checked = false;
//    overall.indeterminate = true;
//  }
//}
//
//Validation
//Checkboxes do support validation (offered to all <input>s). However, most of the ValidityStates will always be false. If the checkbox has the required attribute, but is not checked, then ValidityState.valueMissing will be true.
//
//Examples
//The following example is an extended version of the "multiple checkboxes" example we saw above — it has more standard options, plus an "other" checkbox that when checked causes a text field to appear to enter a value for the "other" option. This is achieved with a short block of JavaScript. The example includes implicit labels, with the <input> directly inside the <label>. The text input, without a visible label, includes the aria-label attribute which provides its accessible name. This example also includes some CSS to improve the styling.
//
//HTML
//HTML
//Copy to Clipboard
//Play
//<form>
//  <fieldset>
//    <legend>Choose your interests</legend>
//    <div>
//      <label>
//        <input type="checkbox" id="coding" name="interest" value="coding" />
//        Coding
//      </label>
//    </div>
//    <div>
//      <label>
//        <input type="checkbox" id="music" name="interest" value="music" />
//        Music
//      </label>
//    </div>
//    <div>
//      <label>
//        <input type="checkbox" id="art" name="interest" value="art" />
//        Art
//      </label>
//    </div>
//    <div>
//      <label>
//        <input type="checkbox" id="sports" name="interest" value="sports" />
//        Sports
//      </label>
//    </div>
//    <div>
//      <label>
//        <input type="checkbox" id="cooking" name="interest" value="cooking" />
//        Cooking
//      </label>
//    </div>
//    <div>
//      <label>
//        <input type="checkbox" id="other" name="interest" value="other" />
//        Other
//      </label>
//      <input
//        type="text"
//        id="otherValue"
//        name="other"
//        aria-label="Other interest" />
//    </div>
//    <div>
//      <button type="submit">Submit form</button>
//    </div>
//  </fieldset>
//</form>
//CSS
//CSS
//Copy to Clipboard
//Play
//html {
//  font-family: sans-serif;
//}
//
//form {
//  width: 600px;
//  margin: 0 auto;
//}
//
//div {
//  margin-bottom: 10px;
//}
//
//fieldset {
//  background: cyan;
//  border: 5px solid blue;
//}
//
//legend {
//  padding: 10px;
//  background: blue;
//  color: cyan;
//}
//JavaScript
//JS
//Copy to Clipboard
//Play
//const otherCheckbox = document.querySelector("#other");
//const otherText = document.querySelector("#otherValue");
//otherText.style.visibility = "hidden";
//
//otherCheckbox.addEventListener("change", () => {
//  if (otherCheckbox.checked) {
//    otherText.style.visibility = "visible";
//    otherText.value = "";
//  } else {
//    otherText.style.visibility = "hidden";
//  }
//});
//Play
//
//Technical summary
//Value    A string representing the value of the checkbox.
//Events    change and input
//Supported common attributes    checked
//IDL attributes    checked, indeterminate and value
//DOM interface    HTMLInputElement
//Methods    select()
//Implicit ARIA Role    checkbox
