// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.
//: [Previous Challenge](@previous)
//: ## Challenge 3: Reverse a collection
//: Reverse a collection of elements by hand. Do not rely on the
//: reverse or reversed methods.

extension MutableCollection
where Self: BidirectionalCollection {
    mutating func reverse() {
        var left = startIndex
        var right = index(before: endIndex)
        while left < right {
            swapAt(left, right)
            formIndex(after: &left)
            formIndex(before: &right)
        }
    }
}
