// TODO: Migrate to use new HTML.View protocol
// The NSViewRepresentable conformance needs to be updated for the new generic constraints
// #if canImport(SwiftUI) && os(macOS)
//     import AppKit
//     import HTML_Rendering
//     import SwiftUI
//     import WebKit
//
//     extension HTML.Document: @retroactive View where Body: HTML.View, Head: HTML.View {}
//     extension HTML.Document: SwiftUI.NSViewRepresentable where Body: HTML.View, Head: HTML.View {
//         public func makeNSView(context: Context) -> WKWebView {
//             let webView = WKWebView(
//                 frame: NSRect(x: 0, y: 0, width: 640, height: 480),
//                 configuration: WKWebViewConfiguration()
//             )
//             webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
//             webView.loadHTMLString(
//                 (try? String(self)) ?? "HTML could not be parsed into a String",
//                 baseURL: nil
//             )
//             return webView
//         }
//
//         public func updateNSView(_ webView: WKWebView, context: Context) {}
//     }
// #endif
