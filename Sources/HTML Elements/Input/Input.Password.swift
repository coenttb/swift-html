//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="password">` elements provide a way for the user to securely enter a password.
///
/// The element is presented as a one-line plain text editor control in which the text is obscured
/// so that it cannot be read, usually by replacing each character with a symbol such as the
/// asterisk ("*") or a dot ("•"). This character will vary depending on the user agent and operating system.
///
/// Note: Any forms involving sensitive information like passwords (such as login forms) should be
/// served over HTTPS. Many browsers now implement mechanisms to warn against insecure login forms.
extension Input {
    public struct Password: Sendable, Equatable {
        /// The value attribute contains a string whose value is the current contents of the text
        /// editing control being used to enter the password. If the user hasn't entered anything yet,
        /// this value is an empty string ("").
        public var value: String?
        
        /// The maximum string length (measured in UTF-16 code units) that the user can enter into the password field.
        /// This must be an integer value of 0 or higher. If no maxlength is specified, or an invalid value is specified,
        /// the password field has no maximum length. This value must also be greater than or equal to the value of minlength.
        public var maxlength: Maxlength?
        
        /// The minimum string length (measured in UTF-16 code units) that the user can enter into the password entry field.
        /// This must be a non-negative integer value smaller than or equal to the value specified by maxlength.
        /// If no minlength is specified, or an invalid value is specified, the password input has no minimum length.
        public var minlength: Minlength?
        
        /// The pattern attribute, when specified, is a regular expression that the input's value must match
        /// for the value to pass constraint validation. It must be a valid JavaScript regular expression.
        ///
        /// Use of a pattern is strongly recommended for password inputs, in order to help ensure that valid
        /// passwords using a wide assortment of character classes are selected and used by your users.
        public var pattern: Pattern?
        
        /// The placeholder attribute is a string that provides a brief hint to the user as to what kind
        /// of information is expected in the field. It should be a word or short phrase that demonstrates
        /// the expected type of data, rather than an explanatory message.
        public var placeholder: Placeholder?
        
        /// A Boolean attribute which, if present, means this field cannot be edited by the user.
        public var readonly: Readonly?
        
        /// The size attribute is a numeric value indicating how many characters wide the input field should be.
        /// The value must be a number greater than zero, and the default value is 20.
        public var size: Size?
        
        /// The autocomplete attribute allows the browser to fill out the password field automatically.
        ///
        /// Common values for password fields include:
        /// - "current-password" - For login forms
        /// - "new-password" - For registration and password change forms
        /// - "one-time-code" - For one-time passwords
        /// - "off" - Don't autocomplete (though some browsers might ignore this)
        public var autocomplete: String?
        
        /// Creates a new password input configuration
        public init(
            value: String? = nil,
            maxlength: Maxlength? = nil,
            minlength: Minlength? = nil,
            pattern: Pattern? = nil,
            placeholder: Placeholder? = nil,
            readonly: Readonly? = nil,
            size: Size? = nil,
            autocomplete: String? = nil
        ) {
            self.value = value
            self.maxlength = maxlength
            self.minlength = minlength
            self.pattern = pattern
            self.placeholder = placeholder
            self.readonly = readonly
            self.size = size
            self.autocomplete = autocomplete
        }
    }
}


//<input type="password">
//
//
//Baseline Widely available *

extension Input {
    /// Creates a new password input element
    public static func password(
        name: String,
        value: String? = nil,
        maxlength: Maxlength? = nil,
        minlength: Minlength? = nil,
        pattern: Pattern? = nil,
        placeholder: Placeholder? = nil,
        readonly: Readonly? = nil,
        size: Size? = nil,
        autocomplete: String? = nil,
        disabled: Disabled? = nil,
        form: Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .password(
                .init(
                    value: value,
                    maxlength: maxlength,
                    minlength: minlength,
                    pattern: pattern,
                    placeholder: placeholder,
                    readonly: readonly,
                    size: size,
                    autocomplete: autocomplete
                )
            )
        )
    }
}
//
//
//
//<input> elements of type password provide a way for the user to securely enter a password.
//
//The element is presented as a one-line plain text editor control in which the text is obscured so that it cannot be read, usually by replacing each character with a symbol such as the asterisk ("*") or a dot ("•"). This character will vary depending on the user agent and operating system.
//
//Try it
//HTML Demo: <input type="password">
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
//<div>
//  <label for="username">Username:</label>
//  <input type="text" id="username" name="username" />
//</div>
//
//<div>
//  <label for="pass">Password (8 characters minimum):</label>
//  <input type="password" id="pass" name="password" minlength="8" required />
//</div>
//
//<input type="submit" value="Sign in" />
//
//OUTPUT
//The precise behavior of the entry process may vary from browser to browser. Some browsers display the typed character for a moment before obscuring it, while others allow the user to toggle the display of plain-text on and off. Both approaches help a user check that they entered the intended password, which can be particularly difficult on mobile devices.
//
//Note: Any forms involving sensitive information like passwords (such as login forms) should be served over HTTPS. Many browsers now implement mechanisms to warn against insecure login forms; see Insecure passwords.
//Value
//The value attribute contains a string whose value is the current contents of the text editing control being used to enter the password. If the user hasn't entered anything yet, this value is an empty string (""). If the required property is specified, then the password edit box must contain a value other than an empty string to be valid.
//
//If the pattern attribute is specified, the content of a password control is only considered valid if the value passes validation; see Validation for more information.
//
//Note: The line feed (U+000A) and carriage return (U+000D) characters are not permitted in a password value. When setting the value of a password control, line feed and carriage return characters are stripped out of the value.
//Additional attributes
//In addition to the global attributes, and the attributes that operate on all <input> elements regardless of their type, password field inputs support the following attributes.
//
//Note: The autocorrect global attribute can be added to password inputs, but the stored state is always off.
//maxlength
//The maximum string length (measured in UTF-16 code units) that the user can enter into the password field. This must be an integer value of 0 or higher. If no maxlength is specified, or an invalid value is specified, the password field has no maximum length. This value must also be greater than or equal to the value of minlength.
//
//The input will fail constraint validation if the length of the text entered into the field is greater than maxlength UTF-16 code units long. Constraint validation is only applied when the value is changed by the user.
//
//minlength
//The minimum string length (measured in UTF-16 code units) that the user can enter into the password entry field. This must be a non-negative integer value smaller than or equal to the value specified by maxlength. If no minlength is specified, or an invalid value is specified, the password input has no minimum length.
//
//The input will fail constraint validation if the length of the text entered into the field is fewer than minlength UTF-16 code units long. Constraint validation is only applied when the value is changed by the user.
//
//pattern
//The pattern attribute, when specified, is a regular expression that the input's value must match for the value to pass constraint validation. It must be a valid JavaScript regular expression, as used by the RegExp type, and as documented in our guide on regular expressions; the 'u' flag is specified when compiling the regular expression, so that the pattern is treated as a sequence of Unicode code points, instead of as ASCII. No forward slashes should be specified around the pattern text.
//
//If the specified pattern is not specified or is invalid, no regular expression is applied and this attribute is ignored completely.
//
//Note: Use the title attribute to specify text that most browsers will display as a tooltip to explain what the requirements are to match the pattern. You should also include other explanatory text nearby.
//Use of a pattern is strongly recommended for password inputs, in order to help ensure that valid passwords using a wide assortment of character classes are selected and used by your users. With a pattern, you can mandate case rules, require the use of some number of digits and/or punctuation characters, and so forth. See the section Validation for details and an example.
//
//placeholder
//The placeholder attribute is a string that provides a brief hint to the user as to what kind of information is expected in the field. It should be a word or short phrase that demonstrates the expected type of data, rather than an explanatory message. The text must not include carriage returns or line feeds.
//
//If the control's content has one directionality (LTR or RTL) but needs to present the placeholder in the opposite directionality, you can use Unicode bidirectional algorithm formatting characters to override directionality within the placeholder; see How to use Unicode controls for bidi text for more information.
//
//Note: Avoid using the placeholder attribute if you can. It is not as semantically useful as other ways to explain your form, and can cause unexpected technical issues with your content. See <input> labels for more information.
//readonly
//A Boolean attribute which, if present, means this field cannot be edited by the user. Its value can, however, still be changed from JavaScript code that directly sets the value of the HTMLInputElement.value property.
//
//Note: Because a read-only field cannot have a value, required does not have any effect on inputs with the readonly attribute also specified.
//size
//The size attribute is a numeric value indicating how many characters wide the input field should be. The value must be a number greater than zero, and the default value is 20. Since character widths vary, this may or may not be exact and should not be relied upon to be so; the resulting input may be narrower or wider than the specified number of characters, depending on the characters and the font (font settings in use).
//
//This does not set a limit on how many characters the user can enter into the field. It only specifies approximately how many can be seen at a time. To set an upper limit on the length of the input data, use the maxlength attribute.
//
//Using password inputs
//Password input boxes generally work just like other textual input boxes; the main difference is the obscuring of the content to prevent people near the user from reading the password.
//
//A basic password input
//Here we see the most basic password input, with a label established using the <label> element.
//
//HTML
//Copy to Clipboard
//Play
//<label for="userPassword">Password: </label>
//<input id="userPassword" type="password" />
//Play
//
//Allowing autocomplete
//To allow the user's password manager to automatically enter the password, specify the autocomplete attribute. For passwords, this should typically be one of the following:
//
//on
//Allow the browser or a password manager to automatically fill out the password field. This isn't as informative as using either current-password or new-password.
//
//off
//Don't allow the browser or password manager to automatically fill out the password field. Note that some software ignores this value, since it's typically harmful to users' ability to maintain safe password practices.
//
//current-password
//Allow the browser or password manager to enter the current password for the site. This provides more information than on does, since it lets the browser or password manager automatically enter currently-known password for the site in the field, but not to suggest a new one.
//
//new-password
//Allow the browser or password manager to automatically enter a new password for the site; this is used on "change your password" and "new user" forms, on the field asking the user for a new password. The new password may be generated in a variety of ways, depending on the password manager in use. It may fill in a new suggested password, or it might show the user an interface for creating one.
//
//HTML
//Copy to Clipboard
//Play
//<label for="userPassword">Password:</label>
//<input id="userPassword" type="password" autocomplete="current-password" />
//Play
//
//Making the password mandatory
//To tell the user's browser that the password field must have a valid value before the form can be submitted, specify the Boolean required attribute.
//
//HTML
//Copy to Clipboard
//Play
//<label for="userPassword">Password: </label>
//<input id="userPassword" type="password" required />
//<input type="submit" value="Submit" />
//Play
//
//Specifying an input mode
//If your recommended (or required) password syntax rules would benefit from an alternate text entry interface than the standard keyboard, you can use the inputmode attribute to request a specific one. The most obvious use case for this is if the password is required to be numeric (such as a PIN). Mobile devices with virtual keyboards, for example, may opt to switch to a numeric keypad layout instead of a full keyboard, to make entering the password easier. If the PIN is for one-time use, set the autocomplete attribute to either off or one-time-code to suggest that it's not saved.
//
//HTML
//Copy to Clipboard
//Play
//<label for="pin">PIN: </label>
//<input id="pin" type="password" inputmode="numeric" />
//Play
//
//Setting length requirements
//As usual, you can use the minlength and maxlength attributes to establish minimum and maximum acceptable lengths for the password. This example expands on the previous one by specifying that the user's PIN must be at least four and no more than eight digits. The size attribute is used to ensure that the password entry control is eight characters wide.
//
//HTML
//Copy to Clipboard
//Play
//<label for="pin">PIN:</label>
//<input
//  id="pin"
//  type="password"
//  inputmode="numeric"
//  minlength="4"
//  maxlength="8"
//  size="8" />
//Play
//
//Selecting text
//As with other textual entry controls, you can use the select() method to select all the text in the password field.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<label for="userPassword">Password: </label>
//<input id="userPassword" type="password" size="12" />
//<button id="selectAll">Select All</button>
//JavaScript
//
//JS
//Copy to Clipboard
//Play
//document.getElementById("selectAll").onclick = () => {
//  document.getElementById("userPassword").select();
//};
//Result
//
//Play
//
//You can also use selectionStart and selectionEnd to get (or set) what range of characters in the control are currently selected, and selectionDirection to know which direction selection occurred in (or will be extended in, depending on your platform; see its documentation for an explanation). However, given that the text is obscured, the usefulness of these is somewhat limited.
//
//Validation
//If your application has character set restrictions or any other requirement for the actual content of the entered password, you can use the pattern attribute to establish a regular expression to be used to automatically ensure that your passwords meet those requirements.
//
//In this example, only values consisting of at least four and no more than eight hexadecimal digits are valid.
//
//HTML
//Copy to Clipboard
//Play
//<label for="hexId">Hex ID: </label>
//<input
//  id="hexId"
//  type="password"
//  pattern="[0-9a-fA-F]{4,8}"
//  title="Enter an ID consisting of 4-8 hexadecimal digits"
//  autocomplete="new-password" />
//Play
//
//Examples
//Requesting a Social Security number
//This example only accepts input which matches the format for a valid United States Social Security Number. These numbers, used for tax and identification purposes in the US, are in the form "123-45-6789". Assorted rules for what values are permitted in each group exist as well.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<label for="ssn">SSN:</label>
//<input
//  type="password"
//  id="ssn"
//  inputmode="numeric"
//  minlength="9"
//  maxlength="12"
//  pattern="(?!000)([0-6]\d{2}|7([0-6]\d|7[012]))([ -])?(?!00)\d\d\3(?!0000)\d{4}"
//  required
//  autocomplete="off" />
//<br />
//<label for="ssn">Value:</label>
//<span id="current"></span>
//This uses a pattern which limits the entered value to strings representing legal Social Security numbers. Obviously, this regexp doesn't guarantee a valid SSN (since we don't have access to the Social Security Administration's database), but it does ensure the number could be one; it generally avoids values that cannot be valid. In addition, it allows the three groups of digits to be separated by a space, a dash ("-"), or nothing.
//
//The inputmode is set to numeric to encourage devices with virtual keyboards to switch to a numeric keypad layout for easier entry. The minlength and maxlength attributes are set to 9 and 12, respectively, to require that the value be at least nine and no more than 12 characters (the former without separating characters between the groups of digits and the latter with them). The required attribute is used to indicate that this control must have a value. Finally, autocomplete is set to off to avoid password managers and session restore features trying to set its value, since this isn't a password at all.
//
//JavaScript
//
//The JavaScript displays the entered SSN onscreen so you can see it. This defeats the purpose of a password field, but it helps experiment with the pattern.
//
//JS
//Copy to Clipboard
//Play
//const ssn = document.getElementById("ssn");
//const current = document.getElementById("current");
//
//ssn.oninput = (event) => {
//  current.textContent = ssn.value;
//};
//Result
//
//Play
//
//Technical summary
//Value    A string representing a password, or empty
//Events    change and input
//Supported Common Attributes    autocomplete, inputmode, maxlength, minlength, pattern, placeholder, readonly, required, and size
//IDL attributes    selectionStart, selectionEnd, selectionDirection, and value
//DOM interface    HTMLInputElement
//Methods    select(), setRangeText(), and setSelectionRange()
//Implicit ARIA Role    no corresponding role
