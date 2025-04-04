//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="file">` elements let the user choose one or more files from their device storage.
/// Once chosen, the files can be uploaded to a server using form submission, or manipulated
/// using JavaScript code and the File API.
extension Input {
    public struct File: Sendable, Equatable {
        /// The accept attribute value is a string that defines the file types the file input should accept.
        /// This string is a comma-separated list of unique file type specifiers.
        ///
        /// For example:
        /// - "image/png" or ".png" — Accepts PNG files.
        /// - "image/png, image/jpeg" or ".png, .jpg, .jpeg" — Accept PNG or JPEG files.
        /// - "image/*" — Accept any file with an image/* MIME type.
        /// - ".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" — accept anything that is an MS Word document.
        public var accept: Accept?
        
        /// The capture attribute value is a string that specifies which camera to use for capture of
        /// image or video data, if the accept attribute indicates that the input should be of one of those types.
        ///
        /// - "user" indicates that the user-facing camera and/or microphone should be used.
        /// - "environment" specifies that the outward-facing camera and/or microphone should be used.
        public var capture: Capture?
        
        /// When the multiple Boolean attribute is specified, the file input allows the user to select
        /// more than one file.
        public var multiple: Multiple?
        
        /// Creates a new file input configuration
        public init(
            accept: Accept? = nil,
            capture: Capture? = nil,
            multiple: Multiple? = nil
        ) {
            self.accept = accept
            self.capture = capture
            self.multiple = multiple
        }
    }
}

extension Input.File {
    public typealias Accept = HTML_Attributes.Accept
}


//<input type="file">
//
//
//Baseline Widely available

extension Input {
    /// Creates a new file input element
    public static func file(
        name: String,
        accept: Accept? = nil,
        capture: Capture? = nil,
        multiple: Multiple? = nil,
        disabled: Disabled? = nil,
        form: Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .file(
                .init(
                    accept: accept,
                    capture: capture,
                    multiple: multiple
                )
            )
        )
    }
}
//
//
//
//<input> elements with type="file" let the user choose one or more files from their device storage. Once chosen, the files can be uploaded to a server using form submission, or manipulated using JavaScript code and the File API.
//
//Try it
//HTML Demo: <input type="file">
//RESET
//HTML
//CSS
//1
//2
//3
//4
//<label for="avatar">Choose a profile picture:</label>
//
//<input type="file" id="avatar" name="avatar" accept="image/png, image/jpeg" />
//
//OUTPUT
//Value
//A file input's value attribute contains a string that represents the path to the selected file(s). If no file is selected yet, the value is an empty string (""). When the user selected multiple files, the value represents the first file in the list of files they selected. The other files can be identified using the input's HTMLInputElement.files property.
//
//Note: The value is always the file's name prefixed with C:\fakepath\, which isn't the real path of the file. This is to prevent malicious software from guessing the user's file structure.
//Additional attributes
//In addition to the common attributes shared by all <input> elements, inputs of type file also support the following attributes.
//
//accept
//The accept attribute value is a string that defines the file types the file input should accept. This string is a comma-separated list of unique file type specifiers. Because a given file type may be identified in more than one manner, it's useful to provide a thorough set of type specifiers when you need files of a given format.
//
//For instance, there are a number of ways Microsoft Word files can be identified, so a site that accepts Word files might use an <input> like this:
//
//HTML
//Copy to Clipboard
//<input
//  type="file"
//  id="docpicker"
//  accept=".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" />
//capture
//The capture attribute value is a string that specifies which camera to use for capture of image or video data, if the accept attribute indicates that the input should be of one of those types. A value of user indicates that the user-facing camera and/or microphone should be used. A value of environment specifies that the outward-facing camera and/or microphone should be used. If this attribute is missing, the user agent is free to decide on its own what to do. If the requested facing mode isn't available, the user agent may fall back to its preferred default mode.
//
//Note: capture was previously a Boolean attribute which, if present, requested that the device's media capture device(s) such as camera or microphone be used instead of requesting a file input.
//multiple
//When the multiple Boolean attribute is specified, the file input allows the user to select more than one file.
//
//Non-standard attributes
//In addition to the attributes listed above, the following non-standard attributes are available on some browsers. You should try to avoid using them when possible, since doing so will limit the ability of your code to function in browsers that don't implement them.
//
//webkitdirectory
//The Boolean webkitdirectory attribute, if present, indicates that only directories should be available to be selected by the user in the file picker interface. See HTMLInputElement.webkitdirectory for additional details and examples.
//
//Though originally implemented only for WebKit-based browsers, webkitdirectory is also usable in Firefox. However, even though it has relatively broad support, it is still not standard and should not be used unless you have no alternative.
//
//Unique file type specifiers
//A unique file type specifier is a string that describes a type of file that may be selected by the user in an <input> element of type file. Each unique file type specifier may take one of the following forms:
//
//A valid case-insensitive filename extension, starting with a period (".") character. For example: .jpg, .pdf, or .doc.
//A valid MIME type string, with no extensions.
//The string audio/* meaning "any audio file".
//The string video/* meaning "any video file".
//The string image/* meaning "any image file".
//The accept attribute takes a string containing one or more of these unique file type specifiers as its value, separated by commas. For example, a file picker that needs content that can be presented as an image, including both standard image formats and PDF files, might look like this:
//
//HTML
//Copy to Clipboard
//<input type="file" accept="image/*,.pdf" />
//Using file inputs
//A basic example
//HTML
//Copy to Clipboard
//Play
//<form method="post" enctype="multipart/form-data">
//  <div>
//    <label for="file">Choose file to upload</label>
//    <input type="file" id="file" name="file" multiple />
//  </div>
//  <div>
//    <button>Submit</button>
//  </div>
//</form>
//This produces the following output:
//
//Play
//
//Note: You can find this example on GitHub too — see the source code, and also see it running live.
//Regardless of the user's device or operating system, the file input provides a button that opens up a file picker dialog that allows the user to choose a file.
//
//Including the multiple attribute, as shown above, specifies that multiple files can be chosen at once. The user can choose multiple files from the file picker in any way that their chosen platform allows (e.g. by holding down Shift or Control and then clicking). If you only want the user to choose a single file per <input>, omit the multiple attribute.
//
//Getting information on selected files
//The selected files' are returned by the element's HTMLInputElement.files property, which is a FileList object containing a list of File objects. The FileList behaves like an array, so you can check its length property to get the number of selected files.
//
//Each File object contains the following information:
//
//name
//The file's name.
//
//lastModified
//A number specifying the date and time at which the file was last modified, in milliseconds since the UNIX epoch (January 1, 1970, at midnight).
//
//lastModifiedDate Deprecated
//A Date object representing the date and time at which the file was last modified. This is deprecated and should not be used. Use lastModified instead.
//
//size
//The size of the file in bytes.
//
//type
//The file's MIME type.
//
//webkitRelativePath Non-standard
//A string specifying the file's path relative to the base directory selected in a directory picker (that is, a file picker in which the webkitdirectory attribute is set). This is non-standard and should be used with caution.
//
//Limiting accepted file types
//Often you won't want the user to be able to pick any arbitrary type of file; instead, you often want them to select files of a specific type or types. For example, if your file input lets users upload a profile picture, you probably want them to select web-compatible image formats, such as JPEG or PNG.
//
//Acceptable file types can be specified with the accept attribute, which takes a comma-separated list of allowed file extensions or MIME types. Some examples:
//
//accept="image/png" or accept=".png" — Accepts PNG files.
//accept="image/png, image/jpeg" or accept=".png, .jpg, .jpeg" — Accept PNG or JPEG files.
//accept="image/*" — Accept any file with an image/* MIME type. (Many mobile devices also let the user take a picture with the camera when this is used.)
//accept=".doc,.docx,.xml,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document" — accept anything that smells like an MS Word document.
//Let's look at a more complete example:
//
//HTML
//Copy to Clipboard
//Play
//<form method="post" enctype="multipart/form-data">
//  <div>
//    <label for="profile_pic">Choose file to upload</label>
//    <input
//      type="file"
//      id="profile_pic"
//      name="profile_pic"
//      accept=".jpg, .jpeg, .png" />
//  </div>
//  <div>
//    <button>Submit</button>
//  </div>
//</form>
//This produces a similar-looking output to the previous example:
//
//Play
//
//Note: You can find this example on GitHub too — see the source code, and also see it running live.
//It may look similar, but if you try selecting a file with this input, you'll see that the file picker only lets you select the file types specified in the accept value (the exact interface differs across browsers and operating systems).
//
//The accept attribute doesn't validate the types of the selected files; it provides hints for browsers to guide users towards selecting the correct file types. It is still possible (in most cases) for users to toggle an option in the file chooser that makes it possible to override this and select any file they wish, and then choose incorrect file types.
//
//Because of this, you should make sure that the accept attribute is backed up by appropriate server-side validation.
//
//Detecting cancellations
//The cancel event is fired when the user does not change their selection, reselecting the previously selected files. The cancel event is also fired when the file picker dialog gets closed, or canceled, via the "cancel" button or the escape key.
//
//For example, the following code will log to the console if the user closes the popup without selecting a file:
//
//JS
//Copy to Clipboard
//const elem = document.createElement("input");
//elem.type = "file";
//elem.addEventListener("cancel", () => {
//  console.log("Cancelled.");
//});
//elem.addEventListener("change", () => {
//  if (elem.files.length == 1) {
//    console.log("File selected: ", elem.files[0]);
//  }
//});
//elem.click();
//Notes
//You cannot set the value of a file picker from a script — doing something like the following has no effect:
//JS
//Copy to Clipboard
//const input = document.querySelector("input[type=file]");
//input.value = "foo";
//When a file is chosen using an <input type="file">, the real path to the source file is not shown in the input's value attribute for obvious security reasons. Instead, the filename is shown, with C:\fakepath\ prepended to it. There are some historical reasons for this quirk, but it is supported across all modern browsers, and in fact is defined in the spec.
//Examples
//In this example, we'll present a slightly more advanced file chooser that takes advantage of the file information available in the HTMLInputElement.files property, as well as showing off a few clever tricks.
//
//Note: You can see the complete source code for this example on GitHub — file-example.html (see it live also). We won't explain the CSS; the JavaScript is the main focus.
//First of all, let's look at the HTML:
//
//HTML
//Copy to Clipboard
//Play
//<form method="post" enctype="multipart/form-data">
//  <div>
//    <label for="image_uploads">Choose images to upload (PNG, JPG)</label>
//    <input
//      type="file"
//      id="image_uploads"
//      name="image_uploads"
//      accept=".jpg, .jpeg, .png"
//      multiple />
//  </div>
//  <div class="preview">
//    <p>No files currently selected for upload</p>
//  </div>
//  <div>
//    <button>Submit</button>
//  </div>
//</form>
//This is similar to what we've seen before — nothing special to comment on.
//
//Next, let's walk through the JavaScript.
//
//In the first lines of script, we get references to the form input itself, and the <div> element with the class of .preview. Next, we hide the <input> element — we do this because file inputs tend to be ugly, difficult to style, and inconsistent in their design across browsers. You can activate the input element by clicking its <label>, so it is better to visually hide the input and style the label like a button, so the user will know to interact with it if they want to upload files.
//
//JS
//Copy to Clipboard
//Play
//const input = document.querySelector("input");
//const preview = document.querySelector(".preview");
//
//input.style.opacity = 0;
//Note: opacity is used to hide the file input instead of visibility: hidden or display: none, because assistive technology interprets the latter two styles to mean the file input isn't interactive.
//Next, we add an event listener to the input to listen for changes to its selected value (in this case, when files are selected). The event listener invokes our custom updateImageDisplay() function.
//
//JS
//Copy to Clipboard
//Play
//input.addEventListener("change", updateImageDisplay);
//Whenever the updateImageDisplay() function is invoked, we:
//
//Use a while loop to empty the previous contents of the preview <div>.
//Grab the FileList object that contains the information on all the selected files, and store it in a variable called curFiles.
//Check to see if no files were selected, by checking if curFiles.length is equal to 0. If so, print a message into the preview <div> stating that no files have been selected.
//If files have been selected, we loop through each one, printing information about it into the preview <div>. Things to note here:
//We use the custom validFileType() function to check whether the file is of the correct type (e.g. the image types specified in the accept attribute).
//If it is, we:
//Print out its name and file size into a list item inside the previous <div> (obtained from file.name and file.size). The custom returnFileSize() function returns a nicely-formatted version of the size in bytes/KB/MB (by default the browser reports the size in absolute bytes).
//Generate a thumbnail preview of the image by calling URL.createObjectURL(file). Then, insert the image into the list item too by creating a new <img> and setting its src to the thumbnail.
//If the file type is invalid, we display a message inside a list item telling the user that they need to select a different file type.
//JS
//Copy to Clipboard
//Play
//function updateImageDisplay() {
//  while (preview.firstChild) {
//    preview.removeChild(preview.firstChild);
//  }
//
//  const curFiles = input.files;
//  if (curFiles.length === 0) {
//    const para = document.createElement("p");
//    para.textContent = "No files currently selected for upload";
//    preview.appendChild(para);
//  } else {
//    const list = document.createElement("ol");
//    preview.appendChild(list);
//
//    for (const file of curFiles) {
//      const listItem = document.createElement("li");
//      const para = document.createElement("p");
//      if (validFileType(file)) {
//        para.textContent = `File name ${file.name}, file size ${returnFileSize(
//          file.size,
//        )}.`;
//        const image = document.createElement("img");
//        image.src = URL.createObjectURL(file);
//        image.alt = image.title = file.name;
//
//        listItem.appendChild(image);
//        listItem.appendChild(para);
//      } else {
//        para.textContent = `File name ${file.name}: Not a valid file type. Update your selection.`;
//        listItem.appendChild(para);
//      }
//
//      list.appendChild(listItem);
//    }
//  }
//}
//The custom validFileType() function takes a File object as a parameter, then uses Array.prototype.includes() to check if any value in the fileTypes matches the file's type property. If a match is found, the function returns true. If no match is found, it returns false.
//
//JS
//Copy to Clipboard
//Play
//// https://developer.mozilla.org/en-US/docs/Web/Media/Guides/Formats/Image_types
//const fileTypes = [
//  "image/apng",
//  "image/bmp",
//  "image/gif",
//  "image/jpeg",
//  "image/pjpeg",
//  "image/png",
//  "image/svg+xml",
//  "image/tiff",
//  "image/webp",
//  "image/x-icon",
//];
//
//function validFileType(file) {
//  return fileTypes.includes(file.type);
//}
//The returnFileSize() function takes a number (of bytes, taken from the current file's size property), and turns it into a nicely formatted size in bytes/KB/MB.
//
//JS
//Copy to Clipboard
//Play
//function returnFileSize(number) {
//  if (number < 1e3) {
//    return `${number} bytes`;
//  } else if (number >= 1e3 && number < 1e6) {
//    return `${(number / 1e3).toFixed(1)} KB`;
//  } else {
//    return `${(number / 1e6).toFixed(1)} MB`;
//  }
//}
//Note: The "KB" and "MB" units here use the SI prefix convention of 1KB = 1000B, similar to macOS. Different systems represent file sizes differently—for example, Ubuntu uses IEC prefixes where 1KiB = 1024B, while RAM specifications often use SI prefixes to represent powers of two (1KB = 1024B). For this reason, we used 1e3 (1000) and 1e6 (100000) instead of 1024 and 1048576. In your application, you should communicate the unit system clearly to your users if the exact size is important.
//The example looks like this; have a play:
//
//Play
//
//Technical summary
//Value    A string representing the path to the selected file.
//Events    change, input and cancel
//Supported common attributes    required
//Additional Attributes    accept, capture, multiple
//IDL attributes    files and value
//DOM interface    HTMLInputElement
//Methods    select()
//Implicit ARIA Role    no corresponding role
