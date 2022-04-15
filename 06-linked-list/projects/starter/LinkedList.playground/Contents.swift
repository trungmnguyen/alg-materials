// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public class Node<Value> {
    public var value: Value
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomDebugStringConvertible {
    public var debugDescription: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

example(of: "creating and linking nodes") {
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    print(node1)
}


public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: CustomDebugStringConvertible {
    public var debugDescription: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
