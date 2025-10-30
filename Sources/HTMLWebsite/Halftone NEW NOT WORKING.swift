////
////  File.swift
////  coenttb-web
////
////  Created by Coen ten Thije Boonkkamp on 01/09/2024.
////
//
// import Foundation
// import HTML
// import Dependencies
//
// public struct Halftone3<Image: HTML>: HTML {
//    let grayscale: String
//    let dotSize: LengthPercentage
//    let lineColor: HTMLColor
//    let lineContrast: Int
//    let photoBrightness: Int
//    let photoContrast: Int
//    let photoBlur: CSSPropertyTypes.Length
//    let blendMode: CSSPropertyTypes.MixBlendMode
//    let rotation: CSSPropertyTypes.Angle
//    let image: Image
//    let imageConfig: (Image) -> any HTML = { $0 }
//
//    @Dependency(\.objectStyle.position) var objectPosition
//
//    public var body: some HTML {
//        div {
//            div {
//                AnyHTML(imageConfig(image))
//                    .position(.absolute)
//                    .top(0)
//                    .left(0)
//                    .width(.percentage(100))
//                    .height(.percentage(100))
//                    .objectFit(.cover)
//                    .mixBlendMode(blendMode)
//                    .inlineStyle("filter", """
//                        grayscale(\(grayscale))
//                        brightness(\(photoBrightness)%)
//                        contrast(\(photoContrast)%)
//                        blur(\(photoBlur.description))
//                    """)
//            }
//            .position(
//                .absolute,
//                top: .zero,
//                right: .zero,
//                bottom: .zero,
//                left: .zero
//            )
//            .inlineStyle("filter", "contrast(\(lineContrast)%)")
//            .overflow(.hidden)
//            .inlineStyle("content", "''", pseudo: .before)
//            .position(
//                .absolute,
//                top: .percent(-50),
//                right: .percent(-50),
//                bottom: .percent(-50),
//                left: .percent(-50),
//                pseudo: .before
//            )
//            .inlineStyle("background", "radial-gradient(circle at center, \(lineColor.light.description), \(lineColor.dark.description))", pseudo: .before)
//            .backgroundSize(.size(dotSize, dotSize), pseudo: .before)
//            .transform(.rotate(rotation), pseudo: .before)
//
//        }
//    }
// }
//
//
// extension HTML {
//    @discardableResult
//    public func position(
//        _ value: CSSPropertyTypes.Position?,
//        top: Top?,
//        right: Right?,
//        bottom: Bottom?,
//        left: Left?,
//        media : CSSAtRuleTypes.Media? = nil,
//        pre: String? = nil,
//        pseudo: Pseudo? = nil
//    ) -> some HTML {
//        self
//            .position(value, media: media, pre: pre, pseudo: pseudo)
//            .top(top, media: media, pre: pre, pseudo: pseudo)
//            .left(left, media: media, pre: pre, pseudo: pseudo)
//            .right(right, media: media, pre: pre, pseudo: pseudo)
//            .bottom(bottom, media: media, pre: pre, pseudo: pseudo)
//    }
// }
//
// extension HTML {
//    public func halftone3(
//        grayscale: String = "0",
//        dotSize: LengthPercentage = .em(0.3),
//        lineColor: HTMLColor = .offBlack.withDarkColor(.offWhite),
//        lineContrast: Int = 2000,
//        photoBrightness: Int = 100,
//        photoContrast: Int = 100,
//        photoBlur: CSSPropertyTypes.Length = .px(1),
//        blendMode: CSSPropertyTypes.MixBlendMode = .hardLight,
//        rotation: CSSPropertyTypes.Angle = 20
//    ) -> some HTML {
//        Halftone3(
//            grayscale: grayscale,
//            dotSize: dotSize,
//            lineColor: lineColor,
//            lineContrast: lineContrast,
//            photoBrightness: photoBrightness,
//            photoContrast: photoContrast,
//            photoBlur: photoBlur,
//            blendMode: blendMode,
//            rotation: rotation,
//            image: self
//        )
//    }
// }
//
// #if DEBUG && canImport(SwiftUI)
// import SwiftUI
// #Preview {
//    VStack {
//        HTMLDocument {
//            div {
//                // Empty div with background styling
//            }
//            .width(.px(300))
//            .height(.px(300))
//            .inlineStyle("background", "linear-gradient(45deg, #ff6b6b, #4ecdc4)")
//            .halftone3(
//    //            dotSize: .px(4),
//    //            lineColor: .black
//            )
//        }
//
//        HTMLDocument {
//            HTMLText(
//                try! String(
//                    HTMLDocument {
//                        div {
//                            // Empty div with background styling
//                        }
//                        .width(.px(300))
//                        .height(.px(300))
//                        .inlineStyle("background", "linear-gradient(45deg, #ff6b6b, #4ecdc4)")
//                        .halftone3()
//                    }
//                )
//            )
//        }
//    }.frame(height: 800)
// }
//
//
// #endif
