#if canImport(SwiftUI) && os(macOS)
  import AppKit
  import SwiftUI
  import WebKit

  extension HTMLDocument: @retroactive View {}
  extension HTMLDocument: SwiftUI.NSViewRepresentable {
    public func makeNSView(context: Context) -> WKWebView {
      let webView = WKWebView(
        frame: NSRect(x: 0, y: 0, width: 640, height: 480),
        configuration: WKWebViewConfiguration()
      )
      webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
      webView.loadHTMLString(
        (try? String(self)) ?? "HTML could not be parsed into a String",
        baseURL: nil
      )
      return webView
    }

    public func updateNSView(_ webView: WKWebView, context: Context) {}
  }
#endif
