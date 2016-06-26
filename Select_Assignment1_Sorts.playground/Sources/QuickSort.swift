import Foundation

public func quickSort(list: [Int]) -> [Int] {
    //make sure the list is greater than 1, if not, we don't need to sort
    guard list.count > 1 else {
        return list
    }
    let pivotIndex = list.count / 2
    let pivot = list[pivotIndex]
    var lessList = [Int]()
    var greaterList = [Int]()
    for index in 0..<list.count {
        guard pivotIndex != index else {
            continue
        }
        let element = list[index]
        if element < pivot {
            lessList.append(element)
        }
        else {
            greaterList.append(element)
        }
    }
    lessList = quickSort(lessList)
    greaterList = quickSort(greaterList)
    lessList.append(pivot)
    return lessList + greaterList
}

