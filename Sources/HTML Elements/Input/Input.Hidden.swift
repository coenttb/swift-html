//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 03/04/2025.
//

import Foundation
import PointFreeHTML
import HTML_Attributes

/// `<input type="hidden">` elements let web developers include data that cannot be seen or modified
/// by users when a form is submitted. For example, the ID of the content that is currently being
/// ordered or edited, or a unique security token. Hidden inputs are completely invisible in the
/// rendered page, and there is no way to make it visible in the page's content.
///
/// Note: While the value isn't displayed to the user in the page's content, it is visible—and can be
/// edited—using any browser's developer tools or "View Source" functionality. Do not rely on hidden
/// inputs as a form of security.
///
/// Hidden inputs don't participate in constraint validation; they have no real value to be constrained.
extension Input {
    public struct Hidden: Sendable, Equatable {
        /// The value attribute holds a string that contains the hidden data you want to include when
        /// the form is submitted to the server. This specifically can't be edited or seen by the user
        /// via the user interface, although it could be edited via browser developer tools.
        public var value: String?
        
        /// Creates a new hidden input configuration
        public init(
            value: String? = nil
        ) {
            self.value = value
        }
    }
}


//<input type="hidden">
//
//
//Baseline Widely available

extension Input {
    /// Creates a new hidden input element
    public static func hidden(
        name: String,
        value: String? = nil,
        disabled: Disabled? = nil,
        form: Form.ID? = nil
    ) -> Self {
        .init(
            name: name,
            disabled: disabled,
            form: form,
            type: .hidden(
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
//<input> elements of type hidden let web developers include data that cannot be seen or modified by users when a form is submitted. For example, the ID of the content that is currently being ordered or edited, or a unique security token. Hidden inputs are completely invisible in the rendered page, and there is no way to make it visible in the page's content.
//
//Note: The input and change events do not apply to this input type. Hidden inputs cannot be focused even using JavaScript (e.g. hiddenInput.focus()).
//Value
//The <input> element's value attribute holds a string that contains the hidden data you want to include when the form is submitted to the server. This specifically can't be edited or seen by the user via the user interface, although you could edit the value via browser developer tools.
//
//Warning: While the value isn't displayed to the user in the page's content, it is visible—and can be edited—using any browser's developer tools or "View Source" functionality. Do not rely on hidden inputs as a form of security.
//Additional attributes
//In addition to the attributes common to all <input> elements, hidden inputs offer the following attributes.
//
//name
//This is actually one of the common attributes, but it has a special meaning available for hidden inputs. Normally, the name attribute functions on hidden inputs just like on any other input. However, when the form is submitted, a hidden input whose name is set to _charset_ will automatically be reported with the value set to the character encoding used to submit the form.
//
//Using hidden inputs
//As mentioned above, hidden inputs can be used anywhere that you want to include data the user can't see or edit along with the form when it's submitted to the server. Let's look at some examples that illustrate its use.
//
//Tracking edited content
//One of the most common uses for hidden inputs is to keep track of what database record needs to be updated when an edit form is submitted. A typical workflow looks like this:
//
//User decides to edit some content they have control over, such as a blog post, or a product entry. They get started by pressing the edit button.
//The content to be edited is taken from the database and loaded into an HTML form to allow the user to make changes.
//After editing, the user submits the form, and the updated data is sent back to the server to be updated in the database.
//The idea here is that during step 2, the ID of the record being updated is kept in a hidden input. When the form is submitted in step 3, the ID is automatically sent back to the server with the record content. The ID lets the site's server-side component know exactly which record needs to be updated with the submitted data.
//
//You can see a full example of what this might look like in the Examples section below.
//
//Improving website security
//Hidden inputs are also used to store and submit security tokens or secrets, for the purposes of improving website security. The basic idea is that if a user is filling in a sensitive form, such as a form on their banking website to transfer some money to another account, the secret they would be provided with would prove that they are who they say they are, and that they are using the correct form to submit the transfer request.
//
//This would stop a malicious user from creating a fake form, pretending to be a bank, and emailing the form to unsuspecting users to trick them into transferring money to the wrong place. This kind of attack is called a Cross Site Request Forgery (CSRF); pretty much any reputable server-side framework uses hidden secrets to prevent such attacks.
//
//Note: Placing the secret in a hidden input doesn't inherently make it secure. The key's composition and encoding would do that. The value of the hidden input is that it keeps the secret associated with the data and automatically includes it when the form is sent to the server. You need to use well-designed secrets to actually secure your website.
//Validation
//Hidden inputs don't participate in constraint validation; they have no real value to be constrained.
//
//Examples
//Let's look at how we might implement a version of the edit form we described earlier (see Tracking edited content), using a hidden input to remember the ID of the record being edited.
//
//The edit form's HTML might look a bit like this:
//
//HTML
//Copy to Clipboard
//Play
//<form>
//  <div>
//    <label for="title">Post title:</label>
//    <input type="text" id="title" name="title" value="My excellent blog post" />
//  </div>
//  <div>
//    <label for="content">Post content:</label>
//    <textarea id="content" name="content" cols="60" rows="5">
//This is the content of my excellent blog post. I hope you enjoy it!
//    </textarea>
//  </div>
//  <div>
//    <button type="submit">Update post</button>
//  </div>
//  <input type="hidden" id="postId" name="postId" value="34657" />
//</form>
//Let's also add some CSS:
//
//CSS
//Copy to Clipboard
//Play
//html {
//  font-family: sans-serif;
//}
//
//form {
//  width: 500px;
//}
//
//div {
//  display: flex;
//  margin-bottom: 10px;
//}
//
//label {
//  flex: 2;
//  line-height: 2;
//  text-align: right;
//  padding-right: 20px;
//}
//
//input,
//textarea {
//  flex: 7;
//  font-family: sans-serif;
//  font-size: 1.1rem;
//  padding: 5px;
//}
//
//textarea {
//  height: 60px;
//}
//The server would set the value of the hidden input with the ID postID to the ID of the post in its database before sending the form to the user's browser and would use that information when the form is returned to know which database record to update with modified information. No scripting is needed in the content to handle this.
//
//The output looks like this:
//
//Play
//
//Note: You can also find the example on GitHub (see the source code, and also see it running live).
//When submitted, the form data sent to the server will look something like this:
//
//title=My+excellent+blog+post&content=This+is+the+content+of+my+excellent+blog+post.+I+hope+you+enjoy+it!&postId=34657
//
//Even though the hidden input cannot be seen at all, its data is still submitted.
//
//Technical summary
//Value    A string representing the value of the hidden data you want to pass back to the server.
//Events    None.
//Supported Common Attributes    autocomplete
//IDL attributes    value
//DOM interface    HTMLInputElement
//Methods    None.
//Implicit ARIA Role    no corresponding role
