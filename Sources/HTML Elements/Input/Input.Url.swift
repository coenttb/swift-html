///
/// `Input.Url.swift`
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="url">` elements are used to let the user enter and edit a URL.
/// The input value is automatically validated to ensure that it's either empty or a properly-formatted URL.
extension Input {
    public struct Url: Sendable, Equatable {
        /// A string representing a URL, or empty.
        public var value: String?
        
        /// The id of a datalist element that provides a list of predefined values to suggest to the user.
        public var list: List?
        
        /// The maximum string length that the user can enter.
        public var maxlength: Maxlength?
        
        /// The minimum string length that the user can enter.
        public var minlength: Minlength?
        
        /// A regular expression that the input's value must match to be valid.
        public var pattern: Pattern?
        
        /// A brief hint displayed in the input field when it is empty.
        public var placeholder: Placeholder?
        
        /// A Boolean attribute which, if present, means this field cannot be edited by the user.
        public var readonly: Readonly?
        
        /// The visible width of the input field in characters.
        public var size: Size?
        
        /// Enable or disable spell-checking for this element.
        public var spellcheck: Spellcheck?
        
        /// Whether the input field is required to have a value before form submission.
        public var required: Required?
        
        /// Creates a new URL input configuration
        public init(
            value: String? = nil,
            list: List? = nil,
            maxlength: Maxlength? = nil,
            minlength: Minlength? = nil,
            pattern: Pattern? = nil,
            placeholder: Placeholder? = nil,
            readonly: Readonly? = nil,
            size: Size? = nil,
            spellcheck: Spellcheck? = nil,
            required: Required? = nil
        ) {
            self.value = value
            self.list = list
            self.maxlength = maxlength
            self.minlength = minlength
            self.pattern = pattern
            self.placeholder = placeholder
            self.readonly = readonly
            self.size = size
            self.spellcheck = spellcheck
            self.required = required
        }
    }
}

extension Input {
    /// Creates a new URL input element
    public static func url(
        name: String,
        value: String? = nil,
        list: List? = nil,
        maxlength: Maxlength? = nil,
        minlength: Minlength? = nil,
        pattern: Pattern? = nil,
        placeholder: Placeholder? = nil,
        readonly: Readonly? = nil,
        size: Size? = nil,
        spellcheck: Spellcheck? = nil,
        required: Required? = nil,
        disabled: Disabled? = nil,
        form: Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .url(
                .init(
                    value: value,
                    list: list,
                    maxlength: maxlength,
                    minlength: minlength,
                    pattern: pattern,
                    placeholder: placeholder,
                    readonly: readonly,
                    size: size,
                    spellcheck: spellcheck,
                    required: required
                )
            )
        )
    }
}


//<input type="url">
//
//
//Baseline Widely available
//
//
//
//<input> elements of type url are used to let the user enter and edit a URL.
//
//Try it
//HTML Demo: <input type="url">
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
//<form>
//  <label for="url">Enter an https:// URL:</label>
//  <input
//    type="url"
//    name="url"
//    id="url"
//    placeholder="https://example.com"
//    pattern="https://.*"
//    size="30"
//    required />
//</form>
//
//OUTPUT
//The input value is automatically validated to ensure that it's either empty or a properly-formatted URL before the form can be submitted. The :valid and :invalid CSS pseudo-classes are automatically applied as appropriate to visually denote whether the current value of the field is a valid URL or not.
//
//Value
//The <input> element's value attribute contains a string that is automatically validated as conforming to URL syntax. More specifically, there are two possible value formats that will pass validation:
//
//An empty string ("") indicates the user did not enter a value or that the value was removed.
//A single properly-formed absolute URL. This doesn't necessarily mean the URL address exists, but it is at least formatted correctly. An entry matching urlscheme://rest-of-url can be valid, even if the urlscheme entered doesn't exist.
//See Validation for details on how URLs are validated to ensure that they're formatted properly.
//
//Additional attributes
//In addition to the global attributes, and the attributes that operate on all <input> elements regardless of their type, url inputs support the following attributes.
//
//Note: The autocorrect global attribute can be added to url inputs, but the stored state is always off.
//list
//The values of the list attribute is the id of a <datalist> element located in the same document. The <datalist> provides a list of predefined values to suggest to the user for this input. Any values in the list that are not compatible with the type are not included in the suggested options. The values provided are suggestions, not requirements: users can select from this predefined list or provide a different value.
//
//maxlength
//The maximum string length (measured in UTF-16 code units) that the user can enter into the url input. This must be an integer value of 0 or higher. If no maxlength is specified, or an invalid value is specified, the url input has no maximum length. This value must also be greater than or equal to the value of minlength.
//
//The input will fail constraint validation if the length of the text value of the field is greater than maxlength UTF-16 code units long. Constraint validation is only applied when the value is changed by the user.
//
//minlength
//The minimum string length (measured in UTF-16 code units) that the user can enter into the url input. This must be a non-negative integer value smaller than or equal to the value specified by maxlength. If no minlength is specified, or an invalid value is specified, the url input has no minimum length.
//
//The input will fail constraint validation if the length of the text entered into the field is fewer than minlength UTF-16 code units long. Constraint validation is only applied when the value is changed by the user.
//
//pattern
//The pattern attribute, when specified, is a regular expression that the input's value must match for the value to pass constraint validation. It must be a valid JavaScript regular expression, as used by the RegExp type, and as documented in our guide on regular expressions; the 'u' flag is specified when compiling the regular expression so that the pattern is treated as a sequence of Unicode code points, instead of as ASCII. No forward slashes should be specified around the pattern text.
//
//If the specified pattern is not specified or is invalid, no regular expression is applied and this attribute is ignored completely.
//
//Note: Use the title attribute to specify text that most browsers will display as a tooltip to explain what the requirements are to match the pattern. You should also include other explanatory text nearby.
//See the section Pattern validation for details and an example.
//
//placeholder
//The placeholder attribute is a string that provides a brief hint to the user as to what kind of information is expected in the field. It should be a word or short phrase that demonstrates the expected type of data, rather than an explanatory message. The text must not include carriage returns or line feeds.
//
//If the control's content has one directionality (LTR or RTL) but needs to present the placeholder in the opposite directionality, you can use Unicode bidirectional algorithm formatting characters to override directionality within the placeholder; see How to use Unicode controls for bidi text for more information.
//
//Note: Avoid using the placeholder attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See <input> labels for more information.
//readonly
//The readonly Boolean attribute, if present, means this field cannot be edited by the user. Its value can, however, still be changed by JavaScript code directly setting the HTMLInputElement value property.
//
//Note: Because a read-only field cannot have a value, required does not have any effect on inputs with the readonly attribute also specified.
//size
//The size attribute is a numeric value indicating how many characters wide the input field should be. The value must be a number greater than zero, and the default value is 20. Since character widths vary, this may or may not be exact and should not be relied upon to be so; the resulting input may be narrower or wider than the specified number of characters, depending on the characters and the font (font settings in use).
//
//This does not set a limit on how many characters the user can enter into the field. It only specifies approximately how many can be seen at a time. To set an upper limit on the length of the input data, use the maxlength attribute.
//
//spellcheck
//The spellcheck global attribute is used to indicate whether to enable spell-checking for an element. It can be used on any editable content, but here we consider specifics related to the use of spellcheck on <input> elements. The permitted values for spellcheck are:
//
//false
//Disable spell-checking for this element.
//
//true
//Enable spell-checking for this element.
//
//"" (empty string) or no value
//Follow the element's default behavior for spell-checking. This may be based upon a parent's spellcheck setting or other factors.
//
//An input field can have spell-checking enabled if it doesn't have the readonly attribute set and is not disabled.
//
//The value returned by reading spellcheck may not reflect the actual state of spell-checking within a control if the user agent's preferences override the setting.
//
//Using URL inputs
//When you create a URL input with the proper type value, url, you get automatic validation that the entered text is at least in the correct form to potentially be a legitimate URL. This can help avoid cases in which the user mistypes their website's address, or provides an invalid one.
//
//It's important, however, to note that this is not enough to ensure that the specified text is a URL which actually exists, corresponds to the user of the site, or is acceptable in any other way. It ensures that the value of the field is properly formatted to be a URL.
//
//Note: A user can tinker with your HTML behind the scenes, so your site must not use this validation for any security purposes. You must verify the URL on the server-side of any transaction in which the provided text may have any security implications of any kind.
//A basic URL input
//This element is implemented as a standard text input field with basic validation features. In its most basic form, a URL input can be implemented like this:
//
//HTML
//Copy to Clipboard
//Play
//<input id="myURL" name="myURL" type="url" />
//Play
//
//Notice that it's considered valid when empty and when a single validly-formatted URL address is entered, but is otherwise not considered valid. By adding the required attribute, only properly-formed URLs are allowed; the input is no longer considered valid when empty.
//
//There is nothing magical going on here. Submitting this form would cause the following data to be sent to the server: myURL=http%3A%2F%2Fwww.example.com. Note how characters are escaped as necessary.
//
//Placeholders
//Sometimes it's helpful to offer an in-context hint as to what form the input data should take. This can be especially important if the page design doesn't offer descriptive labels for each <input>. This is where placeholders come in. A placeholder is a value that demonstrates the form the value should take by presenting an example of a valid value, which is displayed inside the edit box when the element's value is "". Once data is entered into the box, the placeholder disappears; if the box is emptied, the placeholder reappears.
//
//Here, we have a url input with the placeholder http://www.example.com. Note how the placeholder disappears and reappears as you manipulate the contents of the edit field.
//
//HTML
//Copy to Clipboard
//Play
//<input
//  id="myURL"
//  name="myURL"
//  type="url"
//  placeholder="http://www.example.com" />
//Play
//
//Controlling the input size
//You can control both the physical length of the input box and the minimum and maximum lengths allowed for the input text.
//
//Physical input element size
//
//The physical size of the input box can be controlled using the size attribute. With it, you can specify the number of characters the input box can display at a time. In this example, for instance, the url edit box is 30 characters wide:
//
//HTML
//Copy to Clipboard
//Play
//<input id="myURL" name="myURL" type="url" size="30" />
//Play
//
//Element value length
//
//The size is separate from the length limitation on the entered URL itself. You can specify a minimum length, in characters, for the entered URL using the minlength attribute; similarly, use maxlength to set the maximum length of the entered URL. If maxLength exceeds size, the input box's contents will scroll as needed to show the current selection or insertion point as the content is manipulated.
//
//The example below creates a 30-character wide URL address entry box, requiring that the contents be no shorter than 10 characters and no longer than 80 characters.
//
//HTML
//Copy to Clipboard
//Play
//<input
//  id="myURL"
//  name="myURL"
//  type="url"
//  size="30"
//  minlength="10"
//  maxlength="80" />
//Play
//
//Note: These attributes also affect validation; a value shorter or longer than the specified minimum/maximum lengths will be classified as invalid; in addition most browsers will refuse to let the user enter a value longer than the specified maximum length.
//Providing default options
//Providing a single default using the value attribute
//
//As always, you can provide a default value for a url input box by setting its value attribute:
//
//HTML
//Copy to Clipboard
//Play
//<input id="myURL" name="myURL" type="url" value="http://www.example.com" />
//Play
//
//Offering suggested values
//
//Taking it a step further, you can provide a list of default options from which the user can select by specifying the list attribute. This doesn't limit the user to those options, but does allow them to select commonly-used URLs more quickly. This also offers hints to autocomplete. The list attribute specifies the ID of a <datalist>, which in turn contains one <option> element per suggested value; each option's value is the corresponding suggested value for the URL entry box.
//
//HTML
//Copy to Clipboard
//Play
//<input id="myURL" name="myURL" type="url" list="defaultURLs" />
//
//<datalist id="defaultURLs">
//  <option value="https://developer.mozilla.org/"></option>
//  <option value="http://www.google.com/"></option>
//  <option value="http://www.microsoft.com/"></option>
//  <option value="https://www.mozilla.org/"></option>
//  <option value="http://w3.org/"></option>
//</datalist>
//Play
//
//With the <datalist> element and its <option>s in place, the browser will offer the specified values as potential values for the URL; this is typically presented as a popup or drop-down menu containing the suggestions. While the specific user experience may vary from one browser to another, typically clicking in the edit box presents a drop-down of the suggested URLs. Then, as the user types, the list is adjusted to show only matching values. Each typed character narrows down the list until the user makes a selection or types a custom value.
//
//Using labels for suggested values
//
//You can opt to include the label attribute on one or all of your <option> elements to provide textual labels. Some browsers may display only the labels, while others may display both the label and the URL.
//
//HTML
//Copy to Clipboard
//Play
//<input id="myURL" name="myURL" type="url" list="defaultURLs" />
//
//<datalist id="defaultURLs">
//  <option value="https://developer.mozilla.org/" label="MDN Web Docs"></option>
//  <option value="http://www.google.com/" label="Google"></option>
//  <option value="http://www.microsoft.com/" label="Microsoft"></option>
//  <option value="https://www.mozilla.org/" label="Mozilla"></option>
//  <option value="http://w3.org/" label="W3C"></option>
//</datalist>
//Play
//
//Validation
//There are two levels of content validation available for url inputs. First, there's the standard level of validation offered to all <input>s, which automatically ensures that the contents meet the requirements to be a valid URL. But there's also the option to add additional filtering to ensure that your own specialized needs are met, if you have any.
//
//Warning: HTML form validation is not a substitute for scripts that ensure that the entered data is in the proper format. It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it entirely. It's also possible for someone to bypass your HTML entirely and submit the data directly to your server. If your server-side code fails to validate the data it receives, disaster could strike when improperly-formatted data (or data which is too large, is of the wrong type, and so forth) is entered into your database.
//Basic validation
//Browsers that support the url input type automatically provide validation to ensure that only text that matches the standard format for URLs is entered into the input box.
//
//The syntax of a URL is fairly intricate. It's defined by WHATWG's URL Living Standard and is described for newcomers in our article What is a URL?
//
//Making a URL required
//As mentioned earlier, to make a URL entry required before the form can be submitted (you can't leave the field blank), you just need to include the required attribute on the input.
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <input id="myURL" name="myURL" type="url" required />
//  <button>Submit</button>
//</form>
//Play
//
//Try submitting the above form with no value entered to see what happens.
//
//Pattern validation
//If you need the entered URL to be restricted further than just "any string that looks like a URL," you can use the pattern attribute to specify a regular expression the value must match for the value to be valid.
//
//For example, let's say you're building a support page for employees of Myco, Inc. which will let them contact their IT department for help if one of their pages has a problem. In our simplified form, the user needs to enter the URL of the page that has a problem, and a message describing what is wrong. But we want the URL to only successfully validate if the entered URL is in a Myco domain.
//
//Since inputs of type url validate against both the standard URL validation and the specified pattern, you can implement this with a regular expression. Let's see how:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <div>
//    <label for="myURL">Enter the problem website address:</label>
//    <input
//      id="myURL"
//      name="myURL"
//      type="url"
//      required
//      pattern=".*\.myco\..*"
//      title="The URL must be in a Myco domain" />
//    <span class="validity"></span>
//  </div>
//  <div>
//    <label for="myComment">What is the problem?</label>
//    <input id="myComment" name="myComment" type="text" required />
//    <span class="validity"></span>
//  </div>
//  <div>
//    <button>Submit</button>
//  </div>
//</form>
//Play
//
//First of all, the required attribute is specified, making it mandatory that a valid URL be provided.
//
//Second, in the url input, we set pattern to ".*\.myco\..*". This regular expression requests a string that has any number of characters, followed by a dot, followed by "myco", followed by a dot, followed by any number of characters. Because the browser runs both the standard URL filter and our custom pattern against the specified text, we wind up with a validation that says "make sure this is a valid URL, and also in a Myco domain."
//
//This isn't perfect, but it is good enough for this basic demo's requirements.
//
//It's advisable to use the title attribute along with pattern. If you do, the title must describe the pattern; it should explain what format the data should take on, rather than any other information. That's because the title may be displayed or spoken as part of a validation error message. For example, the browser might present the message "The entered text doesn't match the required pattern." followed by your specified title. If your title is something like "URL", the result would be the message "The entered text doesn't match the required pattern. URL", which is not a good user experience.
//
//That's why, instead, we specify the string "The URL must be in a myco domain". By doing that, the resulting full error message might be something like "The entered text doesn't match the required pattern. The URL should be in a myco domain."
//
//Note: If you run into trouble while writing your validation regular expressions and they're not working properly, check your browser's console; there may be helpful error messages there to aid you in solving the problem.
//Examples
//There's not much else to say about url type inputs; check the Pattern validation and Using URL inputs sections for numerous examples.
//
//You can also find our pattern validation example on GitHub (see it running live also).
//
//Technical summary
//Value    A string representing a URL, or empty
//Events    change and input
//Supported Common Attributes    autocomplete, list, maxlength, minlength, pattern, placeholder, readonly, required and size
//IDL attributes    list, value, selectionEnd, selectionDirection
//DOM interface    HTMLInputElement
//Methods    select(), setRangeText() and setSelectionRange().
//Implicit ARIA Role    with no list attribute: textbox    with list attribute: combobox
