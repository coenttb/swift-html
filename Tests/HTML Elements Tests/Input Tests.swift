//import Foundation
//import Testing
//import HTML_Attributes
//import PointFreeHTML
//import InlineSnapshotTesting
//
//@Suite(
//    "Input Type Attribute Tests"
////    .snapshots(record: .all)
//)
//struct InputTypeTests {
//    
//    @Test("Initialize with string value")
//    func initWithStringValue() {
//        let inputType = InputType("text")
//        #expect(inputType.description == "text")
//    }
//    
//    @Test("Initialize with string literal")
//    func initWithStringLiteral() {
//        let inputType: InputType = "text"
//        #expect(inputType.description == "text")
//    }
//    
//    @Test("Initialize with Type enum")
//    func initWithTypeEnum() {
//        let inputType = InputType(.email)
//        #expect(inputType.description == "email")
//    }
//    
//    @Test("Static property text")
//    func staticPropertyText() {
//        let inputType = InputType.text
//        #expect(inputType.description == "text")
//    }
//    
//    @Test("Static property email")
//    func staticPropertyEmail() {
//        let inputType = InputType.email
//        #expect(inputType.description == "email")
//    }
//    
//    @Test("Static property password")
//    func staticPropertyPassword() {
//        let inputType = InputType.password
//        #expect(inputType.description == "password")
//    }
//    
//    @Test("Static property checkbox")
//    func staticPropertyCheckbox() {
//        let inputType = InputType.checkbox
//        #expect(inputType.description == "checkbox")
//    }
//    
//    @Test("Static property file")
//    func staticPropertyFile() {
//        let inputType = InputType.file
//        #expect(inputType.description == "file")
//    }
//    
//    @Test("Type datetime-local value")
//    func datetimeLocalValue() {
//        let inputType = InputType(.datetimeLocal)
//        #expect(inputType.description == "datetime-local")
//    }
//    
//    @Test("Basic input with type renders correctly")
//    func basicInputWithTypeRendersCorrectly() {
//        assertInlineSnapshot(
//            of: input().type(.text),
//            as: .html
//        ) {
//            """
//            <input type="text">
//            """
//        }
//    }
//    
//    @Test("Text input with attributes renders correctly")
//    func textInputWithAttributesRendersCorrectly() {
//        assertInlineSnapshot(
//            of: input()
//                .type(.text)
//                .id("username")
//                .name("username")
//                .placeholder("Enter username")
//                .value("john"),
//            as: .html
//        ) {
//            """
//            <input id="username" name="username" placeholder="Enter username" type="text" value="john">
//            """
//        }
//    }
//    
//    @Test("Email input with required attribute renders correctly")
//    func emailInputWithRequiredAttributeRendersCorrectly() {
//        assertInlineSnapshot(
//            of: input()
//                .type(.email)
//                .name("email")
//                .required,
//            as: .html
//        ) {
//            """
//            <input name="email" required type="email">
//            """
//        }
//    }
//    
//    @Test("Checkbox input with checked attribute renders correctly")
//    func checkboxInputWithCheckedAttributeRendersCorrectly() {
//        assertInlineSnapshot(
//            of: input()
//                .type(.checkbox)
//                .name("agree")
//                .value("yes")
//                .checked,
//            as: .html
//        ) {
//            """
//            <input checked name="agree" type="checkbox" value="yes">
//            """
//        }
//    }
//    
//    @Test("Number input with min, max and step renders correctly")
//    func numberInputWithMinMaxStepRendersCorrectly() {
//        assertInlineSnapshot(
//            of: input()
//                .type(.number)
//                .name("quantity")
//                .min("1")
//                .max("10")
//                .step("1")
//                .value("5"),
//            as: .html
//        ) {
//            """
//            <input max="10" min="1" name="quantity" step="1" type="number" value="5">
//            """
//        }
//    }
//    
//    @Test("File input with accept and multiple attributes renders correctly")
//    func fileInputWithAcceptAndMultipleRendersCorrectly() {
//        assertInlineSnapshot(
//            of: input()
//                .type(.file)
//                .name("documents")
//                .accept([".pdf", ".docx"])
//                .multiple,
//            as: .html
//        ) {
//            """
//            <input accept=".pdf, .docx" multiple name="documents" type="file">
//            """
//        }
//    }
//    
//    @Test("Factory method textInput renders correctly")
//    func factoryMethodTextInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.textInput(
//                id: "username",
//                name: "username",
//                placeholder: "Enter username",
//                value: "john"
//            ),
//            as: .html
//        ) {
//            """
//            <input id="username" name="username" placeholder="Enter username" type="text" value="john">
//            """
//        }
//    }
//    
//    @Test("Factory method emailInput renders correctly")
//    func factoryMethodEmailInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.emailInput(
//                id: "email",
//                name: "email",
//                placeholder: "Enter email",
//                required: true,
//                multiple: true
//            ),
//            as: .html
//        ) {
//            """
//            <input id="email" multiple name="email" placeholder="Enter email" required type="email">
//            """
//        }
//    }
//    
//    @Test("Factory method checkbox renders correctly")
//    func factoryMethodCheckboxRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.checkbox(
//                id: "subscribe",
//                name: "subscribe",
//                value: "yes",
//                checked: true
//            ),
//            as: .html
//        ) {
//            """
//            <input checked id="subscribe" name="subscribe" type="checkbox" value="yes">
//            """
//        }
//    }
//    
//    @Test("Factory method radio renders correctly")
//    func factoryMethodRadioRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.radio(
//                id: "male",
//                name: "gender",
//                value: "male",
//                checked: true
//            ),
//            as: .html
//        ) {
//            """
//            <input checked id="male" name="gender" type="radio" value="male">
//            """
//        }
//    }
//    
//    @Test("Factory method numberInput renders correctly")
//    func factoryMethodNumberInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.numberInput(
//                id: "quantity",
//                name: "quantity",
//                min: "1",
//                max: "10",
//                step: "1",
//                value: "5"
//            ),
//            as: .html
//        ) {
//            """
//            <input id="quantity" max="10" min="1" name="quantity" step="1" type="number" value="5">
//            """
//        }
//    }
//    
//    @Test("Factory method fileInput renders correctly")
//    func factoryMethodFileInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.fileInput(
//                id: "document",
//                name: "document",
//                multiple: true,
//                accepts: .pdf, .docx
//            ),
//            as: .html
//        ) {
//            """
//            <input accept=".pdf, .docx" id="document" multiple name="document" type="file">
//            """
//        }
//    }
//    
//    @Test("Factory method submit renders correctly")
//    func factoryMethodSubmitRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.submit(value: "Submit Form"),
//            as: .html
//        ) {
//            """
//            <input type="submit" value="Submit Form">
//            """
//        }
//    }
//}
//
//@Suite(
//    "Input Element Helper Tests"
////    .snapshots(record: .all)
//)
//struct InputElementHelperTests {
//    
//    @Test("Labeled text input renders correctly")
//    func labeledTextInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.labeledTextInput(
//                id: "username",
//                label: "Username:",
//                placeholder: "Enter username",
//                required: true
//            ),
//            as: .html
//        ) {
//            """
//            <div><label for="username">Username:</label><input id="username" name="username" placeholder="Enter username" required type="text"></div>
//            """
//        }
//    }
//    
//    @Test("Checkbox with label renders correctly")
//    func checkboxWithLabelRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.checkbox(
//                id: "subscribe",
//                label: "Subscribe to newsletter",
//                value: "yes",
//                checked: true
//            ),
//            as: .html
//        ) {
//            """
//            <div><input checked id="subscribe" name="subscribe" type="checkbox" value="yes"><label for="subscribe">Subscribe to newsletter</label></div>
//            """
//        }
//    }
//    
//    @Test("Radio button with label renders correctly")
//    func radioButtonWithLabelRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.radio(
//                id: "male",
//                name: "gender",
//                label: "Male",
//                value: "male",
//                checked: true
//            ),
//            as: .html
//        ) {
//            """
//            <div><input checked id="male" name="gender" type="radio" value="male"><label for="male">Male</label></div>
//            """
//        }
//    }
//    
//    @Test("Radio group renders correctly")
//    func radioGroupRendersCorrectly() {
//        let options = [
//            (id: "male", label: "Male", value: "male"),
//            (id: "female", label: "Female", value: "female"),
//            (id: "other", label: "Other", value: "other")
//        ]
//        
//        assertInlineSnapshot(
//            of: HTML.radioGroup(
//                name: "gender",
//                options: options,
//                selectedValue: "female"
//            ),
//            as: .html
//        ) {
//            """
//            <fieldset><div><input id="male" name="gender" type="radio" value="male"><label for="male">Male</label></div><div><input checked id="female" name="gender" type="radio" value="female"><label for="female">Female</label></div><div><input id="other" name="gender" type="radio" value="other"><label for="other">Other</label></div></fieldset>
//            """
//        }
//    }
//    
//    @Test("Form with inputs renders correctly")
//    func formWithInputsRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.form(action: "/submit", method: "post") {
//                HTML.labeledTextInput(
//                    id: "name",
//                    label: "Name:",
//                    required: true
//                )
//                
//                HTML.labeledTextInput(
//                    id: "email",
//                    label: "Email:",
//                    required: true
//                )
//                
//                HTML.checkbox(
//                    id: "subscribe",
//                    label: "Subscribe to newsletter"
//                )
//            },
//            as: .html
//        ) {
//            """
//            <form action="/submit" method="post"><div><label for="name">Name:</label><input id="name" name="name" required type="text"></div><div><label for="email">Email:</label><input id="email" name="email" required type="text"></div><div><input id="subscribe" name="subscribe" type="checkbox" value="1"><label for="subscribe">Subscribe to newsletter</label></div><div><input type="submit" value="Submit"></div></form>
//            """
//        }
//    }
//    
//    @Test("Search input renders correctly")
//    func searchInputRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.searchInput(
//                id: "search",
//                name: "q",
//                placeholder: "Search for products...",
//                buttonText: "Search Products"
//            ),
//            as: .html
//        ) {
//            """
//            <div><input id="search" name="q" placeholder="Search for products..." type="search"><button type="submit">Search Products</button></div>
//            """
//        }
//    }
//    
//    @Test("Complete contact form renders correctly")
//    func completeContactFormRendersCorrectly() {
//        assertInlineSnapshot(
//            of: HTML.form(action: "/contact", method: "post") {
//                HTML.labeledTextInput(
//                    id: "name",
//                    label: "Full Name:",
//                    required: true
//                )
//                
//                HTML.labeledTextInput(
//                    id: "email",
//                    label: "Email Address:",
//                    required: true
//                )
//                
//                div {
//                    label()
//                        .for("message")
//                        .text("Message:")
//                    
//                    textarea()
//                        .id("message")
//                        .name("message")
//                        .attribute("rows", "5")
//                        .required
//                }
//                
//                HTML.checkbox(
//                    id: "subscribe",
//                    label: "Subscribe to newsletter"
//                )
//            },
//            as: .html
//        ) {
//            """
//            <form action="/contact" method="post"><div><label for="name">Full Name:</label><input id="name" name="name" required type="text"></div><div><label for="email">Email Address:</label><input id="email" name="email" required type="text"></div><div><label for="message">Message:</label><textarea id="message" name="message" required rows="5"></textarea></div><div><input id="subscribe" name="subscribe" type="checkbox" value="1"><label for="subscribe">Subscribe to newsletter</label></div><div><input type="submit" value="Submit"></div></form>
//            """
//        }
//    }
//}
