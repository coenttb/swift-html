//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 22/12/2025.
//

import InlineSnapshotTesting
import StandardsTestSupport

extension Test {
    @MainActor
    @Suite(.serialized, .snapshots(record: .failed))
    struct Snapshot {}
}
