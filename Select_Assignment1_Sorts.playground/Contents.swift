//: Playground - noun: a place where people can play

typealias SortMethod = ([Int]) -> [Int]

public class SortTestCase : XCTestCase {
    
    var sortMethod: SortMethod!
    
    init(method: SortMethod) {
        self.sortMethod = method
        super.init()
    }
    
    func testEmptyArray() {
        let list: [Int] = []
        XCTAssertEqual(sortMethod(list), [])
    }
    
    func testOneElementArray() {
        let list = [1]
        XCTAssertEqual(sortMethod(list), [1])
    }
    
    func testSortedList() {
        let list = [1,2,3]
        XCTAssertEqual(sortMethod(list), [1,2,3])
    }
    
    func testUnsortedList() {
        let list = [3, 2, 1]
        XCTAssertEqual(sortMethod(list), [1, 2, 3])
    }
    
    func testUnsortedEvenList() {
        let list = [4, 2, 1, 3]
        XCTAssertEqual(sortMethod(list), [1, 2, 3, 4])
    }
    
    func testEqualList() {
        let list = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
        XCTAssertEqual(sortMethod(list), [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])
    }
    
    func testComplexUnsortedList() {
        let list = [-100000,3,4,5,6,1,2,3,4,1,1,100]
        XCTAssertEqual(sortMethod(list), [-100000,1,1,1,2,3,3,4, 4,5,6,100])
    }
    
    func testWorstCaseQuickSort() {
        let list = [1, 2, 4, 3, 9, 5, 6, 8, 7] //O(n^2) - the pivot is always the greatest value vs O(nlogn) - mergesort
        XCTAssertEqual(sortMethod(list), [1,2,3,4,5,6,7,8,9])
    }
    
    func testWorstCaseMergeSort() {
        let list = [4,2,8,6,0,3,1,7,5] //maximum comparation time, space comsumption: three level recursion vs two (quicksort)
        XCTAssertEqual(sortMethod(list), [0, 1,2,3,4,5,6,7,8])
    }
}

//This sort is quite stupid it makes my complex test case failed.
//SortTestCase(method: bogoSort)
SortTestCase(method: selectSort)
SortTestCase(method: quickSort)
SortTestCase(method: mergeSort)
