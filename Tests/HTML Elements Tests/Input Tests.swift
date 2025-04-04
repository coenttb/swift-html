import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Input Type Attribute Tests",
//    .snapshots(record: .failed),
)
struct InputTypeTests {
    @Test("Fully initialized Input renders correctly")
    func fullyInitializedInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "test",
                disabled: true,
                form: nil,
                type: .image(
                    .init(
                        src: "src",
                        alt: "alt",
                        height: 100,
                        width: 200,
                        form: .init(
                            action: "action",
                            enctype: .multipartFormData,
                            method: .post,
                            novalidate: true,
                            target: .top
                        )
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="test" disabled type="image" alt="alt" height="100.0" width="200.0" src="src" formaction="action" formenctype="multipart/form-data" formmethod="post" formnovalidate formtarget="_top">
            """
        }
    }
    
    @Test("Button input renders correctly")
    func buttonInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "buttonInput",
                disabled: nil,
                form: nil,
                type: .button(
                    .init(
                        value: "Click Me"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="buttonInput" type="button" value="Click Me">
            """
        }
    }
    
    @Test("Checkbox input renders correctly")
    func checkboxInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "interestCoding",
                disabled: nil,
                form: nil,
                type: .checkbox(
                    .init(
                        value: "coding",
                        checked: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="interestCoding" type="checkbox" value="coding" checked>
            """
        }
    }
    
    @Test("Color input renders correctly")
    func colorInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "favoriteColor",
                disabled: nil,
                form: nil,
                type: .color(
                    .init(
                        value: "#ff0000"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="favoriteColor" type="color" value="#ff0000">
            """
        }
    }
    
    @Test("Date input renders correctly")
    func dateInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "trip-start",
                disabled: nil,
                form: nil,
                type: .date(
                    .init(
                        value: "2018-07-22",
                        min: "2018-01-01",
                        max: "2018-12-31",
                        step: 7
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="trip-start" type="date" value="2018-07-22" min="2018-01-01" max="2018-12-31" step="7.0">
            """
        }
    }
    
    @Test("Datetime-local input renders correctly")
    func datetimeLocalInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "meeting-time",
                disabled: nil,
                form: nil,
                type: .datetimeLocal(
                    .init(
                        value: "2018-06-12T19:30",
                        min: "2018-06-07T00:00",
                        max: "2018-06-14T00:00",
                        step: 60
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="meeting-time" type="datetime-local" value="2018-06-12T19:30" min="2018-06-07T00:00" max="2018-06-14T00:00" step="60.0">
            """
        }
    }
    
    @Test("Email input renders correctly")
    func emailInputRendersCorrectly() {
        assertInlineSnapshot(
            of: input(
                name: "email",
                disabled: nil,
                form: nil,
                type: .email(
                    .init(
                        value: "user@example.com",
                        maxlength: 64,
                        minlength: 5,
                        multiple: true,
                        pattern: ".+@example\\.com",
                        placeholder: "username@example.com",
                        readonly: false,
                        size: 30
                    )
                )
            ),
            as: .html
        ) {
            #"""
            <input placeholder="username@example.com" size="30" name="email" type="email" value="user@example.com" maxlength="64" minlength="5" multiple pattern=".+@example\.com">
            """#
        }
    }
    
    @Test("File input renders correctly")
    func fileInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "avatar",
                disabled: nil,
                form: nil,
                type: .file(
                    .init(
                        accept: .init(.png, .jpeg),
                        capture: "user",
                        multiple: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="avatar" type="file" accept="image/png,.png, image/jpeg,.jpg,.jpeg" capture="user" multiple>
            """
        }
    }
    
    @Test("File input with predefined accept type renders correctly")
    func fileInputWithPredefinedAcceptTypeRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "document",
                disabled: nil,
                form: nil,
                type: .file(
                    .init(
                        accept: .documents,
                        multiple: false
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="document" type="file" accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation">
            """
        }
    }
    
    @Test("Hidden input renders correctly")
    func hiddenInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "postId",
                disabled: nil,
                form: nil,
                type: .hidden(
                    .init(
                        value: "34657"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="postId" type="hidden" value="34657">
            """
        }
    }
    
    @Test("Number input renders correctly with specific step")
    func numberInputWithSpecificStepRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "quantity",
                disabled: nil,
                form: nil,
                type: .number(
                    .init(
                        value: "10",
                        min: 1,
                        max: 100,
                        placeholder: "Multiple of 10",
                        readonly: false,
                        step: 10
                    )
                )
            ),
            as: .html
        ) {
            """
            <input placeholder="Multiple of 10" step="10.0" name="quantity" type="number" value="10" min="1" max="100">
            """
        }
    }
    
    @Test("Number input renders correctly with step any")
    func numberInputWithStepAnyRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "price",
                disabled: nil,
                form: nil,
                type: .number(
                    .init(
                        value: "9.99",
                        min: 0,
                        max: nil,
                        placeholder: "Enter price",
                        readonly: nil,
                        step: .any
                    )
                )
            ),
            as: .html
        ) {
            """
            <input placeholder="Enter price" step="any" name="price" type="number" value="9.99" min="0">
            """
        }
    }
    
    @Test("Password input renders correctly")
    func passwordInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "password",
                disabled: nil,
                form: nil,
                type: .password(
                    .init(
                        value: nil,
                        maxlength: 64,
                        minlength: 8,
                        pattern: "[A-Za-z0-9\\d@$!%*?&]{8,}",
                        placeholder: "Enter password",
                        readonly: false,
                        size: 30,
                        autocomplete: "new-password"
                    )
                )
            )
            .inputmode(.text),
            as: .html
        ) {
            #"""
            <input inputmode="text" placeholder="Enter password" size="30" autocomplete="new-password" name="password" type="password" maxlength="64" minlength="8" pattern="[A-Za-z0-9\d@$!%*?&amp;]{8,}">
            """#
        }
    }
    
    @Test("Password input for PIN renders correctly")
    func passwordInputForPINRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "pin",
                disabled: nil,
                form: nil,
                type: .password(
                    .init(
                        value: nil,
                        maxlength: 8,
                        minlength: 4,
                        pattern: "\\d{4,8}",
                        placeholder: "Enter PIN",
                        readonly: nil,
                        size: 8,
                        autocomplete: "one-time-code"
                    )
                )
            )
            .inputmode(.numeric),
            as: .html
        ) {
            #"""
            <input inputmode="numeric" placeholder="Enter PIN" size="8" autocomplete="one-time-code" name="pin" type="password" maxlength="8" minlength="4" pattern="\d{4,8}">
            """#
        }
    }
    
    @Test("Radio input renders correctly")
    func radioInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "drone",
                disabled: nil,
                form: nil,
                type: .radio(
                    .init(
                        value: "huey",
                        checked: true,
                        required: nil
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="drone" type="radio" value="huey" checked>
            """
        }
    }
    
    @Test("Radio input with required renders correctly")
    func radioInputWithRequiredRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "contact",
                disabled: nil,
                form: nil,
                type: .radio(
                    .init(
                        value: "email",
                        checked: false,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="contact" type="radio" value="email" required>
            """
        }
    }
    
    @Test("Range input renders correctly")
    func rangeInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "volume",
                disabled: nil,
                form: nil,
                type: .range(
                    .init(
                        value: "50",
                        min: 0,
                        max: 100,
                        step: 1,
                        list: nil
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="volume" type="range" value="50" min="0" max="100" step="1.0">
            """
        }
    }
    
    @Test("Range input with step any and list renders correctly")
    func rangeInputWithStepAnyAndListRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "temperature",
                disabled: nil,
                form: nil,
                type: .range(
                    .init(
                        value: "25",
                        min: 0,
                        max: 100,
                        step: .any,
                        list: "values"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="temperature" type="range" value="25" min="0" max="100" step="any" list="values">
            """
        }
    }
    
    @Test("Reset input renders correctly")
    func resetInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "reset",
                disabled: nil,
                form: nil,
                type: .reset(
                    .init(
                        value: "Reset the form"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="reset" type="reset" value="Reset the form">
            """
        }
    }
    
    @Test("Reset input with default value renders correctly")
    func resetInputWithDefaultValueRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "reset",
                disabled: nil,
                form: nil,
                type: .reset(
                    .init()
                )
            ),
            as: .html
        ) {
            """
            <input name="reset" type="reset">
            """
        }
    }
    
    @Test("Submit input renders correctly")
    func submitInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "submit",
                disabled: nil,
                form: nil,
                type: .submit(
                    .init(
                        value: "Send Form"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="submit" type="submit" value="Send Form">
            """
        }
    }
    
    @Test("Submit input with form attributes renders correctly")
    func submitInputWithFormAttributesRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "submit",
                disabled: nil,
                form: nil,
                type: .submit(
                    .init(
                        value: "Submit",
                        formaction: "https://example.com/submit",
                        formenctype: .multipartFormData,
                        formmethod: .post,
                        formnovalidate: true,
                        formtarget: .blank
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="submit" type="submit" value="Submit" formaction="https://example.com/submit" formenctype="multipart/form-data" formmethod="post" formnovalidate formtarget="_blank">
            """
        }
    }
    
    @Test("Tel input renders correctly")
    func telInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "phone",
                disabled: nil,
                form: nil,
                type: .tel(
                    .init(
                        value: "555-123-4567",
                        pattern: "[0-9]{3}-[0-9]{3}-[0-9]{4}"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="phone" type="tel" value="555-123-4567" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
            """
        }
    }
    
    @Test("Tel input with validation attributes renders correctly")
    func telInputWithValidationAttributesRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "phone",
                disabled: nil,
                form: nil,
                type: .tel(
                    .init(
                        value: nil,
                        list: "phone-formats",
                        maxlength: 15,
                        minlength: 7,
                        pattern: "[0-9]{3}-[0-9]{3}-[0-9]{4}",
                        placeholder: "Format: 123-456-7890",
                        readonly: false,
                        size: 20,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input placeholder="Format: 123-456-7890" size="20" required name="phone" type="tel" list="phone-formats" maxlength="15" minlength="7" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}">
            """
        }
    }
    
    @Test("Text input renders correctly")
    func textInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "username",
                disabled: nil,
                form: nil,
                type: .text(
                    .init(
                        value: "johndoe"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="username" type="text" value="johndoe">
            """
        }
    }
    
    @Test("Text input with validation attributes renders correctly")
    func textInputWithValidationAttributesRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "username",
                disabled: nil,
                form: nil,
                type: .text(
                    .init(
                        value: nil,
                        list: "usernames",
                        maxlength: 20,
                        minlength: 3,
                        pattern: "[a-z0-9]{3,20}",
                        placeholder: "Enter username",
                        readonly: false,
                        size: 30,
                        spellcheck: true,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input placeholder="Enter username" size="30" spellcheck required name="username" type="text" list="usernames" maxlength="20" minlength="3" pattern="[a-z0-9]{3,20}">
            """
        }
    }
    
    @Test("Time input renders correctly")
    func timeInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "appointment",
                disabled: nil,
                form: nil,
                type: .time(
                    .init(
                        value: "13:30"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="appointment" type="time" value="13:30">
            """
        }
    }
    
    @Test("Time input with min, max and step renders correctly")
    func timeInputWithMinMaxAndStepRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "appointment",
                disabled: nil,
                form: nil,
                type: .time(
                    .init(
                        value: "13:30",
                        list: "available-times",
                        min: "09:00",
                        max: "18:00",
                        readonly: false,
                        step: 30,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="appointment" type="time" value="13:30" list="available-times" min="09:00" max="18:00" step="30.0" required>
            """
        }
    }
    
    @Test("Time input with step=any renders correctly")
    func timeInputWithStepAnyRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "appointment",
                disabled: nil,
                form: nil,
                type: .time(
                    .init(
                        value: "13:30:45",
                        min: "09:00",
                        max: "18:00",
                        step: .any
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="appointment" type="time" value="13:30:45" min="09:00" max="18:00" step="any">
            """
        }
    }
    
    @Test("URL input renders correctly")
    func urlInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "website",
                disabled: nil,
                form: nil,
                type: .url(
                    .init(
                        value: "https://example.com"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="website" type="url" value="https://example.com">
            """
        }
    }
    
    @Test("URL input with validation attributes renders correctly")
    func urlInputWithValidationAttributesRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "website",
                disabled: nil,
                form: nil,
                type: .url(
                    .init(
                        value: nil,
                        list: "website-suggestions",
                        maxlength: 100,
                        minlength: 10,
                        pattern: "https://.*\\.mydomain\\.com",
                        placeholder: "https://example.mydomain.com",
                        readonly: false,
                        size: 50,
                        spellcheck: false,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            #"""
            <input name="website" type="url" list="website-suggestions" maxlength="100" minlength="10" pattern="https://.*\.mydomain\.com" placeholder="https://example.mydomain.com" size="50" required>
            """#
        }
    }
    
    @Test("Week input renders correctly")
    func weekInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "week",
                disabled: nil,
                form: nil,
                type: .week(
                    .init(
                        value: "2023-W12"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="week" type="week" value="2023-W12">
            """
        }
    }
    
    @Test("Week input with min, max and step renders correctly")
    func weekInputWithMinMaxAndStepRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "week",
                disabled: nil,
                form: nil,
                type: .week(
                    .init(
                        value: "2023-W12",
                        list: "available-weeks",
                        min: "2023-W01",
                        max: "2023-W52",
                        readonly: false,
                        step: 2,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="week" type="week" value="2023-W12" list="available-weeks" min="2023-W01" max="2023-W52" step="2.0" required>
            """
        }
    }
    
    @Test("Week input with step=any renders correctly")
    func weekInputWithStepAnyRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "week",
                disabled: nil,
                form: nil,
                type: .week(
                    .init(
                        value: "2023-W12",
                        min: "2023-W01",
                        max: "2023-W52",
                        step: .any
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="week" type="week" value="2023-W12" min="2023-W01" max="2023-W52" step="any">
            """
        }
    }
    
    @Test("Month input renders correctly")
    func monthInputRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "month",
                disabled: nil,
                form: nil,
                type: .month(
                    .init(
                        value: "2023-07"
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="month" type="month" value="2023-07">
            """
        }
    }
    
    @Test("Month input with min, max and step renders correctly")
    func monthInputWithMinMaxAndStepRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "month",
                disabled: nil,
                form: nil,
                type: .month(
                    .init(
                        value: "2023-07",
                        list: "available-months",
                        min: "2023-01",
                        max: "2023-12",
                        readonly: false,
                        step: 2,
                        required: true
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="month" type="month" value="2023-07" list="available-months" min="2023-01" max="2023-12" step="2.0" required>
            """
        }
    }
    
    @Test("Month input with step=any renders correctly")
    func monthInputWithStepAnyRendersCorrectly() {
        assertInlineSnapshot(
            of: Input(
                name: "month",
                disabled: nil,
                form: nil,
                type: .month(
                    .init(
                        value: "2023-07",
                        min: "2023-01",
                        max: "2023-12",
                        step: .any
                    )
                )
            ),
            as: .html
        ) {
            """
            <input name="month" type="month" value="2023-07" min="2023-01" max="2023-12" step="any">
            """
        }
    }
}
