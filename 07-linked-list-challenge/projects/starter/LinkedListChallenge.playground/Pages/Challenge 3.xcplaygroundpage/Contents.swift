// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
/*:
 [Previous Challenge](@previous)
 ## Challenge 3: Reverse a linked list
 
 Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
 */
extension LinkedList {
    
    mutating func reverse() {
        // Solution 1: Using an extra space
        //        var tmpList = LinkedList<Value>()
        //        for value in self {
        //            tmpList.push(value)
        //        }
        //
        //        head = tmpList.head
        
        // Solution 2: Without an extra space
        
        tail = head
        var prev = head
        var current = head?.next
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        
        head = prev
    }
}

example(of: "reversing a list") {
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    print("Original list: \(list)")
    list.reverse()
    print("Reversed list: \(list)")
}

//: [Next Challenge](@next)
