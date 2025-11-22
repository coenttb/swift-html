import HTMLCSSPointFreeHTML

//
//  File.swift
//  swift-html-standard
//
//  Created by Coen ten Thije Boonkkamp on 12/07/2025.
//

/// Lowercase typealias for creating Anchor elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `anchor` identifier when creating
/// HTML anchor elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// anchor(href: "https://example.com") {
///     "Visit Example Website"
/// }
/// ```
public typealias a = HTML_Standard.Anchor

/// Lowercase typealias for creating Abbreviation elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `abbr` identifier when creating
/// HTML abbreviation elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// abbr {
///     "HTML"
/// }
/// ```
public typealias abbr = HTML_Standard.Abbreviation

/// Lowercase typealias for creating Address elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `address` identifier when creating
/// HTML address elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// address {
///   "Contact us: contact@example.com"
/// }
/// ```
public typealias address = HTML_Standard.Address

/// Lowercase typealias for creating Area elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `area` identifier when creating
/// HTML area elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// area(
///   shape: .circle(coords: "75,75,75"),
///   href: "section.html",
///   alt: "Go to section"
/// )
/// ```
public typealias area = HTML_Standard.Area

/// Lowercase typealias for creating Article elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `article` identifier when creating
/// HTML article elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// article {
///   heading2 { "Blog Post Title" }
///   HTMLComponents.Paragraph { "Content goes here..." }
/// }
/// ```
public typealias article = HTML_Standard.Article

/// Lowercase typealias for creating Aside elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `aside` identifier when creating
/// HTML aside elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// aside {
///   HTMLComponents.Paragraph { "This is supplementary information that enhances the main content." }
/// }
/// ```
public typealias aside = HTML_Standard.Aside

/// Lowercase typealias for creating Audio elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `audio` identifier when creating
/// HTML audio elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// audio(controls: true) {
///     source(src: "audio.mp3", type: "audio/mpeg")
///     "Your browser does not support the audio element."
/// }
/// ```
public typealias audio = HTML_Standard.Audio

/// Lowercase typealias for creating B elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `b` identifier when creating
/// HTML b elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// b {
///     "This text is bold but semantically neutral."
/// }
/// ```
public typealias b = HTML_Standard.B

/// Lowercase typealias for creating Base elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `base` identifier when creating
/// HTML base elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// base(href: "https://example.com/")
/// ```
public typealias base = HTML_Standard.Base

/// Lowercase typealias for creating Body elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `body` identifier when creating
/// HTML body elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// body {
///   heading1 { "Welcome to My Website" }
///   HTMLComponents.Paragraph { "This is the content of my webpage." }
/// }
/// ```
public typealias body = HTML_Standard.Body

/// Lowercase typealias for creating BidirectionalIsolate elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `bdi` identifier when creating
/// HTML bidirectional isolate elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// bdi {
///     "User-generated content with possibly different directionality"
/// }
/// ```
public typealias bdi = HTML_Standard.BidirectionalIsolate

/// Lowercase typealias for creating BidirectionalTextOverride elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `bdo` identifier when creating
/// HTML bidirectional text override elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// bdo(dir: .rtl) {
///     "This text will display right-to-left."
/// }
/// ```
public typealias bdo = HTML_Standard.BidirectionalTextOverride

/// Lowercase typealias for creating Big elements with a more HTML-like syntax.
public typealias big = HTML_Standard.Big

/// Lowercase typealias for creating BlockQuote elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `blockquote` identifier when creating
/// HTML block quotation elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// blockquote(cite: "https://www.example.com/source") {
///     p {
///         "This is a block quotation with a citation source."
///     }
/// }
/// ```
public typealias blockquote = HTML_Standard.BlockQuote

/// Lowercase typealias for creating BR elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `br` identifier when creating
/// HTML br elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// p {
///     "First line"
///     br()
///     "Second line"
/// }
/// ```
public typealias br = HTML_Standard.BR

/// Lowercase typealias for creating Button elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `button` identifier when creating
/// HTML button elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// button {
///     "Click me"
/// }
/// ```
public typealias button = HTML_Standard.Button

/// Lowercase typealias for creating Canvas elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `canvas` identifier when creating
/// HTML canvas elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// canvas(width: 300, height: 150) {
///     "Your browser does not support the canvas element."
/// }
/// ```
public typealias canvas = HTML_Standard.Canvas

/// Lowercase typealias for creating Caption elements with a more HTML-like syntax.
public typealias caption = HTML_Standard.Caption

/// Lowercase typealias for creating Center elements with a more HTML-like syntax.
public typealias center = HTML_Standard.Center

/// Lowercase typealias for creating Citation elements with a more HTML-like syntax.
public typealias cite = HTML_Standard.Cite

/// Lowercase typealias for creating Code elements with a more HTML-like syntax.
public typealias code = HTML_Standard.Code

/// Lowercase typealias for creating TableColumn elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `col` identifier when creating
/// HTML column elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// col(span: 2, width: "100px")
/// ```
public typealias col = HTML_Standard.TableColumn

/// Lowercase typealias for creating TableColumnGroup elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `colgroup` identifier when creating
/// HTML column group elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// colgroup(span: 5, class: "weekdays")
/// ```
/// Or:
/// ```swift
/// colgroup {
///   col()
///   col(span: 2)
/// }
/// ```
public typealias colgroup = HTML_Standard.TableColumnGroup

/// Lowercase typealias for creating Data elements with a more HTML-like syntax.
public typealias data = HTML_Standard.Data

/// Lowercase typealias for creating DataList elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `datalist` identifier when creating
/// HTML datalist elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// datalist(id: "browsers") {
///     option(value: "Chrome")
///     option(value: "Firefox")
///     option(value: "Safari")
/// }
/// ```
public typealias datalist = HTML_Standard.DataList

/// Lowercase typealias for creating DescriptionDetails elements with a more HTML-like syntax.
public typealias dd = HTML_Standard.DescriptionDetails

/// Lowercase typealias for creating Del elements with a more HTML-like syntax.
public typealias del = HTML_Standard.Del

/// Lowercase typealias for creating Details elements with a more HTML-like syntax.
public typealias details = HTML_Standard.Details

/// Lowercase typealias for creating Definition elements with a more HTML-like syntax.
public typealias dfn = HTML_Standard.Definition

/// Lowercase typealias for creating Dialog elements with a more HTML-like syntax.
public typealias dialog = HTML_Standard.Dialog

/// Lowercase typealias for creating Directory elements with a more HTML-like syntax.
public typealias dir = HTML_Standard.Directory

/// Lowercase typealias for creating ContentDivision elements with a more HTML-like syntax.
public typealias div = ContentDivision

/// Lowercase typealias for creating Description List elements with a more HTML-like syntax.
public typealias dl = HTML_Standard.DescriptionList

/// Lowercase typealias for creating DescriptionTerm elements with a more HTML-like syntax.
public typealias dt = HTML_Standard.DescriptionTerm

/// Lowercase typealias for creating Emphasis elements with a more HTML-like syntax.
public typealias em = HTML_Standard.Emphasis

/// Lowercase typealias for creating Embed elements with a more HTML-like syntax.
public typealias embed = HTML_Standard.Embed

/// Lowercase typealias for creating FencedFrame elements with a more HTML-like syntax.
public typealias fencedframe = HTML_Standard.FencedFrame

/// Lowercase typealias for creating FieldSet elements with a more HTML-like syntax.
public typealias fieldset = HTML_Standard.FieldSet

/// Lowercase typealias for creating FigureCaption elements with a more HTML-like syntax.
public typealias figcaption = HTML_Standard.FigureCaption

/// Lowercase typealias for creating Figure elements with a more HTML-like syntax.
public typealias figure = HTML_Standard.Figure

/// Lowercase typealias for creating Font elements with a more HTML-like syntax.
public typealias font = HTML_Standard.Font

/// Lowercase typealias for creating Footer elements with a more HTML-like syntax.
public typealias footer = HTML_Standard.Footer

/// Lowercase typealias for creating Form elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `form` identifier when creating
/// HTML form elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// form(name: "login", action: "/login", method: .post) {
///     // Form controls
/// }
/// ```
public typealias form = HTML_Standard.Form

/// Lowercase typealias for creating Frame elements with a more HTML-like syntax.
public typealias frame = HTML_Standard.Frame

/// Lowercase typealias for creating Frameset elements with a more HTML-like syntax.
public typealias frameset = HTML_Standard.Frameset

public typealias h1 = HTML_Standard.H1
public typealias h2 = HTML_Standard.H2
public typealias h3 = HTML_Standard.H3
public typealias h4 = HTML_Standard.H4
public typealias h5 = HTML_Standard.H5
public typealias h6 = HTML_Standard.H6

/// Lowercase typealias for creating Head elements with a more HTML-like syntax.
public typealias head = HTML_Standard.Head

/// Lowercase typealias for creating Header elements with a more HTML-like syntax.
public typealias header = HTML_Standard.Header

/// Lowercase typealias for creating HeadingGroup elements with a more HTML-like syntax.
public typealias hgroup = HTML_Standard.HeadingGroup

/// Lowercase typealias for creating ThematicBreak elements with a more HTML-like syntax.
public typealias hr = HTML_Standard.ThematicBreak

/// Lowercase typealias for creating HtmlRoot elements with a more HTML-like syntax.
public typealias html = HTML_Standard.HtmlRoot

/// Lowercase typealias for creating IdiomaticText elements with a more HTML-like syntax.
public typealias i = HTML_Standard.IdiomaticText

/// Lowercase typealias for creating InlineFrame elements with a more HTML-like syntax.
public typealias iframe = HTML_Standard.InlineFrame

public typealias img = HTML_Standard.Image

/// Lowercase typealias for creating Input elements with a more HTML-like syntax.
/// Example: `input(name: "username", disabled: nil, type: .text(...))`
public typealias input = HTML_Standard.Input

/// Lowercase typealias for creating InsertedText elements with a more HTML-like syntax.
public typealias ins = HTML_Standard.InsertedText

/// Lowercase typealias for creating KeyboardInput elements with a more HTML-like syntax.
public typealias kbd = HTML_Standard.KeyboardInput

/// Lowercase typealias for creating Label elements with a more HTML-like syntax.
///
/// Example: `label(for: "name") { "Your name:" }`
public typealias label = HTML_Standard.Label

/// Lowercase typealias for creating Legend elements with a more HTML-like syntax.
public typealias legend = HTML_Standard.Legend

/// Lowercase typealias for creating ListItem elements with a more HTML-like syntax.
public typealias li = HTML_Standard.ListItem

/// Lowercase typealias for creating Link elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `link` identifier when creating
/// HTML link elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// link(href: "styles.css", rel: "stylesheet")
/// ```
public typealias link = HTML_Standard.Link

/// Lowercase typealias for creating Main elements with a more HTML-like syntax.
public typealias main = HTML_Standard.Main

/// Lowercase typealias for creating Map elements with a more HTML-like syntax.
public typealias map = HTML_Standard.Map

/// Lowercase typealias for creating Mark elements with a more HTML-like syntax.
public typealias mark = HTML_Standard.Mark

/// Lowercase typealias for creating Marquee elements with a more HTML-like syntax.
public typealias marquee = HTML_Standard.Marquee

/// Lowercase typealias for creating Menu elements with a more HTML-like syntax.
public typealias menu = HTML_Standard.Menu

/// Lowercase typealias for creating Meta elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `meta` identifier when creating
/// HTML meta elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// meta(name: .description, content: "Page description")
/// ```
public typealias meta = HTML_Standard.Meta

/// Lowercase typealias for creating Meter elements with a more HTML-like syntax.
public typealias meter = HTML_Standard.Meter

/// Lowercase typealias for creating NavigationSection elements with a more HTML-like syntax.
public typealias nav = HTML_Standard.NavigationSection

/// Lowercase typealias for creating NoBr elements with a more HTML-like syntax.
public typealias nobr = HTML_Standard.NoBr

/// Lowercase typealias for creating EmbedFallback elements with a more HTML-like syntax.
public typealias noembed = HTML_Standard.EmbedFallback

/// Lowercase typealias for creating FrameFallback elements with a more HTML-like syntax.
@available(
    *,
    deprecated,
    message: "The noframes element is obsolete and shouldn't be used in modern web development"
)
public typealias noframes = HTML_Standard.FrameFallback

/// Lowercase typealias for creating Noscript elements with a more HTML-like syntax.
public typealias noscript = HTML_Standard.Noscript

/// Lowercase typealias for creating Object elements with a more HTML-like syntax.
public typealias object = HTML_Standard.ExternalObject

/// Lowercase typealias for creating OrderedList elements with a more HTML-like syntax.
public typealias ol = HTML_Standard.OrderedList

/// Lowercase typealias for creating OptionGroup elements with a more HTML-like syntax.
public typealias optgroup = HTML_Standard.OptionGroup

/// Lowercase typealias for creating Option elements with a more HTML-like syntax.
public typealias option = HTML_Standard.Option

/// Lowercase typealias for creating Output elements with a more HTML-like syntax.
public typealias output = HTML_Standard.Output

/// Lowercase typealias for creating Paragraph elements with a more HTML-like syntax.
public typealias p = HTML_Standard.Paragraph

/// Lowercase typealias for creating Param elements with a more HTML-like syntax.
public typealias param = HTML_Standard.Param

/// Lowercase typealias for creating Picture elements with a more HTML-like syntax.
public typealias picture = HTML_Standard.Picture

/// Lowercase typealias for creating PlainText elements with a more HTML-like syntax.
@available(
    *,
    deprecated,
    message: "The <plaintext> element is deprecated. Use <pre> or <code> instead."
)
public typealias plaintext = HTML_Standard.PlainText

/// Lowercase typealias for creating PreformattedText elements with a more HTML-like syntax.
public typealias pre = HTML_Standard.PreformattedText

/// Lowercase typealias for creating ProgressIndicator elements with a more HTML-like syntax.
public typealias progress = HTML_Standard.ProgressIndicator

/// Lowercase typealias for creating InlineQuotation elements with a more HTML-like syntax.
public typealias q = HTML_Standard.InlineQuotation

/// Lowercase typealias for creating RubyBase elements with a more HTML-like syntax.
public typealias rb = HTML_Standard.RubyBase

/// Lowercase typealias for creating RubyParenthesis elements with a more HTML-like syntax.
public typealias rp = HTML_Standard.RubyParenthesis

/// Lowercase typealias for creating RubyText elements with a more HTML-like syntax.
public typealias rt = HTML_Standard.RubyText

/// Lowercase typealias for creating RubyTextContainer elements with a more HTML-like syntax.
public typealias rtc = HTML_Standard.RubyTextContainer

/// Lowercase typealias for creating Ruby elements with a more HTML-like syntax.
public typealias ruby = HTML_Standard.Ruby

/// Lowercase typealias for creating Strikethrough elements with a more HTML-like syntax.
public typealias s = HTML_Standard.Strikethrough

/// Lowercase typealias for creating Sample Output elements with a more HTML-like syntax.
public typealias samp = HTML_Standard.Samp

/// Lowercase typealias for creating Script elements with a more HTML-like syntax.
public typealias script = HTML_Standard.Script

/// Lowercase typealias for creating Search elements with a more HTML-like syntax.
public typealias search = HTML_Standard.Search

/// Lowercase typealias for creating Section elements with a more HTML-like syntax.
public typealias section = HTML_Standard.Section

/// Lowercase typealias for creating Select elements with a more HTML-like syntax.
public typealias select = HTML_Standard.Select

/// Lowercase typealias for creating WebComponentSlot elements with a more HTML-like syntax.
public typealias slot = HTML_Standard.WebComponentSlot

/// Lowercase typealias for creating Small elements with a more HTML-like syntax.
public typealias small = HTML_Standard.Small

/// Lowercase typealias for creating Source elements with a more HTML-like syntax.
public typealias source = HTML_Standard.Source

/// Lowercase typealias for creating span elements with a more HTML-like syntax.
public typealias span = HTML_Standard.ContentSpan

/// Lowercase typealias for creating Strike elements with a more HTML-like syntax.
public typealias strike = HTML_Standard.Strike

/// Lowercase typealias for creating StrongImportance elements with a more HTML-like syntax.
public typealias strong = HTML_Standard.StrongImportance

/// Lowercase typealias for creating Style elements with a more HTML-like syntax.
public typealias style = HTML_Standard.Style

/// Lowercase typealias for creating Subscript elements with a more HTML-like syntax.
public typealias sub = HTML_Standard.Subscript

/// Lowercase typealias for creating DisclosureSummary elements with a more HTML-like syntax.
public typealias summary = HTML_Standard.DisclosureSummary

/// Lowercase typealias for creating Superscript elements with a more HTML-like syntax.
public typealias sup = HTML_Standard.Superscript

/// Lowercase typealias for creating Table elements with a more HTML-like syntax.
public typealias table = HTML_Standard.Table

/// Lowercase typealias for creating TableBody elements with a more HTML-like syntax.
public typealias tbody = HTML_Standard.TableBody

/// Lowercase typealias for creating TableDataCell elements with a more HTML-like syntax.
public typealias td = HTML_Standard.TableDataCell

/// Lowercase typealias for creating ContentTemplate elements with a more HTML-like syntax.
public typealias template = HTML_Standard.ContentTemplate

/// Lowercase typealias for creating Textarea elements with a more HTML-like syntax.
public typealias textarea = HTML_Standard.Textarea

/// Lowercase typealias for creating TableFoot elements with a more HTML-like syntax.
public typealias tfoot = HTML_Standard.TableFoot

/// Lowercase typealias for creating TableHeader elements with a more HTML-like syntax.
public typealias th = HTML_Standard.TableHeader

/// Lowercase typealias for creating TableHead elements with a more HTML-like syntax.
public typealias thead = HTML_Standard.TableHead

/// Lowercase typealias for creating Time elements with a more HTML-like syntax.
public typealias time = HTML_Standard.Time

/// Lowercase typealias for creating Title elements with a more HTML-like syntax.
public typealias title = HTML_Standard.Title

/// Lowercase typealias for creating TableRow elements with a more HTML-like syntax.
public typealias tr = HTML_Standard.TableRow

/// Lowercase typealias for creating Track elements with a more HTML-like syntax.
public typealias track = HTML_Standard.Track

/// Lowercase typealias for creating TeletypeText elements with a more HTML-like syntax.
public typealias tt = HTML_Standard.TeletypeText

/// Lowercase typealias for creating UnarticulatedAnnotation elements with a more HTML-like syntax.
public typealias u = HTML_Standard.UnarticulatedAnnotation

/// Alternative lowercase typealias for creating UnarticulatedAnnotation elements.
public typealias underline = HTML_Standard.UnarticulatedAnnotation

/// Lowercase typealias for creating UnorderedList elements with a more HTML-like syntax.
public typealias ul = HTML_Standard.UnorderedList

/// Lowercase typealias for creating Variable elements with a more HTML-like syntax.
/// Note: Backticks are required since `var` is a reserved keyword in Swift.
public typealias `var` = HTML_Standard.Variable

/// Lowercase typealias for creating Video elements with a more HTML-like syntax.
public typealias video = HTML_Standard.Video

/// Lowercase typealias for creating LineBreakOpportunity elements with a more HTML-like syntax.
public typealias wbr = HTML_Standard.LineBreakOpportunity
