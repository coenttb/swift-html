public struct Divider: HTML {
  public init() {}
  public var body: some HTML {
    hr()
      .border(.none)
      .border(.top(width: 1.px, style: .solid, color: .gray400.dark(.gray300)))
      .margin(vertical: 0, horizontal: 30.percent)
  }
}
