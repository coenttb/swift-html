//
//  File.swift
//  swift-html
//
//  Created by Coen ten Thije Boonkkamp on 22/12/2025.
//

import StandardsTestSupport
import InlineSnapshotTesting

extension Test {
    @MainActor
    @Suite(.serialized, .snapshots(record: .failed))
    struct Snapshot {}
}
