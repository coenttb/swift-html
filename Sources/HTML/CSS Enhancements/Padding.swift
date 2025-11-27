//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 15/04/2025.
//

import CSS_Rendering
import CSS_Standard
import OrderedCollections

extension HTML.View {
    @HTML.Builder
    public func padding(
        vertical: LengthPercentage? = nil,
        horizontal: LengthPercentage? = nil,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        switch (vertical, horizontal) {
        case (.some(let vertical), .some(let horizontal)):
            self.padding(
                .verticalHorizontal(vertical, horizontal),
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
        case (.none, .some(let horizontal)):
            self
                .paddingRight(.lengthPercentage(horizontal))
                .paddingLeft(.lengthPercentage(horizontal))
        case (.some(let vertical), .none):
            self
                .paddingTop(.lengthPercentage(vertical))
                .paddingBottom(.lengthPercentage(vertical))
        case (.none, .none):
            self
        }
    }
}

extension HTML.View {
    @HTML.Builder
    public func padding(
        _ vertical: LengthPercentage?,
        _ horizontal: LengthPercentage?,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.padding(
            vertical: vertical,
            horizontal: horizontal,
            media: mediaQuery,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension Padding {
    public typealias Variant = Side
}

extension HTML.View {
    @HTML.Builder
    public func padding(
        _ padding: Padding.Variant...,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.padding(.init(padding), media: mediaQuery, selector: selector, pseudo: pseudo)
    }

    @HTML.Builder
    public func padding(
        _ padding: OrderedSet<Padding.Variant>,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        if padding.count == 4 {
            // Extract values for each side from the ordered set
            let topValue = padding.first(where: {
                if case .top = $0 { return true } else { return false }
            })
            let rightValue = padding.first(where: {
                if case .right = $0 { return true } else { return false }
            })
            let bottomValue = padding.first(where: {
                if case .bottom = $0 { return true } else { return false }
            })
            let leftValue = padding.first(where: {
                if case .left = $0 { return true } else { return false }
            })

            // Convert to LengthPercentage if found
            let top: LengthPercentage? = topValue.flatMap {
                if case .top(let lp) = $0 {
                    return lp
                } else {
                    return nil
                }
            }

            let right: LengthPercentage? = rightValue.flatMap {
                if case .right(let lp) = $0 {
                    return lp
                } else {
                    return nil
                }
            }

            let bottom: LengthPercentage? = bottomValue.flatMap {
                if case .bottom(let lp) = $0 {
                    return lp
                } else {
                    return nil
                }
            }

            let left: LengthPercentage? = leftValue.flatMap {
                if case .left(let lp) = $0 {
                    return lp
                } else {
                    return nil
                }
            }

            self.padding(
                .sides(
                    top: top,
                    right: right,
                    bottom: bottom,
                    left: left
                ),
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
        } else {
            paddingSides(
                padding: padding,
                media: mediaQuery,
                selector: selector,
                pseudo: pseudo
            )
        }
    }

    private func paddingSides(
        padding: OrderedSet<Padding.Variant>,
        media mediaQuery: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector?,
        pseudo: HTML.Pseudo?
    ) -> some HTML.View {
        self
            .if(
                padding.contains(where: { if case .top = $0 { return true } else { return false } })
            ) {
                element in
                HTML.Group {
                    let lengthPercentage = padding.first(where: {
                        if case .top = $0 { return true } else { return false }
                    })!
                    if case .top(let value) = lengthPercentage {
                        element.inlineStyle(
                            "padding-top",
                            value.description,
                            media: mediaQuery,
                            selector: selector,
                            pseudo: pseudo
                        )
                    } else {
                        element
                    }
                }
            }
            .if(
                padding.contains(where: {
                    if case .bottom = $0 { return true } else { return false }
                })
            ) {
                element in
                HTML.Group {
                    let lengthPercentage = padding.first(where: {
                        if case .bottom = $0 { return true } else { return false }
                    })!
                    if case .bottom(let value) = lengthPercentage {
                        element.inlineStyle(
                            "padding-bottom",
                            value.description,
                            media: mediaQuery,
                            selector: selector,
                            pseudo: pseudo
                        )
                    } else {
                        element
                    }
                }
            }
            .if(
                padding.contains(where: { if case .left = $0 { return true } else { return false } }
                )
            ) {
                element in
                HTML.Group {
                    let lengthPercentage = padding.first(where: {
                        if case .left = $0 { return true } else { return false }
                    })!
                    if case .left(let value) = lengthPercentage {
                        element.inlineStyle(
                            "padding-left",
                            value.description,
                            media: mediaQuery,
                            selector: selector,
                            pseudo: pseudo
                        )
                    } else {
                        element
                    }
                }
            }
            .if(
                padding.contains(where: {
                    if case .right = $0 { return true } else { return false }
                })
            ) {
                element in
                HTML.Group {
                    let lengthPercentage = padding.first(where: {
                        if case .right = $0 { return true } else { return false }
                    })!
                    if case .right(let value) = lengthPercentage {
                        element.inlineStyle(
                            "padding-right",
                            value.description,
                            media: mediaQuery,
                            selector: selector,
                            pseudo: pseudo
                        )
                    } else {
                        element
                    }
                }
            }
    }
}

extension HTML.View {
    @discardableResult
    @HTML.Builder
    public func padding(
        top: LengthPercentage,
        horizontal: LengthPercentage,
        bottom: LengthPercentage,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {
        self.padding(
            .top(top),
            .bottom(bottom),
            .left(horizontal),
            .right(horizontal),
            media: media,
            selector: selector,
            pseudo: pseudo
        )
    }
}

extension HTML.View {
    @discardableResult
    public func padding(
        top: LengthPercentage? = nil,
        bottom: LengthPercentage? = nil,
        left: LengthPercentage? = nil,
        right: LengthPercentage? = nil,
        media: W3C_CSS_MediaQueries.Media? = nil,
        selector: HTML.Selector? = nil,
        pseudo: HTML.Pseudo? = nil
    ) -> some HTML.View {

        var x: OrderedSet<Padding.Variant> = []

        if let top {
            _ = x.insert(.top(top), at: x.count)
        }

        if let bottom {
            _ = x.insert(.bottom(bottom), at: x.count)
        }

        if let left {
            _ = x.insert(.left(left), at: x.count)
        }

        if let right {
            _ = x.insert(.right(right), at: x.count)
        }

        return self.padding(x, media: media, selector: selector, pseudo: pseudo)
    }
}
