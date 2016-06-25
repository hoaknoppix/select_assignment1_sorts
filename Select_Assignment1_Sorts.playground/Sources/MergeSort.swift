import Foundation

private func mergeRemainingSubListElements(inout mergedList: [Int], inout subList: [Int]) {
    while subList.count > 0 {
        mergedList.append(subList[0])
        subList.removeAtIndex(0)
    }
}

private func mergeSubLists(firstList: [Int], secondList: [Int]) -> [Int] {
    var tempFirstList = firstList
    var tempSecondList = secondList
    var mergedList = [Int]()
    while tempFirstList.count > 0 && tempSecondList.count > 0 {
        if tempFirstList[0] > tempSecondList[0] {
            mergedList.append(tempSecondList[0])
            tempSecondList.removeAtIndex(0)
        }
        else {
            mergedList.append(tempFirstList[0])
            tempFirstList.removeAtIndex(0)
        }
    }
    mergeRemainingSubListElements(&mergedList, subList: &tempFirstList)
    mergeRemainingSubListElements(&mergedList, subList: &tempSecondList)
    
    return mergedList
}

public func mergeSort(list: [Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }
    
    var sortedList = list
    
    let lastIndex = sortedList.count - 1
    
    let numberOfFirstSubListElements = sortedList.count / 2
    
    var secondSubList = Array(sortedList[0...numberOfFirstSubListElements - 1])
    if secondSubList.count > 1 {
        secondSubList = mergeSort(secondSubList)
    }
    
    var firstSubList = Array(sortedList[numberOfFirstSubListElements...lastIndex])
    if firstSubList.count > 1 {
        firstSubList = mergeSort(firstSubList)
    }
    
    return mergeSubLists(firstSubList, secondList: secondSubList)
}

