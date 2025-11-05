//
//  ReadmeVerificationTests.swift
//  swift-html
//
//  Created for README verification
//

import HTML
import Testing

@Suite("README Verification")
struct ReadmeVerificationTests {
    @Test("Example from README: Basic HTML Generation")
    func basicHtmlGeneration() throws {
        let page = div {
            h1 { "Welcome to swift-html" }
                .color(.red)
                .fontSize(.rem(2.5))

            p { "Build type-safe web pages with Swift" }
                .color(light: .gray800, dark: .gray200)
                .lineHeight(1.6)
        }

        let bytes: ContiguousArray<UInt8> = page.render()
        let string: String = String(decoding: bytes, as: UTF8.self)

        // Verify it renders without crashing
        #expect(!string.isEmpty)
        #expect(string.contains("Welcome to swift-html"))
        #expect(string.contains("Build type-safe web pages with Swift"))
    }

    @Test("Example from README: Horizontal Stack")
    func horizontalStack() throws {
        let header = HStack {
            div { "Logo" }
            Spacer()
            div { "Menu" }
        }

        let bytes = header.render()
        let string = String(decoding: bytes, as: UTF8.self)

        #expect(!string.isEmpty)
        #expect(string.contains("Logo"))
        #expect(string.contains("Menu"))
    }

    @Test("Example from README: Vertical Stack")
    func verticalStack() throws {
        let content = VStack {
            div { "Section 1" }
            div { "Section 2" }
        }

        let bytes = content.render()
        let string = String(decoding: bytes, as: UTF8.self)

        #expect(!string.isEmpty)
        #expect(string.contains("Section 1"))
        #expect(string.contains("Section 2"))
    }

    @Test("Example from README: Grid Layout")
    func gridLayout() throws {
        let grid = LazyVGrid(columns: [1, 2, 1]) {
            div { "Item 1" }
            div { "Item 2" }
            div { "Item 3" }
        }

        let bytes = grid.render()
        let string = String(decoding: bytes, as: UTF8.self)

        #expect(!string.isEmpty)
        #expect(string.contains("Item 1"))
        #expect(string.contains("Item 2"))
        #expect(string.contains("Item 3"))
    }

    @Test("Example from README: Dark Mode Support")
    func darkModeSupport() throws {
        let adaptiveContent = p { "Adaptive text" }
            .color(light: .gray900, dark: .gray100)
            .backgroundColor(light: .white, dark: .gray900)

        let bytes = adaptiveContent.render()
        let string = String(decoding: bytes, as: UTF8.self)

        #expect(!string.isEmpty)
        #expect(string.contains("Adaptive text"))
    }

    @Test("Example from README: Reusable Components")
    func reusableComponents() throws {
        struct CustomButton: HTML {
            let title: String
            let href: String

            var body: some HTML {
                a(href: .init(rawValue: href)) { title }
                    .display(.inlineBlock)
                    .padding(vertical: .rem(0.5), horizontal: .rem(1))
                    .backgroundColor(.blue)
                    .color(.white)
                    .borderRadius(.px(6))
                    .textDecoration(TextDecoration.none)
            }
        }

        let button = CustomButton(title: "Learn More", href: "/docs")
        let bytes = button.render()
        let string = String(decoding: bytes, as: UTF8.self)

        #expect(!string.isEmpty)
        #expect(string.contains("Learn More"))
        #expect(string.contains("/docs"))
    }
}
