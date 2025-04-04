//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import HTML_Attributes

extension Input {
    /// `<input type="button">` elements are rendered as push buttons, which can be programmed to control
    /// custom functionality anywhere on a webpage as required when assigned an event handler function
    /// (typically for the click event).
    ///
    /// Note: While `<input>` elements of type button are still perfectly valid HTML, the newer `<button>`
    /// element is now the favored way to create buttons. Given that a `<button>`'s label text is inserted
    /// between the opening and closing tags, you can include HTML in the label, even images.
    ///
    /// ## Value
    /// The `value` attribute contains a string that is used as the button's label and provides the accessible description.
    /// If no value is specified, you get an empty button.
    ///
    /// ## Examples
    ///
    /// Basic button with value:
    /// ```html
    /// <input type="button" value="Click Me" />
    /// ```
    ///
    /// Button without a value:
    /// ```html
    /// <input type="button" />
    /// ```
    ///
    /// Button with event handler (in JavaScript):
    /// ```html
    /// <form>
    ///   <input type="button" value="Start machine" />
    /// </form>
    /// <p>The machine is stopped.</p>
    /// ```
    ///
    /// Adding keyboard shortcuts with accesskey:
    /// ```html
    /// <input type="button" value="Start machine" accesskey="s" />
    /// ```
    ///
    /// Disabled button:
    /// ```html
    /// <input type="button" value="Disable me" disabled />
    /// ```
    ///
    /// ## Notes
    /// - Buttons don't participate in constraint validation as they have no real value to be constrained
    /// - Unlike other browsers, Firefox persists the disabled state even after page reload
    /// - Buttons can inherit disabled state from parent elements like `<fieldset>`
    public struct Button: Sendable, Equatable {
        /// A string that is used as the button's label. The value provides the accessible description for the button.
        /// If not specified, you get an empty button.
        public var value: String?
        
        public init(
            value: String? = nil
        ) {
            self.value = value
        }
    }
}

extension Input {
    public static func button(
        name: String,
        value: String? = nil,
        disabled: Disabled? = nil,
        form: HTML_Attributes.Form.ID? = nil,
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .button(
                .init(
                    value: value
                )
            )
        )
    }
}


//<input type="button">
//
//
//Baseline Widely available
//
//
//
//<input> elements of type button are rendered as push buttons, which can be programmed to control custom functionality anywhere on a webpage as required when assigned an event handler function (typically for the click event).
//
//Try it
//HTML Demo: <input type="button">
//RESET
//HTML
//CSS
//1
//2
//<input class="styled" type="button" value="Add to favorites" />
//
//OUTPUT
//Note: While <input> elements of type button are still perfectly valid HTML, the newer <button> element is now the favored way to create buttons. Given that a <button>'s label text is inserted between the opening and closing tags, you can include HTML in the label, even images.
//Value
//Button with a value
//An <input type="button"> elements' value attribute contains a string that is used as the button's label. The value provides the accessible description for the button.
//
//HTML
//Copy to Clipboard
//Play
//<input type="button" value="Click Me" />
//Play
//
//Button without a value
//If you don't specify a value, you get an empty button:
//
//HTML
//Copy to Clipboard
//Play
//<input type="button" />
//Play
//
//Using buttons
//<input type="button"> elements have no default behavior (their cousins, <input type="submit"> and <input type="reset"> are used to submit and reset forms, respectively). To make buttons do anything, you have to write JavaScript code to do the work.
//
//A basic button
//We'll begin by creating a basic button with a click event handler that starts our machine (well, it toggles the value of the button and the text content of the following paragraph):
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <input type="button" value="Start machine" />
//</form>
//<p>The machine is stopped.</p>
//JS
//Copy to Clipboard
//Play
//const button = document.querySelector("input");
//const paragraph = document.querySelector("p");
//
//button.addEventListener("click", updateButton);
//
//function updateButton() {
//  if (button.value === "Start machine") {
//    button.value = "Stop machine";
//    paragraph.textContent = "The machine has started!";
//  } else {
//    button.value = "Start machine";
//    paragraph.textContent = "The machine is stopped.";
//  }
//}
//The script gets a reference to the HTMLInputElement object representing the <input> in the DOM, saving this reference in the variable button. addEventListener() is then used to establish a function that will be run when click events occur on the button.
//
//Play
//
//Adding keyboard shortcuts to buttons
//Keyboard shortcuts, also known as access keys and keyboard equivalents, let the user trigger a button using a key or combination of keys on the keyboard. To add a keyboard shortcut to a button — just as you would with any <input> for which it makes sense — you use the accesskey global attribute.
//
//In this example, s is specified as the access key (you'll need to press s plus the particular modifier keys for your browser/OS combination; see accesskey for a useful list of those).
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <input type="button" value="Start machine" accesskey="s" />
//</form>
//<p>The machine is stopped.</p>
//Play
//
//Note: The problem with the above example of course is that the user will not know what the access key is! In a real site, you'd have to provide this information in a way that doesn't interfere with the site design (for example by providing an easily accessible link that points to information on what the site access keys are).
//Disabling and enabling a button
//To disable a button, specify the disabled global attribute on it, like so:
//
//HTML
//Copy to Clipboard
//<input type="button" value="Disable me" disabled />
//Setting the disabled attribute
//
//You can enable and disable buttons at run time by setting disabled to true or false. In this example our button starts off enabled, but if you press it, it is disabled using button.disabled = true. A setTimeout() function is then used to reset the button back to its enabled state after two seconds.
//
//HTML
//Copy to Clipboard
//Play
//<input type="button" value="Enabled" />
//JS
//Copy to Clipboard
//Play
//const button = document.querySelector("input");
//
//button.addEventListener("click", disableButton);
//
//function disableButton() {
//  button.disabled = true;
//  button.value = "Disabled";
//  setTimeout(() => {
//    button.disabled = false;
//    button.value = "Enabled";
//  }, 2000);
//}
//Play
//
//Inheriting the disabled state
//
//If the disabled attribute isn't specified, the button inherits its disabled state from its parent element. This makes it possible to enable and disable groups of elements all at once by enclosing them in a container such as a <fieldset> element, and then setting disabled on the container.
//
//The example below shows this in action. This is very similar to the previous example, except that the disabled attribute is set on the <fieldset> when the first button is pressed — this causes all three buttons to be disabled until the two second timeout has passed.
//
//HTML
//Copy to Clipboard
//Play
//<fieldset>
//  <legend>Button group</legend>
//  <input type="button" value="Button 1" />
//  <input type="button" value="Button 2" />
//  <input type="button" value="Button 3" />
//</fieldset>
//JS
//Copy to Clipboard
//Play
//const button = document.querySelector("input");
//const fieldset = document.querySelector("fieldset");
//
//button.addEventListener("click", disableButton);
//
//function disableButton() {
//  fieldset.disabled = true;
//  setTimeout(() => {
//    fieldset.disabled = false;
//  }, 2000);
//}
//Play
//
//Note: Unlike other browsers, Firefox persists the disabled state of an <input> element even after the page is reloaded. As a workaround, set the <input> element's autocomplete attribute to off. (See Firefox bug 654072 for more details.)
//Validation
//Buttons don't participate in constraint validation; they have no real value to be constrained.
//
//Examples
//The below example shows a very basic drawing app created using a <canvas> element and some CSS and JavaScript (we'll hide the CSS for brevity). The top two controls allow you to choose the color and size of the drawing pen. The button, when clicked, invokes a function that clears the canvas.
//
//HTML
//Copy to Clipboard
//Play
//<div class="toolbar">
//  <input type="color" aria-label="select pen color" />
//  <input
//    type="range"
//    min="2"
//    max="50"
//    value="30"
//    aria-label="select pen size" /><span class="output">30</span>
//  <input type="button" value="Clear canvas" />
//</div>
//
//<canvas class="myCanvas">
//  <p>Add suitable fallback here.</p>
//</canvas>
//JS
//Copy to Clipboard
//Play
//const canvas = document.querySelector(".myCanvas");
//const width = (canvas.width = window.innerWidth);
//const height = (canvas.height = window.innerHeight - 85);
//const ctx = canvas.getContext("2d");
//
//ctx.fillStyle = "rgb(0 0 0)";
//ctx.fillRect(0, 0, width, height);
//
//const colorPicker = document.querySelector('input[type="color"]');
//const sizePicker = document.querySelector('input[type="range"]');
//const output = document.querySelector(".output");
//const clearBtn = document.querySelector('input[type="button"]');
//
//// covert degrees to radians
//function degToRad(degrees) {
//  return (degrees * Math.PI) / 180;
//}
//
//// update size picker output value
//
//sizePicker.oninput = () => {
//  output.textContent = sizePicker.value;
//};
//
//// store mouse pointer coordinates, and whether the button is pressed
//let curX;
//let curY;
//let pressed = false;
//
//// update mouse pointer coordinates
//document.onmousemove = (e) => {
//  curX = e.pageX;
//  curY = e.pageY;
//};
//
//canvas.onmousedown = () => {
//  pressed = true;
//};
//
//canvas.onmouseup = () => {
//  pressed = false;
//};
//
//clearBtn.onclick = () => {
//  ctx.fillStyle = "rgb(0 0 0)";
//  ctx.fillRect(0, 0, width, height);
//};
//
//function draw() {
//  if (pressed) {
//    ctx.fillStyle = colorPicker.value;
//    ctx.beginPath();
//    ctx.arc(
//      curX,
//      curY - 85,
//      sizePicker.value,
//      degToRad(0),
//      degToRad(360),
//      false,
//    );
//    ctx.fill();
//  }
//
//  requestAnimationFrame(draw);
//}
//
//draw();
//Play
//
//Technical summary
//Value    A string used as the button's label
//Events    click
//Supported common attributes    type and value
//IDL attributes    value
//DOM interface    HTMLInputElement
//Methods    None
//Implicit ARIA Role    button
//Specifications
