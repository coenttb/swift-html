import SnapshotTesting
import Testing

@MainActor
@Suite(
    .serialized,
    .snapshots(record: .failed)
)
struct SnapshotTests {}
