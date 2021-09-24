import XCTest
@testable import Heap

final class HeapTests: XCTestCase {
  
  private let testInputItems = [2, -9, 34, 10, 5, 1, 29, 6, -4, 0, 10, 10]
  
  func test_containsNoElementOnInitialization() {
    let heap = Heap<Int>()
    
    XCTAssertTrue(heap.isEmpty, "The heap must be empty after initilization")
  }
  
  func test_peekElementOnEmptyHeap_shouldReturnNil() {
    let heap = Heap<Int>()
    
    XCTAssertNil(heap.peek, "Empty heap must return nil on peek")
  }
  
  func test_popElementOnEmptyHeap_shouldReturnNil() {
    var heap = Heap<Int>()
    
    XCTAssertNil(heap.pop(), "Empty heap must return nil on pop")
  }
  
  func test_pushElementOnEmptyHeap() {
    var heap = Heap<Int>()
    let number = 4
    heap.push(number)
    
    XCTAssertFalse(heap.isEmpty, "The heap must not be empty")
    XCTAssertEqual(heap.count, 1, "The heap should contain one element")
    XCTAssertEqual(heap.peek, number)
  }
  
  func test_popElementOnHeapWithOneItem_heapShouldBeEmpty() {
    var heap = Heap<Int>()
    let number = 4
    heap.push(number)
    
    let popedItem = heap.pop()
    
    XCTAssertTrue(heap.isEmpty, "The heap must be empty")
    XCTAssertEqual(number, popedItem, "Popped item must be equal to the initially pushed one")
  }
  
  func test_minHeapReturnItemsInOrder() {
    checkIsValidMinHeap(testInputItems)
  }
  
  func test_minHeapReturnItemsInOrder_withExtremes() {
    let extremesInput = [Int.max, .max, .max, .zero, .zero, .zero, .min, .min, .min]
    checkIsValidMinHeap(extremesInput)
  }
  
  func test_minHeapReturnItemsInOrder_againstRandomInputOf1000Elements_threeTimesInARow() {
    for _ in 0..<2 {
      checkIsValidMinHeap(generateRandomSetOf1000Elements())
    }
  }
  
  func test_maxHeapReturnItemsInOrder() {
    checkIsValidMaxHeap(testInputItems)
  }
  
  func test_maxHeapReturnItemsInOrder_withExtremes() {
    let extremesInput = [Int.min, .min, .min, .zero, .zero, .zero, .max, .max, .max]
    checkIsValidMaxHeap(extremesInput)
  }
  
  func test_maxHeapReturnItemsInOrder_againstRandomInputOf1000Elements_threeTimesInARow() {
    for _ in 0..<2 {
      checkIsValidMaxHeap(generateRandomSetOf1000Elements())
    }
  }
  
  private func checkIsValidMinHeap(_ items: [Int], file: StaticString = #file, line: UInt = #line) {
    var heap = Heap<Int>()
    for item in testInputItems {
      heap.push(item)
    }
    
    var prevItem = Int.min
    while !heap.isEmpty {
      guard let popedItem = heap.pop() else {
        XCTFail("The not empty heap should always return value on the pop operation")
        return
      }
      XCTAssertTrue(prevItem <= popedItem, "The previous item must always be less than or equal to the new one in the min-heap")
      prevItem = popedItem
    }
  }
  
  private func checkIsValidMaxHeap(_ items: [Int], file: StaticString = #file, line: UInt = #line) {
    var heap: Heap<Int> = Heap(isMinHeap: false)
    for item in testInputItems {
      heap.push(item)
    }
    
    var prevItem = Int.max
    while !heap.isEmpty {
      guard let popedItem = heap.pop() else {
        XCTFail("The not empty heap should always return value on the pop operation")
        return
      }
      XCTAssertTrue(prevItem >= popedItem, "The previous item must always be greater than or equal to the new one in the max-heap")
      prevItem = popedItem
    }
  }
  
  private func generateRandomSetOf1000Elements() -> [Int] {
    var res = [Int]()
    for _ in 0..<1000 {
      // Making range small so there will be duplicates
      res.append(Int.random(in: -100...100))
    }
    
    return res
  }
}
