import Foundation

public func quickSort(list: [Int]) -> [Int] {
    guard list.count > 1 else {
        return list
    }
    let pivotIndex = list.count/2
    let pivot = list[pivotIndex]
    var lessList = [Int]()
    var greaterList = [Int]()
    for index in 0...list.count-1 {
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

