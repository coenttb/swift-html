//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import HTML_Attributes

/// `<input type="range">` elements let the user specify a numeric value which must be no less than a given value,
/// and no more than another given value. The precise value, however, is not considered important.
/// This is typically represented using a slider or dial control rather than a text entry box like the number input type.
///
/// Because this kind of widget is imprecise, it should only be used if the control's exact value isn't important.
///
/// Common use cases include:
/// - Audio controls such as volume and balance, or filter controls
/// - Color configuration controls such as color channels, transparency, brightness
/// - Game configuration controls such as difficulty, visibility distance, world size
/// - Password length for a password manager's generated passwords
extension Input {
    public struct Range: Sendable, Equatable {
        /// The value attribute contains a string which contains a string representation of the selected number.
        /// The value is never an empty string ("").
        ///
        /// The default value is halfway between the specified minimum and maximum—unless the maximum is actually
        /// less than the minimum, in which case the default is set to the value of the min attribute.
        ///
        /// If an attempt is made to set the value lower than the minimum, it is set to the minimum.
        /// Similarly, an attempt to set the value higher than the maximum results in it being set to the maximum.
        public var value: String?
        
        /// The greatest value in the range of permitted values. If the value entered into the element
        /// exceeds this, the element fails constraint validation. If the value of the max attribute isn't
        /// a number, then the element has no maximum value.
        ///
        /// This value must be greater than or equal to the value of the min attribute.
        /// Default value is 100.
        public var max: Max?
        
        /// The lowest value in the range of permitted values. If the value of the element is less than this,
        /// the element fails constraint validation. If a value is specified for min that isn't a valid number,
        /// the input has no minimum value.
        ///
        /// This value must be less than or equal to the value of the max attribute.
        /// Default value is 0.
        public var min: Min?
        
        /// The step attribute is a number that specifies the granularity that the value must adhere to.
        /// Only values that match the specified stepping interval are valid.
        ///
        /// The default stepping value for range inputs is 1, allowing only integers to be entered—unless
        /// the stepping base is not an integer.
        public var step: Step?
        
        /// The value of the list attribute is the id of a <datalist> element located in the same document.
        /// The <datalist> provides tick marks on the range control. Each point is represented using an <option>
        /// element with its value attribute set to the range's value at which a mark should be drawn.
        public var list: List?
        
        /// Creates a new range input configuration
        public init(
            value: String? = nil,
            min: Min? = nil,
            max: Max? = nil,
            step: Step? = nil,
            list: List? = nil
        ) {
            self.value = value
            self.min = min
            self.max = max
            self.step = step
            self.list = list
        }
    }
}

extension Input.Range {
    public typealias Step = HTML_Attributes.Step
}


//<input type="range">
//
//
//Baseline Widely available *

extension Input {
    /// Creates a new range input element
    public static func range(
        name: Name,
        value: String? = nil,
        min: Min? = nil,
        max: Max? = nil,
        step: Step? = nil,
        list: List? = nil,
        disabled: Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .range(
                .init(
                    value: value,
                    min: min,
                    max: max,
                    step: step,
                    list: list
                )
            )
        )
    }
}
//
//
//
//<input> elements of type range let the user specify a numeric value which must be no less than a given value, and no more than another given value. The precise value, however, is not considered important. This is typically represented using a slider or dial control rather than a text entry box like the number input type.
//
//Because this kind of widget is imprecise, it should only be used if the control's exact value isn't important.
//
//Try it
//HTML Demo: <input type="range">
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
//15
//16
//17
//18
//19
//<p>Audio settings:</p>
//
//<div>
//  <input type="range" id="volume" name="volume" min="0" max="11" />
//  <label for="volume">Volume</label>
//</div>
//
//<div>
//  <input
//    type="range"
//    id="cowbell"
//    name="cowbell"
//    min="0"
//    max="100"
//    value="90"
//    step="10" />
//  <label for="cowbell">Cowbell</label>
//</div>
//
//OUTPUT
//If the user's browser doesn't support type range, it will fall back and treat it as a text input.
//
//Validation
//There is no pattern validation available; however, the following forms of automatic validation are performed:
//
//If the value is set to something which can't be converted into a valid floating-point number, validation fails because the input is suffering from a bad input.
//The value won't be less than min. The default is 0.
//The value won't be greater than max. The default is 100.
//The value will be a multiple of step. The default is 1.
//Value
//The value attribute contains a string which contains a string representation of the selected number. The value is never an empty string (""). The default value is halfway between the specified minimum and maximum—unless the maximum is actually less than the minimum, in which case the default is set to the value of the min attribute. The algorithm for determining the default value is:
//
//JS
//Copy to Clipboard
//defaultValue =
//  rangeElem.max < rangeElem.min
//    ? rangeElem.min
//    : rangeElem.min + (rangeElem.max - rangeElem.min) / 2;
//If an attempt is made to set the value lower than the minimum, it is set to the minimum. Similarly, an attempt to set the value higher than the maximum results in it being set to the maximum.
//
//Additional attributes
//In addition to the attributes shared by all <input> elements, range inputs offer the following attributes.
//
//Note: The following input attributes do not apply to the input range: accept, alt, checked, dirname, formaction, formenctype, formmethod, formnovalidate, formtarget, height, maxlength, minlength, multiple, pattern, placeholder, readonly, required, size, and src. Any of these attributes, if included, will be ignored.
//list
//The value of the list attribute is the id of a <datalist> element located in the same document. The <datalist> provides a list of predefined values to suggest to the user for this input. Any values in the list that are not compatible with the type are not included in the suggested options. The values provided are suggestions, not requirements: users can select from this predefined list or provide a different value.
//
//See the adding tick marks below for an example of how the options on a range are denoted in supported browsers.
//
//max
//The greatest value in the range of permitted values. If the value entered into the element exceeds this, the element fails constraint validation. If the value of the max attribute isn't a number, then the element has no maximum value.
//
//This value must be greater than or equal to the value of the min attribute. See the HTML max attribute.
//
//min
//The lowest value in the range of permitted values. If the value of the element is less than this, the element fails constraint validation. If a value is specified for min that isn't a valid number, the input has no minimum value.
//
//This value must be less than or equal to the value of the max attribute. See the HTML min attribute.
//
//Note: If the min and max values are equal or the max value is lower than the min value the user will not be able to interact with the range.
//step
//The step attribute is a number that specifies the granularity that the value must adhere to. Only values that match the specified stepping interval (min if specified, value otherwise, or an appropriate default value if neither of those is provided) are valid.
//
//The step attribute can also be set to the any string value. This step value means that no stepping interval is implied and any value is allowed in the specified range (barring other constraints, such as min and max). See the Setting step to the any value example for how this works in supported browsers.
//
//Note: When the value entered by a user doesn't adhere to the stepping configuration, the user agent may round off the value to the nearest valid value, preferring to round numbers up when there are two equally close options.
//The default stepping value for range inputs is 1, allowing only integers to be entered, unless the stepping base is not an integer; for example, if you set min to -10 and value to 1.5, then a step of 1 will allow only values such as 1.5, 2.5, 3.5,… in the positive direction and -0.5, -1.5, -2.5,… in the negative direction. See the HTML step attribute.
//
//Non-standard attributes
//orient
//Similar to the -moz-orient non-standard CSS property impacting the <progress> and <meter> elements, the orient attribute defines the orientation of the range slider. Values include horizontal, meaning the range is rendered horizontally, and vertical, where the range is rendered vertically.
//
//Examples
//While the number type lets users enter a number with optional constraints forcing their value to be between a minimum and a maximum value, it does require that they enter a specific value. The range input type lets you ask the user for a value in cases where the user may not even care—or know—what the specific numeric value selected is.
//
//A few examples of situations in which range inputs are commonly used:
//
//Audio controls such as volume and balance, or filter controls.
//Color configuration controls such as color channels, transparency, brightness, etc.
//Game configuration controls such as difficulty, visibility distance, world size, and so forth.
//Password length for a password manager's generated passwords.
//As a rule, if the user is more likely to be interested in the percentage of the distance between minimum and maximum values than the actual number itself, a range input is a great candidate. For example, in the case of a home stereo volume control, users typically think "set volume at halfway to maximum" instead of "set volume to 0.5".
//
//Specifying the minimum and maximum
//By default, the minimum is 0 and the maximum is 100. If that's not what you want, you can easily specify different bounds by changing the values of the min and/or max attributes. These can be any floating-point value.
//
//For example, to ask the user for a value between -10 and 10, you can use:
//
//HTML
//Copy to Clipboard
//Play
//<input type="range" min="-10" max="10" />
//Play
//
//Setting the value's granularity
//By default, the granularity is 1, meaning the value is always an integer. To control the granularity, you can change the step attribute. For example, If you need a value to be halfway between 5 and 10, you should set the value of step to 0.5:
//
//Setting the step attribute
//
//HTML
//Copy to Clipboard
//Play
//<input type="range" min="5" max="10" step="0.5" />
//Play
//
//Setting step to any
//
//If you want to accept any value regardless of how many decimal places it extends to, you can specify a value of any for the step attribute:
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<input id="pi_input" type="range" min="0" max="3.14" step="any" />
//<p>Value: <output id="value"></output></p>
//JAVASCRIPT
//
//JS
//Copy to Clipboard
//Play
//const value = document.querySelector("#value");
//const input = document.querySelector("#pi_input");
//value.textContent = input.value;
//input.addEventListener("input", (event) => {
//  value.textContent = event.target.value;
//});
//Play
//
//This example lets the user select any value between 0 and π without any restriction on the fractional part of the value selected. JavaScript is used to show how the value changes as the user interacts with the range.
//
//Adding tick marks
//To add tick marks to a range control, include the list attribute, giving it the id of a <datalist> element which defines a series of tick marks on the control. Each point is represented using an <option> element with its value set to the range's value at which a mark should be drawn.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<label for="temp">Choose a comfortable temperature:</label><br />
//<input type="range" id="temp" name="temp" list="markers" />
//
//<datalist id="markers">
//  <option value="0"></option>
//  <option value="25"></option>
//  <option value="50"></option>
//  <option value="75"></option>
//  <option value="100"></option>
//</datalist>
//Result
//
//Play
//
//Using the same datalist for multiple range controls
//To help you from repeating code you can reuse that same <datalist> for multiple <input type="range"> elements, and other <input> types.
//
//Note: If you also want to show the labels as in the example below then you would need a datalist for each range input.
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<p>
//  <label for="temp1">Temperature for room 1:</label>
//  <input type="range" id="temp1" name="temp1" list="values" />
//</p>
//<p>
//  <label for="temp2">Temperature for room 2:</label>
//  <input type="range" id="temp2" name="temp2" list="values" />
//</p>
//
//<p>
//  <label for="temp3">Temperature for room 3:</label>
//  <input type="range" id="temp3" name="temp3" list="values" />
//</p>
//
//<datalist id="values">
//  <option value="0" label="0"></option>
//  <option value="25" label="25"></option>
//  <option value="50" label="50"></option>
//  <option value="75" label="75"></option>
//  <option value="100" label="100"></option>
//</datalist>
//Result
//
//Play
//
//Adding labels
//You can label tick marks by giving the <option> elements label attributes. However, the label content will not be displayed by default. You can use CSS to show the labels and to position them correctly. Here's one way you could do this.
//
//HTML
//
//HTML
//Copy to Clipboard
//Play
//<label for="tempB">Choose a comfortable temperature:</label><br />
//<input type="range" id="tempB" name="temp" list="values" />
//
//<datalist id="values">
//  <option value="0" label="very cold!"></option>
//  <option value="25" label="cool"></option>
//  <option value="50" label="medium"></option>
//  <option value="75" label="getting warm!"></option>
//  <option value="100" label="hot!"></option>
//</datalist>
//CSS
//
//CSS
//Copy to Clipboard
//Play
//datalist {
//  display: flex;
//  flex-direction: column;
//  justify-content: space-between;
//  writing-mode: vertical-lr;
//  width: 200px;
//}
//
//option {
//  padding: 0;
//}
//
//input[type="range"] {
//  width: 200px;
//  margin: 0;
//}
//Result
//
//Play
//
//Creating vertical range controls
//By default, browsers render range inputs as sliders with the knob sliding left and right.
//
//To create a vertical range wherein the thumb slides up and down, set the writing-mode property with a value of either vertical-rl or vertical-lr:
//
//CSS
//Copy to Clipboard
//Play
//input[type="range"] {
//  writing-mode: vertical-lr;
//}
//This causes the range slider to render vertically:
//
//Play
//
//You can also set the CSS appearance property to the non-standard slider-vertical value if you want to support older versions of Chrome and Safari, and include the non-standard orient="vertical" attribute to support older versions of Firefox.
//
//See Creating vertical form controls for examples.
//
//Technical summary
//Value    A string containing the string representation of the selected numeric value; use valueAsNumber to get the value as a number.
//Events    change and input
//Supported common attributes    autocomplete, list, max, min, step
//IDL attributes    list, value, valueAsNumber
//DOM interface    HTMLInputElement
//Methods    stepDown() and stepUp()
//Implicit ARIA Role    slider
