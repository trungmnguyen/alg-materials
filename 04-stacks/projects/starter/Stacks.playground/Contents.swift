// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.


public struct Stack<Element> {
    private var storage: [Element] = []
    public init() {}
    
    public init(_ elements: [Element]) {
     storage = elements
   }
    
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    // Non-essential operations
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator:
                                                        "\n"))
        -----------
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    print(stack)
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}

example(of: "initializing a stack from an array") {
  let array = ["A", "B", "C", "D"]
  var stack = Stack(array)
  print(stack)
  stack.pop()
}

example(of: "initializing a stack from an array literal") {
  var stack: Stack = [1.0, 2.0, 3.0, 4.0]
  print(stack)
  stack.pop()
}
