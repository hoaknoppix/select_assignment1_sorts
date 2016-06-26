import Foundation

public func selectSort(list: [Int]) -> [Int] {
    //make sure the list is greater than 1, if not, we don't need to sort
    guard list.count > 1 else {
        return list
    }
    
    var sortedList = list
    let lastIndex = sortedList.count - 1
    for sortingIndex in 0..<lastIndex  {
        var minIndex = sortingIndex
        for index in sortingIndex+1...lastIndex {
            if sortedList[minIndex] > sortedList[index] {
                minIndex = index
            }
        }
        Utils.swap(&sortedList[sortingIndex], lastVariable: &sortedList[minIndex])
    }
    return sortedList
}

