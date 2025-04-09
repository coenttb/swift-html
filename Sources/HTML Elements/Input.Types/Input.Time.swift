///
/// `Input.Time.swift`
/// swift-html
///
/// Created by Coen ten Thije Boonkkamp on 03/04/2025.
///

import Foundation
import HTML_Attributes

/// `<input type="time">` elements create input fields designed to let the user easily enter a time (hours and minutes, and optionally seconds).
/// The value is always a 24-hour HH:mm or HH:mm:ss formatted time, with leading zeros, regardless of the UI's input format.
extension Input {
    public struct Time: Sendable, Equatable {
        /// A string representing a time in 24-hour format (HH:mm or HH:mm:ss).
        /// Example: "13:30" for 1:30 PM.
        public var value: String?
        
        /// The id of a datalist element providing suggested times.
        public var list: List?
        
        /// A string indicating the earliest time to accept (e.g., "09:00").
        public var min: Min?
        
        /// A string indicating the latest time to accept (e.g., "18:00").
        public var max: Max?
        
        /// A Boolean attribute which, if present, means this field cannot be edited by the user.
        public var readonly: Readonly?
        
        /// Specifies the granularity of time increments in seconds.
        /// Default is 60 (1 minute), but can be set to other values to show seconds.
        public var step: Step?
        
        /// Whether the input field is required to have a value before form submission.
        public var required: Required?
        
        /// Creates a new time input configuration
        public init(
            value: String? = nil,
            list: List? = nil,
            min: Min? = nil,
            max: Max? = nil,
            readonly: Readonly? = nil,
            step: Step? = nil,
            required: Required? = nil
        ) {
            self.value = value
            self.list = list
            self.min = min
            self.max = max
            self.readonly = readonly
            self.step = step
            self.required = required
        }
    }
}

extension Input.Time {
    public typealias Step = HTML_Attributes.Step
}

extension Input {
    /// Creates a new time input element
    public static func time(
        name: Name,
        value: String? = nil,
        list: List? = nil,
        min: Min? = nil,
        max: Max? = nil,
        readonly: Readonly? = nil,
        step: Input.Time.Step? = nil,
        required: Required? = nil,
        disabled: Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .time(
                .init(
                    value: value,
                    list: list,
                    min: min,
                    max: max,
                    readonly: readonly,
                    step: step,
                    required: required
                )
            )
        )
    }
}


//<input type="time">
//
//
//Baseline Widely available
//
//
//
//<input> elements of type time create input fields designed to let the user easily enter a time (hours and minutes, and optionally seconds).
//
//While the control's user interface appearance is based on the browser and operating system, the features are the same. The value is always a 24-hour HH:mm or HH:mm:ss formatted time, with leading zeros, regardless of the UI's input format.
//
//Try it
//HTML Demo: <input type="time">
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
//<label for="appointment">Choose a time for your meeting:</label>
//
//<input
//  type="time"
//  id="appointment"
//  name="appointment"
//  min="09:00"
//  max="18:00"
//  required />
//
//<small>Office hours are 9am to 6pm</small>
//
//OUTPUT
//Setting the value attribute
//You can set a default value for the input by including a valid time in the value attribute when creating the <input> element, like so:
//
//HTML
//Copy to Clipboard
//Play
//<label for="appointment-time">Choose an appointment time: </label>
//<input
//  id="appointment-time"
//  type="time"
//  name="appointment-time"
//  value="13:30" />
//Play
//
//Setting the value using JavaScript
//You can also get and set the time value in JavaScript using the HTMLInputElement value property, for example:
//
//JS
//Copy to Clipboard
//const timeControl = document.querySelector('input[type="time"]');
//timeControl.value = "15:30";
//Time value format
//The value of the time input is always in 24-hour format that includes leading zeros: HH:mm, regardless of the input format, which is likely to be selected based on the user's locale (or by the user agent). If the time includes seconds (see Using the step attribute), the format is always HH:mm:ss. You can learn more about the format of the time value used by this input type in Time strings.
//
//In this example, you can see the time input's value by entering a time and seeing how it changes afterward.
//
//First, a look at the HTML. We include a label and input, and add a <p> element with a <span> to display the value of the time input:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label for="startTime">Start time: </label>
//  <input type="time" id="startTime" />
//  <p>
//    Value of the <code>time</code> input:
//    <code>"<span id="value">n/a</span>"</code>.
//  </p>
//</form>
//The JavaScript code adds code to the time input to watch for the input event, which is triggered every time the contents of an input element change. When this happens, the contents of the <span> are replaced with the new value of the input element.
//
//JS
//Copy to Clipboard
//Play
//const startTime = document.getElementById("startTime");
//const valueSpan = document.getElementById("value");
//
//startTime.addEventListener(
//  "input",
//  () => {
//    valueSpan.innerText = startTime.value;
//  },
//  false,
//);
//Play
//
//When a form including a time input is submitted, the value is encoded before being included in the form's data. The form's data entry for a time input will always be in the form name=HH%3Amm, or name=HH%3Amm%3Ass if seconds are included (see Using the step attribute).
//
//Additional attributes
//In addition to the attributes common to all <input> elements, time inputs offer the following attributes.
//
//Note: Unlike many data types, time values have a periodic domain, meaning that the values reach the highest possible value, then wrap back around to the beginning again. For example, specifying a min of 14:00 and a max of 2:00 means that the permitted time values start at 2:00 PM, run through midnight to the next day, ending at 2:00 AM. See more in the making min and max cross midnight section of this article.
//list
//The values of the list attribute is the id of a <datalist> element located in the same document. The <datalist> provides a list of predefined values to suggest to the user for this input. Any values in the list that are not compatible with the type are not included in the suggested options. The values provided are suggestions, not requirements: users can select from this predefined list or provide a different value.
//
//max
//A string indicating the latest time to accept, specified in the same time value format as described above. If the specified string isn't a valid time, no maximum value is set.
//
//min
//A string specifying the earliest time to accept, given in the time value format described previously. If the value specified isn't a valid time string, no minimum value is set.
//
//readonly
//A Boolean attribute which, if present, means this field cannot be edited by the user. Its value can, however, still be changed by JavaScript code directly setting the HTMLInputElement value property.
//
//Note: Because a read-only field cannot have a value, required does not have any effect on inputs with the readonly attribute also specified.
//step
//The step attribute is a number that specifies the granularity that the value must adhere to, or the special value any, which is described below. Only values which are equal to the basis for stepping (min if specified, value otherwise, and an appropriate default value if neither of those is provided) are valid.
//
//A string value of any means that no stepping is implied, and any value is allowed (barring other constraints, such as min and max).
//
//Note: When the data entered by the user doesn't adhere to the stepping configuration, the user agent may round to the nearest valid value, preferring numbers in the positive direction when there are two equally close options.
//For time inputs, the value of step is given in seconds, with a scaling factor of 1000 (since the underlying numeric value is in milliseconds). The default value of step is 60, indicating 60 seconds (or 1 minute, or 60,000 milliseconds).
//
//When any is set as the value for step, the default 60 seconds is used, and the seconds value is not displayed in the UI.
//
//Using time inputs
//Basic uses of time
//The most basic use of <input type="time"> involves a basic <input> and <label> element combination, as seen below:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label for="appointment-time">Choose an appointment time: </label>
//  <input id="appointment-time" type="time" name="appointment-time" />
//</form>
//Play
//
//Controlling input size
//<input type="time"> doesn't support form sizing attributes such as size, since times are always about the same number of characters long. You'll have to resort to CSS for sizing needs.
//
//Using the step attribute
//You can use the step attribute to vary the amount of time jumped whenever the time is incremented or decremented (for example, so the time moves by 10 minutes at a time when clicking the little arrow widgets).
//
//It takes an integer value defining the number of seconds you want to increment by; the default value is 60 seconds. With this as the default, most user agent time UIs display hours and minutes but not seconds. Including the step attribute with any numeric value other than a value divisible by 60 adds seconds to the UI, if the min or max value has not already caused the seconds to be visible.
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label for="appointment-time">Choose an appointment time: </label>
//  <input id="appointment-time" type="time" name="appointment-time" step="2" />
//</form>
//Play
//
//To specify minutes or hours as a step, specify the number of minutes or hours in seconds, such as 120 for 2 minutes, or 7200 for 2 hours.
//
//Validation
//By default, <input type="time"> does not apply any validation to entered values, other than the user agent's interface generally not allowing you to enter anything other than a time value. This is helpful, but you can't entirely rely on the value to be a proper time string, since it might be an empty string (""), which is allowed.
//
//Setting maximum and minimum times
//You can use the min and max attributes to restrict the valid times that can be chosen by the user. In the following example we are setting a minimum time of 12:00 and a maximum time of 18:00:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label for="appointment-time">
//    Choose an appointment time (opening hours 12:00 to 18:00):
//  </label>
//  <input
//    id="appointment-time"
//    type="time"
//    name="appointment-time"
//    min="12:00"
//    max="18:00" />
//  <span class="validity"></span>
//</form>
//Play
//
//Here's the CSS used in the above example. Here we make use of the :valid and :invalid CSS properties to style the input based on whether the current value is valid. We add an icon as generated content icon on a <span> next to the input.
//
//CSS
//Copy to Clipboard
//Play
//div {
//  margin-bottom: 10px;
//  position: relative;
//}
//
//input[type="number"] {
//  width: 100px;
//}
//
//input + span {
//  padding-right: 30px;
//}
//
//input:invalid + span::after {
//  position: absolute;
//  content: "✖";
//  padding-left: 5px;
//}
//
//input:valid + span::after {
//  position: absolute;
//  content: "✓";
//  padding-left: 5px;
//}
//The result here is that:
//
//Only times between 12:00 and 18:00 will be seen as valid; times outside that range will be denoted as invalid.
//Making min and max cross midnight
//
//By setting a min attribute greater than the max attribute, the valid time range will wrap around midnight to produce a valid time range. This functionality is not supported by any other input types.
//
//JS
//Copy to Clipboard
//Play
//const input = document.createElement("input");
//input.type = "time";
//input.min = "23:00";
//input.max = "01:00";
//input.value = "23:59";
//
//if (input.validity.valid && input.type === "time") {
//  // <input type=time> reversed range supported
//} else {
//  // <input type=time> reversed range unsupported
//}
//Making times required
//In addition, you can use the required attribute to make filling in the time mandatory. Browsers will display an error if you try to submit a time that is outside the set bounds, or an empty time field.
//
//Let's look at an example; here we've set minimum and maximum times, and also made the field required:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <div>
//    <label for="appointment-time">
//      Choose an appointment time (opening hours 12:00 to 18:00):
//    </label>
//    <input
//      id="appointment-time"
//      type="time"
//      name="appointment-time"
//      min="12:00"
//      max="18:00"
//      required />
//    <span class="validity"></span>
//  </div>
//  <div>
//    <input type="submit" value="Submit form" />
//  </div>
//</form>
//If you try to submit the form with an incomplete time (or with a time outside the set bounds), the browser displays an error. Try playing with the example now:
//
//Play
//
//Warning: HTML form validation is not a substitute for scripts that ensure that the entered data is in the proper format. It's far too easy for someone to make adjustments to the HTML that allow them to bypass the validation, or to remove it entirely. It's also possible for someone to bypass your HTML entirely and submit the data directly to your server. If your server-side code fails to validate the data it receives, disaster could strike when improperly-formatted data is submitted (or data which is too large, of the wrong type, and so forth).
//Examples
//In this example, we create an interface element for choosing time using the native picker created with <input type="time">:
//
//HTML
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label for="appointment-time">
//    Choose an appointment time (opening hours 12:00 to 18:00):
//  </label>
//  <input
//    id="appointment-time"
//    type="time"
//    name="appointment-time"
//    min="12:00"
//    max="18:00"
//    required />
//  <span class="validity"></span>
//</form>
//CSS
//CSS
//Copy to Clipboard
//Play
//input[type="time"] {
//  width: 100px;
//}
//
//input + span {
//  padding-right: 30px;
//}
//
//input:invalid + span::after {
//  position: absolute;
//  content: "✖";
//  padding-left: 5px;
//}
//
//input:valid + span::after {
//  position: absolute;
//  content: "✓";
//  padding-left: 5px;
//}
//Result
//Play
//
//Technical Summary
//Value    A string representing a time, or empty.
//Events    change and input
//Supported common attributes    autocomplete, list, readonly, step
//IDL attributes    list, value, valueAsDate, valueAsNumber
//DOM interface    HTMLInputElement
//Methods    select(), stepDown(), and stepUp().
//Implicit ARIA Role    no corresponding role
//Specifications
//Specification
//HTML
//# time-state-(type=time)
