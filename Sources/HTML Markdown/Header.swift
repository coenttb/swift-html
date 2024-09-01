import HTML

struct Header<Content: HTML>: HTML {
    let size: Length
    @HTMLBuilder let content: Content
    init(_ size: Length = 3, @HTMLBuilder content: () -> Content) {
        self.size = size
        self.content = content()
    }
    
    var body: some HTML {
        tag("h\(size)") {
            content
        }
        .inlineStyle("margin", "0")
        .margin(0)
        .margin(top: marginTop, pseudo: .not(.firstChild))
        .margin(bottom: marginBottom, pseudo: .not(.firstChild))
        .fontSize(size)
        .font(.weight(700))
        .lineHeight(.length(lineHeight))
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
    var lineHeight: Length {
        switch size {
        case 1: 1.2.rem
        case 2: 1.2.rem
        case 3: 1.2.rem
        case 4: 1.2.rem
        case 5: 1.15.rem
        default: 1.15.rem
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
