// Copyright (c) 2021 Razeware LLC
// For full license & permission details, see LICENSE.markdown.

public extension RandomAccessCollection where Element: Comparable {
    func binarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        
        let middle = index(range.lowerBound, offsetBy: size/2)
        
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return binarySearch(for: value, in: middle..<range.upperBound)
        }
        
    }
}


let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]
let search31 = array.firstIndex(of: 31)
let binarySearch31 = array.binarySearch(for: 31)
print("firstIndex(of:): \(String(describing: search31))")
print("binarySearch(for:): \(String(describing:binarySearch31))")
