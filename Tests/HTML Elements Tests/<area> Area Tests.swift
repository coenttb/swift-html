import Foundation
import Testing
import HTML_Attributes
import HTML_Elements
import PointFreeHTML
import InlineSnapshotTesting

@Suite(
    "Area Element Tests"
)
struct AreaTests {
    
    @Test("Create basic area with shape, coords, href, and alt")
    func createBasicArea() {
        let a = Area(
            shape: .circle(coords: "75,75,75"),
            href: "page.html",
            alt: "Go to page"
        )
        
        #expect(a.shape == .circle(coords: "75,75,75"))
        #expect(a.href == "page.html")
        #expect(a.alt == "Go to page")
    }
    
    @Test("Create area with additional attributes")
    func createAreaWithAttributes() {
        let a = Area(
            shape: .rect(coords: "0,0,100,100"),
            alt: "Download file",
            href: "file.pdf",
            download: Download(true),
            target: .blank
        )
        
        #expect(a.shape == .rect(coords: "0,0,100,100"))
        #expect(a.href == "file.pdf")
        #expect(a.alt == "Download file")
        #expect(a.download?.shouldInclude == true)
        #expect(a.target == .blank)
    }
    
    @Test("Create area with referrer policy")
    func createAreaWithReferrerPolicy() {
        let a = Area(
            shape: .poly(coords: "0,0,100,0,50,50"),
            alt: "Go to page",
            href: "page.html",
            referrerpolicy: .noReferrer
        )
        
        #expect(a.shape == .poly(coords: "0,0,100,0,50,50"))
        #expect(a.href == "page.html")
        #expect(a.alt == "Go to page")
        #expect(a.referrerpolicy == .noReferrer)
    }
    
    @Test("Create area with lowercase typealias")
    func createAreaWithLowercaseTypealias() {
        let a = area(
            shape: .default,
            alt: "Default area",
            href: "default.html",
        )
        
        #expect(a.shape == .default)
        #expect(a.coords == nil)
        #expect(a.href == "default.html")
        #expect(a.alt == "Default area")
    }
    
//    @Test("Create rectangular area with convenience method")
//    func createRectangleWithConvenienceMethod() {
//        let a = Area.rectangle(
//            x1: 10, y1: 20, x2: 110, y2: 120,
//            href: "rect.html",
//            alt: "Rectangle area"
//        )
//        
//        #expect(a.shape == .rect)
//        #expect(a.coords == "10,20,110,120")
//        #expect(a.href == "rect.html")
//        #expect(a.alt == "Rectangle area")
//    }
//    
//    @Test("Create circular area with convenience method")
//    func createCircleWithConvenienceMethod() {
//        let a = Area.circle(
//            x: 100, y: 100, radius: 50,
//            href: "circle.html",
//            alt: "Circle area"
//        )
//        
//        #expect(a.shape == .circle)
//        #expect(a.coords == "100,100,50")
//        #expect(a.href == "circle.html")
//        #expect(a.alt == "Circle area")
//    }
//    
//    @Test("Create polygon area with convenience method")
//    func createPolygonWithConvenienceMethod() {
//        let points = [(0, 0), (100, 0), (50, 100)]
//        let a = Area.polygon(
//            points: points,
//            href: "poly.html",
//            alt: "Polygon area"
//        )
//        
//        #expect(a.shape == .poly)
//        #expect(a.coords == "0,0,100,0,50,100")
//        #expect(a.href == "poly.html")
//        #expect(a.alt == "Polygon area")
//    }
//    
//    @Test("Create default area with convenience method")
//    func createDefaultWithConvenienceMethod() {
//        let a = Area.defaultArea(
//            href: "default.html",
//            alt: "Default area"
//        )
//        
//        #expect(a.shape == .default)
//        #expect(a.coords == nil)
//        #expect(a.href == "default.html")
//        #expect(a.alt == "Default area")
//    }
//    
    @Test("Test target values")
    func testTargetValues() {
        let selfTarget = Area.Target.`self`
        let blankTarget = Area.Target.blank
        let parentTarget = Area.Target.parent
        let topTarget = Area.Target.top
        let customTarget = "frame1"
        
        #expect(selfTarget.description == "_self")
        #expect(blankTarget.description == "_blank")
        #expect(parentTarget.description == "_parent")
        #expect(topTarget.description == "_top")
        #expect(customTarget.description == "frame1")
    }
}
