#if canImport(UIKit) && os(iOS)
    import HTML_Rendering
    import SwiftUI
    import WebKit

    extension HTML.Document: @retroactive SwiftUI.View {}
    extension HTML.Document: SwiftUI.UIViewRepresentable {
        public func makeUIView(context: Context) -> WKWebView {
            let webView = WKWebView()
            webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
            webView.loadHTMLString(try! .init(self), baseURL: nil)
            return webView
        }

        public func updateUIView(_ webView: WKWebView, context: Context) {}
    }
#endif
