//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 01/09/2024.
//

import Dependencies
import Foundation
import HTML

public struct Halftone<Image: HTML>: HTML {
  let grayscale: String
  let dotSize: Length
  let lineColor: HTMLColor
  let lineContrast: Int
  let photoBrightness: Int
  let photoContrast: Int
  let photoBlur: Length
  let blendMode: MixBlendMode
  let rotationAngle: Int
  let image: Image

  @Dependency(\.objectStyle.position) var objectPosition

  public var body: some HTML {
    div {
      div {
        image
          .objectPosition(objectPosition)
          .position(.absolute)
          .top(0)
          .left(0)
          .width(.percent(100))
          .height(.percent(100))
          .objectFit(.cover)
          .mixBlendMode(blendMode)
          .inlineStyle(
            "filter",
            """
                grayscale(\(grayscale))
                brightness(\(photoBrightness)%)
                contrast(\(photoContrast)%)
                blur(\(photoBlur.description))
            """
          )
      }
      .position(
        .absolute,
        top: .zero,
        right: .zero,
        bottom: .zero,
        left: .zero
      )
      .position(.absolute)
      .top(.zero)
      .right(.zero)
      .bottom(.zero)
      .left(.zero)
      .inlineStyle("filter", "contrast(\(lineContrast)%)")
      .overflow(.hidden)
      .inlineStyle("content", "''", pseudo: .before)
      .position(
        .absolute,
        top: .percent(-50),
        right: .percent(-50),
        bottom: .percent(-50),
        left: .percent(-50),
        pseudo: .before
      )
      .inlineStyle(
        "background",
        "radial-gradient(circle at center, \(lineColor.light.description), \(lineColor.dark.description))",
        pseudo: .before
      )
      .inlineStyle(
        "background-size",
        "\(dotSize.description) \(dotSize.description)",
        pseudo: .before
      )
      .transform("rotate(\(rotationAngle)deg)", pseudo: .before)

    }
  }
}

extension HTML {
  public func halftone(
    grayscale: String = "0",
    dotSize: Length = .em(0.3),
    lineColor: HTMLColor = .offBlack.withDarkColor(.offWhite),
    lineContrast: Int = 2000,
    photoBrightness: Int = 100,
    photoContrast: Int = 100,
    photoBlur: Length = .px(1),
    blendMode: MixBlendMode = .hardLight,
    rotationAngle: Int = 20
  ) -> some HTML {
    Halftone(
      grayscale: grayscale,
      dotSize: dotSize,
      lineColor: lineColor,
      lineContrast: lineContrast,
      photoBrightness: photoBrightness,
      photoContrast: photoContrast,
      photoBlur: photoBlur,
      blendMode: blendMode,
      rotationAngle: rotationAngle,
      image: self
    )
  }
}

// Unsure whether this should be added.
private enum ObjectStyleKey: DependencyKey {
  static let liveValue = ObjectStyle(position: .inherit)
  static let testValue = ObjectStyle(position: .inherit)
}

extension DependencyValues {
  public var objectStyle: ObjectStyle {
    get { self[ObjectStyleKey.self] }
    set { self[ObjectStyleKey.self] = newValue }
  }
}

#if DEBUG && canImport(SwiftUI)
  import SwiftUI
  #Preview {
    HTMLDocument {
      div {
        // Empty div with background styling
      }
      .width(.px(300))
      .height(.px(300))
      .inlineStyle("background", "linear-gradient(45deg, #ff6b6b, #4ecdc4)")
      .halftone(  //            dotSize: .px(4),
        //            lineColor: .black
        )
    }
  }

  #Preview {
    HTMLDocument {
      HTMLText(
        try! String(
          HTMLDocument {
            div {
              // Empty div with background styling
            }
            .halftone()
            .width(.px(300))
            .height(.px(300))
            .inlineStyle("background", "linear-gradient(45deg, #ff6b6b, #4ecdc4)")
          }
        )
      )
    }
  }
#endif

// EXAMPLE FOR GENERATING BLOG POST CARD IMAGE
// PageModule(theme: .content) {
//    div {
//        div {
//            div {
//                Image.prehalftone
//                    .inlineStyle("filter", "sepia(0.8) hue-rotate(-260deg) saturate(2) brightness(1.15) contrast(1.2)")
//                    .halftone(
//                        lineColor: .black.withDarkColor(.white),
//                        lineContrast: 1500,
//                        photoBrightness: 90,
//                        photoContrast: 110,
//                        photoBlur: .px(0.5),
//                        blendMode: .overlay,
//                        rotationAngle: 15
//                    )
//            }
//            .overflow(.hidden)
//        }
//        .height(.px(300))
//        .width(.px(384))
//    }
//    .position(.relative)
// }
