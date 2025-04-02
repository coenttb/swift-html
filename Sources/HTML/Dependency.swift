import Dependencies

extension HTML {
    public func dependency<Value>(
        _ keyPath: WritableKeyPath<DependencyValues, Value>,
        _ value: Value
    ) -> some HTML {
        _DependencyKeyWritingModifier(base: self, keyPath: keyPath, value: value)
    }
}

private struct _DependencyKeyWritingModifier<Base: HTML, Value>: HTML {
    let base: Base
    let keyPath: WritableKeyPath<DependencyValues, Value>
    let value: Value
    
    static func _render(_ html: Self, into printer: inout HTMLPrinter) {
        withDependencies {
            $0[keyPath: html.keyPath] = html.value
        } operation: {
            Base._render(html.base, into: &printer)
        }
    }
    var body: Never { fatalError() }
}

// Unsure whether this should be added.
private enum ObjectStyleKey: DependencyKey {
    static let liveValue = ObjectStyle.init(position: .inherit)
    static let testValue = ObjectStyle.init(position: .inherit)
}

extension DependencyValues {
    public var objectStyle: ObjectStyle {
        get { self[ObjectStyleKey.self] }
        set { self[ObjectStyleKey.self] = newValue }
    }
}


