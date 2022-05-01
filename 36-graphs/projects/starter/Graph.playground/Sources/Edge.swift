import Foundation

public struct Edge<T> {
    public let source: Vertex<T>
    public var destination: Vertex<T>
    public let weight: Double?
}
