// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public func bubbleSort<Element>(_ array: inout [Element])
where Element: Comparable {
    // 1
    guard array.count >= 2 else {
        return
    }
    // 2
    for end in (1..<array.count).reversed() {
        var swapped = false
        // 3
        for current in 0..<end {
            if array[current] > array[current + 1] {
                array.swapAt(current, current + 1)
                swapped = true
            }
        }
        // 4
        if !swapped {
            return
        }
    }
}

example(of: "bubble sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    bubbleSort(&array)
    print("Bubble sorted: \(array)")
}


public func selectionSort<Element>(_ array: inout [Element])
where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    // 1
    for current in 0..<(array.count - 1) {
        var lowest = current
        // 2
        for other in (current + 1)..<array.count {
            if array[lowest] > array[other] {
                lowest = other
            }
        }
        // 3
        if lowest != current {
            array.swapAt(lowest, current)
        }
    }
}

example(of: "selection sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    selectionSort(&array)
    print("Selection sorted: \(array)")
}

public func insertionSort<Element>(_ array: inout [Element])
where Element: Comparable {
    guard array.count >= 2 else {
        return
    }
    // 1
    for current in 1..<array.count {
        // 2
        for shifting in (1...current).reversed() {
            // 3
            if array[shifting] < array[shifting - 1] {
                array.swapAt(shifting, shifting - 1)
            } else {
                break
            }
        }
    }
}

example(of: "insertion sort") {
    var array = [9, 4, 10, 3]
    print("Original: \(array)")
    insertionSort(&array)
    print("Insertion sorted: \(array)")
}



public func bubbleSort<T>(_ collection: inout T)
where T: MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    for end in collection.indices.reversed() {
        var swapped = false
        var current = collection.startIndex
        while current < end {
            let next = collection.index(after: current)
            if collection[current] > collection[next] {
                collection.swapAt(current, next)
                swapped = true
            }
            current = next
        }
        if !swapped {
            return
        }
    }
}


public func selectionSort<T>(_ collection: inout T)
where T: MutableCollection, T.Element: Comparable {
    guard collection.count >= 2 else {
        return
    }
    for current in collection.indices {
        var lowest = current
        var other = collection.index(after: current)
        while other < collection.endIndex {
            if collection[lowest] > collection[other] {
                lowest = other
            }
            other = collection.index(after: other)
        }
        if lowest != current {
            collection.swapAt(lowest, current)
        }
    }
}


public func insertionSort<T>(_ collection: inout T)
where T: BidirectionalCollection & MutableCollection,
      T.Element: Comparable {
          guard collection.count >= 2 else {
              return
          }
          for current in collection.indices {
              var shifting = current
              while shifting > collection.startIndex {
                  let previous = collection.index(before: shifting)
                  if collection[shifting] < collection[previous] {
                      collection.swapAt(shifting, previous)
                  } else {
                      break
                  }
                  shifting = previous
              }
          }
    }
