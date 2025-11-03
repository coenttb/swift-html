//
//  EmptyState.swift
//  swift-html
//
//  A reusable empty state component for when there's no data to display
//

import Foundation
import HTML
import HTMLComponents

/// A component for displaying empty states with optional icon, title, description, and action
public struct EmptyState<Action: HTML>: HTML {
  /// Optional icon or emoji to display
  let icon: String?

  /// The title message
  let title: String

  /// Optional description text
  let description: String?

  /// Optional action button or link
  let action: Action?

  /// Text alignment for the content
  let textAlign: TextAlign

  /// Optional custom spacing between elements
  let spacing: Length?

  /// Optional icon size
  let iconSize: LengthPercentage?

  public init(
    icon: String? = nil,
    title: String,
    description: String? = nil,
    textAlign: TextAlign = .center,
    spacing: Length? = nil,
    iconSize: LengthPercentage? = nil,
    @HTMLBuilder action: () -> Action
  ) {
    self.icon = icon
    self.title = title
    self.description = description
    self.textAlign = textAlign
    self.spacing = spacing
    self.iconSize = iconSize
    self.action = action()
  }

  public var body: some HTML {
    div {
      VStack(spacing: spacing ?? .rem(1)) {
        // Icon
        if let icon = icon {
          div { icon }
            .fontSize(.init(iconSize ?? .rem(3)))
            .marginBottom(.rem(0.5))
        }

        // Title
        Header(2) { title }
          .fontSize(.rem(1.5))
          .color(.text.primary)
          .marginBottom(.rem(0.5))

        // Description
        if let description = description {
          HTMLComponents.Paragraph { description }
            .color(.text.secondary)
            .maxWidth(.rem(30))
            .margin(horizontal: .auto)
            .marginBottom(.rem(1))
        }

        // Action
        if let action = action {
          div { action }
            .marginTop(.rem(1))
        }
      }
    }
    .textAlign(textAlign)
    .padding(vertical: .rem(3), horizontal: .rem(2))
  }
}

// MARK: - Convenience Initializers

extension EmptyState where Action == HTMLEmpty {
  /// Creates an empty state without an action
  public init(
    icon: String? = nil,
    title: String,
    description: String? = nil,
    textAlign: TextAlign = .center,
    spacing: Length? = nil,
    iconSize: LengthPercentage? = nil
  ) {
    self.icon = icon
    self.title = title
    self.description = description
    self.textAlign = textAlign
    self.spacing = spacing
    self.iconSize = iconSize
    self.action = nil
  }
}

// extension EmptyState where Action == Link<HTMLText> {
//    /// Creates an empty state with a simple link action
//    public init(
//        icon: String? = nil,
//        title: String,
//        description: String? = nil,
//        actionText: String,
//        actionHref: URL,
//        textAlign: TextAlign = .center,
//        spacing: Length? = nil,
//        iconSize: LengthPercentage? = nil
//    ) {
//        self.init(
//            icon: icon,
//            title: title,
//            description: description,
//            textAlign: textAlign,
//            spacing: spacing,
//            iconSize: iconSize
//        ) {
//            Link(href: .init(actionHref)) { actionText }
//                .linkColor(.branding.primary)
//                .fontWeight(.medium)
//        }
//    }
// }

// extension EmptyState where Action == HTMLWebsite.Button<HTMLText, HTMLEmpty> {
//    /// Creates an empty state with a button action
//    public init(
//        icon: String? = nil,
//        title: String,
//        description: String? = nil,
//        actionText: String,
//        buttonStyle: ButtonStyle = .default,
//        textAlign: TextAlign = .center,
//        spacing: Length? = nil,
//        iconSize: LengthPercentage? = nil
//    ) {
//        self.init(
//            icon: icon,
//            title: title,
//            description: description,
//            textAlign: textAlign,
//            spacing: spacing,
//            iconSize: iconSize
//        ) {
//            HTMLWebsite.Button(style: buttonStyle) {
//                HTMLText(actionText)
//            }
//        }
//    }
// }

// MARK: - Common Empty States

extension EmptyState {
  /// Creates a "No Data" empty state
  public static func noData<A: HTML>(
    title: String = "No Data Yet",
    description: String? = "Start by adding some data to see it here.",
    @HTMLBuilder action: () -> A = { HTMLEmpty() }
  ) -> EmptyState<A> {
    EmptyState<A>(
      icon: "📊",
      title: title,
      description: description,
      action: action
    )
  }

  /// Creates a "No Results" empty state for search
  public static func noResults<A: HTML>(
    searchTerm: String? = nil,
    @HTMLBuilder action: () -> A = { HTMLEmpty() }
  ) -> EmptyState<A> {
    let description = searchTerm.map { "No results found for \"\($0)\"" } ?? "No results found"
    return EmptyState<A>(
      icon: "🔍",
      title: "No Results",
      description: description,
      action: action
    )
  }

  /// Creates a "Coming Soon" empty state
  public static func comingSoon<A: HTML>(
    feature: String? = nil,
    @HTMLBuilder action: () -> A = { HTMLEmpty() }
  ) -> EmptyState<A> {
    let title = feature.map { "\($0) Coming Soon" } ?? "Coming Soon"
    return EmptyState<A>(
      icon: "🚀",
      title: title,
      description: "This feature is under development and will be available soon.",
      action: action
    )
  }

  /// Creates an error empty state
  public static func error<A: HTML>(
    message: String? = "Something went wrong. Please try again.",
    @HTMLBuilder action: () -> A = { HTMLEmpty() }
  ) -> EmptyState<A> {
    EmptyState<A>(
      icon: "⚠️",
      title: "Error",
      description: message,
      action: action
    )
  }
}
