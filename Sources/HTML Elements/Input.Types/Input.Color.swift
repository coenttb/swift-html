//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import HTML_Attributes

/// `<input type="color">` elements provide a user interface element that lets a user specify a color,
/// either by using a visual color picker interface or by entering the color into a text field in #rrggbb
/// hexadecimal format.
///
/// Only basic hexadecimal colors (without alpha channel) are allowed though CSS colors has more formats,
/// e.g. color names, functional notations and a hexadecimal format with an alpha channel.
///
/// The element's presentation may vary substantially from one browser and/or platform to another—it might
/// be a basic textual input that automatically validates to ensure that the color information is entered
/// in the proper format, or a platform-standard color picker, or some kind of custom color picker window.
extension Input {
    public struct Color: Sendable, Equatable {
        /// The value of an `<input>` element of type color is always a string which contains a 7-character
        /// string specifying an RGB color in hexadecimal format. While you can input the color in either
        /// upper- or lower-case, it will be stored in lower-case form.
        ///
        /// The value is never in any other form, and is never empty. If not specified, the default value is #000000.
        ///
        /// Note: Setting the value to anything that isn't a valid, fully-opaque, RGB color in hexadecimal notation
        /// will result in the value being set to #000000. Colors with an alpha channel are not supported.
        public var value: String?
        
        /// Creates a new color input configuration
        public init(
            value: String? = nil
        ) {
            self.value = value
        }
    }
}

extension Input {
    /// Creates a new color input element
    public static func color(
        name: String,
        value: String? = nil,
        disabled: Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .color(
                .init(
                    value: value
                )
            )
        )
    }
}

//<input type="color">
//
//
//Limited availability
//
//
//
//<input> elements of type color provide a user interface element that lets a user specify a color, either by using a visual color picker interface or by entering the color into a text field in #rrggbb hexadecimal format.
//
//Only basic hexadecimal colors (without alpha channel) are allowed though CSS colors has more formats, e.g. color names, functional notations and a hexadecimal format with an alpha channel.
//
//The element's presentation may vary substantially from one browser and/or platform to another—it might be a basic textual input that automatically validates to ensure that the color information is entered in the proper format, or a platform-standard color picker, or some kind of custom color picker window.
//
//Try it
//HTML Demo: <input type="color">
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
//<p>Choose your monster's colors:</p>
//
//<div>
//  <input type="color" id="head" name="head" value="#e66465" />
//  <label for="head">Head</label>
//</div>
//
//<div>
//  <input type="color" id="body" name="body" value="#f6b73c" />
//  <label for="body">Body</label>
//</div>
//
//OUTPUT
//Value
//The value of an <input> element of type color is always a string which contains a 7-character string specifying an RGB color in hexadecimal format. While you can input the color in either upper- or lower-case, it will be stored in lower-case form. The value is never in any other form, and is never empty.
//
//Note: Setting the value to anything that isn't a valid, fully-opaque, RGB color in hexadecimal notation will result in the value being set to #000000. In particular, you can't use CSS's standardized color names, or any CSS function syntax, to set the value. This makes sense when you keep in mind that HTML and CSS are separate languages and specifications. In addition, colors with an alpha channel are not supported; specifying a color in 9-character hexadecimal notation (e.g. #009900aa) will also result in the color being set to #000000.
//Using color inputs
//Inputs of type color are simple, due to the limited number of attributes they support.
//
//Providing a default color
//You can update the example above to set a default value, so that the color picker is pre-filled with the default color and the color picker (if any) will also default to that color:
//
//HTML
//Copy to Clipboard
//Play
//<input type="color" value="#ff0000" />
//Play
//
//If you don't specify a value, the default is #000000, which is black. The value must be in seven-character hexadecimal notation, meaning the "#" character followed by two digits each representing red, green, and blue, like this: #rrggbb. If you have colors that are in any other format (such as CSS color names or CSS color functions such as rgb() or hsl() ), you'll have to convert them to hexadecimal before setting the value.
//
//Tracking color changes
//As is the case with other <input> types, there are two events that can be used to detect changes to the color value: input and change. input is fired on the <input> element every time the color changes. The change event is fired when the user dismisses the color picker. In both cases, you can determine the new value of the element by looking at its value.
//
//Here's an example that watches changes over time to the color value:
//
//JS
//Copy to Clipboard
//colorPicker.addEventListener("input", updateFirst, false);
//colorPicker.addEventListener("change", watchColorPicker, false);
//
//function watchColorPicker(event) {
//  document.querySelectorAll("p").forEach((p) => {
//    p.style.color = event.target.value;
//  });
//}
//Selecting the value
//When a browser doesn't support a color picker interface, its implementation of color inputs will be a text box that validates the contents automatically to ensure that the value is in the correct format. In this case you can use the select() method to select the text currently in the edit field.
//
//If the browser instead uses a color picker, select() does nothing. You should be aware of this behavior so your code can respond appropriately in either case.
//
//JS
//Copy to Clipboard
//colorPicker.select();
//Validation
//A color input's value is considered to be invalid if the user agent is unable to convert the user's input into seven-character lower-case hexadecimal notation. If and when this is the case, the :invalid pseudo-class is applied to the element.
//
//Example
//Let's create an example which does a little more with the color input by tracking the change and input events to take the new color and apply it to every <p> element in the document.
//
//HTML
//The HTML is fairly straightforward — a couple of paragraphs of descriptive material with an <input> of type color with the ID color-picker, which we'll use to change the color of the paragraphs' text.
//
//HTML
//Copy to Clipboard
//Play
//<p>
//  An example demonstrating the use of the
//  <code>&lt;input type="color"&gt;</code> control.
//</p>
//
//<label for="color-picker">Color:</label>
//<input type="color" value="#ff0000" id="color-picker" />
//
//<p>
//  Watch the paragraph colors change when you adjust the color picker. As you
//  make changes in the color picker, the first paragraph's color changes, as a
//  preview (this uses the <code>input</code> event). When you close the color
//  picker, the <code>change</code> event fires, and we detect that to change
//  every paragraph to the selected color.
//</p>
//JavaScript
//First, there's some setup. Here we establish some variables, setting up a variable that contains the color we'll set the color picker to when we first load up, and then setting up a load handler to do the main startup work once the page is fully loaded.
//
//JS
//Copy to Clipboard
//Play
//let colorPicker;
//const defaultColor = "#0000ff";
//
//window.addEventListener("load", startup, false);
//Initialization
//
//Once the page is loaded, our load event handler, startup(), is called:
//
//JS
//Copy to Clipboard
//Play
//function startup() {
//  colorPicker = document.querySelector("#color-picker");
//  colorPicker.value = defaultColor;
//  colorPicker.addEventListener("input", updateFirst, false);
//  colorPicker.addEventListener("change", updateAll, false);
//  colorPicker.select();
//}
//This gets a reference to the color <input> element in a variable called colorPicker, then sets the color input's value to the value in defaultColor. Then the color input's input event is set up to call our updateFirst() function, and the change event is set to call updateAll(). These are both seen below.
//
//Finally, we call select() to select the text content of the color input if the control is implemented as a text field (this has no effect if a color picker interface is provided instead).
//
//Reacting to color changes
//
//We provide two functions that deal with color changes. The updateFirst() function is called in response to the input event. It changes the color of the first paragraph element in the document to match the new value of the color input. Since input events are fired every time an adjustment is made to the value (for example, if the brightness of the color is increased), these will happen repeatedly as the color picker is used.
//
//JS
//Copy to Clipboard
//Play
//function updateFirst(event) {
//  const p = document.querySelector("p");
//  if (p) {
//    p.style.color = event.target.value;
//  }
//}
//When the color picker is dismissed, indicating that the value will not change again (unless the user re-opens the color picker), a change event is sent to the element. We handle that event using the updateAll() function, using Event.target.value to obtain the final selected color:
//
//JS
//Copy to Clipboard
//Play
//function updateAll(event) {
//  document.querySelectorAll("p").forEach((p) => {
//    p.style.color = event.target.value;
//  });
//}
//This sets the color of every <p> block so that its color attribute matches the current value of the color input, which is referred to using event.target.
//
//Result
//The final result looks like this:
//
//Play
//
//Technical summary
//Value    A 7-character string specifying a <color> in lower-case hexadecimal notation
//Events    change and input
//Supported common attributes    autocomplete and list
//IDL attributes    list and value
//DOM interface    HTMLInputElement
//Methods    select()
//Implicit ARIA Role    no corresponding role
