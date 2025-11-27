import HTML

public struct Table<Headers: HTML.View, Rows: HTML.View>: HTML.View {
    let headers: Headers
    let rows: Rows
    let id: String?
    let striped: Bool
    let hoverable: Bool
    let bordered: Bool

    public init(
        id: String? = nil,
        striped: Bool = false,
        hoverable: Bool = true,
        bordered: Bool = true,
        @HTML.Builder headers: () -> Headers,
        @HTML.Builder rows: () -> Rows
    ) {
        self.id = id
        self.striped = striped
        self.hoverable = hoverable
        self.bordered = bordered
        self.headers = headers()
        self.rows = rows()
    }

    public var body: some HTML.View {
        div {
            table {
                thead {
                    headers
                }
                tbody {
                    rows
                }
            }
            .if(let: id) {
                $0.id($1)
            }
            .width(.percent(100))
            .borderCollapse(.collapse)
            .backgroundColor(.background.primary)
            .if(striped) { table in
                table.inlineStyle(
                    "tbody tr:nth-child(even)",
                    "background-color: rgba(0, 0, 0, 0.02)"
                )
                .inlineStyle(
                    "tbody tr:nth-child(even)",
                    "background-color: rgba(255, 255, 255, 0.02)",
                    media: .dark
                )
            }
            .if(hoverable) { table in
                table.backgroundColor(
                    .rgba(red: 59, green: 130, blue: 246, alpha: 0.05),
                    selector: "tbody tr",
                    pseudo: .hover
                )
            }
        }
        .overflowX(.auto)
        .if(bordered) { wrapper in
            wrapper
                .border(width: .px(1), style: .solid, color: .border.secondary)
                .borderRadius(.px(8))
        }
    }
}

// Table header helpers
public struct TableHeader: HTML.View {
    let content: String
    let sortable: Bool
    let alignment: TextAlign
    let onClick: String?

    public init(
        _ content: String,
        sortable: Bool = false,
        alignment: TextAlign = .left,
        onClick: String? = nil
    ) {
        self.content = content
        self.sortable = sortable
        self.alignment = alignment
        self.onClick = onClick
    }

    public var body: some HTML.View {
        th {
            HTML.Text(content)
            if sortable {
                span { "" }
                    .class("sort-indicator")
                    .marginLeft(.px(4))
                    .fontSize(.em(0.8))
            }
        }
        .padding(.rem(0.75))
        .textAlign(alignment)
        .borderBottom(width: .px(2), style: .solid, color: .border.primary)
        .if(sortable) { header in
            header
                .cursor(.pointer)
                .onclick(onClick ?? "")
                .backgroundColor(.rgba(59, 130, 246, 0.1), pseudo: .hover)
        }
    }
}

// Table row helper
public struct TableRow<Content: HTML.View>: HTML.View {
    let content: Content
    let onClick: String?

    public init(
        onClick: String? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.onClick = onClick
        self.content = content()
    }

    public var body: some HTML.View {
        tr {
            content
        }
        .if(onClick != nil) { row in
            row
                .cursor(.pointer)
                .attribute("onclick", onClick!)
        }
    }
}

// Table cell helper
public struct TableCell<Content: HTML.View>: HTML.View {
    let content: Content
    let alignment: TextAlign
    let colspan: Int?
    let rowspan: Int?

    public init(
        alignment: TextAlign = .left,
        colspan: Int? = nil,
        rowspan: Int? = nil,
        @HTML.Builder content: () -> Content
    ) {
        self.alignment = alignment
        self.colspan = colspan
        self.rowspan = rowspan
        self.content = content()
    }

    public var body: some HTML.View {
        td {
            content
        }
        .padding(.rem(0.75))
        .textAlign(alignment)
        .borderBottom(width: .px(1), style: .solid, color: .border.secondary)
        .if(colspan != nil) { cell in
            cell.attribute("colspan", "\(colspan!)")
        }
        .if(rowspan != nil) { cell in
            cell.attribute("rowspan", "\(rowspan!)")
        }
    }
}
