import SnapshotTesting
import Testing

@MainActor
@Suite(
    .serialized,
    .snapshots(record: .never)
)
struct SnapshotTests {}
