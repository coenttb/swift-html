import Dependencies
import HTML_Rendering

extension HTML.View {
    public func dependency<Value>(
        _ keyPath: WritableKeyPath<DependencyValues, Value>,
        _ value: Value
    ) -> some HTML.View {
        _DependencyKeyWritingModifier(base: self, keyPath: keyPath, value: value)
    }
}

private struct _DependencyKeyWritingModifier<Base: HTML.View, Value>: HTML.View {
    let base: Base
    let keyPath: WritableKeyPath<DependencyValues, Value>
    let value: Value

    static func _render<Buffer: RangeReplaceableCollection>(
        _ html: Self,
        into buffer: inout Buffer,
        context: inout HTML.Context
    ) where Buffer.Element == UInt8 {
        withDependencies {
            $0[keyPath: html.keyPath] = html.value
        } operation: {
            Base._render(html.base, into: &buffer, context: &context)
        }
    }
    var body: Never { fatalError() }
}
