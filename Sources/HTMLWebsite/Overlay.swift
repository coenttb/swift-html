//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 31/08/2024.
//

import Dependencies
import Foundation
import HTMLAttributesPointFreeHTML
import HTMLComponents

public struct Overlay<Content: HTML>: HTML {

  let id: String
  let content: Content

  public init(
    id: String = "coenttb-shared-overlay-id",
    @HTMLBuilder content: () -> Content
  ) {
    self.content = content()
    self.id = String.sanitizeForJavaScript(id)
  }

  private var backgroundOverlay: some HTML {
    div {}
      .id("background-overlay-\(id)")
      .display(Display.none)
      .position(.fixed)
      .top(.zero)
      .left(.zero)
      .width(.percent(100))
      .height(.percent(100))
      .backgroundColor(HTMLColor.init(light: .rgba(red: 0, green: 0, blue: 0, alpha: 0.7)))
      .transition("opacity 0.3s ease")
      .opacity(0)
      .zIndex(1000)
  }

  public var body: some HTML {
    div {
      backgroundOverlay

      Card {
        content
      }
      .id("popup-container-\(id)")
      .textAlign(.center)
      .display(Display.none)
      .position(.fixed)
      .top(.percent(50))
      .left(.percent(50))
      .transform("translate(-50%, -50%) scale(0.95)")
      .transition("opacity 0.3s ease, transform 0.3s ease")
      .opacity(0)
      .zIndex(1001)
      .maxWidth(.px(440))
      .width(.percent(90))
      .margin(
        vertical: nil,
        horizontal: .auto,
      )
      .backgroundColor(.background.primary)
    }
    .class(.init(id))

    script {
      """
      // Initialize global variables
      window.overlayShown_\(id) = false;

      // Global hide function
      window.hideOverlay_\(id) = function(saveToStorage = false) {
          let overlay = document.getElementById('popup-container-\(id)');
          let backgroundOverlay = document.getElementById('background-overlay-\(id)');

          overlay.style.opacity = '0';
          overlay.style.transform = 'translate(-50%, -50%) scale(0.95)';
          backgroundOverlay.style.opacity = '0';

          setTimeout(function() {
              overlay.style.display = 'none';
              backgroundOverlay.style.display = 'none';
          }, 300);

          window.overlayShown_\(id) = false;

          if (saveToStorage) {
              localStorage.setItem('\(id)_dismissed', 'true');
          }
      };

      (function() {
          let lastScrollTop_\(id) = 0;
          let triggerPoint_\(id) = 0;

          function isElementInViewport(el) {
              const rect = el.getBoundingClientRect();
              return (
                  rect.top >= 0 &&
                  rect.left >= 0 &&
                  rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) &&
                  rect.right <= (window.innerWidth || document.documentElement.clientWidth)
              );
          }

          function showOverlay_\(id)() {
              if (window.overlayShown_\(id) || localStorage.getItem('\(id)_dismissed') === 'true') return;

              let overlay = document.getElementById('popup-container-\(id)');
              let backgroundOverlay = document.getElementById('background-overlay-\(id)');

              backgroundOverlay.style.display = 'block';
              overlay.style.display = 'block';

              setTimeout(function() {
                  backgroundOverlay.style.opacity = '1';
                  overlay.style.opacity = '1';
                  overlay.style.transform = 'translate(-50%, -50%) scale(1)';
              }, 10);

              window.overlayShown_\(id) = true;
          }

          function handleOverlayVisibility_\(id)() {
              if (localStorage.getItem('\(id)_dismissed') === 'true') return;

              let subscribeOverlay = document.querySelector('.\(id)');
              if (!subscribeOverlay) return;

              let currentScrollTop = window.pageYOffset || document.documentElement.scrollTop;

              if (!window.overlayShown_\(id) && isElementInViewport(subscribeOverlay)) {
                  showOverlay_\(id)();
                  triggerPoint_\(id) = currentScrollTop;
              } else if (window.overlayShown_\(id) && currentScrollTop < triggerPoint_\(id) && currentScrollTop < lastScrollTop_\(id)) {
                  window.hideOverlay_\(id)(false);  // Don't save to storage when auto-hiding
              }

              lastScrollTop_\(id) = currentScrollTop <= 0 ? 0 : currentScrollTop;
          }

          window.addEventListener('scroll', handleOverlayVisibility_\(id));
          window.addEventListener('resize', handleOverlayVisibility_\(id));

          // Initial check on page load
          document.addEventListener('DOMContentLoaded', handleOverlayVisibility_\(id));

          // Expose the dismiss function globally
          window.dismissOverlay_\(id) = function() {
              window.hideOverlay_\(id)(true);  // Save to storage when explicitly dismissed
          };
      })();
      """
    }
  }
}
