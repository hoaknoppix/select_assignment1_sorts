import Foundation

private func mergeRemainingSubListElements(inout mergedList: [Int], inout subList: [Int]) {
    while subList.count > 0 {
        appendToMergeList(&mergedList, subList: &subList)
    }
}

private func appendToMergeList(inout mergedList: [Int], inout subList: [Int]) {
    mergedList.append(subList.first!)
    subList.removeFirst()
}

private func mergeSubLists(firstList: [Int], secondList: [Int]) -> [Int] {
    var tempFirstList = firstList
    var tempSecondList = secondList
    var mergedList = [Int]()
    while tempFirstList.count > 0 && tempSecondList.count > 0 {
        if tempFirstList.first > tempSecondList.first {
            appendToMergeList(&mergedList, subList: &tempSecondList)
        }
        else {
            appendToMergeList(&mergedList, subList: &tempFirstList)
        }
    }
    mergeRemainingSubListElements(&mergedList, subList: &tempFirstList)
    mergeRemainingSubListElements(&mergedList, subList: &tempSecondList)
    
    return mergedList
}

public func mergeSort(list: [Int]) -> [Int] {
    //make sure the list is greater than 1, if not, we don't need to sort
    guard list.count > 1 else {
        return list
    }
    
    var sortedList = list
    let lastIndex = sortedList.count - 1
    let middleElementIndex = sortedList.count / 2
    
    var firstSubList = Array(sortedList[0..<middleElementIndex])
    var secondSubList = Array(sortedList[middleElementIndex...lastIndex])
    
    if firstSubList.count > 1 {
        firstSubList = mergeSort(firstSubList)
    }
    
    if secondSubList.count > 1 {
        secondSubList = mergeSort(secondSubList)
    }
    
    return mergeSubLists(firstSubList, secondList: secondSubList)
}

