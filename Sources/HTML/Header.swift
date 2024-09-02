public struct Header<Content: HTML>: HTML {
    let size: Int
    @HTMLBuilder let content: Content
    public init(_ size: Int = 3, @HTMLBuilder content: () -> Content) {
        self.size = size
        self.content = content()
    }
    
    public var body: some HTML {
        tag("h\(size)") {
            content
        }
        .margin(0)
        .margin(top: marginTop, pseudo: .not(.firstChild))
        .margin(bottom: marginBottom, pseudo: .not(.lastChild))
        .font(.size(fontSize))
        .font(.weight(700))
        .lineHeight(.number(lineHeight))
    }
    
    var fontSize: Length {
        switch size {
        case 1: 4.rem
        case 2: 3.rem
        case 3: 2.rem
        case 4: 1.5.rem
        case 5: 1.rem
        default: 0.875.rem
        }
    }
    var lineHeight: Double {
        switch size {
        case 1: 1.2
        case 2: 1.2
        case 3: 1.2
        case 4: 1.2
        case 5: 1.15
        default: 1.15
        }
    }
    var marginBottom: Length {
        switch size {
        case 1: 1.rem
        case 2: 0.75.rem
        case 3: 0.5.rem
        case 4: 0.5.rem
        case 5: 0.5.rem
        default: 0.3.rem
        }
    }
    var marginTop: Length {
        switch size {
        case 1: 2.rem
        case 2: 1.75.rem
        case 3: 1.5.rem
        case 4: 1.5.rem
        case 5: 0.5.rem
        default: 0.5.rem
        }
    }
}
