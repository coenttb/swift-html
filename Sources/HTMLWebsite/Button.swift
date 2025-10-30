//
//  File.swift
//  coenttb-com-server
//
//  Created by Coen ten Thije Boonkkamp on 14/07/2025.
//

import Dependencies
import Foundation
import HTML
import HTMLComponents

// MARK: - Updated Button Struct
public struct Button<Label: HTML, Icon: HTML>: HTML {
  let button: HTMLElementTypes.Button
  let label: Label
  let icon: Icon?
  let style: ButtonStyle

  public init(
    button: HTMLElementTypes.Button = .init(),
    style: ButtonStyle = .default,
    @HTMLBuilder label: () -> Label,
    @HTMLBuilder icon: () -> Icon
  ) {
    self.button = button
    self.icon = icon()
    self.label = label()
    self.style = style
  }

  public init(
    button: HTMLElementTypes.Button = .init(),
    style: ButtonStyle = .default,
    @HTMLBuilder label: () -> Label
  ) where Icon == HTMLEmpty {
    self.button = button
    self.icon = HTMLEmpty()
    self.label = label()
    self.style = style
  }

  @Dependency(\.theme.text.button) var textColor
  @Dependency(\.theme.background.button) var background

  public var body: some HTML {
    return HTMLElementTypes.Button {
      HTMLGroup {
        if let icon = icon {
          LabelTypealias {
            span { icon }
              .color(textColor)
          } title: {
            span { label }
              .color(textColor)
          }
        } else {
          span { label }
            .color(textColor)
        }
      }
    }
    .buttonStyle(
      background: background,
      style: style
    )
  }
}

// MARK: - Button Style
public struct ButtonStyle: Equatable {
  public let cornerRadius: LengthPercentage
  public let verticalPadding: LengthPercentage
  public let horizontalPadding: LengthPercentage

  public init(
    cornerRadius: LengthPercentage = .rem(0.5),
    verticalPadding: LengthPercentage = .rem(0.75),
    horizontalPadding: LengthPercentage = .rem(1)
  ) {
    self.cornerRadius = cornerRadius
    self.verticalPadding = verticalPadding
    self.horizontalPadding = horizontalPadding
  }

  public static var `default`: Self { primary }

  public static var primary: Self {
    ButtonStyle(
      cornerRadius: .rem(0.25),
      verticalPadding: .rem(0.80),
      horizontalPadding: .rem(1.6)
    )
  }

  public static var secondary: Self {
    ButtonStyle(
      cornerRadius: .rem(0.25),
      verticalPadding: .rem(0.6),
      horizontalPadding: .rem(0.9)
    )
  }

  public static var tertiary: Self {
    ButtonStyle(
      cornerRadius: .rem(0.25),
      verticalPadding: .rem(0.2),
      horizontalPadding: .rem(0.3)
    )
  }

  public static var round: Self {
    ButtonStyle(
      cornerRadius: .percentage(100),
      verticalPadding: .rem(0.5),
      horizontalPadding: .rem(0.5)
    )
  }
}

// MARK: - HTML Protocol Extension
extension HTML {
  public func buttonStyle(
    background: HTMLColor,
    style: ButtonStyle = .default
  ) -> some HTML {

    //        let borderColor: HTMLColor? = {
    //            switch style {
    //            case .primary, .secondary, .tertiary:
    //                return background.darker(by: 0.15)
    //            case .round:
    //                return nil
    //            default:
    //                return nil
    //            }
    //        }()

    let borderStyle: BorderStyle? = {
      switch style {
      case .primary, .secondary, .tertiary:
        return BorderStyle.none
      case .round:
        return nil
      default:
        return nil
      }
    }()

    let backgroundColor: HTMLColor? = {
      switch style {
      case .primary, .secondary, .tertiary:
        return background
      case .round:
        return nil
      default:
        return nil
      }
    }()

    let backgroundColorHover: HTMLColor? = {
      switch style {
      case .primary, .secondary, .tertiary:
        return background.darker(by: 0.2)
      case .round:
        return HTMLColor.buttonBackground
      default:
        return nil
      }
    }()

    let boxShadow: String? = {
      switch style {
      case .primary, .secondary, .tertiary:
        return
          "rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, \(background.light.darker(by: 0.075)) 0px 0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;"
      case .round:
        return nil
      default:
        return nil
      }
    }()

    let boxShadowDark: String? = {
      switch style {
      case .primary, .secondary, .tertiary:
        return
          "rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, \(background.dark.lighter(by: 0.15)) 0px 0px 0px 1px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(0, 0, 0, 0) 0px 0px 0px 0px, rgba(255, 255, 255, 0.08) 0px 2px 5px 0px;"
      case .round:
        return nil
      default:
        return nil
      }
    }()

    return
      self
      //            .color(color)
      .padding(
        vertical: style.verticalPadding,
        horizontal: style.horizontalPadding
      )
      .borderRadius(.uniform(style.cornerRadius))
      .borderStyle(borderStyle)
      .borderWidth(.px(0))
      .appearance(Appearance.none)
      .backgroundColor(backgroundColor)
      .backgroundColor(backgroundColorHover, pseudo: .hover)
      .display(.flex)
      .alignItems(.center)
      .width(.fitContent)
      .width(.fitContent, media: .mobile)
      .alignSelf(.start, media: .mobile)
      .textDecoration(TextDecoration.none)
      .cursor(.pointer)
      .inlineStyle("transition", "background-color 0.3s, box-shadow 0.3s")
      .inlineStyle("user-select", "none")
      .inlineStyle("-webkit-user-select", "none")
      .inlineStyle("-moz-user-select", "none")
      .inlineStyle("-ms-user-select", "none")
      .inlineStyle("box-shadow", "0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06)")
      .inlineStyle("box-shadow", boxShadow)
      .inlineStyle("box-shadow", boxShadowDark, media: .dark)

  }
}

//
//
//#if DEBUG && canImport(SwiftUI) && os(macOS)
//import Dependencies
//import SwiftUI
//
//#Preview {
//    HTMLDocument {
//        withDependencies {
//            $0.theme.text.button = .yellow
//            $0.theme.background.button = .red
//        } operation: {
//            HTMLWebsite.Button(
//                button: .init(type: .submit)
//            ) {
//                "Hello"
//            }
//        }
//    }
//    .frame(height: 800)
//}
//#endif
