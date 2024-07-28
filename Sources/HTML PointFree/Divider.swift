import HTML

public struct Divider: HTML {
  public init() {}
  public var body: some HTML {
    hr()
      .inlineStyle("border", "none")
      .inlineStyle("border-top", "1px solid \(HTMLColor.gray800.rawValue)")
      .inlineStyle("border-top", "1px solid \(HTMLColor.gray300.rawValue)", media: .dark)
      .inlineStyle("margin", "0 30%")
  }
}
