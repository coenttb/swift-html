import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Input Type Attribute Tests",
//    .snapshots(record: .all),
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
}
