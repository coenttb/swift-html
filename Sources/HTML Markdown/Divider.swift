import HTML

public struct Divider: HTML {
  public init() {}
  public var body: some HTML {
    hr()
      .border(.none)
      .border(.top(width: 1.px, style: .solid, color: .gray800.dark(.gray300)))
      .margin(top: 0, right: 30.percent)
  }
}
