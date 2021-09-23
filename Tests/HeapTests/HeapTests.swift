import XCTest
@testable import Heap

final class HeapTests: XCTestCase {
  
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
}
