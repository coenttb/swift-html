//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

extension Input {
    public struct Date: Sendable, Equatable {
        
    }
}

//<input type="date">
//
//
//Baseline Widely available
//
//
//
//<input> elements of type="date" create input fields that let the user enter a date. The appearance of the date picker input UI varies based on the browser and operating system. The value is normalized to the format yyyy-mm-dd.
//
//The resulting value includes the year, month, and day, but not the time. The time and datetime-local input types support time and date+time input.
//
//Try it
//HTML Demo: <input type="date">
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
//<label for="start">Start date:</label>
//
//<input
//  type="date"
//  id="start"
//  name="trip-start"
//  value="2018-07-22"
//  min="2018-01-01"
//  max="2018-12-31" />
//
//OUTPUT
//Value
//A string representing the date entered in the input. The date is formatted according to Date strings format.
//
//You can set a default value for the input with a date inside the value attribute, like so:
//
//HTML
//Copy to Clipboard
//Play
//<input type="date" value="2017-06-01" />
//Play
//
//Note: The displayed date format will differ from the actual value — the displayed date is formatted based on the locale of the user's browser, but the parsed value is always formatted yyyy-mm-dd.
//You can get and set the date value in JavaScript with the HTMLInputElement value and valueAsNumber properties. For example:
//
//JS
//Copy to Clipboard
//Play
//const dateControl = document.querySelector('input[type="date"]');
//dateControl.value = "2017-06-01";
//console.log(dateControl.value); // prints "2017-06-01"
//console.log(dateControl.valueAsNumber); // prints 1496275200000, a JavaScript timestamp (ms)
//This code finds the first <input> element whose type is date, and sets its value to 2017-06-01 (June 1st, 2017). It then reads that value back in string and number formats.
//
//Additional attributes
//The attributes common to all <input> elements apply to the date inputs as well, but might not influence its presentation. For example size and placeholder might not work. date inputs have the following additional attributes.
//
//max
//The latest date to accept. If the value entered into the element occurs afterward, the element fails constraint validation. If the value of the max attribute isn't a possible date string in the format yyyy-mm-dd, then the element has no maximum date value.
//
//If both the max and min attributes are set, this value must be a date string later than or equal to the one in the min attribute.
//
//min
//The earliest date to accept. If the value entered into the element occurs beforehand, the element fails constraint validation. If the value of the min attribute isn't a possible date string in the format yyyy-mm-dd, then the element has no minimum date value.
//
//If both the max and min attributes are set, this value must be a date string earlier than or equal to the one in the max attribute.
//
//step
//The step attribute is a number that specifies the granularity that the value must adhere to, or the special value any, which is described below. Only values which are equal to the basis for stepping (min if specified, value otherwise, and an appropriate default value if neither of those is provided) are valid.
//
//A string value of any means that no stepping is implied, and any value is allowed (barring other constraints, such as min and max).
//
//Note: When the data entered by the user doesn't adhere to the stepping configuration, the user agent may round to the nearest valid value, preferring numbers in the positive direction when there are two equally close options.
//For date inputs, the value of step is given in days; and is treated as a number of milliseconds equal to 86,400,000 times the step value (the underlying numeric value is in milliseconds). The default value of step is 1, indicating 1 day.
//
//Note: Specifying any as the value for step has the same effect as 1 for date inputs.
//Using date inputs
//Date inputs provide an easy interface for choosing dates, and they normalize the data format sent to the server regardless of the user's locale.
//
//In this section, we'll look at basic and then more complex uses of <input type="date">.
//
//Basic uses of date
//The most basic use of <input type="date"> involves one <input> combined with its <label>, as seen below:
//
//HTML
//Copy to Clipboard
//Play
//<form action="https://example.com">
//  <label>
//    Enter your birthday:
//    <input type="date" name="bday" />
//  </label>
//
//  <p><button>Submit</button></p>
//</form>
//Play
//
//This HTML submits the entered date under the key bday to https://example.com — resulting in a URL like https://example.com/?bday=1955-06-08.
//
//Setting maximum and minimum dates
//You can use the min and max attributes to restrict the dates that can be chosen by the user. In the following example, we set a minimum date of 2017-04-01 and a maximum date of 2017-04-30:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label>
//    Choose your preferred party date:
//    <input type="date" name="party" min="2017-04-01" max="2017-04-30" />
//  </label>
//</form>
//Play
//
//The result is that only days in April 2017 can be selected — the month and year parts of the textbox will be uneditable, and dates outside April 2017 can't be selected in the picker widget.
//
//You can use the step attribute to vary the number of days jumped each time the date is incremented (e.g. to only make Saturdays selectable).
//
//Controlling input size
//<input type="date"> doesn't support form sizing attributes such as size. Prefer CSS for sizing it.
//
//Validation
//By default, <input type="date"> doesn't validate the entered value beyond its format. The interfaces generally don't let you enter anything that isn't a date — which is helpful.
//
//If you use min and max to restrict the available dates (see Setting maximum and minimum dates), the form control disables invalid dates, and will display an error if you try to submit a date that is out of bounds.
//
//You can also use the required attribute to make filling in the date mandatory — an error will be displayed if you try to submit an empty date field.
//
//Let's look at an example of minimum and maximum dates, and also made a field required:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <label>
//    Choose your preferred party date (required, April 1st to 20th):
//    <input
//      type="date"
//      name="party"
//      min="2017-04-01"
//      max="2017-04-20"
//      required />
//    <span class="validity"></span>
//  </label>
//
//  <p>
//    <button>Submit</button>
//  </p>
//</form>
//If you try to submit the form with an incomplete date (or with a date outside the set bounds), the browser displays an error. Try playing with the example now:
//
//Play
//
//Here's the CSS used in the above example. We make use of the :valid and :invalid pseudo-elements to add an icon next to the input, based on whether the current value is valid. We had to put the icon on a <span> next to the input, not on the input itself, because in Chrome at least the input's generated content is placed inside the form control, and can't be styled or shown effectively.
//
//CSS
//Copy to Clipboard
//Play
//label {
//  display: flex;
//  align-items: center;
//}
//
//span::after {
//  padding-left: 5px;
//}
//
//input:invalid + span::after {
//  content: "✖";
//}
//
//input:valid + span::after {
//  content: "✓";
//}
//Warning: Client-side form validation is not a substitute for validating on the server. It's easy for someone to modify the HTML, or bypass your HTML entirely and submit the data directly to your server. If your server fails to validate the received data, disaster could strike with data that is badly-formatted, too large, of the wrong type, etc.
//Examples
//In this example, we create a date picker using the native <input type="date"> picker.
//
//HTML
//The HTML looks like so:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <div class="nativeDatePicker">
//    <label for="bday">Enter your birthday:</label>
//    <input type="date" id="bday" name="bday" />
//    <span class="validity"></span>
//  </div>
//</form>
//CSS
//The CSS looks like so:
//
//CSS
//Copy to Clipboard
//Play
//input:invalid + span::after {
//  content: " ✖";
//}
//
//input:valid + span::after {
//  content: " ✓";
//}
//Results
//Play
//
//Technical summary
//Value    A string representing a date in YYYY-MM-DD format, or empty
//Events    change and input
//Supported common attributes    autocomplete, list, readonly, step
//IDL attributes    value, valueAsDate, valueAsNumber
//DOM interface    HTMLInputElement
//Methods    select(), stepDown(), stepUp()
//Implicit ARIA Role    no corresponding role
//Specifications
//Specification
//HTML
//# date-state-(type=date)
