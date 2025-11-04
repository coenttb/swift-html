//
//  TranslatingIntegrationTests.swift
//  swift-html
//
//  Tests for TranslatedString HTML integration (requires Translating trait)
//

#if TRANSLATING
  import Dependencies
  import DependenciesTestSupport
  import Foundation
  import HTML
  import PointFreeHTMLTestSupport
  import Testing
  import Translating

  extension SnapshotTests {
    @Suite(
      "Translating Integration Tests",
      .dependencies {
        $0.language = .english
        $0.locale = .init(identifier: "en_US")
      }
    )
    struct TranslatingIntegrationTests {

      @Test("TranslatedString renders as HTML")
      func translatedStringRendersAsHTML() {
        let translatedText = TranslatedString(
          dutch: "Hallo wereld",
          english: "Hello world"
        )

        assertInlineSnapshot(
          of: div { translatedText },
          as: .html
        ) {
          """

          <div>Hello world
          </div>
          """
        }
      }

      @Test("TranslatedString in paragraph")
      func translatedStringInParagraph() {
        let greeting = TranslatedString(
          dutch: "Welkom bij onze website",
          english: "Welcome to our website"
        )

        assertInlineSnapshot(
          of: p { greeting },
          as: .html
        ) {
          """

          <p>Welcome to our website
          </p>
          """
        }
      }

      @Test("Multiple TranslatedStrings in container")
      func multipleTranslatedStrings() {
        let title = TranslatedString(
          dutch: "Titel",
          english: "Title"
        )
        let content = TranslatedString(
          dutch: "Inhoud",
          english: "Content"
        )

        assertInlineSnapshot(
          of: div {
            h1 { title }
            p { content }
          },
          as: .html
        ) {
          """

          <div>
            <h1>Title
            </h1>
            <p>Content
            </p>
          </div>
          """
        }
      }

      @Test("TranslatedString with HTML styling")
      func translatedStringWithStyling() {
        let message = TranslatedString(
          dutch: "Belangrijke mededeling",
          english: "Important announcement"
        )

        assertInlineSnapshot(
          of: p { message }
            .color(.red)
            .fontWeight(.bold),
          as: .html
        ) {
          """

          <p class="font-weight-bcFnu color-ILzRW1 color-CA97y2">Important announcement
          </p>
          """
        }
      }

      @Test("TranslatedString in HStack")
      func translatedStringInHStack() {
        let label = TranslatedString(
          dutch: "Label:",
          english: "Label:"
        )
        let value = TranslatedString(
          dutch: "Waarde",
          english: "Value"
        )

        assertInlineSnapshot(
          of: HStack {
            span { label }
            span { value }
          },
          as: .html
        ) {
          """

          <swift-html-hstack class="column-gap-dnNPN1 size-C8uWv flex-direction-jlten2 display-BvS8W3 vertical-align-cvXVf align-items-msN8p3"><span>Label:</span><span>Value</span>
          </swift-html-hstack>
          """
        }
      }

      @Test("HTMLText initializer with TranslatedString")
      func htmlTextInitializer() {
        let text = TranslatedString(
          dutch: "Tekst",
          english: "Text"
        )

        let htmlText = HTMLText(text)

        assertInlineSnapshot(
          of: div { htmlText },
          as: .html
        ) {
          """

          <div>Text
          </div>
          """
        }
      }

      @Test("TranslatedString with language dependency")
      func translatedStringWithLanguageDependency() {
        let greeting = TranslatedString(
          dutch: "Goedemorgen",
          english: "Good morning"
        )

        // Test with English
        withDependencies {
          $0.language = .english
        } operation: {
          assertInlineSnapshot(
            of: p { greeting },
            as: .html
          ) {
            """

            <p>Good morning
            </p>
            """
          }
        }

        // Test with Dutch
        withDependencies {
          $0.language = .dutch
        } operation: {
          assertInlineSnapshot(
            of: p { greeting },
            as: .html
          ) {
            """

            <p>Goedemorgen
            </p>
            """
          }
        }
      }

      @Test("TranslatedString in complex structure")
      func translatedStringInComplexStructure() {
        let headerText = TranslatedString(
          dutch: "Koptekst",
          english: "Header"
        )
        let subtitleText = TranslatedString(
          dutch: "Ondertitel",
          english: "Subtitle"
        )
        let bodyText = TranslatedString(
          dutch: "Hoofdtekst",
          english: "Body text"
        )

        assertInlineSnapshot(
          of: article {
            header {
              h1 { headerText }
              h2 { subtitleText }
            }
            div {
              p { bodyText }
            }
          },
          as: .html
        ) {
          """

          <article>
            <header>
              <h1>Header
              </h1>
              <h2>Subtitle
              </h2>
            </header>
            <div>
              <p>Body text
              </p>
            </div>
          </article>
          """
        }
      }
    }
  }
#endif
