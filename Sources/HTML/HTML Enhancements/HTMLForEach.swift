//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 25/06/2025.
//

import Foundation

public struct HTMLForEach<Content: HTML>: HTML {
    /// The array of HTML content generated from the collection.
    let content: _HTMLArray<Content>

    /// Creates a new HTML component that generates content for each element in a collection.
    ///
    /// - Parameters:
    ///   - data: The collection to iterate over.
    ///   - content: A closure that transforms each element of the collection into HTML content.
    public init<Data: Sequence>(
        _ data: Data,
        @HTMLBuilder content: (Data.Element) -> Content
    ) {
        self.content = HTMLBuilder.buildArray(data.map(content))
    }

    /// The body of this component, which is the array of HTML content.
    public var body: some HTML {
        content
    }
}

#if DEBUG && canImport(SwiftUI)
    import SwiftUI
    #Preview {
        HTMLDocument {
            ul {
                HTMLForEach(11...20) { element in
                    AnyHTML {
                        li {
                            "\(element)"
                        }
                    }
                }

                for element in 1...10 {
                    AnyHTML {
                        li {
                            "\(element)"
                        }
                    }
                }

                // TO-DO: currently doesn't compile.
                //            for element in 1...10 {
                //                li {
                //                    "\(element)"
                //                }
                //            }
            }
        }
    }
#endif
