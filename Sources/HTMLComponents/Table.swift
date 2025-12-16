//import HTML
//
//public struct Table<Headers: HTML.View, Rows: HTML.View>: HTML.View {
//    let headers: Headers
//    let rows: Rows
//    let id: String?
//    let striped: Bool
//    let hoverable: Bool
//    let bordered: Bool
//
//    public init(
//        id: String? = nil,
//        striped: Bool = false,
//        hoverable: Bool = true,
//        bordered: Bool = true,
//        @HTML.Builder headers: () -> Headers,
//        @HTML.Builder rows: () -> Rows
//    ) {
//        self.id = id
//        self.striped = striped
//        self.hoverable = hoverable
//        self.bordered = bordered
//        self.headers = headers()
//        self.rows = rows()
//    }
//
//    public var body: some HTML.View {
//        div {
//            table {
//                thead { headers }
//                tbody { rows }
//            }
//            .if(let: id) { $0.id($1) }
//            .inlineStyle("width", "100%")
//            .inlineStyle("border-collapse", "collapse")
//            .inlineStyle("background-color", "var(--background-primary, white)")
//        }
//        .inlineStyle("overflow-x", "auto")
//        .inlineStyle("border", bordered ? "1px solid var(--border-secondary, #e5e7eb)" : nil)
//        .inlineStyle("border-radius", bordered ? "8px" : nil)
//    }
//}
//
//// Table header helpers
//public struct TableHeader: HTML.View {
//    let content: String
//    let sortable: Bool
//    let alignment: String
//    let onClick: String?
//
//    public init(
//        _ content: String,
//        sortable: Bool = false,
//        alignment: String = "left",
//        onClick: String? = nil
//    ) {
//        self.content = content
//        self.sortable = sortable
//        self.alignment = alignment
//        self.onClick = onClick
//    }
//
//    public var body: some HTML.View {
//        th {
//            HTML.Text(content)
//            if sortable {
//                span { "" }
//                    .class("sort-indicator")
//                    .inlineStyle("margin-left", "4px")
//                    .inlineStyle("font-size", "0.8em")
//            }
//        }
//        .inlineStyle("padding", "0.75rem")
//        .inlineStyle("text-align", alignment)
//        .inlineStyle("border-bottom", "2px solid var(--border-primary, #d1d5db)")
//        .inlineStyle("cursor", sortable ? "pointer" : nil)
//        .if(sortable) { $0.onclick(onClick ?? "") }
//    }
//}
//
//// Table row helper
//public struct TableRow<Content: HTML.View>: HTML.View {
//    let content: Content
//    let onClick: String?
//
//    public init(
//        onClick: String? = nil,
//        @HTML.Builder content: () -> Content
//    ) {
//        self.onClick = onClick
//        self.content = content()
//    }
//
//    public var body: some HTML.View {
//        tr { content }
//            .inlineStyle("cursor", onClick != nil ? "pointer" : nil)
//            .attribute("onclick", onClick)
//    }
//}
//
//// Table cell helper
//public struct TableCell<Content: HTML.View>: HTML.View {
//    let content: Content
//    let alignment: String
//    let colspan: Int?
//    let rowspan: Int?
//
//    public init(
//        alignment: String = "left",
//        colspan: Int? = nil,
//        rowspan: Int? = nil,
//        @HTML.Builder content: () -> Content
//    ) {
//        self.alignment = alignment
//        self.colspan = colspan
//        self.rowspan = rowspan
//        self.content = content()
//    }
//
//    public var body: some HTML.View {
//        td { content }
//            .inlineStyle("padding", "0.75rem")
//            .inlineStyle("text-align", alignment)
//            .inlineStyle("border-bottom", "1px solid var(--border-secondary, #e5e7eb)")
//            .attribute("colspan", colspan.map { "\($0)" })
//            .attribute("rowspan", rowspan.map { "\($0)" })
//    }
//}
