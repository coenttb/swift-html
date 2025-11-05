import HTMLCSSPointFreeHTML

//
//  File.swift
//  swift-html-types
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
public typealias a = HTMLElementTypes.Anchor

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
public typealias abbr = HTMLElementTypes.Abbreviation

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
public typealias address = HTMLElementTypes.Address

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
public typealias area = HTMLElementTypes.Area

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
public typealias article = HTMLElementTypes.Article

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
public typealias aside = HTMLElementTypes.Aside

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
public typealias audio = HTMLElementTypes.Audio

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
public typealias b = HTMLElementTypes.B

/// Lowercase typealias for creating Base elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `base` identifier when creating
/// HTML base elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// base(href: "https://example.com/")
/// ```
public typealias base = HTMLElementTypes.Base

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
public typealias body = HTMLElementTypes.Body

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
public typealias bdi = HTMLElementTypes.BidirectionalIsolate

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
public typealias bdo = HTMLElementTypes.BidirectionalTextOverride

/// Lowercase typealias for creating Big elements with a more HTML-like syntax.
public typealias big = HTMLElementTypes.Big

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
public typealias blockquote = HTMLElementTypes.BlockQuote

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
public typealias br = HTMLElementTypes.BR

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
public typealias button = HTMLElementTypes.Button

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
public typealias canvas = HTMLElementTypes.Canvas

/// Lowercase typealias for creating Caption elements with a more HTML-like syntax.
public typealias caption = HTMLElementTypes.Caption

/// Lowercase typealias for creating Center elements with a more HTML-like syntax.
public typealias center = HTMLElementTypes.Center

/// Lowercase typealias for creating Citation elements with a more HTML-like syntax.
public typealias cite = HTMLElementTypes.Cite

/// Lowercase typealias for creating Code elements with a more HTML-like syntax.
public typealias code = HTMLElementTypes.Code

/// Lowercase typealias for creating TableColumn elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `col` identifier when creating
/// HTML column elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// col(span: 2, width: "100px")
/// ```
public typealias col = HTMLElementTypes.TableColumn

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
public typealias colgroup = HTMLElementTypes.TableColumnGroup

/// Lowercase typealias for creating Data elements with a more HTML-like syntax.
public typealias data = HTMLElementTypes.Data

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
public typealias datalist = HTMLElementTypes.DataList

/// Lowercase typealias for creating DescriptionDetails elements with a more HTML-like syntax.
public typealias dd = HTMLElementTypes.DescriptionDetails

/// Lowercase typealias for creating Del elements with a more HTML-like syntax.
public typealias del = HTMLElementTypes.Del

/// Lowercase typealias for creating Details elements with a more HTML-like syntax.
public typealias details = HTMLElementTypes.Details

/// Lowercase typealias for creating Definition elements with a more HTML-like syntax.
public typealias dfn = HTMLElementTypes.Definition

/// Lowercase typealias for creating Dialog elements with a more HTML-like syntax.
public typealias dialog = HTMLElementTypes.Dialog

/// Lowercase typealias for creating Directory elements with a more HTML-like syntax.
public typealias dir = HTMLElementTypes.Directory

/// Lowercase typealias for creating ContentDivision elements with a more HTML-like syntax.
public typealias div = HTMLElementTypes.ContentDivision

/// Lowercase typealias for creating Description List elements with a more HTML-like syntax.
public typealias dl = HTMLElementTypes.DescriptionList

/// Lowercase typealias for creating DescriptionTerm elements with a more HTML-like syntax.
public typealias dt = HTMLElementTypes.DescriptionTerm

/// Lowercase typealias for creating Emphasis elements with a more HTML-like syntax.
public typealias em = HTMLElementTypes.Emphasis

/// Lowercase typealias for creating Embed elements with a more HTML-like syntax.
public typealias embed = HTMLElementTypes.Embed

/// Lowercase typealias for creating FencedFrame elements with a more HTML-like syntax.
public typealias fencedframe = HTMLElementTypes.FencedFrame

/// Lowercase typealias for creating FieldSet elements with a more HTML-like syntax.
public typealias fieldset = HTMLElementTypes.FieldSet

/// Lowercase typealias for creating FigureCaption elements with a more HTML-like syntax.
public typealias figcaption = HTMLElementTypes.FigureCaption

/// Lowercase typealias for creating Figure elements with a more HTML-like syntax.
public typealias figure = HTMLElementTypes.Figure

/// Lowercase typealias for creating Font elements with a more HTML-like syntax.
public typealias font = HTMLElementTypes.Font

/// Lowercase typealias for creating Footer elements with a more HTML-like syntax.
public typealias footer = HTMLElementTypes.Footer

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
public typealias form = HTMLElementTypes.Form

/// Lowercase typealias for creating Frame elements with a more HTML-like syntax.
public typealias frame = HTMLElementTypes.Frame

/// Lowercase typealias for creating Frameset elements with a more HTML-like syntax.
public typealias frameset = HTMLElementTypes.Frameset

public typealias h1 = HTMLElementTypes.H1
public typealias h2 = HTMLElementTypes.H2
public typealias h3 = HTMLElementTypes.H3
public typealias h4 = HTMLElementTypes.H4
public typealias h5 = HTMLElementTypes.H5
public typealias h6 = HTMLElementTypes.H6

/// Lowercase typealias for creating Head elements with a more HTML-like syntax.
public typealias head = HTMLElementTypes.Head

/// Lowercase typealias for creating Header elements with a more HTML-like syntax.
public typealias header = HTMLElementTypes.Header

/// Lowercase typealias for creating HeadingGroup elements with a more HTML-like syntax.
public typealias hgroup = HTMLElementTypes.HeadingGroup

/// Lowercase typealias for creating ThematicBreak elements with a more HTML-like syntax.
public typealias hr = HTMLElementTypes.ThematicBreak

/// Lowercase typealias for creating HtmlRoot elements with a more HTML-like syntax.
public typealias html = HTMLElementTypes.HtmlRoot

/// Lowercase typealias for creating IdiomaticText elements with a more HTML-like syntax.
public typealias i = HTMLElementTypes.IdiomaticText

/// Lowercase typealias for creating InlineFrame elements with a more HTML-like syntax.
public typealias iframe = HTMLElementTypes.InlineFrame

public typealias img = HTMLElementTypes.Image

/// Lowercase typealias for creating Input elements with a more HTML-like syntax.
/// Example: `input(name: "username", disabled: nil, type: .text(...))`
public typealias input = HTMLElementTypes.Input

/// Lowercase typealias for creating InsertedText elements with a more HTML-like syntax.
public typealias ins = HTMLElementTypes.InsertedText

/// Lowercase typealias for creating KeyboardInput elements with a more HTML-like syntax.
public typealias kbd = HTMLElementTypes.KeyboardInput

/// Lowercase typealias for creating Label elements with a more HTML-like syntax.
///
/// Example: `label(for: "name") { "Your name:" }`
public typealias label = HTMLElementTypes.Label

/// Lowercase typealias for creating Legend elements with a more HTML-like syntax.
public typealias legend = HTMLElementTypes.Legend

/// Lowercase typealias for creating ListItem elements with a more HTML-like syntax.
public typealias li = HTMLElementTypes.ListItem

/// Lowercase typealias for creating Link elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `link` identifier when creating
/// HTML link elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// link(href: "styles.css", rel: "stylesheet")
/// ```
public typealias link = HTMLElementTypes.Link

/// Lowercase typealias for creating Main elements with a more HTML-like syntax.
public typealias main = HTMLElementTypes.Main

/// Lowercase typealias for creating Map elements with a more HTML-like syntax.
public typealias map = HTMLElementTypes.Map

/// Lowercase typealias for creating Mark elements with a more HTML-like syntax.
public typealias mark = HTMLElementTypes.Mark

/// Lowercase typealias for creating Marquee elements with a more HTML-like syntax.
public typealias marquee = HTMLElementTypes.Marquee

/// Lowercase typealias for creating Menu elements with a more HTML-like syntax.
public typealias menu = HTMLElementTypes.Menu

/// Lowercase typealias for creating Meta elements with a more HTML-like syntax.
///
/// This typealias allows you to use the lowercase `meta` identifier when creating
/// HTML meta elements, which more closely matches HTML syntax.
///
/// Example:
/// ```swift
/// meta(name: .description, content: "Page description")
/// ```
public typealias meta = HTMLElementTypes.Meta

/// Lowercase typealias for creating Meter elements with a more HTML-like syntax.
public typealias meter = HTMLElementTypes.Meter

/// Lowercase typealias for creating NavigationSection elements with a more HTML-like syntax.
public typealias nav = HTMLElementTypes.NavigationSection

/// Lowercase typealias for creating NoBr elements with a more HTML-like syntax.
public typealias nobr = HTMLElementTypes.NoBr

/// Lowercase typealias for creating EmbedFallback elements with a more HTML-like syntax.
public typealias noembed = HTMLElementTypes.EmbedFallback

/// Lowercase typealias for creating FrameFallback elements with a more HTML-like syntax.
@available(
    *,
    deprecated,
    message: "The noframes element is obsolete and shouldn't be used in modern web development"
)
public typealias noframes = HTMLElementTypes.FrameFallback

/// Lowercase typealias for creating Noscript elements with a more HTML-like syntax.
public typealias noscript = HTMLElementTypes.Noscript

/// Lowercase typealias for creating Object elements with a more HTML-like syntax.
public typealias object = HTMLElementTypes.ExternalObject

/// Lowercase typealias for creating OrderedList elements with a more HTML-like syntax.
public typealias ol = HTMLElementTypes.OrderedList

/// Lowercase typealias for creating OptionGroup elements with a more HTML-like syntax.
public typealias optgroup = HTMLElementTypes.OptionGroup

/// Lowercase typealias for creating Option elements with a more HTML-like syntax.
public typealias option = HTMLElementTypes.Option

/// Lowercase typealias for creating Output elements with a more HTML-like syntax.
public typealias output = HTMLElementTypes.Output

/// Lowercase typealias for creating Paragraph elements with a more HTML-like syntax.
public typealias p = HTMLElementTypes.Paragraph

/// Lowercase typealias for creating Param elements with a more HTML-like syntax.
public typealias param = HTMLElementTypes.Param

/// Lowercase typealias for creating Picture elements with a more HTML-like syntax.
public typealias picture = HTMLElementTypes.Picture

/// Lowercase typealias for creating PlainText elements with a more HTML-like syntax.
@available(
    *,
    deprecated,
    message: "The <plaintext> element is deprecated. Use <pre> or <code> instead."
)
public typealias plaintext = HTMLElementTypes.PlainText

/// Lowercase typealias for creating PreformattedText elements with a more HTML-like syntax.
public typealias pre = HTMLElementTypes.PreformattedText

/// Lowercase typealias for creating ProgressIndicator elements with a more HTML-like syntax.
public typealias progress = HTMLElementTypes.ProgressIndicator

/// Lowercase typealias for creating InlineQuotation elements with a more HTML-like syntax.
public typealias q = HTMLElementTypes.InlineQuotation

/// Lowercase typealias for creating RubyBase elements with a more HTML-like syntax.
public typealias rb = HTMLElementTypes.RubyBase

/// Lowercase typealias for creating RubyParenthesis elements with a more HTML-like syntax.
public typealias rp = HTMLElementTypes.RubyParenthesis

/// Lowercase typealias for creating RubyText elements with a more HTML-like syntax.
public typealias rt = HTMLElementTypes.RubyText

/// Lowercase typealias for creating RubyTextContainer elements with a more HTML-like syntax.
public typealias rtc = HTMLElementTypes.RubyTextContainer

/// Lowercase typealias for creating Ruby elements with a more HTML-like syntax.
public typealias ruby = HTMLElementTypes.Ruby

/// Lowercase typealias for creating Strikethrough elements with a more HTML-like syntax.
public typealias s = HTMLElementTypes.Strikethrough

/// Lowercase typealias for creating Sample Output elements with a more HTML-like syntax.
public typealias samp = HTMLElementTypes.Samp

/// Lowercase typealias for creating Script elements with a more HTML-like syntax.
public typealias script = HTMLElementTypes.Script

/// Lowercase typealias for creating Search elements with a more HTML-like syntax.
public typealias search = HTMLElementTypes.Search

/// Lowercase typealias for creating Section elements with a more HTML-like syntax.
public typealias section = HTMLElementTypes.Section

/// Lowercase typealias for creating Select elements with a more HTML-like syntax.
public typealias select = HTMLElementTypes.Select

/// Lowercase typealias for creating WebComponentSlot elements with a more HTML-like syntax.
public typealias slot = HTMLElementTypes.WebComponentSlot

/// Lowercase typealias for creating Small elements with a more HTML-like syntax.
public typealias small = HTMLElementTypes.Small

/// Lowercase typealias for creating Source elements with a more HTML-like syntax.
public typealias source = HTMLElementTypes.Source

/// Lowercase typealias for creating span elements with a more HTML-like syntax.
public typealias span = HTMLElementTypes.ContentSpan

/// Lowercase typealias for creating Strike elements with a more HTML-like syntax.
public typealias strike = HTMLElementTypes.Strike

/// Lowercase typealias for creating StrongImportance elements with a more HTML-like syntax.
public typealias strong = HTMLElementTypes.StrongImportance

/// Lowercase typealias for creating Style elements with a more HTML-like syntax.
public typealias style = HTMLElementTypes.Style

/// Lowercase typealias for creating Subscript elements with a more HTML-like syntax.
public typealias sub = HTMLElementTypes.Subscript

/// Lowercase typealias for creating DisclosureSummary elements with a more HTML-like syntax.
public typealias summary = HTMLElementTypes.DisclosureSummary

/// Lowercase typealias for creating Superscript elements with a more HTML-like syntax.
public typealias sup = HTMLElementTypes.Superscript

/// Lowercase typealias for creating Table elements with a more HTML-like syntax.
public typealias table = HTMLElementTypes.Table

/// Lowercase typealias for creating TableBody elements with a more HTML-like syntax.
public typealias tbody = HTMLElementTypes.TableBody

/// Lowercase typealias for creating TableDataCell elements with a more HTML-like syntax.
public typealias td = HTMLElementTypes.TableDataCell

/// Lowercase typealias for creating ContentTemplate elements with a more HTML-like syntax.
public typealias template = HTMLElementTypes.ContentTemplate

/// Lowercase typealias for creating Textarea elements with a more HTML-like syntax.
public typealias textarea = HTMLElementTypes.Textarea

/// Lowercase typealias for creating TableFoot elements with a more HTML-like syntax.
public typealias tfoot = HTMLElementTypes.TableFoot

/// Lowercase typealias for creating TableHeader elements with a more HTML-like syntax.
public typealias th = HTMLElementTypes.TableHeader

/// Lowercase typealias for creating TableHead elements with a more HTML-like syntax.
public typealias thead = HTMLElementTypes.TableHead

/// Lowercase typealias for creating Time elements with a more HTML-like syntax.
public typealias time = HTMLElementTypes.Time

/// Lowercase typealias for creating Title elements with a more HTML-like syntax.
public typealias title = HTMLElementTypes.Title

/// Lowercase typealias for creating TableRow elements with a more HTML-like syntax.
public typealias tr = HTMLElementTypes.TableRow

/// Lowercase typealias for creating Track elements with a more HTML-like syntax.
public typealias track = HTMLElementTypes.Track

/// Lowercase typealias for creating TeletypeText elements with a more HTML-like syntax.
public typealias tt = HTMLElementTypes.TeletypeText

/// Lowercase typealias for creating UnarticulatedAnnotation elements with a more HTML-like syntax.
public typealias u = HTMLElementTypes.UnarticulatedAnnotation

/// Alternative lowercase typealias for creating UnarticulatedAnnotation elements.
public typealias underline = HTMLElementTypes.UnarticulatedAnnotation

/// Lowercase typealias for creating UnorderedList elements with a more HTML-like syntax.
public typealias ul = HTMLElementTypes.UnorderedList

/// Lowercase typealias for creating Variable elements with a more HTML-like syntax.
/// Note: Backticks are required since `var` is a reserved keyword in Swift.
public typealias `var` = HTMLElementTypes.Variable

/// Lowercase typealias for creating Video elements with a more HTML-like syntax.
public typealias video = HTMLElementTypes.Video

/// Lowercase typealias for creating LineBreakOpportunity elements with a more HTML-like syntax.
public typealias wbr = HTMLElementTypes.LineBreakOpportunity
