import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Article Element Tests"
)
struct ArticleTests {
    
    @Test("Create basic article")
    func createBasicArticle() {
        let art = Article<String>(
            content: { "Article content" }
        )
        
        // Verify the content closure returns the expected value
        #expect(art.content() == "Article content")
    }
    
    @Test("Create article with lowercase typealias")
    func createArticleWithLowercaseTypealias() {
        let art = article<String>(
            content: { "Article using typealias" }
        )
        
        #expect(art.content() == "Article using typealias")
    }
    
    @Test("Create nested articles")
    func createNestedArticles() {
        let art = article<String>(
            content: {
                "Main article content" +
                article<String>(
                    content: { "Nested article content" }
                ).content()
            }
        )
        
        #expect(art.content() == "Main article contentNested article content")
    }
}