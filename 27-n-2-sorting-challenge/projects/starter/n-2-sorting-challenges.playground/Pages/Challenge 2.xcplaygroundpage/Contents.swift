// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 2: Find a duplicate
//: Given a collection of Equatable elements, return the first element
//: that is a duplicate in the collection.

// Your code here

let array = [2, 4, 5, 5, 2]
array.firstDuplicate
extension Sequence where Element: Hashable {
    var firstDuplicate: Element? {
        var found: Set<Element> = []
        for value in self {
            if found.contains(value) {
                return value
            } else {
                found.insert(value)
            }
        }
        return nil
    }
}
//: [Next Challenge](@next)
