import Foundation
import Testing
import HTML_Attributes
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Form Attributes Tests",
//    .snapshots(record: .all)
)
struct FormAttributesTests {
    
    // MARK: - Action Tests
    
    @Test("Action attribute with string value")
    func actionAttributeWithStringValue() {
        let html = form().action("/submit")
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form action="/submit">
            </form>
            """
        }
    }
    
    @Test("Action attribute with struct")
    func actionAttributeWithStruct() {
        let html = form().action(Action("/submit"))
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form action="/submit">
            </form>
            """
        }
    }
    
    @Test("Action.relative factory method")
    func actionRelativeFactoryMethod() {
        let html = form().action(Action.relative("submit"))
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form action="/submit">
            </form>
            """
        }
    }
    
    @Test("Action.clientSide factory method")
    func actionClientSideFactoryMethod() {
        let html = form().action(Action.clientSide)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form action="#">
            </form>
            """
        }
    }
    
    // MARK: - Method Tests
    
    @Test("Method attribute with string value")
    func methodAttributeWithStringValue() {
        let html = form().method("post")
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form method="post">
            </form>
            """
        }
    }
    
    @Test("Method attribute with struct")
    func methodAttributeWithStruct() {
        let html = form().method(Method("post"))
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form method="post">
            </form>
            """
        }
    }
    
    @Test("Method attribute with enum")
    func methodAttributeWithEnum() {
        let html = form().method(.post)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form method="post">
            </form>
            """
        }
    }
    
    @Test("Method.get static property")
    func methodGetStaticProperty() {
        let html = form().method(Method.get)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form method="get">
            </form>
            """
        }
    }
    
    @Test("Method.post static property")
    func methodPostStaticProperty() {
        let html = form().method(Method.post)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form method="post">
            </form>
            """
        }
    }
    
    @Test("Method.dialog static property")
    func methodDialogStaticProperty() {
        let html = form().method(Method.dialog)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form method="dialog">
            </form>
            """
        }
    }
    
//
    
    // MARK: - Enctype Tests
    
    @Test("Enctype attribute with string value")
    func enctypeAttributeWithStringValue() {
        let html = form().enctype("multipart/form-data")
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="multipart/form-data">
            </form>
            """
        }
    }
    
    @Test("Enctype attribute with struct")
    func enctypeAttributeWithStruct() {
        let html = form().enctype(Enctype("multipart/form-data"))
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="multipart/form-data">
            </form>
            """
        }
    }
    
    @Test("Enctype attribute with enum")
    func enctypeAttributeWithEnum() {
        let html = form().enctype(.multipartFormData)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="multipart/form-data">
            </form>
            """
        }
    }
    
    @Test("Enctype.urlEncoded static property")
    func enctypeUrlEncodedStaticProperty() {
        let html = form().enctype(Enctype.urlEncoded)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="application/x-www-form-urlencoded">
            </form>
            """
        }
    }
    
    @Test("Enctype.multipartFormData static property")
    func enctypeMultipartFormDataStaticProperty() {
        let html = form().enctype(Enctype.multipartFormData)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="multipart/form-data">
            </form>
            """
        }
    }
    
    @Test("Enctype.textPlain static property")
    func enctypeTextPlainStaticProperty() {
        let html = form().enctype(Enctype.textPlain)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="text/plain">
            </form>
            """
        }
    }

    
    // MARK: - Novalidate Tests
    
    @Test("Novalidate attribute")
    func novalidateAttribute() {
        let html = form().novalidate
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form novalidate>
            </form>
            """
        }
    }
    
    @Test("Novalidate attribute with struct")
    func novalidateAttributeWithStruct() {
        let html = form().novalidate
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form novalidate>
            </form>
            """
        }
    }
    
    @Test("Formnovalidate attribute on submit button")
    func formnovalidateAttributeOnSubmitButton() {
        let html = input().type(input: .submit).novalidate
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """
            <input novalidate type="submit">
            """
        }
    }
    
   
    
    // MARK: - Target Tests
    
    @Test("Target attribute with string value")
    func targetAttribute() {
        let html = form().target(form: .blank)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form target="_blank">
            </form>
            """
        }
    }

    
    // MARK: - Combined Form Attributes Tests
    
    @Test("Form with multiple attributes")
    func formWithMultipleAttributes() {
        let html = form()
            .action("/submit")
            .method(.post)
            .enctype(.multipartFormData)
            .novalidate
            .target(form: .blank)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form target="_blank" novalidate enctype="multipart/form-data" method="post" action="/submit">
            </form>
            """
        }
    }
    
    @Test("Complete contact form with all attributes")
    func completeContactFormWithAllAttributes() {
        let html: some HTML = form {
            fieldset {
                legend { "Contact Form" }
                
                div {
                    label { "Name:" }.for("name")
                    input().type(input: .text).id("name").name("name").required
                }
                
                div {
                    label { "Email:" }.for("email")
                    input().type(input: .email).id("email").name("email").required
                }
                
                div {
                    label { "Message:" }.for("message")
                    textarea().id("message").name("message").attribute("rows", "5").required
                }
                
                div {
                    input().type(input: .submit).value("Send Message")
                    input()
                        .type(input: .submit)
                        .value("Send in New Window")
                        .target(form: .blank)
                }
            }
        }
        .action("/contact")
        .method(.post)
        .novalidate
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form novalidate method="post" action="/contact">
              <fieldset>
                <legend>Contact Form
                </legend>
                <div><label for="name">Name:</label><input required name="name" id="name" type="text">
                </div>
                <div><label for="email">Email:</label><input required name="email" id="email" type="email">
                </div>
                <div><label for="message">Message:</label><textarea required name="message" rows="5" id="message"></textarea>
                </div>
                <div><input value="Send Message" type="submit"><input target="_blank" value="Send in New Window" type="submit">
                </div>
              </fieldset>
            </form>
            """
        }
    }
    
    @Test("File upload form with all required attributes")
    func fileUploadFormWithAllRequiredAttributes() {
        let html: some HTML = form {
            div {
                label { "Select file:" }.for("fileUpload")
                input().type(input: .file).id("fileUpload").name("fileUpload").accept(.pdf, .docx).required
            }
            
            div {
                input().type(input: .submit).value("Upload")
            }
        }
        .action("/upload")
        .method(.post)
        .enctype(.multipartFormData)
        
        assertInlineSnapshot(
            of: html,
            as: .html
        ) {
            """

            <form enctype="multipart/form-data" method="post" action="/upload">
              <div><label for="fileUpload">Select file:</label><input required accept=".pdf, .docx" name="fileUpload" id="fileUpload" type="file">
              </div>
              <div><input value="Upload" type="submit">
              </div>
            </form>
            """
        }
    }
}
