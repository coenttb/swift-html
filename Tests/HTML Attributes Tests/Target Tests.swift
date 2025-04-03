import Foundation
import Testing
import HTML_Attributes
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Target Attribute Tests",
//    .snapshots(record: .all)
)
struct TargetTests {
    
    @Test("Initialize with string value")
    func initWithStringValue() {
        let target = Target("content-frame")
        #expect(target.description == "content-frame")
    }
    
    @Test("Initialize with string literal")
    func initWithStringLiteral() {
        let target: Target = "content-frame"
        #expect(target.description == "content-frame")
    }
    
    @Test("Initialize with predefined context")
    func initWithPredefinedContext() {
        let target = Target(.blank)
        #expect(target.description == "_blank")
    }
    
    @Test("Blank target value")
    func blankTargetValue() {
        let target = Target.blank
        #expect(target.description == "_blank")
    }
    
    @Test("Parent target value")
    func parentTargetValue() {
        let target = Target.parent
        #expect(target.description == "_parent")
    }
    
    @Test("Top target value")
    func topTargetValue() {
        let target = Target.top
        #expect(target.description == "_top")
    }
    
    @Test("UnfencedTop target value")
    func unfencedTopTargetValue() {
        let target = Target.unfencedTop
        #expect(target.description == "_unfencedTop")
    }
    
    @Test("Named target factory method")
    func namedTargetFactoryMethod() {
        let target = Target.named("content-frame")
        #expect(target.description == "content-frame")
    }
    
    @Test("Link with target renders correctly")
    func linkWithTargetRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Open in new tab"
            }
                .href("https://example.com")
                .target(anchor: .blank),
            as: .html
        ) {
            """
            <a target="_blank" href="https://example.com">Open in new tab</a>
            """
        }
    }
    
    @Test("Link with named target renders correctly")
    func linkWithNamedTargetRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Load in frame"
            }
                .href("page.html")
                .target(anchor: "content-frame"),
            as: .html
        ) {
            """
            <a target="content-frame" href="page.html">Load in frame</a>
            """
        }
    }
    
    @Test("Link with target context renders correctly")
    func linkWithTargetContextRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Load in parent"
            }
                .href("page.html")
                .target(anchor: .parent),
            as: .html
        ) {
            """
            <a target="_parent" href="page.html">Load in parent</a>
            """
        }
    }
    
    @Test("openInNewTab helper renders correctly")
    func openInNewTabHelperRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Open safely in new tab"
            }
                .href("https://example.com")
                .openInNewTab()
            ,
            as: .html
        ) {
            """
            <a rel="noopener" target="_blank" href="https://example.com">Open safely in new tab</a>
            """
        }
    }
    
    @Test("openInNewTab with opener renders correctly")
    func openInNewTabWithOpenerRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Open with opener in new tab"
            }
                .href("https://example.com")
                .openInNewTab(withOpener: true),
            as: .html
        ) {
            """
            <a target="_blank" href="https://example.com">Open with opener in new tab</a>
            """
        }
    }
    
    @Test("openInParent helper renders correctly")
    func openInParentHelperRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Open in parent"
            }
                .href("page.html")
                .openInParent()
            ,
            as: .html
        ) {
            """
            <a target="_parent" href="page.html">Open in parent</a>
            """
        }
    }
    
    @Test("openInTop helper renders correctly")
    func openInTopHelperRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Open in top"
            }
                .href("page.html")
                .openInTop(),
            as: .html
        ) {
            """
            <a target="_top" href="page.html">Open in top</a>
            """
        }
    }
    
    @Test("targetFrame helper renders correctly")
    func targetFrameHelperRendersCorrectly() {
        assertInlineSnapshot(
            of: a {
                "Load in content frame"
            }
                .href("page.html")
                .targetFrame("content-frame"),
            as: .html
        ) {
            """
            <a target="content-frame" href="page.html">Load in content frame</a>
            """
        }
    }
    
    @Test("iframe with name and link targeting it renders correctly")
    func iframeWithNameAndLinkTargetingItRendersCorrectly() {
        assertInlineSnapshot(
            of: div {
                iframe()
                    .attribute("name", "content-area")
                    .attribute("src", "empty.html")
                    .attribute("width", "600")
                    .attribute("height", "400")
                
                p {
                    a {
                        "Load Page 1"
                    }
                        .href("page1.html")
                        .targetFrame("content-area")
                }
                
                p {
                    a {
                        "Load Page 2"
                    }
                        .href("page2.html")
                        .targetFrame("content-area")
                }
            },
            as: .html
        ) {
            """

            <div>
              <iframe name="content-area" src="empty.html" width="600" height="400">
              </iframe>
              <p><a target="content-area" href="page1.html">Load Page 1</a>
              </p>
              <p><a target="content-area" href="page2.html">Load Page 2</a>
              </p>
            </div>
            """
        }
    }
}
